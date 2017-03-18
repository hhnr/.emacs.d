;;; disable splash screen on emacs start
(setq inhibit-splash-screen t)

;;; spacemacs theme
;;; https://github.com/nashamri/spacemacs-theme
(use-package spacemacs-theme
  :ensure t
  :init
  (load-theme 'spacemacs-dark t))

(provide 'init-appearance)
