(global-auto-revert-mode t)

(when (equal system-type 'darwin)
  (setq magit-emacsclient-executable "/usr/local/bin/emacsclient"))

(defadvice git-commit (after git-commit-refresh-diff-hl activate) (diff-hl-update))
(defadvice magit-refresh (after magit-refresh-diff-hl activate) (diff-hl-update))
(defadvice magit-quit-window (after magit-quit-window-refresh-diff-hl activate) (diff-hl-update))
