;;; avendael-helm.el --- Avendael's helm

;;; Commentary:
;;
;; Aye Captain!
;;
;;; Code:
(require 'helm)
(require 'helm-buffers)
(require 'helm-match-plugin)

(setq helm-buffers-fuzzy-matching t)

(global-set-key (kbd "s-R") 'helm-git-grep)
(global-set-key (kbd "s-r") 'helm-imenu)
(global-set-key (kbd "s-P") 'helm-M-x)
(global-set-key (kbd "s-t") 'helm-mini)
(global-set-key (kbd "s-f") 'helm-find-files)
(global-set-key (kbd "s-F") 'helm-for-files)
(global-set-key (kbd "s-y") 'helm-show-kill-ring)
(global-set-key (kbd "s-o") 'helm-recentf)

(global-set-key (kbd "C-h f") 'helm-apropos)

(provide 'avendael-helm)
;;; avendael-helm.el ends here
