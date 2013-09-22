;;-- Yasnippet --;;

(require 'yasnippet)
;(yas/define-snippets 'nxhtml-mode nil 'html-mode)
;(setq yas/root-directory '("~/.emacs.d/snippets"))
(yas/reload-all)
(yas/global-mode 1)
(add-hook 'term-mode-hook (lambda () (setq yas-dont-activate t)))
