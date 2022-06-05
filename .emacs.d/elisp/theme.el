;; Spacemacs theme
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defautls)
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-henna t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification
  (doom-themes-org-config))

;; Sculpture theme
;; (use-package sculpture-themes
;;   :ensure t
;;   :load-path "themes"
;;   :config
;;   (load-theme 'sculpture-themes-dark t))

;; Provide module
(provide 'theme)
