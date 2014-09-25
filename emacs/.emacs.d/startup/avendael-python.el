;;; avendael-elpy.el --- Avendael's python customizations

;;; Commentary:
;;
;; Elpy and python customizations.
;;
;;; Code:
(require 'python)
(require 'elpy)
(require 'company)

(setq elpy-modules '(elpy-module-sane-defaults
                        elpy-module-company
                        elpy-module-eldoc
                        elpy-module-pyvenv
                        elpy-module-yasnippet))
(setq elpy-rpc-backend "jedi")
(setq python-shell-interpreter "ipython")

(elpy-enable)
(elpy-use-ipython)

(add-hook 'python-mode-hook
    '(lambda ()
         (make-local-variable 'write-contents-hooks)
         (add-hook 'write-contents-hooks 'buffer-untabify)))

(add-hook 'elpy-mode-hook
    (lambda ()
        (set (make-local-variable 'company-backends)
            '((elpy-company-backend company-dabbrev-code company-keywords
                  company-files company-yasnippet)))))


(provide 'avendael-python)
;;; avendael-python.el ends here
