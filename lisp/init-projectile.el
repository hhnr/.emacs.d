;; projectile
(use-package projectile
  :defer t
  :ensure t
  :bind ("C-c p f" .  projectile-find-file)
  :config
  (projectile-global-mode t))

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
