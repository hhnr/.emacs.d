
;; don't add package-initialize to init file
(setq package--init-file-ensured t)

(org-babel-load-file (expand-file-name (concat user-emacs-directory "settings.org")))
