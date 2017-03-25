;; highlight-symbol
;; https://github.com/nschum/highlight-symbol.el

(use-package highlight-symbol
  :ensure t
  :init
  (global-set-key [(control f3)] 'highlight-symbol)
  (global-set-key [f3] 'highlight-symbol-next)
  (global-set-key [(shift f3)] 'highlight-symbol-prev)
  (global-set-key [(meta f3)] 'highlight-symbol-query-replace))

(provide 'init-highlight-symbol)
