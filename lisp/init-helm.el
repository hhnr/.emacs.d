;; helm
;; https://github.com/emacs-helm/helm
(use-package helm
  :ensure t
  :config
  (use-package helm-config
    :init
    ;; http://pragmaticemacs.com/emacs/find-and-open-files-from-anywhere-with-helm-for-files/
    ;; limit max number of matches displayed for speed
    (setq helm-candidate-number-limit 100)
    ;; ignore boring files like .o and .a
    (setq helm-ff-skip-boring-files t)
    ;; fuzzy matching for helm-M-x
    (setq helm-M-x-fuzzy-match t)
    (setq helm-buffers-fuzzy-matching t
	  helm-recentf-fuzzy-match t)
    (setq helm-semantic-fuzzy-match t
	  helm-imenu-fuzzy-match t)
    (setq helm-locate-fuzzy-match t)
    (setq helm-apropos-fuzzy-match t)
    (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
    (helm-mode 1))
  :diminish helm-mode
  :bind ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ("C-x b" . helm-mini)
  ("M-y" . helm-show-kill-ring)
  ("C-c h x" . helm-register))

;; helm-descbinds
;; https://github.com/emacs-helm/helm-descbinds
(use-package helm-descbinds
  :ensure t
  :bind ("C-h b" . helm-descbinds))

;; emacs-helm-ag
;; https://github.com/syohex/emacs-helm-ag
(use-package helm-ag
  :ensure t
  :commands helm-ag)

;; helm-cscope
;; https://github.com/alpha22jp/helm-cscope.el
(use-package helm-cscope
  :ensure t
  :commands (helm-cscope-find-global-definition
	     helm-cscope-find-calling-this-function
	     helm-cscope-find-this-symbol
	     helm-cscope-pop-mark)
  :init
  (add-hook 'c-mode-common-hook 'helm-cscope-mode)
  (add-hook 'helm-cscope-mode-hook
	    (lambda ()
	      (local-set-key (kbd "M-.") 'helm-cscope-find-global-definition)
	      (local-set-key (kbd "M-@") 'helm-cscope-find-calling-this-function)
	      (local-set-key (kbd "M-s") 'helm-cscope-find-this-symbol)
	      (local-set-key (kbd "M-,") 'helm-cscope-pop-mark))))

(provide 'init-helm)
