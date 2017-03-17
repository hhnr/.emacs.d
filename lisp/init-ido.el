;;; ido mode
;;; https://www.gnu.org/software/emacs/manual/ido.html
(use-package ido
  :config
  (ido-mode t)
  :bind ("C-x C-f" . ido-find-file))

(provide 'init-ido)
