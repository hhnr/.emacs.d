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
  :config (projectile-mode))

(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  ;; enable fuzzy matching everywhere
  ;; https://github.com/emacs-helm/helm/wiki/Fuzzy-matching
  (setq helm-recentf-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-locate-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-semantic-fuzzy-match t)
  (setq helm-imenu-fuzzy-match t)
  (setq helm-apropos-fuzzy-match t)
  (setq helm-lisp-fuzzy-completion t)
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)

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
  :bind ("C-c p f" . helm-find)
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

;; recentf mode
;; https://www.emacswiki.org/emacs/RecentFiles
(use-package recentf
  :init
  (setq recentf-max-menu-items 25)
  :bind ("C-x C-r" . helm-recentf)
  :config
  (recentf-mode 1)
  ;; periodically save the list of files
  (run-at-time nil (* 5 60) 'recentf-save-list))

;; kill the current buffer without a prompt
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; delete selected text on insert
(delete-selection-mode +1)

;; paredit mode
(use-package paredit
  :ensure t
  :diminish paredit-mode
  :init
  (add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode))


;; improve emacs display performance
;; https://www.masteringemacs.org/article/improving-performance-emacs-display-engine
(setq redisplay-dont-pause t)

(use-package golden-ratio
  :ensure t
  :diminish golden-ratio-mode
  :init
  (golden-ratio-mode 1))
