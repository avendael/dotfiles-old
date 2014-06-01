;;; avendael-js.el --- avendael's Javascript customizations

;;; Commentary:
;;
;; Use js2 for Javascript, some fancy REPLs, and skewer the browser.
;;
;;; Code:
(require 'js2-mode)
(require 'js-comint)
(require 'nodejs-repl)
(require 'skewer-mode)
(require 'tern)
(require 'yasnippet)

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
(setq-default js2-global-externs
              '("clearTimeout" "setInterval" "clearInterval" "location" "__dirname"
                "console" "JSON" "module" "require" "buster" "sinon" "assert" "refute"
                "setTimeout" "angular" "exports" "encodeURIComponent"))

(setq-default js2-idle-timer-delay 0.1)

;; js2-mode steals TAB, let's steal it back for yasnippet
(defun js2-tab-properly ()
  (interactive)
  (let ((yas-fallback-behavior 'return-nil))
    (unless (yas-expand)
      (indent-for-tab-command)
      (if (looking-back "^\s*")
          (back-to-indentation)))))

(define-key js2-mode-map (kbd "TAB") 'js2-tab-properly)

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; Use skewer for frontend js, and use node for backend js. Just disable skewer to enable shadowed bindings.
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(provide 'avendael-js)
;;; avendael-js.el ends here
