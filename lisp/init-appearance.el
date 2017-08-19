;;; disable splash screen on emacs start
(setq inhibit-splash-screen t)

;; (use-package solarized-theme
;;   :ensure t
;;   :init
;;   (load-theme 'solarized-dark t))
(load-theme 'leuven t)
;;; set dejavu font
;;;(set-frame-font "Terminus-10")

;;; disable scrollbar mode
(scroll-bar-mode -1)

;;; disable toolbar mode
(tool-bar-mode -1)

;; highlight matching parens
(show-paren-mode)
(provide 'init-appearance)
