;;; mjf-init.el --- Main entry point for mjf configuration.

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

;; change init file dir
(setq prelude-user-init-file "/Users/markf/.emacs.mjf.d/")


(provide 'mjf-prelude)
;;; mjf-prelude.el ends here
