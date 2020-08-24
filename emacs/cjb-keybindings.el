;; -*- lexical-binding: t -*-

;; NOTE: make sure 'cjb-evil-config gets loaded before this file

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "M-/") 'hippie-expand)

(defvar cjb/leader-key ",")
(defun cjb/leader (&rest keys)
  "Fake in Vim leader mappings for evil-mode; works with any # of keys"
  (apply 'concat
         (cons cjb/leader-key keys)))

(define-key evil-normal-state-map (kbd "M-n") 'make-frame)
(define-key evil-normal-state-map (kbd "M-w") 'delete-frame)
(define-key evil-normal-state-map (kbd "C-y") 'yank)
(define-key evil-normal-state-map (kbd "M-y") 'yank-pop)
(define-key evil-normal-state-map (kbd (cjb/leader "`")) 'visual-line-mode)
(define-key evil-normal-state-map (kbd (cjb/leader "~")) 'toggle-truncate-lines)
(define-key evil-normal-state-map (kbd (cjb/leader "b")) 'ido-switch-buffer)
(define-key evil-normal-state-map (kbd (cjb/leader "p")) 'projectile-command-map)
(define-key evil-normal-state-map (kbd (cjb/leader "f")) 'projectile-find-file)
(define-key evil-normal-state-map (kbd (cjb/leader "w")) 'projectile-grep)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(define-key evil-insert-state-map (kbd "C-a") 'beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)

;; Bookmark List (M-x list-bookmarks)
(add-hook 'bookmark-bmenu-mode-hook
          (lambda ()
            (local-set-key (kbd "j") 'evil-next-line)
            (local-set-key (kbd "k") 'evil-previous-line)))

;; Dired
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file "..")))))

(provide 'cjb-keybindings)
