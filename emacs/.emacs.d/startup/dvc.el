;;-- DVC Mode --;;

(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/extensions/dvc/lisp"))
(require 'dvc-autoloads)
(global-set-key "\C-xVhp" 'xhg-push)
(global-set-key "\C-xVhP" 'xhg-pull)