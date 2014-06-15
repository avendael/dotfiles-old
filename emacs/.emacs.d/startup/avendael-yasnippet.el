;;; avendael-yasnippet.el --- Avendael's yasnippet customizations

;;; Commentary:
;;
;; Nothing much really, but a convention is a convention.
;;
;;; Code:
(require 'yasnippet)

(add-hook 'term-mode-hook (lambda () (setq yas-dont-activate t)))
(yas-global-mode 1)

(provide 'avendael-yasnippet)
;;; avendael-yasnippet.el ends here
