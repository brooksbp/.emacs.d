; Avoid garbage collection during init
(setq gc-cons-threshold-saved gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold gc-cons-threshold-saved)))

; Save customizations to custom.el instead of this file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;------------------------------------------------------------------------------
;; Packages

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Work-around for https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
(when (and (version< emacs-version "26.3") (boundp 'libgnutls-version) (>= libgnutls-version 30604))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (when (stringp min-version)
    (setq min-version (version-to-list min-version)))
  (or (package-installed-p package min-version)
      (let* ((known (cdr (assoc package package-archive-contents)))
             (best (car (sort known (lambda (a b)
                                      (version-list-<= (package-desc-version b)
                                                       (package-desc-version a)))))))
        (if (and best (version-list-<= min-version (package-desc-version best)))
            (package-install best)
          (if no-refresh
              (error "No version of %s >= %S is available" package min-version)
            (package-refresh-contents)
            (require-package package min-version t)))
        (package-installed-p package min-version))))

(setq package-enable-at-startup nil)

(package-initialize)

;;------------------------------------------------------------------------------
;; Themes

(require-package 'monokai-theme)
(load-theme 'monokai t)

(require-package 'material-theme)
;(load-theme 'material t)

;;------------------------------------------------------------------------------
;; Display

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-splash-screen t)

(menu-bar-mode -1)
(if window-system (tool-bar-mode -1))
(if window-system (scroll-bar-mode -1))

(setq use-dialog-box nil)

(fset 'yes-or-no-p 'y-or-n-p)

(setq line-number-mode t)
(setq column-number-mode t)

; Flash the screen instead of making an audible ding
(setq visibile-bell t)

; Turn on line wrapping
(setq-default truncate-lines nil)
(setq-default truncate-partial-width-windows nil)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

; Highlight matching delimiters
(show-paren-mode 1)

(setq-default show-trailing-whitespace t)

; Display the current function name in the mode line
(which-function-mode 1)

(require-package 'window-numbering)
(window-numbering-mode 1)

; Enable Auto-Revert mode to continuously display changes made to a file
; by other programs, e.g. to 'tail' a file.
(global-auto-revert-mode)
(setq global-auto-revert-none-file-buffers t)
(setq auto-revert-verbose nil)

;;------------------------------------------------------------------------------
;; Editing

(setq-default make-backup-files nil)
(setq-default auto-save-default nil)

; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

; Automatically insert matching delimiters
(when (fboundp 'electric-pair-mode)
  (electric-pair-mode))

; Inserting text while the mark is active causes selected text to be deleted first
(setq-default delete-selection-mode t)

(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

(defun delete-leading-whitespace (start end)
  "Delete whitespace at the beginning of each line in region."
  (interactive "*r")
  (save-excursion
    (if (not (bolp)) (forward-line 1))
    (delete-whitespace-rectangle (point) end nil)))

;;------------------------------------------------------------------------------
;; Search

; Case-insensitive search
(setq-default case-fold-search t)

(require-package 'anzu)
(global-anzu-mode +1)

;;------------------------------------------------------------------------------
;; Ediff

(setq-default ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-window-setup-function 'ediff-setup-windows-plain)

;;---------------------------------------------------------------------------
;; Autocomplete

(require-package 'auto-complete)

(require 'auto-complete-config)
(ac-config-default)

(setq ac-auto-show-menu nil)
(setq ac-expand-on-auto-complete t)
(setq ac-show-menu-immediately-on-auto-complete nil)
(setq ac-use-quick-help nil)
(setq ac-auto-start 4)
(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-yasnippet
               ac-source-filename
               ac-source-words-in-all-buffer
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers))

;;---------------------------------------------------------------------------

(require-package 'move-dup)

(global-set-key (kbd "C-<up>") 'md/move-lines-up)
(global-set-key (kbd "C-<down>") 'md/move-lines-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq vc-follow-symlinks t)

(require-package 'git-modes)

;;------------------------------------------------------------------------------

(add-to-list 'load-path (expand-file-name "~/bluespec/Bluespec-2017.03.beta1/util/emacs"))

(autoload 'bsv-mode "bsv-mode" "BSV mode" t )
(setq auto-mode-alist (cons  '("\\.bsv\\'" . bsv-mode) auto-mode-alist))

;;------------------------------------------------------------------------------

(require-package 'verilog-mode "2023.6.6")

(setq verilog-indent-lists nil)
(setq verilog-indent-level 2)
(setq verilog-indent-level-module 2)
(setq verilog-indent-level-declaration 2)
(setq verilog-indent-level-behavioral 2)
(setq verilog-indent-level-directive 2)
(setq verilog-indent-begin-after-if nil)
(setq verilog-indent-class-inside-pkg t)
(setq verilog-indent-declaration-macros nil)
(setq verilog-case-fold nil)
(setq verilog-case-indent 2)
(setq verilog-cexp-indent 2)
(setq verilog-auto-newline nil)
(setq verilog-auto-indent-on-newline t)
(setq verilog-tab-always-indent t)
(setq verilog-auto-endcomments nil)
;; (setq verilog-auto-lineup nil)

;;------------------------------------------------------------------------------

;; (setq c-default-style "gnu")

;; (setq c-default-style "k&r")
;; (setq c-basic-offset 4)

;; (setq c-default-style "bsd")
;; (setq c-basic-offset 4)

; Linux
(defun setup-c-mode ()
  (set-variable 'indent-tabs-mode t)
  (c-set-offset 'inextern-lang 0))
(add-hook 'c-mode-common-hook 'setup-c-mode)
(setq c-default-style "linux")

(require-package 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)

;;------------------------------------------------------------------------------

(unless (version< emacs-version "28.1")
  (require-package 'bazel))

(require-package 'cmake-mode)

(require-package 'dts-mode)

(require-package 'bison-mode)
(add-to-list 'auto-mode-alist '("\\.yy\\'" . bison-mode))
(add-to-list 'auto-mode-alist '("\\.ll\\'" . flex-mode))

(require-package 'markdown-mode)

(require-package 'dockerfile-mode)

(require-package 'rust-mode)
(require-package 'cargo)

(require-package 'python-mode)
(require-package 'pip-requirements)

(require-package 'go-mode)

(require-package 'haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

(require-package 'racket-mode)

(require-package 'tuareg)  ; OCaml

(require-package 'json-mode)
(require-package 'yaml-mode)

(require-package 'js2-mode)
(require-package 'typescript-mode)
(require-package 'web-mode)

(require-package 'tagedit)
(require-package 'mmm-mode)
(require-package 'sass-mode)
(require-package 'scss-mode)
(require-package 'less-css-mode)

;;------------------------------------------------------------------------------

(require 'server)
(unless (server-running-p)
  (server-start))
