;;-- Auto Complete --;;
(require 'auto-complete-config)

(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-flyspell-workaround)
(ac-linum-workaround)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(define-key ac-mode-map (kbd "C-x M-TAB") 'completion-at-point)
