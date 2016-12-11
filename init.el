
;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; UTF-8 please
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

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

;; Don't show startup message
(setq inhibit-startup-message t)

;; remove unnecessary gui
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; change cursor type
(setq-default cursor-type 'bar)

;; load theme
(load-theme 'smyx t)

(use-package which-key
  :diminish (which-key-mode)
  :config (which-key-mode))

;; company mode
(use-package company
  :diminish company-mode
  :init (setq company-minimum-prefix-length 2)
  :config (global-company-mode 1))

;; highlight matching parens
(show-paren-mode)

;; highlight current line
(global-hl-line-mode)

;; c customizations
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq c-default-style "linux"
      c-basic-offset 4)

;; typing y or n is enough for yes or no prompt
(defalias 'yes-or-no-p 'y-or-n-p)

;; projectile
(use-package projectile
  :init (setq projectile-enable-caching t)
  :commands projectile-find-file
  :config (projectile-global-mode))

(use-package helm
  :diminish helm-mode
  :init
  (require 'helm-config)
  (helm-mode 1)
  :bind   
  ("C-x C-f" . helm-find-files)
  ("C-x b" . helm-mini)           
  ("M-x" . helm-M-x))

(use-package helm-projectile
  :config
  (helm-projectile-on)
  :bind ("C-c p f" . helm-projectile-find-file))

(use-package helm-descbinds             
  :ensure t)

(use-package helm-ag            
  :ensure t)

(use-package helm-gtags         
  :ensure t
  :config
  ;; Enable helm-gtags-mode
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode)
  :bind (:map helm-gtags-mode-map
	      ("M-t" . helm-gtags-find-tag)
	      ("M-r" . helm-gtags-find-rtag)
	      ("M-s" . helm-gtags-find-symbol)
	      ("M-g M-p" . helm-gtags-parse-file)
	      ("C-c <" . helm-gtags-pervious-history)
	      ("C-c >" . helm-gtags-next-history)
	      ("M-," . helm-gtags-pop-stack)))

;; no custom config in init file please
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(use-package magit
  :commands magit-status
  :bind ("C-c m" . magit-status))


