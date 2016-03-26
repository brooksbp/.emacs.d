(require-package 'org)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done 'time)

(setq org-agenda-files '("~/org/nodes"))

(defun nightly-agenda ()
  "This function returns 5"
  (interactive)
  (org-agenda-list)
  (write-region (point-min) (point-max) "~/.nightly.agenda" t)
  (kill-emacs))

(provide 'init-org)
