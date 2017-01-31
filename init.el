;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'base)

(require 'init-elpa)

;(require 'init-org)

(require 'init-auto-complete)

(require-package 'window-numbering)
(window-numbering-mode 1)

(require-package 'clojure-mode)
(require-package 'd-mode)
(require-package 'go-mode)
(require 'init-cc)
(require 'init-haskell)
(require-package 'julia-mode)
(require-package 'js2-mode)
(require-package 'llvm-mode)
(require-package 'lua-mode)
(require-package 'markdown-mode)
(require-package 'racket-mode)
(require-package 'rust-mode)
(require-package 'tuareg)
(require-package 'yaml-mode)
(require-package 'scss-mode)

(require-package 'puppet-mode)

(require-package 'elm-mode)

(require 'init-themes)

(require 'server)
(unless (server-running-p)
  (server-start))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
