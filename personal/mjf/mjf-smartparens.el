;;; mjf-smartparens.el --- mjf customizations for

;;; Commentary:
;;; Requirements:
;;; Code:

(setq sp-navigate-reindent-after-up t)

(define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)

(global-set-key (kbd "M-C-a") 'sp-beginning-of-sexp)
(global-set-key (kbd "M-C-e") 'sp-end-of-sexp)
(global-set-key (kbd "M-J") 'sp-join-sexp)


(provide 'mjf-smartparens)
;;; mjf-smartparens.el ends here
