;; -*- lexical-binding: t -*-

;; cjb-evil-config.el - Set up evil mode

(evil-mode 1)
(evil-commentary-mode 1)
(setq evil-search-wrap nil)
(setq evil-search-module "evil-search")

(defun cjb/evil-star-in-place ()
  (interactive)
  (evil-search-word-forward)
  (evil-search-previous))

;; binding this key here instead of keybindings b/c it's more like a change
;; of behavior than a true remapping.
(define-key evil-normal-state-map (kbd "*") 'cjb/evil-star-in-place)

(defun cjb/evil-down-ten ()
  (interactive)
  (evil-next-line 10))

(defun cjb/evil-up-ten ()
  (interactive)
  (evil-previous-line 10))

(provide 'cjb-evil-config)
