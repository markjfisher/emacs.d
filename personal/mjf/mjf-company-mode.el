;;; mjf-company-mode.el --- mjf customizations for

;;; Commentary:
;;; Requirements:
;;; Code:

;; auto completion added everywhere
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-restclient)

(provide 'mjf-company-mode)
;;; mjf-company-mode.el ends here
