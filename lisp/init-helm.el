;; helm
;; https://github.com/emacs-helm/helm
(use-package helm
  :ensure t
  :config
  (progn
    (use-package helm-config
      :init
      (helm-mode 1))
    ;; http://pragmaticemacs.com/emacs/find-and-open-files-from-anywhere-with-helm-for-files/
    ;; limit max number of matches displayed for speed
    (setq helm-candidate-number-limit 100)
    ;; ignore boring files like .o and .a
    (setq helm-ff-skip-boring-files t))
  :bind ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files))

;; helm-descbinds
;; https://github.com/emacs-helm/helm-descbinds
(use-package helm-descbinds
  :ensure t
  :bind ("C-h b" . helm-descbinds))

(provide 'init-helm)
