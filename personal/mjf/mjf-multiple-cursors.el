;;; mjf-multiple-cursors.el --- mjf customizations for multiple-cursors

;;; Commentary:
;;; Requirements:

(require 'multiple-cursors)

;;; Code:

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(provide 'mjf-multiple-cursors)
;;; mjf-multiple-cursors.el ends here
