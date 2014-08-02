;;; avendael-magit.el --- Avendael's magit customizations

;;; Commentary:
;;
;; Make magit play nice with other vc related packages.
;;
;;; Code:
(require 'magit)
(global-auto-revert-mode t)

(defadvice git-commit (after git-commit-refresh-diff-hl activate)
  "Update diff-hl after git-commit."
  (diff-hl-update))

(defadvice magit-refresh (after magit-refresh-diff-hl activate)
  "Update diff-hl after magit-refresh."
  (diff-hl-update))

(defadvice magit-quit-window (after magit-quit-window-refresh-diff-hl activate)
  "Update diff-hl after magit-quit-window."
  (diff-hl-update))

(provide 'avendael-magit)
;;; avendael-magit.el ends here
