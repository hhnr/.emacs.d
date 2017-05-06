;;; disable splash screen on emacs start
(setq inhibit-splash-screen t)

(use-package zenburn-theme
  :ensure t
  :init
  (load-theme 'zenburn t))

;;; set dejavu font
(set-frame-font "DejaVu Sans Mono-10")

;;; disable scrollbar mode
(scroll-bar-mode -1)

;;; disable toolbar mode
(tool-bar-mode -1)

;; highlight matching parens
(show-paren-mode)
(provide 'init-appearance)
