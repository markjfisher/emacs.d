;;; mjf-themes.el --- mjf customizations for emacs themes

;;; Commentary:
;;; Requirements:
;;; Code:

;; default frame size
(add-to-list 'default-frame-alist '(height . 57))
(add-to-list 'default-frame-alist '(width . 160))

(add-to-list 'custom-theme-load-path (mjf-relative-to-home ".emacs.d/themes/"))
(disable-theme 'zenburn)

(load-theme 'waher)
;; (load-theme 'misterioso)
;; (load-theme 'zonokai-blue)
;; (load-theme 'solarized-dark t)
;; (load-theme 'solarized-light t)
;; (load-theme 'molokai t)

;; for org - reveal.js highlighting
(setq reveal-highlight-theme "atelier-cave.dark")

;; Diminish modeline clutter
(require 'diminish)
;; (diminish 'wrap-region-mode)
;; (diminish 'yas/global-mode)

(provide 'mjf-themes)
;;; mjf-themes.el ends here
