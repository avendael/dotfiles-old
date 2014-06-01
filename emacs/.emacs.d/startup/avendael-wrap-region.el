;;; avendael-wrap-region.el --- Avendael's wrap-region customizations

;;; Commentary:
;;
;; Add more wrappers to wrap-region.
;;
;;; Code:
(require 'wrap-region)

(wrap-region-mode 1)
(wrap-region-add-wrappers
 '(("/* " " */" "#" '(java-mode javascript-mode js2-mode css-mode))
   ("`" "`" nil '(markdown-mode ruby-mode))
   ("<!-- " " -->" "#" '(html-mode xml-mode nxml-mode))
   ("<div>" "</div>" "d" 'html-mode)
   ("<p>" "</p>" "p" 'html-mode)))

(provide 'avendael-wrap-region)
;;; avendael-wrap-region.el ends here
