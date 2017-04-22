;;; add lisp directory to load path,
;;; so that we can require files that are inside lisp directory
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

(require 'init-misc)
(require 'init-packages)
(require 'init-which-key)
;;(require 'init-ido)
;;(require 'init-smex)
(require 'init-magit)
;;(require 'init-helm)
(require 'init-ivy)
(require 'init-ag)
(require 'init-appearance)
(require 'init-highlight-symbol)
(require 'init-company)
(require 'init-electric-pair)
