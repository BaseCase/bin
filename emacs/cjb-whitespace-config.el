;; -*- lexical-binding: t -*-

;; cjb-whitespace.el - Configure indentation and whatnot

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq sentence-end-double-space nil)
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'cc-mode-hook (lambda () (setq tab-width 4)))

(provide 'cjb-whitespace-config)
