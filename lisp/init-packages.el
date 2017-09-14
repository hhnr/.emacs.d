;;; setup package archives
;;; http://melpa.milkbox.net/#/getting-started
(require 'package) 
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; set package-enable-at-startup to nil for slightly faster startup
(setq package-enable-at-startup nil)
(package-initialize)

;;; install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; use package
;;; https://github.com/jwiegley/use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

;; paradox
;; https://github.com/Malabarba/paradox
(use-package paradox
  :ensure t
  :commands paradox-list-packages)
  ;; :config
  ;; (paradox-enable))

(provide 'init-packages)
