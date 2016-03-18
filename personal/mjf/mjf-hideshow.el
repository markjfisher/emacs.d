;;; mjf-hideshow.el --- mjf customizations for hideshow

;;; Commentary:
;;; Requirements:
;;; Code:

;; from https://www.emacswiki.org/emacs/HideShow

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
         (1+ (current-column))))))

(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
              (hs-toggle-hiding)
            (error t))
          (hs-show-all))
    (toggle-selective-display column)))

;; http://www.troyastorino.com/tidbits/emacs-hide-show
(load-library "hideshow")
(global-set-key (kbd "C-c C-+") 'toggle-hiding)
(global-set-key (kbd "C-c C-\\") 'toggle-selective-display)

(defvar code-editing-mode-hooks '(c-mode-common-hook
                                  clojure-mode-hook
                                  emacs-lisp-mode-hook
                                  java-mode-hook
                                  lisp-mode-hook
                                  perl-mode-hook
                                  python-mode-hook
                                  sh-mode-hook))

;; Add a hs-minor-mode hook to code editing major modes

(dolist (mode code-editing-mode-hooks)
  (add-hook mode 'hs-minor-mode))

;; Additionally, use the hideshow-org mode
;; this is copied from https://github.com/occidens/hideshow-org
(require 'hideshow-org)
(global-set-key "\C-ch" 'hs-org/minor-mode)

(provide 'mjf-hideshow)
;;; mjf-hideshow.el ends here
