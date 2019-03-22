;; -*- lexical-binding: t -*-

;; cjb-evil-config.el - Set up evil mode

(evil-mode 1)
(setq evil-search-wrap nil)

(defun cjb/evil-down-ten ()
  (interactive)
  (evil-next-line 10))

(defun cjb/evil-up-ten ()
  (interactive)
  (evil-previous-line 10))

(provide 'cjb-evil-config)
