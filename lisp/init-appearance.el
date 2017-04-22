;;; disable splash screen on emacs start
(setq inhibit-splash-screen t)

;;; spacemacs theme
;;; https://github.com/nashamri/spacemacs-theme
(use-package spacemacs-theme
  :ensure t
  :disabled t
  :defer t
  :init
  (load-theme 'spacemacs-dark t))

;;; spaceline theme
;;; https://github.com/TheBB/spaceline
(use-package spaceline
  :ensure t
  :disabled t
  :init
  (use-package spaceline-config)
  (spaceline-spacemacs-theme))

;; set theme
;;(load-theme 'misterioso t)

;;; set dejavu font
(set-frame-font "DejaVu Sans Mono-10")

;;; disable scrollbar mode
(scroll-bar-mode -1)

;;; disable toolbar mode
(tool-bar-mode -1)

;; highlight matching parens
(show-paren-mode)
(provide 'init-appearance)
