;; Install doom-modline
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-indent-info t))

;; Provide module
(provide 'modeline-settings)
