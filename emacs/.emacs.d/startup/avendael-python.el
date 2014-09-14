;;; avendael-elpy.el --- Avendael's python customizations

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

(setq elpy-modules '(elpy-module-sane-defaults
                        elpy-module-company
                        elpy-module-eldoc
                        elpy-module-pyvenv
                        elpy-module-yasnippet))

(setq elpy-rpc-backend "jedi")
(setq jedi:complete-on-dot t)

(setq python-remove-cwd-from-path nil)
(setq python-shell-interpreter "ipython")

(elpy-enable)

(provide 'avendael-python)
;;; avendael-python.el ends here
