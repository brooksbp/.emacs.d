; Adjust garbage collection thresholds
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold (* 20 1024 1024))))

; Save customizations to custom.el instead of this file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;------------------------------------------------------------------------------
;; Packages

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(defun require-package (package &optional min-version no-refresh)
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

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
;; VCS

(setq vc-follow-symlinks t)

(require-package 'gitignore-mode)
(require-package 'gitconfig-mode)

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

(require-package 'markdown-mode)
(require-package 'yaml-mode)

(require-package 'dockerfile-mode)

;;------------------------------------------------------------------------------
;; Bluespec

(add-to-list 'load-path (expand-file-name "~/Bluespec-2017.03.beta1/util/emacs"))

(autoload 'bsv-mode "bsv-mode" "BSV mode" t )
(setq auto-mode-alist (cons  '("\\.bsv\\'" . bsv-mode) auto-mode-alist))

;;------------------------------------------------------------------------------
;; C languages

; gnu

;; (setq c-default-style "gnu")

; k&r

(setq c-default-style "k&r")
(setq c-basic-offset 4)

; Allman

;; (setq c-default-style "bsd")
;; (setq c-basic-offset 4)

; Linux

;; (defun setup-c-mode ()
;;   (set-variable 'indent-tabs-mode t)
;;   (c-set-offset 'inextern-lang 0))
;; (add-hook 'c-mode-common-hook 'setup-c-mode)
;; (setq c-default-style "linux")

; Google

;; (require-package 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)

;;------------------------------------------------------------------------------
;; Go

(require-package 'go-mode)

;;------------------------------------------------------------------------------
;; Haskell

(require-package 'haskell-mode)

(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;;------------------------------------------------------------------------------
;; Javascript

(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'coffee-mode)
(require-package 'typescript-mode)

;;------------------------------------------------------------------------------
;; Python

(require-package 'pip-requirements)

;;------------------------------------------------------------------------------
;; Lua

(require-package 'lua-mode)

;;------------------------------------------------------------------------------
;; Racket

(require-package 'racket-mode)

;;------------------------------------------------------------------------------
;; Rust

(require-package 'rust-mode)

;;------------------------------------------------------------------------------
;; OCaml

(require-package 'tuareg)

;;------------------------------------------------------------------------------
;; OCaml

(require-package 'erlang)

;;------------------------------------------------------------------------------
;; HTML

(require-package 'tagedit)

;;------------------------------------------------------------------------------
;; CSS

(require-package 'mmm-mode)
(require-package 'sass-mode)
(require-package 'scss-mode)
(require-package 'less-css-mode)

;;------------------------------------------------------------------------------

(require 'server)
(unless (server-running-p)
  (server-start))

;;------------------------------------------------------------------------------
