;; projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode))

(use-package counsel-projectile
  :ensure t
  :init
  (counsel-projectile-on))

(provide 'init-projectile)
