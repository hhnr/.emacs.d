(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(use-package smyx-theme
  :ensure t
  :config
  (load-theme 'smyx t))


(provide 'init-themes)
