;;; avendael-evil.el --- Avendael's evil configuration

;;; Commentary:
;;
;; Vi is Evil.  Evil is so good.
;;
;;; Code:
(require 'evil)
(require 'evil-leader)

(global-evil-leader-mode)
(setq-default evil-cross-lines t)

(define-key minibuffer-local-map (kbd "<escape>") 'keyboard-escape-quit)
(define-key evil-visual-state-map (kbd "<escape>") 'keyboard-quit)
(define-key minibuffer-local-ns-map (kbd "<escape>") 'keyboard-escape-quit)
(define-key minibuffer-local-completion-map (kbd "<escape>") 'keyboard-escape-quit)
(define-key minibuffer-local-must-match-map (kbd "<escape>") 'keyboard-escape-quit)
(define-key minibuffer-local-isearch-map (kbd "<escape>") 'keyboard-escape-quit)

(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "f" 'ido-find-file
 "s" 'ido-switch-buffer
 "d" 'ido-dired
 "k" 'ido-kill-buffer

 ;; projectile
 "pf" 'projectile-find-file
 "ps" 'projectile-switch-project

 ;; magit
 "ms" 'magit-status
 "mc" 'magit-checkout
 "mg" 'magit-run-gitk
 "ml" 'magit-log
 "mf" 'magit-fetch
 "mr" 'magit-reflog

 ;; elscreen
 "ec" 'elscreen-create
 "et" 'elscreen-toggle-display-tab
 "ei" 'elscreen-display-time
 "es" 'elscreen-select-and-goto
 "ep" 'elscreen-previous
 "en" 'elscreen-next
 "ej" 'elscreen-jump
 "ed" 'elscreen-dired
 "ex" 'elscreen-execute-extended-command
 "ek" 'elscreen-kill
 "eq" 'elscreen-kill-screen-and-buffers
 "eo" 'elscreen-kill-others
 "el" 'elscreen-clone
 "er" 'elscreen-find-and-goto-by-buffer
 "ef" 'elscreen-find-file
 "em" 'elscreen-display-last-message
 "e?" 'elscreen-help)

(evil-mode 1)

(provide 'avendael-evil)
;;; avendael-evil.el ends here
