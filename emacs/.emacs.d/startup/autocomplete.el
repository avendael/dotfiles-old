;;-- Auto Complete --;;
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-flyspell-workaround)
(ac-linum-workaround)
;(add-to-list 'ac-modes 'jde-mode)
