;;; avendael-multiple-cursors.el --- Multiple cursors

;;; Commentary:
;;
;; Sublime-like multiple cursors.  This does not work as expected.  See
;; https://github.com/magnars/multiple-cursors.el/issues/17
;; for more info.
;;
;;; Code:
(require 'multiple-cursors)

(global-set-key (kbd "s-C-j") 'mc/edit-lines)
(global-set-key (kbd "s-d") 'mc/mark-next-like-this)
(global-set-key (kbd "s-D") 'mc/mark-previous-like-this)
(global-set-key (kbd "s-A") 'mc/mark-all-like-this)
(setq mc/cmds-to-run-for-all
    '(evil-append-line
         evil-backward-WORD-begin
         evil-backward-word-begin
         evil-delete-char
         evil-delete-line
         evil-digit-argument-or-evil-beginning-of-line
         evil-emacs-state
         evil-end-of-line
         evil-force-normal-state
         evil-forward-WORD-begin
         evil-forward-WORD-end
         evil-forward-word-begin
         evil-forward-word-end
         evil-insert
         evil-next-line
         evil-normal-state
         evil-previous-line))

(provide 'avendael-multiple-cursors)
;;; avendael-multiple-cursors.el ends here
