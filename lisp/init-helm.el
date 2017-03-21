(use-package helm
  :ensure t
  :config
  (progn
    (use-package helm-config
      :init
      (helm-mode 1)))
  :bind ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files))

(provide 'init-helm)
