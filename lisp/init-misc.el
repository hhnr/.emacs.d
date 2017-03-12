;;; prefer utf8 encoding
(prefer-coding-system 'utf-8)

;;; store all backup and autosave files in the tmp dir
;;; http://emacsredux.com/blog/2013/05/09/keep-backup-and-auto-save-files-out-of-the-way/
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(provide 'init-misc)
