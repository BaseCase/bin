;; -*- lexical-binding: t -*-

(column-number-mode t)
(global-hl-line-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode t)

(setq default-frame-alist
  '(
    (width . 100)
    (height . 50)
    (font . "JetBrains Mono NL-11.0")))

(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.1 nil #'invert-face 'mode-line)))

(setq custom-safe-themes t)
(load-theme 'modus-operandi t)

(defun cjb/dark ()
  (interactive)
  (disable-theme 'modus-operandi)
  (load-theme 'modus-vivendi t))

(defun cjb/light ()
  (interactive)
  (disable-theme 'modus-vivendi)
  (load-theme 'modus-operandi t))

(provide 'cjb-visuals)
