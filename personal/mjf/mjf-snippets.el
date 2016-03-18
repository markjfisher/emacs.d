;;; mjf-snippets.el --- mjf customizations for

;;; Commentary:
;;; Requirements:

(require 'yasnippet)

;;; Code:

(setq yas-verbosity 1)
(setq yas-snippet-dirs
      '("~/.emacs.d/personal/snippets"
        "~/.emacs.d/personal/snippets/yas-snippets"
        ))

(yas-global-mode 1)

;; turn off yas when in term-mode to allow tab-completion to work
(add-hook 'term-mode-hook
          (lambda()
            (setq yas-dont-activate t)))

(provide 'mjf-snippets)
;;; mjf-snippets.el ends here
