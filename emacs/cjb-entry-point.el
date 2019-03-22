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

;;
;; misc settings
;;
(prefer-coding-system 'utf-8)
(setq make-backup-files nil)
(setq help-window-select t)
(setq inhibit-splash-screen t)
(setq scroll-conservatively 5)
(add-hook 'before-save-hook 'time-stamp)
(put 'narrow-to-region 'disabled nil)
(electric-pair-mode t)

(provide 'cjb-entry-point)
