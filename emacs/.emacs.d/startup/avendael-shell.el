;;; avendael-shell.el --- Avendael's shell customizations

;;; Commentary:
;;
;; Make M-x shell more awesome.
;;
;;; Code:
(require 'comint)

(defun avendael-shell-simple-send (proc command)
  "Various commands pre-processing before sending to shell.

PROC: the process.
COMMAND: the command."
  (cond
   ;; Check for clear command and execute it.
   ((string-match "^[ \t]*clear[ \t]*$" command)
    (comint-send-string proc "\n")
    (erase-buffer))
   ;; Check for man command and execute it.
   ((string-match "^[ \t]*man[ \t]*" command)
    (comint-send-string proc "\n")
    (setq command (replace-regexp-in-string "^[ \t]*man[ \t]*" "" command))
    (setq command (replace-regexp-in-string "[ \t]+$" "" command))
    (funcall 'man command))
   ;; Send other commands to the default handler.
   (t (comint-simple-send proc command))))

(defun avendael-shell-mode-hook ()
  "Run the customizations in one shot."
  (local-set-key '[up] 'comint-previous-input)
  (local-set-key '[down] 'comint-next-input)
  (local-set-key '[(shift tab)] 'comint-next-matching-input-from-input)
  (setq comint-input-sender 'avendael-shell-simple-send))

;; Hide passwords
(add-hook
  'comint-output-filter-functions
  'comint-watch-for-password-prompt)

(add-hook 'shell-mode-hook 'avendael-shell-mode-hook)
(add-hook 'term-mode-hook 'evil-emacs-state)

(provide 'avendael-shell)
;;; avendael-shell.el ends here
