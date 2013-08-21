(defvar elscreen-tab-configuration-store-filename
    (concat user-emacs-directory ".elscreen")
    "The file where the elscreen tab configuration is stored.")

(defun elscreen-store ()
    "Store the elscreen tab configuration."
    (interactive)
    (if (desktop-save user-emacs-directory)
        (with-temp-file elscreen-tab-configuration-store-filename
            (insert (prin1-to-string (elscreen-get-screen-to-name-alist))))))

(push #'elscreen-store kill-emacs-hook)

(defun elscreen-restore ()
    "Restore the elscreen tab configuration."
    (interactive)
    (if (eq (type-of (desktop-read)) 'symbol)
        (let ((screens (reverse
                        (read
                         (with-temp-buffer
                          (insert-file-contents elscreen-tab-configuration-store-filename)
                          (buffer-string))))))
            (while screens
                (setq screen (car (car screens)))
                (setq buffers (split-string (cdr (car screens)) ":"))
                (if (eq screen 0)
                    (switch-to-buffer (car buffers))
                    (elscreen-find-and-goto-by-buffer (car buffers) t t))
                (while (cdr buffers)
                    (switch-to-buffer-other-window (car (cdr buffers)))
                    (setq buffers (cdr buffers)))
                (setq screens (cdr screens))))))
