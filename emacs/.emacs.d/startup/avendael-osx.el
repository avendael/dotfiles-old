;;; avendael-osx.el --- OSXisms for emacs

;;; Commentary:
;;
;; Adapt Emacs to osx default keybindings.
;;
;;; Code:
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-w") 'kill-this-buffer)
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-Z") 'undo-tree-redo)
(global-set-key (kbd "<s-left>") 'move-beginning-of-line)
(global-set-key (kbd "<s-right>") 'move-end-of-line)
(global-set-key (kbd "<s-up>") 'scroll-down-command)
(global-set-key (kbd "<s-down>") 'scroll-up-command)
(global-set-key (kbd "<C-s-f>") 'maximize-frame)
(global-set-key (kbd "<s-DEL>") 'backward-kill-word)
(global-set-key (kbd "<s-backspace>") 'backward-kill-word)

(provide 'avendael-osx)
;;; avendael-osx.el ends here
