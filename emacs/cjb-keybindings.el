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

;; key-chord ones
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

(provide 'cjb-keybindings)
