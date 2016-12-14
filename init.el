
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
(use-package smyx-theme
  :ensure t
  :config
  (load-theme 'smyx t))

(use-package which-key
  :ensure t
  :diminish (which-key-mode)
  :config (which-key-mode))

;; company mode
(use-package company
  :ensure t
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
  :ensure t
  :init (setq projectile-enable-caching t)
  :commands projectile-find-file
  :config (projectile-global-mode))

(use-package helm
  :ensure t
  :diminish helm-mode
  :config
  (require 'helm-config)
  (helm-mode 1)
  :bind   
  ("C-x C-f" . helm-find-files)
  ("C-x b" . helm-mini)           
  ("M-x" . helm-M-x))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  :bind ("C-c p f" . helm-projectile-find-file)
  ("C-c p p" . helm-projectile-switch-project))

(use-package helm-descbinds             
  :ensure t
  :commands helm-descbinds)

(use-package helm-ag            
  :ensure t
  :commands helm-ag)

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
  :ensure t
  :commands magit-status
  :bind ("C-c m" . magit-status))

(use-package esup
  :commands esup
  :ensure t)

;; gnus
;; saving mail locally 
(require 'gnus)
(setq nnml-directory "~/gmail")
(setq message-directory "~/gmail")
;; don't ignore gmail groups
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")

;; getting mail
(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port 993)
               (nnimap-stream ssl)))

;; sending mail
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "your-name@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      starttls-use-gnutls t)
