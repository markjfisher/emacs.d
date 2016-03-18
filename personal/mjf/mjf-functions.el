;;; mjf-functions.el --- mjf customizations for

;;; Commentary:
;;; Requirements:
;;; Code:

;; some additions from whattheemacs.d
;;

;; show lines temporarily when doing goto-line
(global-set-key [remap goto-line] 'goto-line-with-feedback)

;; usage of with-system:

;; (with-system gnu/linux
;;  (message "Free as in Beer")
;;  (message "Free as in Freedom!"))

;; Special values:
;;   `gnu'         compiled for a GNU Hurd system.
;;   `gnu/linux'   compiled for a GNU/Linux system.
;;   `darwin'      compiled for Darwin (GNU-Darwin, Mac OS X, ...).
;;   `ms-dos'      compiled as an MS-DOS application.
;;   `windows-nt'  compiled as a native W32 application.
;;   `cygwin'      compiled using the Cygwin library.

(defmacro with-system (type &rest body)
  "Evaluate body if `system-type' equals type."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input."
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(defun transparency (x y)
  "Set the transparency of the frame window.
X is foreground transparency, Y is background transparency.
0=transparent/100=opaque."
  (interactive "nFocussed transparency Value 0 - 100 opaque: \nnDefocussed 0 - 100: ")
  (set-frame-parameter (selected-frame) 'alpha (cons x y)))

(defun process-exit-code-and-output (program &rest args)
  "Run PROGRAM with ARGS and return the exit code and output in a list."
  (with-temp-buffer
    (condition-case-unless-debug nil
        (list (apply 'call-process program nil (current-buffer) nil args)
              (buffer-string))
      (error (list -1 (format "exception running %s" program))))))

(provide 'mjf-functions)
;;; mjf-functions.el ends here
