;;; mjf-init.el --- Main entry point for mjf configuration.

;;; Commentary:
;;; The main entry point for mjf Emacs configuration.

;;; Requirements:

(require 'use-package)
(require 'package)

;;; Code:

(eval-and-compile
  (defvar use-package-verbose t))

(use-package mjf-functions)
(use-package mjf-i18n)
(use-package mjf-prelude)
(use-package mjf-company-mode)
(use-package mjf-orgmode)
(use-package mjf-themes)
(use-package mjf-files-and-dirs)
(use-package mjf-multiple-cursors)
(use-package mjf-ido)
(use-package mjf-cider)
(use-package mjf-smartparens)
(use-package mjf-snippets)
(use-package mjf-shell)
(use-package mjf-mark-point)
(use-package mjf-dired)

;; add additional lisp libs
(let ((default-directory (mjf-relative-to-home ".emacs.d/personal/mjf/lisp/")))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(use-package mjf-restclient)

(setq-local figlet-font-path (mjf-relative-to-home "Documents/figlet/fonts"))
(setq-local figlet-fonts '("big" "defleppard" "doom" "fraktur" "Georgia11"
                           "graffiti" "larry3d" "nancyj" "ogre" "poison"
                           "puzzle" "rammstein" "rectangles" "red_phoenix"
                           "roman" "shadow" "slant" "smkeyboard" "soft"
                           "sub-zero" "whimsy"))

(let* ((rand-font (nth (random (length figlet-fonts))
                       figlet-fonts))
       (r-and-fig (process-exit-code-and-output "figlet" "-d" figlet-font-path "-f" rand-font "Emacs"))
       (err-code  (first r-and-fig))
       (fig-out   (second r-and-fig)))
  (if (= err-code 0)
      (message (princ fig-out))
    (message "Emacs (no figlet)")))

(message "[MF] finished mjf-init")
(provide 'mjf-init)
;;; mjf-init.el ends here
