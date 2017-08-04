;;; magit
;;; https://github.com/magit/magit
(use-package magit
  :ensure t
  :commands magit-status
  :bind ("C-x g" . magit-status))
  ;; :init
  ;; (setq magit-completing-read-function 'magit-ido-completing-read))

(provide 'init-magit)
