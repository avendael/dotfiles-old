;;; avendael-osx.el --- Avendael's windmove configuration.

;;; Commentary:
;;
;; Move like the wind.
;;
;;; Code:
(global-set-key (kbd "C-s-l") 'windmove-right)
(global-set-key (kbd "C-s-h") 'windmove-left)
(global-set-key (kbd "C-s-k") 'windmove-up)
(global-set-key (kbd "C-s-j") 'windmove-down)
(global-set-key (kbd "s-l") 'windmove-right)
(global-set-key (kbd "s-h") 'windmove-left)
(global-set-key (kbd "s-k") 'windmove-up)
(global-set-key (kbd "s-j") 'windmove-down)

(provide 'avendael-windmove)
;;; avendael-windmove.el ends here
