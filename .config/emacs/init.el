;; Elpaca settings (Package manager)
(defvar elpaca-installer-version 0.6)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  (elpaca-use-package-mode)
  (setq elpaca-use-package-by-default t))

(elpaca-wait)

;; Emacs default settings
(use-package emacs
  :elpaca nil
  :config
  (setq
   inhibit-startup-message t
   make-backup-files nil
   confirm-kill-emacs 'y-or-n-p
   global-auto-revert-non-file-buffers t
   default-frame-alist (append default-frame-alist
                               '((fullscreen . maximized)
                                 (font . "Hack-16"))))
  (save-place-mode 1)
  (global-auto-revert-mode 1)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (global-display-line-numbers-mode 1)
  (global-hl-line-mode 1)
  (setq-default indent-tabs-mode nil))



;;; Whitespace
(use-package dtrt-indent
  :config
  (dtrt-indent-global-mode))


;; BEGIN_INTERFACE_SETTINGS
(use-package autothemer)

(use-package kanagawa-theme
  :after (autothemer)
  :config
  (load-theme 'kanagawa t))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

(use-package beacon
  :config
  (beacon-mode 1))

(use-package nerd-icons)
(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package doom-modeline
  :after (nerd-icons)
  :init
  (doom-modeline-mode 1))
;; END_INTERFACE_SETTINGS

;; File manager
(use-package dirvish
  :bind
  ("C-x d" . 'dirvish)
  ("C-c f" . 'dirvish-fd)
  :config
  (dirvish-override-dired-mode)
  (setq insert-directory-program "gls"
	dirvish-mode-line-format
	'(:left (sort symlink) :right (omit yank index))
	dirvish-mode-line-height 10
	dirvish-attributes
	'(nerd-icons file-time file-size collapse subtree-state vc-state git-msg)
	dirvish-subtree-state-style 'nerd
	delete-by-moving-to-trash t
	dirvish-path-separators (list
                                 (format "  %s " (nerd-icons-codicon "nf-cod-home"))
                                 (format "  %s " (nerd-icons-codicon "nf-cod-root_folder"))
                                 (format " %s " (nerd-icons-faicon "nf-fa-angle_right")))
	dired-listing-switches "-l --almost-all --human-readable --group-directories-first --no-group"
	dired-mouse-drag-files t
	mouse-drag-and-drop-region-cross-program t
	mouse-1-click-follows-link nil)
  (define-key dirvish-mode-map (kbd "<mouse-1>") 'dirvish-subtree-toggle-or-open)
  (define-key dirvish-mode-map (kbd "<mouse-2>") 'dired-mouse-find-file-other-window)
  (define-key dirvish-mode-map (kbd "<mouse-3>") 'dired-mouse-find-file)
  ;;  (dirvish-peek-mode) ; Preview files in minibuffer
  (dirvish-side-follow-mode) ; similar to `treemacs-follow-mode'
  )

;; Buffers
(use-package ibuffer
  :elpaca nil
  :bind ("C-x C-b" . 'ibuffer)
  :config
  (setq ibuffer-display-summary nil))

(use-package ido
  :elpaca nil
  :config
  (setq ido-enable-flex-matching t
	ido-everywhere t)
  (ido-mode t))

;; Windows
(use-package ace-window
  :ensure t
  :bind
  ("M-o" . 'ace-window)
  ("C-x o" . 'ace-window))

;; Transparent Remote Access, Multiple Protocols (TRAMP)
(use-package tramp
  :elpaca nil
  :config
  ;; Enable full-featured Dirvish over TRAMP on certain connections
  ;; https://www.gnu.org/software/tramp/#Improving-performance-of-asynchronous-remote-processes-1.
  (add-to-list 'tramp-connection-properties
               (list (regexp-quote "/ssh:YOUR_HOSTNAME:")
                     "direct-async-process" t))
  ;; Tips to speed up connections
  (setq tramp-verbose 0)
  (setq tramp-chunksize 2000)
  (setq tramp-use-ssh-controlmaster-options nil))

;; Version control
(use-package magit)

;; Code
(use-package selection-highlight-mode
  :elpaca (
	   :host github
	   :repo "balloneij/selection-highlight-mode")
  :config (selection-highlight-mode))

(use-package treesit-auto
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package nix-ts-mode
  :mode "\\.nix\\'")

;; Code completion
(use-package company
  :config
  (global-company-mode))

(use-package corfu
  :init
  (global-corfu-mode))

(use-package eglot
  :config
  (setq shell-file-name "zsh")
  ((lambda (mode-list)
     "Auto start lsp client for modes"
     (dolist (mode mode-list)
       (add-hook (intern (concat mode "-hook")) 'eglot-ensure)))
   '(
     "rust-ts-mode"
     "typescript-ts-mode"
     "tsx-ts-mode"
     "javascript-ts-mode"
     "html-ts-mode"
     "css-ts-mode"
     "bash-ts-mode"
     "yaml-ts-mode"
     ))
  (add-to-list 'eglot-server-programs '((rust-ts-mode rust-mode) . ("rust-analyzer")))
  (add-to-list 'eglot-server-programs '((js-mode js-ts-mode tsx-ts-mode typescript-ts-mode typescript-mode) . ("/usr/bin/volta" "run" "--node" "20" "npx" "-y" "typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '((js-json-mode json-mode json-ts-mode) . ("/usr/bin/volta" "run" "--node" "20" "npx" "-y" "-p" "vscode-langservers-extracted" "vscode-json-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '((bash-ts-mode sh-mode) . ("/usr/bin/volta" "run" "--node" "20" "npx" "-y" "bash-language-server" "start")))
  (add-to-list 'eglot-server-programs '((css-ts-mode css-mode) . ("/usr/bin/volta" "run" "--node" "20" "npx" "-y" "-p" "vscode-langservers-extracted" "vscode-css-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '((html-ts-mode html-mode) . ("/usr/bin/volta" "run" "--node" "20" "npx" "-y" "-p" "vscode-langservers-extracted" "vscode-html-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '((yaml-ts-mode yaml-mode) . ("/usr/bin/volta" "run" "--node" "20" "npx" "-y" "yaml-language-server" "--stdio"))))

(use-package eldoc-box
  :config
  (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode t))

(use-package apheleia)

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package indent-guide
  :config
  (indent-guide-global-mode))

;; Finder
(use-package deadgrep)

(custom-set-variables '(package-selected-packages '(eglot)))
(custom-set-faces)
