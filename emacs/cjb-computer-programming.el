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

;;
;; TypeScript (and friends)
;;
(defun cjb/setup-tide-mode ()
  (interactive)
  (tide-setup)
  (eldoc-mode +1)
  (company-mode +1)
  (setq-local company-idle-delay 0))

(add-hook 'typescript-mode-hook #'cjb/setup-tide-mode)
(add-hook 'js-mode-hook #'cjb/setup-tide-mode)
(setq company-tooltip-align-annotations t)
(setq typescript-indent-level 2)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when
                (or
                 (string-equal "tsx" (file-name-extension buffer-file-name))
                 (string-equal "jsx" (file-name-extension buffer-file-name)))
              (cjb/setup-tide-mode))))

;;
;; CSS
;;
(setq-default css-indent-offset 2)

;;
;; Swift
;;

;;
;; C
;;
(defvar cjb-c-indent 4)
(setq-default c-basic-offset cjb-c-indent)
(add-hook 'c-mode-hook
          (lambda ()
            (set (make-local-variable 'evil-shift-width) cjb-c-indent)))

(provide 'cjb-computer-programming)

;;
;; Elixir
;;
(add-hook 'elixir-mode-hook
          (lambda ()
            (set (make-local-variable 'evil-shift-width) 2)))
