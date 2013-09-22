(require 'js2-mode)
(require 'js-comint)
(require 'nodejs-repl)
(require 'skewer-mode)

(setenv "NODE_NO_READLINE" "1")
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(setq nodejs-repl-command "/usr/local/bin/node")
(setq inferior-js-program-command "/usr/local/bin/node")
(add-hook 'js2-mode-hook
          '(lambda ()
             (local-set-key "\C-x\C-e" 'js-send-last-sexp)
             (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
             (local-set-key "\C-cb" 'js-send-buffer)
             (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
             (local-set-key "\C-cl" 'js-load-file-and-go)))

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
-(setq-default js2-global-externs
              '("module" "require" "buster" "sinon" "assert" "refute" "setTimeout"
                "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))

(setq-default js2-idle-timer-delay 0.1)

;; Use skewer for frontend js, and use node for backend js. Just disable skewer to enable shadowed bindings.
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)
