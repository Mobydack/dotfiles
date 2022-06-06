;; Install divish
(use-package dirvish
  :ensure t
  :config
  (dirvish-override-dired-mode)
  (dirvish-peek-mode)
  :bind
  (("C-c f" . dirvish-fd)
   :map dired-mode-map
   ("TAB" . dirvish-toggle-subtree)
   ("SPC" . dirvish-show-history)
   ("*" . dirvish-mark-menu)
   ("r" . dirvish-roam)
   ("b" . dirvish-goto-bookmark)
   ("f" . dirvish-file-info-menu)
   ("M-n" . dirvish-go-forward-history)
   ("M-p" . dirvish-go-backward-history)
   ("M-s" . dirvish-setup-menu)
   ("M-f" . dirvish-toggle-fullscreen)
   ([remap dired-sort-toggle-or-edit] . dirvish-quicksort)
   ([remap dired-do-redisplay] . dirvish-ls-switches-menu)
   ([remap dired-summary] . dirvish-dispatch)
   ([remap dired-to-copy] . dirvish-yank-menu)
   ([remap mode-line-other-buffer] . dirvish-other-buffer)))

;; Syntex highlight
(use-package diredfl
  :hook
  (dired-mode . diredfl-mode))

;; Provide module
(provide 'dired-settings)

