(use-package counsel
  :ensure t
  :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode 1)
  :bind
    ("C-c C-r" . ivy-resume)
    ("M-x" . counsel-M-x)
    ("C-x C-f" . counsel-find-file)
    ("<f1> f" . counsel-describe-function)
    ("<f1> v" . counsel-describe-variable)
    ("<f1> l" . counsel-find-library)
    ("<f2> i" . counsel-info-lookup-symbol)
    ("C-c g" . counsel-git)
    ("C-c j" . counsel-git-grep)
    ("C-c k" . counsel-ag)
    ("C-x l" . counsel-locate))

(use-package smex
  :ensure t
  :init
  (smex-initialize))

(provide 'init-ivy)
