;; Don't show toolbar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; Don't show scrollbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Don't show startup message
(setq inhibit-startup-message t)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; UTF-8 please
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; fix backspace : emacs launched in terminal from mobaxterm
;; (normal-erase-is-backspace-mode 1)

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

;; company mode
(use-package company
	     :ensure t)

(setq company-minimum-prefix-length 2)
(global-company-mode 1)

;; ggtags
(use-package ggtags
	     :ensure t)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	                    (ggtags-mode 1))))

;; c customizations
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq c-default-style "linux"
            c-basic-offset 4)

;; projectile
;; enable projectile globally
(use-package projectile
	     :ensure t)
(projectile-global-mode)
;; use caching
(setq projectile-enable-caching t)

;; have automated customizations in separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
