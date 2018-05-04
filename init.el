(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "~/Bluespec-2017.03.beta1/util/emacs"))

(require 'base)

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
(require-package 'markdown-mode)
;(require-package 'racket-mode)
;(require-package 'rust-mode)
;(require-package 'tuareg)
(require-package 'yaml-mode)
;(require-package 'scss-mode)

;(require-package 'puppet-mode)

;(require-package 'elm-mode)

;(require 'init-themes)

(require 'server)
(unless (server-running-p)
  (server-start))
