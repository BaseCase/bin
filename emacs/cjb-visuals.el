;; -*- lexical-binding: t -*-

;; cjb-visuals.el - Visual customizations, both terminal and GUI

(setq custom-safe-themes t)

(column-number-mode t)
(load-theme 'night-owl t)

(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.1 nil #'invert-face 'mode-line)))

(defun cjb/visuals-for-gui ()
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defun cjb/visuals-for-terminal ()
  (dolist (theme custom-enabled-themes nil)
    (disable-theme theme)))

(defun cjb/set-visuals-by-context (frame)
  (progn
    (select-frame frame)
    (if (display-graphic-p frame)
        (cjb/visuals-for-gui)
        (cjb/visuals-for-terminal))))

(add-hook 'after-make-frame-functions 'cjb/set-visuals-by-context)

(setq default-frame-alist
  '(
    (width . 100)
    (height . 50)
    (font . "Source Code Pro-14")))

(menu-bar-mode -1)
(show-paren-mode t)

(defun cjb/dark ()
  (interactive)
  (disable-theme 'material-light)
  (load-theme 'night-owl t))

(defun cjb/light ()
  (interactive)
  (disable-theme 'night-owl)
  (load-theme 'material-light t))

(provide 'cjb-visuals)
