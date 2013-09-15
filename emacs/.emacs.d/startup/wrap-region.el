(require 'wrap-region)

(wrap-region-mode 1)
(wrap-region-add-wrappers
 '(("/* " " */" "#" '(java-mode javascript-mode js2-mode css-mode))
   ("`" "`" nil '(markdown-mode ruby-mode))
   ("<!-- " " -->" "#" '(html-mode xml-mode nxml-mode))
   ("<div>" "</div>" "d" 'html-mode)
   ("<p>" "</p>" "p" 'html-mode)))
