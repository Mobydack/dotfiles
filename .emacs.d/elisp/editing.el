;; Multiple cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
	 ("C->" . mc/mark-next-like-this)
	 ("C-<" . mc/mark-previous-like-this)
	 ("C-c C-<" . mc/mark-all-like-this)))

;; Auto indent
(use-package auto-indent-mode
  :ensure t
  :init
  (auto-indent-global-mode)
  :config
  (setq auto-indent-on-visit-file t))


;; Aggressive indent
(use-package aggressive-indent
  :ensure t
  :init
  (global-aggressive-indent-mode 1))

;; Provide module
(provide 'editing)
