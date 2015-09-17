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

(provide 'init-auto-complete)
