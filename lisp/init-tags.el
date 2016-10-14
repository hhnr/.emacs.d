
;; ggtags
(use-package ggtags
  :ensure t
  :diminish ggtags
  :init
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(ggtags-mode 1)))))


(provide 'init-tags)
