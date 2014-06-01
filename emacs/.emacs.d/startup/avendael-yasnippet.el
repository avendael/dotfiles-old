;;; avendael-yasnippet.el --- Avendael's yasnippet customizations

;;; Commentary:
;;
;; Nothing much really, but a convention is a convention.
;;
;;; Code:
(require 'yasnippet)

;(setq yas/root-directory '("~/.emacs.d/snippets"))
(yas-reload-all)
(yas-global-mode 1)
(add-hook 'term-mode-hook (lambda () (setq yas-dont-activate t)))

(provide 'avendael-yasnippet)
;;; avendael-yasnippet.el ends here
