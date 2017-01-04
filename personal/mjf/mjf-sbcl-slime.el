;;; mjf-sbcl-slime.el --- mjf customizations for SBCL and SLIME

;;; Commentary:
;;; Requirements:
;;; Code:

;; SBCL

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-lisp-implementations '((sbcl ("sbcl"))))
(setq slime-startup-animation nil)

;; SLIME

;; slime is installed from melpa, not via command line.
;; (add-to-list 'load-path "/quicklisp/dists/quicklisp/software/slime-2.14") ;; Path to slime

;; the hyperspec common lisp docs are installed by brew.
(eval-after-load "slime"
  '(progn
     (setq common-lisp-hyperspec-root
           "/usr/local/share/doc/hyperspec/HyperSpec/")
     (setq common-lisp-hyperspec-symbol-table
           (concat common-lisp-hyperspec-root "Data/Map_Sym.txt"))
     (setq common-lisp-hyperspec-issuex-table
           (concat common-lisp-hyperspec-root "Data/Map_IssX.txt"))))

(require 'slime)

(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-fancy))
(setq slime-enable-evaluate-in-emacs t)

(provide 'mjf-sbcl-slime)
;;; mjf-sbcl-slime.el ends here
