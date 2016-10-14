(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))


(provide 'init-themes)
