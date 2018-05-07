(require-package 'monokai-theme)
(setq-default custom-enabled-themes '(monokai))

;(require-package 'material-theme)
;(load-theme 'material t)
;(load-theme 'material-light t)

;(require-package 'moe-theme)
;(load-theme 'moe-dark t)
;(load-theme 'moe-light t)

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

(provide 'init-themes)
