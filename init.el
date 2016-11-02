;; don't add package-initialize to init file
(setq package--init-file-ensured t)

;; Don't show startup message
(setq inhibit-startup-message t)

;; remove unnecessary gui
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; UTF-8 please
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; add lisp folder to load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;;; Package management

;; Please don't load outdated byte code
(setq load-prefer-newer t)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-verbose t)
;;(setq use-package-always-defer t)

(use-package which-key
  :diminish (which-key-mode)
  :ensure t
  :config (which-key-mode))

;; highlight matching parens
(show-paren-mode)

;; company mode
(use-package company
  :ensure t
  :diminish company-mode
  :init (setq company-minimum-prefix-length 2)
  :config (global-company-mode 1))

;; ggtags
(use-package ggtags
  :ensure t
  :diminish ggtags
  :init
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(ggtags-mode 1)))))

;; c customizations
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq c-default-style "linux"
	    c-basic-offset 4)

;; projectile
(use-package projectile
  :ensure t
  :init (setq projectile-enable-caching t)
  :config (projectile-global-mode))

(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (require 'helm-config)
  (helm-mode 1)
  :bind
  ("C-x C-f" . helm-find-files)
  ("C-x b" . helm-mini)
  ("M-x" . helm-M-x))

(use-package helm-projectile
  :ensure t
  :init
  (require 'helm-projectile)
  (helm-projectile-on))

(use-package helm-descbinds
  :ensure t)

(use-package helm-ag
 :ensure t)

(use-package helm-gtags
 :ensure t)

;;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; customize
(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

;; key bindings
(with-eval-after-load 'helm-gtags
  (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
  (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
  (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
  (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack))

(use-package smart-mode-line
  :ensure t
  :disabled t
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(use-package smyx-theme
  :ensure t
  :config
  (load-theme 'smyx t))

(use-package auto-highlight-symbol
  :ensure t)

(global-auto-highlight-symbol-mode)
(define-key auto-highlight-symbol-mode-map (kbd "M-p") 'ahs-backward)
(define-key auto-highlight-symbol-mode-map (kbd "M-n") 'ahs-forward)
(setq ahs-idle-interval 1.0) ;; if you want instant highlighting, set it to 0, but I find it annoying
(setq ahs-default-range 'ahs-range-whole-buffer) ;; highlight every occurence in buffer

;; inhibits highlighting in specific places, like in comments
(setq ahs-inhibit-face-list '(font-lock-comment-delimiter-face
				font-lock-comment-face
				font-lock-doc-face
				font-lock-doc-string-face
				font-lock-string-face))

;; no custom config in init file please
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
