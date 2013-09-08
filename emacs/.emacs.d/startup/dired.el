;; Dired buffer names
(add-hook 'dired-mode-hook 'avendael/buffer-name-dired)
(defun avendael/buffer-name-dired ()
  "Append :dired to dired buffer names"
  (let ((name (buffer-name)))
    (if (not (string-match ":dired$" name))
        (rename-buffer (concat name ":dired") t))))
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file "..")))))
