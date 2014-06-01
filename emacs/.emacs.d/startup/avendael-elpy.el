;;; avendael-elpy.el --- Avendael's elpy customizations

;;; Commentary:
;;
;; Elpy and python customizations.
;;
;;; Code:
(require 'python)
(require 'elpy)
(require 'virtualenv)

(add-hook 'python-mode-hook
            '(lambda ()
               (make-local-variable 'write-contents-hooks)
               (add-hook 'write-contents-hooks 'buffer-untabify)))
(elpy-enable)

(setq python-remove-cwd-from-path nil)
(setq python-shell-interpreter "ipython")
(setq virtualenv-root "~/Development/Libraries/python-venv/")

(provide 'avendael-elpy)
;;; avendael-elpy.el ends here
