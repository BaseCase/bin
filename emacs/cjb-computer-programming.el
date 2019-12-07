;; -*- lexical-binding: t -*-

;; Various programming things like completion, LSP, project
;; navigation, etc. Also, language-specific stuff like indentation.

(projectile-global-mode t)
(global-company-mode t)
(push 'company-lsp company-backends)
(setq company-idle-delay nil)
(setq lsp-prefer-flymake :none)
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
        swift-mode-hook
        c-mode-common-hook
        python-mode-hook))

(dolist (hook cjb/modes-with-dash-words nil)
  (add-hook hook (lambda () (modify-syntax-entry ?- "w"))))

(dolist (hook cjb/modes-with-underscore-words nil)
  (add-hook hook (lambda () (modify-syntax-entry ?_ "w"))))

;;
;; HTML
;;
(add-hook 'html-mode-hook
          (lambda ()
            (set (make-local-variable 'evil-shift-width) 2)
            (set (make-local-variable 'sgml-basic-offset) 2)
            (set (make-local-variable 'tab-width) 2)))

;;
;; CSS
;;
(add-hook 'css-mode-hook
          (lambda ()
            (set (make-local-variable 'css-indent-offset) 2)))

;;
;; Swift
;;
(require 'lsp-sourcekit)
(setq lsp-sourcekit-executable (expand-file-name "~/bin/bin/sourcekit-lsp"))
(add-hook 'swift-mode-hook #'lsp)

;;
;; C
;;
(defvar cjb-c-indent 4)
(setq-default c-basic-offset cjb-c-indent)
(add-hook 'c-mode-hook
          (lambda ()
            (set (make-local-variable 'evil-shift-width) cjb-c-indent)))

(provide 'cjb-computer-programming)
