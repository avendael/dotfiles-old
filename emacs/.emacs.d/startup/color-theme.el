;;-- Color Theme --;;
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/extensions/color-theme"))
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;(load-file "~/.emacs.d/extensions/color-theme/color-theme-zenburn.el")
     (color-theme-zenburn)))