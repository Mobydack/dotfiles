;; Values
;;;; Username value
(defvar mobydack/dashboard-title
  (concat "Welcome to EMACS " (user-full-name)))

(defvar mobydack/dashboard-footer-message "Understanding 100% of everything is impossible.")

;;; Banner type
(defvar mobydack/dashboard-startup-banner
  "~/.emacs.d/elisp/assets/logo-2.gif");
;;;; Items
(defvar mobydack/dashboard-items
  '((recents . 15)
    (projects . 5)
    (agenda . 5)))

;; Dependencies
(use-package page-break-lines
  :ensure t)
(use-package all-the-icons
  :ensure t)

;; Set dashboard
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title mobydack/dashboard-title)
  (setq show-week-agenda-p t)
  (setq dashboard-items mobydack/dashboard-items)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq )
  (setq dashboard-startup-banner mobydack/dashboard-startup-banner)
  (setq initial-buffer-choise (lambda () (get-buffer "*dashboard*")))
  (dashboard-setup-startup-hook))

;; Provide module
(provide 'startup-screen)
