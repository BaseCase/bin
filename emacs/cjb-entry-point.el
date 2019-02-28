;;; -*- lexical-binding: t -*-

;;
;; Command is Meta on OSX
;;
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;;
;; misc settings
;;
(prefer-coding-system 'utf-8)
(setq make-backup-files nil)
(setq help-window-select t)
(setq inhibit-splash-screen t)
(setq scroll-conservatively 5)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;
;; visual stuff
;;
(setq default-frame-alist
  '(
    (width . 100)
    (height . 50)
    (font . "Source Code Pro-14")))
;; (tool-bar-mode -1)
(menu-bar-mode -1)

;;
;; custom keybindings
;;
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-b") 'buffer-menu)



;;
;; evil config
;;
(evil-mode 1)
(setq evil-search-wrap nil)
(define-key evil-normal-state-map (kbd "C-j")
  (lambda () (interactive) (evil-next-line 10)))
(define-key evil-normal-state-map (kbd "C-k")
  (lambda () (interactive) (evil-previous-line 10)))


;;
;; key-chord config
;;
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.05)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)



(provide 'cjb-entry-point)
