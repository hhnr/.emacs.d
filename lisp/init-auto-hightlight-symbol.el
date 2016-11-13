(use-package auto-highlight-symbol
  ; this only installs it for programming mode derivatives; you can also make it global...
  :init
  (add-hook 'prog-mode-hook 'auto-highlight-symbol-mode)
  ;; if you want instant highlighting, set it to 0, but I find it annoying
  (setq ahs-idle-interval 1.0) 
  :diminish auto-highlight-symbol-mode
  :bind (:map auto-highlight-symbol-mode-map
              ("M-p" . ahs-backward)
              ("M-n" . ahs-forward)))

(provide 'init-auto-hightlight-symbol)
