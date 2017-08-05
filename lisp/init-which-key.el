;;; which key mode
;;; https://github.com/justbur/emacs-which-key
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init
  (setq which-key-dont-use-unicode t)
  :config
  (which-key-mode))
(provide 'init-which-key)
