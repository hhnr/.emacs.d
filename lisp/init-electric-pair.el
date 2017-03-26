;; electric pair mode
;; automatic character pairing
(use-package electric-pair-mode
  :init
  ;; enable pairing for {}
  (setq electric-pair-pairs '((?\{ . ?\})))
  (electric-pair-mode))

(provide 'init-electric-pair)


