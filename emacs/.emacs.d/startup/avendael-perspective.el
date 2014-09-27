;;; avendael-perspecctive.el --- Avendael's perspective configuration

;;; Commentary:
;;
;; Each workspace should have its own buffer list.  Perspective is
;; works perfectly for this requirement, and it integrates well with
;; projectile.  This should be loaded anywhere after projectile is loaded.
;;
;;; Code:
(require 'perspective)

(eval-after-load 'perspective
  (set-face-attribute 'persp-selected-face nil :foreground "cornflower blue" :weight 'bold))
(persp-mode)

(global-set-key (kbd "s-{") 'persp-prev)
(global-set-key (kbd "s-}") 'persp-next)
(global-set-key (kbd "s-e ps") 'persp-switch)
(global-set-key (kbd "s-e pk") 'persp-kill)
(global-set-key (kbd "s-e pr") 'persp-rename)
(global-set-key (kbd "s-p w") 'persp-switch)

(provide 'avendael-perspective)
;;; avendael-perspective.el ends here
