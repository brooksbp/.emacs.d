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

(provide 'base)
