;;; avendael-evil.el --- Avendael's evil configuration

;;; Commentary:
;;
;; Vi is Evil.  Evil is so good.
;;
;;; Code:
(require 'evil)
(require 'evil-leader)
(require 'evil-nerd-commenter)
(require 'persp-projectile)

(global-evil-leader-mode)
(setq-default evil-cross-lines t)

(define-key minibuffer-local-map
  (kbd "<escape>") 'keyboard-escape-quit)
(define-key evil-visual-state-map
  (kbd "<escape>") 'keyboard-quit)
(define-key minibuffer-local-ns-map
  (kbd "<escape>") 'keyboard-escape-quit)
(define-key minibuffer-local-completion-map
  (kbd "<escape>") 'keyboard-escape-quit)
(define-key minibuffer-local-must-match-map
  (kbd "<escape>") 'keyboard-escape-quit)
(define-key minibuffer-local-isearch-map
  (kbd "<escape>") 'keyboard-escape-quit)

(define-key evil-normal-state-map
  (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map
  (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map
  (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map
  (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

(define-key evil-normal-state-map (kbd "C-w 0") 'delete-window)

(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
    "f" 'ido-find-file
    "F" 'helm-for-files
    "s" 'ido-switch-buffer
    "d" 'ido-dired
    "k" 'ido-kill-buffer
    "i" 'imenu
    "<SPC>" 'company-yasnippet

    ;; extended commands
    "xt" 'create-tags

    ;; helm
    "gg" 'helm-git-grep
    "gt" 'helm-etags-select
    "hc" 'helm-flycheck
    "h#" 'helm-themes
    "hgg" 'helm-ag
    "hgd" 'helm-do-ag

    ;; shell
    "ts" 'shell
    "te" 'eshell
    "tt" 'ansi-term
    "tp" 'shell-pwd

    ;; projectile/perspective
    "pf" 'projectile-find-file
    "ps" 'projectile-persp-switch-project
    "pg" 'projectile-ag
    "pd" 'projectile-dired
    "ph" 'persp-prev
    "pl" 'persp-next
    "pr" 'persp-rename
    "pw" 'persp-switch
    "pk" 'persp-kill

    ;; evil nerd commenter
    "''" 'evilnc-comment-or-uncomment-lines
    "'l" 'evilnc-comment-or-uncomment-to-the-line
    "'c" 'evilnc-copy-and-comment-lines
    "'p" 'evilnc-comment-or-uncomment-paragraphs
    "'r" 'comment-or-uncomment-region

    ;; magit
    "ms" 'magit-status
    "mc" 'magit-checkout
    "mg" 'magit-run-gitk
    "ml" 'magit-log
    "mf" 'magit-fetch
    "mr" 'magit-reflog
    "mb" 'magit-blame-mode)

(evil-leader/set-key-for-mode 'python-mode
  "<" 'python-indent-shift-left
  ">" 'python-indent-shift-right

  "ow" 'pyvenv-workon
  "oe" 'pyvenv-deactivate
  "or" 'run-python
  "od" 'elpy-doc
  "os" 'elpy-shell-switch-to-shell
  "o." 'elpy-goto-definition

  ;; pony
  "opb" 'pony-browser
  "ops" 'pony-shell
  "opd" 'pony-db-shell
  "opf" 'pony-fabric
  "opm" 'pony-manage
  "opr" 'pony-runserver
  "opt" 'pony-test
  "opgs" 'pony-goto-settings
  "opgt" 'pony-goto-template)
(evil-mode 1)

(provide 'avendael-evil)
;;; avendael-evil.el ends here
