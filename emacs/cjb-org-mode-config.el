;; -*- lexical-binding: t -*-

(setq org-todo-keywords
      '((sequence "TODO" "WORKING" "|" "DONE")))
(setq org-todo-keyword-faces '(("WORKING" . (:foreground "yellow" :background "black"))))
(setq org-startup-indented t)
(add-hook 'org-mode-hook 'visual-line-mode)

(provide 'cjb-org-mode-config)
