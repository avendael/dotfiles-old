;;; avendael-bootstrap.el --- Bootstrap the packages

;;; Commentary:
;;
;; Bootstrap the packages that need to be started before anything else.
;;
;;; Code:
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(provide 'avendael-bootstrap)
;;; avendael-bootstrap.el ends here
