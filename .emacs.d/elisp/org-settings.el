(global-set-key (kbd "C-c o a") 'org-agenda)
(global-set-key (kbd "C-c o c") 'org-capture)

(setq org-todo-keywords '("TODO" "STARTED" "WAITING" "DONE"))

(unless (file-directory-p "~/org/agenda") (make-directory "~/org/agenda" ))

(setq org-agenda-files (directory-files-recursively "~/org/agenda" "org$"))
(setq org-default-notes-file "~/org/agenda/organizer.org")

;; Provide module
(provide 'org-settings)
