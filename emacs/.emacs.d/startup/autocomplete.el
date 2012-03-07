;;-- Auto Complete --;;
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/extensions/auto-complete/"))
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/extensions/auto-complete/dict"))
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/extensions/auto-complete/dict")
(ac-flyspell-workaround)
;(add-to-list 'ac-modes 'jde-mode)