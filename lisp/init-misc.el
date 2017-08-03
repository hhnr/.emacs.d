;;; prefer utf8 encoding
(prefer-coding-system 'utf-8)

;;; store all backup and autosave files in the tmp dir
;;; http://emacsredux.com/blog/2013/05/09/keep-backup-and-auto-save-files-out-of-the-way/
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; detach custom file
;;; http://emacsblog.org/2008/12/06/quick-tip-detaching-the-custom-file/
(setq custom-file "~/.emacs.d/custom.el")
;;(load custom-file 'noerror)

(global-auto-revert-mode)
(provide 'init-misc)
