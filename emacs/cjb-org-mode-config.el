;; -*- lexical-binding: t -*-

(setq org-todo-keywords
      '((sequence "TODO" "WORKING" "|" "DONE")))
(setq org-todo-keyword-faces '(("WORKING" . (:foreground "yellow" :background "black"))))
(setq org-startup-indented t)
(setq org-export-backends (quote (ascii html latex md)))
(add-hook 'org-mode-hook 'visual-line-mode)

;; Keybindings really should go in the keybindings file, but these are described in the manual as defaults,
;; so I dunno why they don't just work :shrug:
(define-key evil-normal-state-map (kbd "s-<up>")    'org-table-move-cell-up)
(define-key evil-normal-state-map (kbd "s-<down>")  'org-table-move-cell-down)
(define-key evil-normal-state-map (kbd "s-<left>")  'org-table-move-cell-left)
(define-key evil-normal-state-map (kbd "s-<right>") 'org-table-move-cell-right)

(provide 'cjb-org-mode-config)
