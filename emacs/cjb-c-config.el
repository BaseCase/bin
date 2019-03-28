;; -*- lexical-binding: t -*-

;; cjb-c-config.el - Set things up for C programming

(defvar cjb-c-indent 4)
(setq-default c-basic-offset cjb-c-indent)
(add-hook 'c-mode-hook
          (lambda ()
            (set (make-local-variable 'evil-shift-width) cjb-c-indent)))

(provide 'cjb-c-config)
