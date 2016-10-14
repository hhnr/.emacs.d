(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (require 'helm-config)
  (helm-mode)
  :bind ("C-x C-f" . helm-find-files)
  ("M-x" . helm-M-x)
  ("C-x b" . helm-mini))

(use-package helm-projectile
  :ensure t
  :init
  (require 'helm-projectile)
  (helm-projectile-on))

(use-package helm-descbinds
  :ensure t)

(use-package helm-ag
  :ensure t)


(provide 'init-helm)
