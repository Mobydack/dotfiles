;; Elisp files
(add-to-list 'load-path (concat user-emacs-directory "elisp"))

;; Utils functions
;;(require 'utils)

;; Base configuration
(require 'base)

;; Org
(require 'org-settings)

;; Theme
(require 'theme)

;; Interface
;;;; Base
(require 'interface)

;;;; Modline
(require 'modeline-settings)

;; Completion
(require 'completion)

;; Startup screen
(require 'startup-screen)

;; Dired settings
(require 'dired-settings)

;; Workspace
(require 'workspace)

;; Editing
(require 'editing)

;; VSC
(require 'vsc)

;; LSP
(require 'lsp)

;; Code
(require 'code)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dirvish which-key use-package projectile page-break-lines multiple-cursors magit-popup magit lsp-ui lsp-ivy doom-themes dashboard counsel all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
