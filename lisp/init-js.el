;; js2-mode
;; https://emacs.cafe/emacs/javascript/setup/2017/04/23/emacs-setup-javascript.html
(use-package js2-mode
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  ;; Better imenu
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode))

;; xref-js2
(use-package xref-js2
  :ensure t
  :defer t
  :config
  ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
  ;; unbind it.
  (define-key js-mode-map (kbd "M-.") nil)
  
  (add-hook 'js2-mode-hook (lambda ()
			     (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))
(provide 'init-js)
