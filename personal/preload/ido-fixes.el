;; remove warnings from ido compiling on emacs 24.3

(message "[MF] loading ido-fixes.el")
(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)
(defvar ido-context-switch-command nil)
(require 'ido)
