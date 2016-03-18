;;; mjf.el --- mjf personalisation of prelude

;;; Commentary:
;;; Code:

(message "[MF] loading mjf.el ...")

(prelude-require-packages
 '(ace-jump-buffer
   ace-jump-mode
   ace-window
   bash-completion
   clojure-snippets
   company-restclient
   csv-mode
   dired+
   dired-hacks-utils
   dired-k
   dired-subtree
   exec-path-from-shell
   groovy-mode
   htmlize
   markdown-mode
   multiple-cursors
   org
   ox-reveal
   restclient
   use-package
   waher-theme
   yaml-mode
   yasnippet))

(defun mjf-relative-to-home (path)
  "Add PATH to the current home dir."
  (format "%s/%s" (getenv "HOME") path))

(add-to-list 'load-path (mjf-relative-to-home ".emacs.d/personal/mjf"))
(load "mjf-init")

(message "[MF] ... finished mjf.el")

(provide 'mjf)
;;; mjf.el ends here
