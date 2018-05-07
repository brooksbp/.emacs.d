(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "~/Bluespec-2017.03.beta1/util/emacs"))

(setq vc-follow-symlinks t)

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

(setq inhibit-splash-screen t)

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode -1))

;; Suppress all dialog boxes.
(setq use-dialog-box nil)

(setq-default
 column-number-mode t
 line-number-mode t
 visible-bell t)

;; If enabled, inserting text while the mark is active causes the text to
;; be deleted first. This also deactivates the mark.
(setq-default delete-selection-mode t)

(setq-default make-backup-files nil)
(setq-default auto-save-default nil)

(setq-default indent-tabs-mode nil)

;; Searching case-sensitivity
(setq-default case-fold-search t)

(setq-default show-trailing-whitespace t)

(setq-default
 truncate-lines nil
 truncate-partial-width-windows nil)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(fset 'yes-or-no-p 'y-or-n-p)

(when (fboundp 'electric-pair-mode)
  (electric-pair-mode))
(when (fboundp 'electric-indent-mode)
  (electric-indent-mode))

;; Enable paren match highlighting
(show-paren-mode 1)

;; Display the current function name in the mode line.
(which-function-mode 1)

(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Enable Auto-Revert mode to continuously display changes made to a file
;; by other programs, e.g. to 'tail' a file.
(global-auto-revert-mode)
(setq global-auto-revert-none-file-buffers t
      auto-revert-verbose nil)

(setq-default
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain)

(defun delete-leading-whitespace (start end)
  "Delete whitespace at the beginning of each line in region."
  (interactive "*r")
  (save-excursion
    (if (not (bolp)) (forward-line 1))
    (delete-whitespace-rectangle (point) end nil)))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-beta")

(global-set-key "\C-xm" 'browse-url-at-point)


(require 'init-elpa)

;(require 'init-org)

(require 'init-auto-complete)

(require-package 'window-numbering)
(window-numbering-mode 1)

(autoload 'bsv-mode "bsv-mode" "BSV mode" t )
(setq auto-mode-alist (cons  '("\\.bsv\\'" . bsv-mode) auto-mode-alist))


;(require-package 'clojure-mode)
;(require-package 'd-mode)
(require-package 'go-mode)
(require 'init-cc)
;(require 'init-haskell)
;(require-package 'julia-mode)
;(require-package 'js2-mode)
;(require-package 'lua-mode)
;(require-package 'markdown-mode)
;(require-package 'racket-mode)
;(require-package 'rust-mode)
;(require-package 'tuareg)
;(require-package 'yaml-mode)
;(require-package 'scss-mode)

;(require-package 'puppet-mode)

;(require-package 'elm-mode)

(require 'init-themes)

(require 'server)
(unless (server-running-p)
  (server-start))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
