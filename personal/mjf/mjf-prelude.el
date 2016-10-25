;;; mjf-prelude.el --- prelude custom changes

;;; Commentary:
;;; Requirements:
;;; Code:

(setq prelude-guru nil)
(setq whitespace-line-column 200)

;; turn off auto-save when click between buffers
(setq prelude-auto-save nil)

;; swap the cmd/alt keys on mac (use "c-c w" to toggle)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

(global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "s-.") 'avy-goto-char)
(global-set-key (kbd "s-w") 'ace-window)

(provide 'mjf-prelude)
;;; mjf-prelude.el ends here
