;;; avendael-evil.el --- Avendael's evil configuration

;;; Commentary:
;;
;; Vi is Evil.  Evil is so good.
;;
;;; Code:
(require 'evil)
(require 'evil-leader)

(global-evil-leader-mode)
(define-key minibuffer-local-map (kbd "<escape>") 'keyboard-escape-quit)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "f" 'ido-find-file
 "s" 'ido-switch-buffer
 "d" 'ido-dired
 "k" 'ido-kill-buffer
 "pf" 'projectile-find-file
 "ps" 'projectile-switch-project
 "ms" 'magit-status
 "mc" 'magit-checkout
 "mg" 'magit-run-gitk
 "ml" 'magit-log
 "mr" 'magit-reflog)

(evil-mode 1)

(provide 'avendael-evil)
;;; avendael-evil.el ends here
