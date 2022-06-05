;; Elisp files
(add-to-list 'load-path (concat user-emacs-directory "elisp"))

;; Utils functions
(require 'utils)

;; Base configuration
(require 'base)

;; Org
(require 'org)

;; Theme
(require 'theme)

;; Interface
(require 'interface)

;; Completion
(require 'completion)

;; Startup screen
(require 'startup-screen)

;; Workspace
(require 'workspace)

;; Editing
(require 'editing)

;; VSC
(require 'vsc)

;; LSP
(require 'lsp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-ivy lsp-ui lsp-mode which-key use-package projectile page-break-lines doom-themes dashboard counsel all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
