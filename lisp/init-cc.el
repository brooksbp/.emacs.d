(require-package 'google-c-style)

(defun setup-c-mode ()
  (set-variable 'indent-tabs-mode t))
(add-hook 'c-mode-common-hook 'setup-c-mode)

(setq c-default-style "linux")

(defun google-cc-mode ()
  (interactive)
  (set-variable 'indent-tabs-mode nil)
  (google-set-c-style)
  (google-make-newline-indent))

(provide 'init-cc)
