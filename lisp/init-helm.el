;; helm
;; https://github.com/emacs-helm/helm
(use-package helm
  :ensure t
  :config
  (progn
    (use-package helm-config
      :init
      (helm-mode 1)))
  :bind ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files))

;; helm-descbinds
;; https://github.com/emacs-helm/helm-descbinds
(use-package helm-descbinds
  :ensure t
  :bind ("C-h b" . helm-descbinds))

(provide 'init-helm)
