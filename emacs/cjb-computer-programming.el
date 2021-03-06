;; -*- lexical-binding: t -*-

;; Various programming things like completion, project
;; navigation, etc. Also, language-specific stuff like indentation.

(projectile-global-mode t)
(global-company-mode t)
(setq company-idle-delay nil)
(setq comint-process-echoes t)
(add-hook 'comint-mode-hook (lambda () (toggle-truncate-lines 1)))

;;
;; make word motion and '*' work how I expect on '-' and '_' depending on language mode
;;
(setq cjb/modes-with-dash-words
      '(emacs-lisp-mode-hook
        html-mode-hook
        css-mode-hook))
(setq cjb/modes-with-underscore-words
      '(html-mode-hook
        c-mode-common-hook
        lua-mode-hook
        python-mode-hook))

(dolist (hook cjb/modes-with-dash-words nil)
  (add-hook hook (lambda () (modify-syntax-entry ?- "w"))))

(dolist (hook cjb/modes-with-underscore-words nil)
  (add-hook hook (lambda () (modify-syntax-entry ?_ "w"))))

;;
;; HTML
;;
(setq-default sgml-basic-offset 2)
(add-hook 'html-mode-hook
          (lambda ()
            (set (make-local-variable 'evil-shift-width) 2)
            (set (make-local-variable 'tab-width) 2)))

;;
;; JavaScript
;;
(setq-default js-indent-level 2)
(add-hook 'js-mode-hook
          (lambda ()
            (set (make-local-variable 'evil-shift-width) 2)))

(require 'web-mode)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

;;
;; CSS
;;
(setq-default css-indent-offset 2)

;;
;; C
;;
(defvar cjb-c-indent 4)
(setq-default c-basic-offset cjb-c-indent)
(add-hook 'c-mode-hook
          (lambda ()
            (set (make-local-variable 'evil-shift-width) cjb-c-indent)))

(provide 'cjb-computer-programming)
