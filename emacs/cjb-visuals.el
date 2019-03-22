;; -*- lexical-binding: t -*-

;; cjb-visuals.el - Visual customizations, both terminal and GUI

;;
;; GUI-only
;;
(setq custom-safe-themes t)

(defun cjb/set-theme-when-gui (frame)
  (if (display-graphic-p frame)
      (progn
        (select-frame frame)
        (load-theme 'spacemacs-light t)
        (tool-bar-mode -1))))

(add-hook 'after-make-frame-functions 'cjb/set-theme-when-gui)

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
