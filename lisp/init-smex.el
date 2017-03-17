;;; smex
;;; https://github.com/nonsequitur/smex
(use-package smex
  :ensure t
  :bind ("M-x" . smex)
  ("M-X" . smex-major-mode-commands))

(provide 'init-smex)
