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

;; package management
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defconst my-packages
  '(;; code completion
    company
    ;; vim emulation
    evil
    ;; tags creation/ code navigation using tags
    ggtags
    ;; for easy selection of item from any list
    ido
    ido-ubiquitous
    smex
    ;; project management
    projectile))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; company mode
(setq company-minimum-prefix-length 2)
(global-company-mode 1)

;; ido configurations
(ido-mode 1)
(ido-everywhere 1)

;; ido ubiquitous
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; ggtags
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	                    (ggtags-mode 1))))

;; c customizations
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq c-default-style "linux"
            c-basic-offset 4)

;; enable projectile globally
(projectile-global-mode)

;; use caching
(setq projectile-enable-caching t)
