;; Install editorcondig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package dtrt-indent
  :ensure t
  :config
  (setq dtrt-indent-run-after-smie t)
  :hook (prog-mode . (lambda ()
                       (modify-syntax-entry ?_ "w")
                       (dtrt-indent-mode)
                       (dtrt-indent-adapt))))

;; Provide module
(provide 'code)

