;; -*- lexical-binding: t -*-

;; cjb-clojure-config.el - CIDER and clojure-mode setup.

(add-hook 'cider-stacktrace-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "q") 'cider-popup-buffer-quit-function)))

(provide 'cjb-clojure-config)
