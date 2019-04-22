;; -*- lexical-binding: t -*-

;; cjb-computer-programming.el - Various programming things like
;; completion, LSP, project navigation, etc.

(projectile-global-mode t)
(global-company-mode t)
(push 'company-lsp company-backends)
(setq company-idle-delay 10)

(setq lsp-prefer-flymake :none)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))

(add-hook 'ruby-mode-hook #'lsp)
(add-hook 'enh-ruby-mode-hook #'lsp)

(add-hook 'xref--xref-buffer-mode-hook 'evil-emacs-state)

(provide 'cjb-computer-programming)
