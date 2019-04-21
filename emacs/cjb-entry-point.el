;; -*- lexical-binding: t -*-

;; cjb-entry-point.el - The starting point for my Emacs setup. Loads in all other config.
;;     Packages are configured one level up from this, in .emacs, because otherwise
;;     there are problems...

(require 'cjb-macos)
(require 'cjb-whitespace-config)
(require 'cjb-evil-config)
(require 'cjb-key-chord-config)
(require 'cjb-keybindings)
(require 'cjb-visuals)
(require 'cjb-clojure-config)
(require 'cjb-c-config)
(require 'cjb-computer-programming)

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
;; file and buffer navigation
;;
(ido-mode t)
(ido-vertical-mode t)
(setq ido-enable-flex-matching t)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(add-hook 'dired-mode-hook (lambda () (rename-buffer (concat (buffer-name) "/"))))

(provide 'cjb-entry-point)
