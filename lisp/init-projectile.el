
;; projectile
(use-package projectile
  :ensure t
  :init (setq projectile-enable-caching t)
  :config (projectile-global-mode))


(provide 'init-projectile)
