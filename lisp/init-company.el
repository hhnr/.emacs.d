;; company mode
;; https://github.com/company-mode/company-mode
(use-package company
  :ensure t
  :diminish company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; company-c-headers
;; https://github.com/randomphrase/company-c-headers
(use-package company-c-headers
  :ensure t
  :init
  (add-to-list 'company-backends 'company-c-headers))

(provide 'init-company)
