;;; avendael-dired.el --- Avendael's dired customizations

;;; Commentary:
;;
;; Append :dired to a dired buffer's name.  Bind ^ to go up one directory and reuse the
;; current buffer.
;;
;;; Code:
(require 'dired)

(defun avendael-buffer-name-dired ()
  "Append :dired to dired buffer names."
  (let ((name (buffer-name)))
    (if (not (string-match ":dired$" name))
        (rename-buffer (concat name ":dired") t))))

(add-hook 'dired-mode-hook 'avendael-buffer-name-dired)
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file "..")))))

(provide 'avendael-dired)
;;; avendael-dired.el ends here
