;;; avendael-expand-region.el --- Avendael's expand-region customizations

;;; Commentary:
;;
;; Not much really, but a convention is a convention.
;;
;;; Code:
(require 'expand-region)
(global-set-key (kbd "C-M-S-SPC") 'er/expand-region)

(provide 'avendael-expand-region)
;;; avendael-expand-region.el ends here
