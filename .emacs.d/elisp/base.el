;; Set default coding system
(set-default-coding-systems 'utf-8)

;; Set default font size
(defvar mobydack/default-font-size 160)
(set-face-attribute 'default nil :height mobydack/default-font-size)

;; Package repositories
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
 			 ("melpa-stable" . "https://stable.melpa.org/packages/")
 			 ("org" . "https://orgmode.org/elpa/")
 			 ("elpa" .  "https://elpa.gnu.org/packages/")))


(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))


;; Install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Emacs customization
(setq make-backup-files nil
      display-line-numbers-type 'relative
      use-package-always-ensure t)

;; Keep buffers automatically up to date
(global-auto-revert-mode t)

;; Display line number
(global-display-line-numbers-mode t)

;; Disable tool bar
(tool-bar-mode -1)

;; Disable menu bar mode
(menu-bar-mode -1)

;; Show matching parentheses
(show-paren-mode 1)

;; Provide module
(provide 'base)

