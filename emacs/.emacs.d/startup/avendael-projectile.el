;;; avendael-projectile --- Avendael's projectile customizations

;;; Commentary:
;;
;; Altered variables.  This doesn't require projectile because for some
;; reason, doing so won't allow rebinding of projectile-keymap-prefix.
;; TODO of course.
;;
;;; Code:
(setq projectile-enable-caching t)
(setq projectile-keymap-prefix (kbd "s-p"))
(setq projectile-completion-system 'helm)
(projectile-global-mode)

(provide 'avendael-projectile)
;;; avendael-projectile.el ends here
