;(require-package 'google-c-style)



;; Linux

;; (defun setup-c-mode ()
;;   (set-variable 'indent-tabs-mode t)
;;   (c-set-offset 'inextern-lang 0))
;; (add-hook 'c-mode-common-hook 'setup-c-mode)
;; (setq c-default-style "linux")


;(setq c-default-style "gnu")


;; Allman

(setq c-default-style "bsd")
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)



;; Google

;; (defun google-cc-mode ()
;;  (interactive)
;;  (set-variable 'indent-tabs-mode nil)
;;  (google-set-c-style)
;;  (google-make-newline-indent))
;; (add-hook 'c++-mode-hook 'google-cc-mode)
;; (add-hook 'c-mode-common-hook 'google-cc-mode)



(provide 'init-cc)
