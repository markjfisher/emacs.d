;;; mjf-ido.el --- mjf customizations for ido

;;; Commentary:
;;; Requirements:

(require 'ido)

;;; Code:

;; ido-modes (seemed to vanish without the ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(setq ido-use-filename-at-point 'guess)

(provide 'mjf-ido)
;;; mjf-ido.el ends here
