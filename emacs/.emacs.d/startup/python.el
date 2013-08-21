;;-- Python Mode --;;

(add-hook 'python-mode-hook
            '(lambda ()
               (make-local-variable 'write-contents-hooks)
               (add-hook 'write-contents-hooks 'buffer-untabify)))
(add-hook 'python-mode-hook #'lambda-mode 1)
(elpy-enable)
(setq python-check-command "pychecker")
(setq python-remove-cwd-from-path nil)
