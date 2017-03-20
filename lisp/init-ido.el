;;; ido mode
;;; https://www.gnu.org/software/emacs/manual/ido.html
(use-package ido
  :config
  (ido-mode t)
  (ido-everywhere t)
  :bind ("C-x C-f" . ido-find-file))

;;; ido-ubiquitous
;;; https://github.com/DarwinAwardWinner/ido-ubiquitous
(use-package ido-ubiquitous
  :ensure t
  :init
  (ido-ubiquitous-mode 1))

(use-package crm-custom
  :ensure t
  :defer t
  :init
  (crm-custom-mode 1))

(use-package ido-yes-or-no
  :ensure t
  :defer t
  :init
  (ido-yes-or-no-mode 1))

;;; ido-flx
;;; https://github.com/lewang/flx
(use-package flx-ido
  :ensure t
  :init
  (flx-ido-mode 1)
  (setq ido-enable-flex-matching t))

;;; ido-vertical-mode
;;; https://github.com/creichert/ido-vertical-mode.el
(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(provide 'init-ido)
