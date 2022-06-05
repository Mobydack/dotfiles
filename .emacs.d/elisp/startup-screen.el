;; Values
;;;; Username value
(defvar mobydack/dashboard-title
  (concat "Welcome to EMACS " (user-full-name)))
;;; Banner type
(defvar mobydack/dashboard-startup-banner
  "~/.emacs.d/elisp/assets/logo-2.gif");
;;;; Items
(defvar mobydack/dashboard-items
  '((recents . 15)
    (projects . 5)
    (agenda . 5)))

;; Dependencies
(use-package page-break-lines)
(use-package all-the-icons)

;; Set dashboard
(use-package dashboard
  :config
  (setq dashboard-banner-logo-title mobydack/dashboard-title)
  (setq show-week-agenda-p t)
  (setq dashboard-items mobydack/dashboard-items)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner mobydack/dashboard-startup-banner)
  (dashboard-setup-startup-hook))

;; Provide module
(provide 'startup-screen)
