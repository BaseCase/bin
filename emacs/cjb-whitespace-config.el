;; -*- lexical-binding: t -*-

;; cjb-whitespace.el - Configure indentation and whatnot
;; NOTE: I'm still trying to decide where language-specific whitespace rules should live.
;; I could see a case being made for both here and lang-specific configs. I'll try both and
;; see what feels better.

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq evil-shift-width 2)
(setq sentence-end-double-space nil)
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;
;; make word motion and '*' work how I expect on '-' and '_' depending on language mode
;;
(setq cjb/modes-with-dash-words
      '(emacs-lisp-mode-hook
        html-mode-hook
        css-mode-hook
        clojure-mode-hook))
(setq cjb/modes-with-underscore-words
      '(html-mode-hook
        swift-mode-hook
        c-mode-common-hook))

(dolist (hook cjb/modes-with-dash-words nil)
  (add-hook hook (lambda () (modify-syntax-entry ?- "w"))))

(dolist (hook cjb/modes-with-underscore-words nil)
  (add-hook hook (lambda () (modify-syntax-entry ?_ "w"))))

;;
;; get indentation right per language (maybe goes in language-specific config files)
;;
(add-hook 'html-mode-hook
          (lambda ()
            (set (make-local-variable 'evil-shift-width) 2)
            (set (make-local-variable 'sgml-basic-offset) 2)
            (set (make-local-variable 'tab-width) 2)))

(add-hook 'css-mode-hook
          (lambda ()
            (set (make-local-variable 'css-indent-offset) 2)))

(provide 'cjb-whitespace-config)
