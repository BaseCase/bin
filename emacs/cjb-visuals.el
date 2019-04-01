;; -*- lexical-binding: t -*-

;; cjb-visuals.el - Visual customizations, both terminal and GUI

(setq custom-safe-themes t)

(defun cjb/visuals-for-gui ()
  (load-theme 'spacemacs-light t)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defun cjb/visuals-for-terminal ()
  (load-theme 'spacemacs-dark t))

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

;;
;; Everywhere
;;
(menu-bar-mode -1)
(which-function-mode t)
(show-paren-mode t)

(provide 'cjb-visuals)
