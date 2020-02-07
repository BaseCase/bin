;; -*- lexical-binding: t -*-

(setq org-todo-keywords
      '((sequence "TODO" "WORKING" "|" "DONE")))
(setq org-todo-keyword-faces '(("WORKING" . (:foreground "yellow" :background "black"))))
(setq org-startup-indented t)
(setq org-export-backends (quote (ascii html latex md)))
(add-hook 'org-mode-hook 'visual-line-mode)

(provide 'cjb-org-mode-config)
