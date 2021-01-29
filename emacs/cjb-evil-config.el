;; -*- lexical-binding: t -*-

(evil-mode 1)
(evil-commentary-mode 1)

(setq evil-search-wrap nil)
(setq evil-search-module "evil-search")

;; TODO: this function might deserve to die.
(defun cjb/evil-star-in-place ()
  (interactive)
  (evil-search-word-forward)
  (evil-search-previous))

(define-key evil-normal-state-map (kbd "*") 'isearch-forward-symbol-at-point)

(provide 'cjb-evil-config)
