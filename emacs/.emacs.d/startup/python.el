;;-- Python Mode --;;

(add-hook 'python-mode-hook
            '(lambda ()
               (make-local-variable 'write-contents-hooks)
               (add-hook 'write-contents-hooks 'buffer-untabify)))