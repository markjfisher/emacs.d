;;; mjf-dired.el --- mjf customizations for dired

;;; Commentary:
;;; Requirements:

(require 'ls-lisp)
;;(require 'dired+)
;;(require 'dired-subtree)

;;; Code:

;; (defun ls-lisp-format-time (file-attr time-index now)
;;   "################")

(defun ls-lisp-format-file-size (file-size human-readable)
  "This is a redefinition of the function from `dired.el'.
This fixes the formatting of file sizes in dired mode, to support very
large files. Without this change, dired supports 8 digits max,
which is up to 10gb.  Some files are larger than that."
  (if (or (not human-readable)
          (< file-size 1024))
      (format (if (floatp file-size) " %11.0f" " %11d") file-size)
    (do ((file-size (/ file-size 1024.0) (/ file-size 1024.0))
         ;; kilo, mega, giga, tera, peta, exa
         (post-fixes (list "k" "M" "G" "T" "P" "E") (cdr post-fixes)))
        ((< file-size 1024) (format " %10.0f%s"  file-size (car post-fixes))))))


(defun dired-sort-toggle ()
  "This is a redefinition of the fn from dired.el. Normally,
dired sorts on either name or time, and you can swap between them
with the s key.  This function one sets sorting on name, size,
time, and extension. Cycling works the same.
"
  (setq dired-actual-switches
        (let (case-fold-search)
          (cond
           ((string-match " " dired-actual-switches) ;; contains a space
            ;; New toggle scheme: add/remove a trailing " -t" " -S",
            ;; or " -U"
            ;; -t = sort by time (date)
            ;; -S = sort by size
            ;; -X = sort by extension

            (cond

             ((string-match " -t\\'" dired-actual-switches)
              (concat
               (substring dired-actual-switches 0 (match-beginning 0))
               " -X"))

             ((string-match " -X\\'" dired-actual-switches)
              (concat
               (substring dired-actual-switches 0 (match-beginning 0))
               " -S"))

             ((string-match " -S\\'" dired-actual-switches)
              (substring dired-actual-switches 0 (match-beginning 0)))

             (t
              (concat dired-actual-switches " -t"))))

           (t
            ;; old toggle scheme: look for a sorting switch, one of [tUXS]
            ;; and switch between them. Assume there is only ONE present.
            (let* ((old-sorting-switch
                    (if (string-match (concat "[t" dired-ls-sorting-switches "]")
                                      dired-actual-switches)
                        (substring dired-actual-switches (match-beginning 0)
                                   (match-end 0))
                      ""))

                   (new-sorting-switch
                    (cond
                     ((string= old-sorting-switch "t") "X")
                     ((string= old-sorting-switch "X") "S")
                     ((string= old-sorting-switch "S") "")
                     (t "t"))))
              (concat
               "-l"
               ;; strip -l and any sorting switches
               (dired-replace-in-string (concat "[-lt"
                                                dired-ls-sorting-switches "]")
                                        ""
                                        dired-actual-switches)
               new-sorting-switch))))))

  (dired-sort-set-modeline)
  (revert-buffer))

(defun dired-sort-set-modeline ()
  "This is a redefinition of the fn from `dired.el'.
This one properly provides the modeline in dired mode, supporting the new
search modes defined in the new `dired-sort-toggle'."
  ;; Set modeline display according to dired-actual-switches.
  ;; Modeline display of "by name" or "by date" guarantees the user a
  ;; match with the corresponding regexps.  Non-matching switches are
  ;; shown literally.
  (when (eq major-mode 'dired-mode)
    (setq mode-name
          (let (case-fold-search)
            (cond ((string-match "^-[^t]*t[^t]*$" dired-actual-switches)
                   "Dired by time")
                  ((string-match "^-[^X]*X[^X]*$" dired-actual-switches)
                   "Dired by ext")
                  ((string-match "^-[^S]*S[^S]*$" dired-actual-switches)
                   "Dired by sz")
                  ((string-match "^-[^SXUt]*$" dired-actual-switches)
                   "Dired by name")
                  (t
                   (concat "Dired " dired-actual-switches)))))
    (force-mode-line-update)))

(defun bind-dired-utils-keys ()
  (bind-keys :map dired-mode-map
             ("." . dired-subtree-cycle)
             ("M-o" . dired-subtree-insert)
             ("M-c" . dired-subtree-remove)
             ("M-u" . dired-subtree-up)
             ("M-d" . dired-subtree-down)
             ("M-p" . dired-subtree-previous-sibling)
             ("M-n" . dired-subtree-next-sibling)
             ("M->" . dired-subtree-end)
             ("M-<" . dired-subtree-beginning)
             ("C-c d" . dired-filter-by-directory)
             ("C-c f" . dired-filter-by-file)))

(setq diredp-hide-details-initially-flag nil)

(with-eval-after-load 'dired
  (require 'dired+)
  (require 'dired-subtree)
  (when (fboundp 'global-dired-hide-details-mode)
    (global-dired-hide-details-mode -1))
  (setq dired-recursive-deletes 'top)
  (bind-dired-utils-keys)
  (define-key dired-mode-map [mouse-2] 'dired-find-file))

(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))
(global-set-key (kbd "C-x C-d") '(lambda () (interactive) (dired ".")))

(provide 'mjf-dired)
;;; mjf-dired.el ends here
