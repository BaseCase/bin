;; -*- lexical-binding: t -*-

;; cjb-computer-programming.el - Various programming things like
;; completion, LSP, project navigation, etc.

(projectile-global-mode t)
(global-company-mode t)
(push 'company-lsp company-backends)
(setq company-idle-delay 10)
(setq lsp-prefer-flymake :none)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))

(require 'lsp-sourcekit)
(setq lsp-sourcekit-executable (expand-file-name "~/bin/bin/sourcekit-lsp"))
(add-hook 'ruby-mode-hook #'lsp)
(add-hook 'enh-ruby-mode-hook #'lsp)
(add-hook 'swift-mode-hook #'lsp)

(add-hook 'xref--xref-buffer-mode-hook 'evil-emacs-state)
(add-hook 'comint-mode-hook
          (lambda ()
            (setq comint-process-echoes t)
            (toggle-truncate-lines 1)))

(provide 'cjb-computer-programming)
