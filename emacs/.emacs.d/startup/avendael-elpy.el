;;; avendael-elpy.el --- Avendael's elpy customizations

;;; Commentary:
;;
;; Elpy and python customizations.
;;
;;; Code:
(require 'python)
(require 'elpy)

(add-hook 'python-mode-hook
            '(lambda ()
               (make-local-variable 'write-contents-hooks)
               (add-hook 'write-contents-hooks 'buffer-untabify)))
(setq elpy-default-minor-modes '(eldoc-mode yas-minor-mode auto-complete-mode))
(setq elpy-rpc-backend "jedi")
(setq jedi:complete-on-dot t)
(elpy-enable)

(setq python-remove-cwd-from-path nil)
(setq python-shell-interpreter "ipython")

(provide 'avendael-elpy)
;;; avendael-elpy.el ends here
