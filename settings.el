
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
(load-theme 'manoj-dark t)

(use-package which-key
  :diminish (which-key-mode)
  :config (which-key-mode))

;; company mode
(use-package company
  :diminish company-mode
  :init (setq company-minimum-prefix-length 2)
  :config (global-company-mode 1))

; highlight matching parens
(show-paren-mode)

;; highlight current line
(global-hl-line-mode)

;; c customizations
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq c-default-style "linux"
            c-basic-offset 4)

;; projectile
(use-package projectile
  :init (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  :config (projectile-global-mode))

(use-package swiper
  :diminish ivy-mode
  :init (setq ivy-use-virtual-buffers t)
  :config
  (ivy-mode)
  :bind
  ("C-x C-f" . counsel-find-file)
  ("C-x b" . ivy-switch-buffer)
  ("M-x" . counsel-M-x)
  ("C-x c b" . ivy-resume))

(use-package counsel-projectile
  :config
  (counsel-projectile-on))

;; no custom config in init file please
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; syntax hightlight in org mode 
(setq org-src-fontify-natively t)
