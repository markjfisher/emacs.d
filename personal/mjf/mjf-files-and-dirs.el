;;; mjf-files-and-dirs.el --- mjf customizations for

;;; Commentary:
;;; Requirements:
;;; Code:

;; use gnu's "ls" for dired
(with-system darwin
  (setq insert-directory-program "/usr/local/bin/gls")
  (setq dired-listing-switches "-aBhl --group-directories-first"))

;; backup stuff
(defvar autosave-dir (mjf-relative-to-home ".emacs.d/personal/.auto-save-files/"))

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))

;; backup files (ie foo~) - backup-directory-alist contains regexp to directory mappings
;; filenames matching a regexp are backed up in the corresponding directory
(defvar backup-dir (mjf-relative-to-home ".emacs.d/personal/.backup-files/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;; from http://whattheemacsd.com/file-defuns.el-01.html
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)


(provide 'mjf-files-and-dirs)
;;; mjf-files-and-dirs.el ends here
