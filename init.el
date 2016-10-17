
;; don't add package-initialize to init file
(setq package--init-file-ensured t)

;; add lisp folder to load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; requires
(require 'init-packages)
(require 'init-ui)
(require 'init-misc)
(require 'init-company)
(require 'init-tags)
(require 'init-c)
(require 'init-projectile)
(require 'init-helm)
(require 'init-themes)

;; no custom config in init file please
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
