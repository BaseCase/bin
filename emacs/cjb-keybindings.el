;; -*- lexical-binding: t -*-

;; cjb-keybindings.el - custom keys
;; NOTE: This file has to come *after* requiring 'evil-config

;; normal ones
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "M-/") 'hippie-expand)

;; evil-specific ones, maybe should go in evil-config...
(defvar cjb/leader-key ",")
(defun cjb/leader (&rest keys)
  "Fake in Vim leader mappings for evil-mode; works with any # of keys"
  (apply 'concat
         (cons cjb/leader-key keys)))

(define-key evil-normal-state-map (kbd "C-j") 'cjb/evil-down-ten)
(define-key evil-normal-state-map (kbd "C-k") 'cjb/evil-up-ten)
(define-key evil-normal-state-map (kbd "C-y") 'yank)
(define-key evil-normal-state-map (kbd "M-y") 'yank-pop)
(define-key evil-normal-state-map (kbd (cjb/leader "`")) 'visual-line-mode)
(define-key evil-normal-state-map (kbd (cjb/leader "~")) 'toggle-truncate-lines)
(define-key evil-normal-state-map (kbd (cjb/leader "b")) 'ido-switch-buffer)
(define-key evil-normal-state-map (kbd (cjb/leader "p")) 'projectile-command-map)

(define-key evil-insert-state-map (kbd "C-a") 'beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
(define-key evil-insert-state-map (kbd "<tab>") 'company-complete)

;; key-chord ones
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; Bookmark View
(add-hook 'bookmark-bmenu-mode-hook
          (lambda () (local-set-key (kbd "j") 'evil-next-line)))

(add-hook 'bookmark-bmenu-mode-hook
          (lambda () (local-set-key (kbd "k") 'evil-previous-line)))

;; Dired
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file "..")))))


;; Somewhat bananas attempt to get a consistent interface over any mode's REPL interaction...
;;
;; I define 4 regularly used REPL interactions:
;;   + "begin" - Launch the REPL associated with this mode
;;   + "sexp-esque" - Do the closest available thing to "send last sexp"
;;   + "region" - Send the selected (in evil visual mode) block to the REPL
;;   + "line" - Send the current line to the REPL
;;
;; To add support for a new language, add a new entry to this
;; alist with the four expected keys.
(setq mode-hooks-to-repl-functions
      '((sql-mode-hook . ((begin . sql-postgres)
                          (sexp-esque . sql-send-paragraph)
                          (region . sql-send-region)
                          (line . sql-send-line-and-next)))

        (enh-ruby-mode-hook . ((begin . inf-ruby-console-auto)
                               (sexp-esque . ruby-send-last-sexp)
                               (region . ruby-send-region)
                               (line . ruby-send-line)))

        (swift-mode-hook . ((begin . swift-mode:run-repl)
                            (sexp-esque . swift-mode:send-buffer)
                            (region . swift-mode:send-region)
                            (line . swift-mode:send-region)))))

(dolist (mode-alist mode-hooks-to-repl-functions nil)
  (let ((mode-hook (car mode-alist))
        (repl-functions (cdr mode-alist)))
    (add-hook mode-hook
              (lambda ()
                (evil-local-set-key 'normal (kbd (cjb/leader "r" "b")) (alist-get 'begin repl-functions))
                (evil-local-set-key 'normal (kbd (cjb/leader "r" "s")) (alist-get 'sexp-esque repl-functions))
                (evil-local-set-key 'normal (kbd (cjb/leader "r" "l")) (alist-get 'line repl-functions))
                (evil-local-set-key 'visual (kbd (cjb/leader "r" "r")) (alist-get 'region repl-functions))))))

(provide 'cjb-keybindings)
