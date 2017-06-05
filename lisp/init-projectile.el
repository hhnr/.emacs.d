;; projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode))

(use-package counsel-projectile
  :ensure t
  :disabled t
  :init
  (counsel-projectile-on))

(use-package helm-projectile
  :ensure t
  :init
  (helm-projectile-on))
(provide 'init-projectile)
