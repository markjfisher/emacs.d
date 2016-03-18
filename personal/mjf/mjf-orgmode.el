;;; mjf-orgmode.el --- mjf orgmode customizations

;;; Commentary:
;;; Requirements:

(require 'package)
(require 'ox-reveal)
(require 'htmlize)

;;; Code:

(defvar reveal-highlight-theme nil)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq org-export-htmlize-output-type 'css)
(setq org-reveal-root "file:///Users/markf/dev/github/reveal.js")

(setq markdown-css-dir "/Users/markf/.emacs.d/personal/css/")
(setq markdown-css-theme "github-rhio")
;; (setq markdown-command-needs-filename 't)
(setq markdown-command "/Users/markf/bin/grip-run.sh")

(defadvice org-html-src-block
    (after toby/wrap-org-html-src-in-code-tag activate)
  (setq ad-return-value (replace-regexp-in-string
                         "\\(<pre[^>]+src-\\([^\"]+\\)\">\\)\\([^<]+\\)</pre>"
                         "\\1<code class=\"\\2\">\\3</code></pre>"
                         ad-return-value)))

(defadvice org-reveal-stylesheets
    (after toby/add-highlight-styles (info) activate)
  "Add stylesheet declaration for highlight.js formatting."
  (let* ((root-path (plist-get info :reveal-root))
         (css-path (concat root-path "/plugin/highlight/styles")))
    (setq ad-return-value
          (concat ad-return-value
                  (format "<link rel=\"stylesheet\" href=\"%s\">\n"
                          (concat css-path "/" reveal-highlight-theme ".css"))))))

(add-hook 'markdown-mode-hook 'company-mode)

(provide 'mjf-orgmode)
;;; mjf-orgmode.el ends here
