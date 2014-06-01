;;; avendael-ediff.el --- Avendael's ediff customizations

;;; Commentary:
;;
;; Don't use a different frame for ediff controls.  Display files side by side by default.
;;
;;; Code:
(require 'ediff)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function
      (lambda (&optional arg)
	(if (> (frame-width) 80)
	    (split-window-horizontally arg)
	  (split-window-vertically arg))))

(provide 'avendael-ediff)
;;; avendael-ediff.el ends here
