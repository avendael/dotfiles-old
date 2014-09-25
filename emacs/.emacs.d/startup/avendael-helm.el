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
(global-set-key (kbd "s-P") 'helm-M-x)
(global-set-key (kbd "s-t") 'helm-buffers-list)

(provide 'avendael-helm)
;;; avendael-helm.el ends here
