(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'base)

(require 'init-elpa)

(require 'init-auto-complete)

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

(require 'init-themes)

(require 'server)
(unless (server-running-p)
  (server-start))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
