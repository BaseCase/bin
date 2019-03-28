;; -*- lexical-binding: t -*-

;; cjb-whitespace.el - Configure indentation and whatnot
;; NOTE: I'm still trying to decide where language-specific whitespace rules should live.
;; I could see a case being made for both here and lang-specific configs. I'll try both and
;; see what feels better.

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq sentence-end-double-space nil)
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'cc-mode-hook (lambda () (setq tab-width 4)))

(provide 'cjb-whitespace-config)
