;; projectile
(use-package projectile
  :defer t
  :ensure t
  :init
  (projectile-mode))

(use-package counsel-projectile
  :defer t
  :ensure t
  :init
  (setq projectile-completion-system 'ivy))
  ;; :disabled t
  ;; :init
  ;; (counsel-projectile-on))

(use-package helm-projectile
  :ensure t
  :disabled t
  :init
  (helm-projectile-on))
(provide 'init-projectile)
