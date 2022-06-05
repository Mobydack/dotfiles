;; Setting projectile
(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-global-mode)
  :init
  (setq projectile-project-search-path '("~/Repos"))
  (setq projectile-switch-project-action #'projectile-dired))

;; Provide module
(provide 'workspace)

