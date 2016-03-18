;;; mjf-cider.el --- mjf customizations for CIDER

;;; Commentary:
;;; Requirements:
;;; Code:

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)
(setq nrepl-buffer-name-show-port t)
(setq cider-repl-history-file (mjf-relative-to-home ".cider_history"))


(provide 'mjf-cider)
;;; mjf-cider.el ends here
