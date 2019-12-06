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
    (font . "DejaVu Sans Mono 13")))

(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.1 nil #'invert-face 'mode-line)))

(setq custom-safe-themes t)
(load-theme 'night-owl t)

(defun cjb/dark ()
  (interactive)
  (disable-theme 'material-light)
  (load-theme 'night-owl t))

(defun cjb/light ()
  (interactive)
  (disable-theme 'night-owl)
  (load-theme 'material-light t))

(provide 'cjb-visuals)
