;; -*- lexical-binding: t -*-

(require 'cjb-visuals)
(require 'cjb-evil-config)
(require 'cjb-keybindings)
(require 'cjb-computer-programming)
(require 'cjb-org-mode-config)

;;
;; misc settings
;;
(setq gc-cons-threshold 20000000)
(prefer-coding-system 'utf-8)
(setq make-backup-files nil)
(setq help-window-select t)
(setq inhibit-splash-screen t)
(setq scroll-conservatively 5)
(add-hook 'before-save-hook 'time-stamp)
(put 'narrow-to-region 'disabled nil)
(electric-pair-mode t)
(put 'dired-find-alternate-file 'disabled nil)

;;
;; make modifier keys work right on macOS
;;
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;;
;; whitespace
;;
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq evil-shift-width 2)
(setq sentence-end-double-space nil)
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;
;; file and buffer navigation
;;
(ido-mode t)
(ido-vertical-mode t)
(setq ido-enable-flex-matching t)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(add-hook 'dired-mode-hook (lambda () (rename-buffer (concat (buffer-name) "/"))))

(provide 'cjb-entry-point)
