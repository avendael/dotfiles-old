;;; avendael-elscreen.el --- Avendael's elscreen customizations

;;; Commentary:
;;
;; Make elscreen look pretty.
;;
;;; Code:
(require 'elscreen)

(defun elscreen-zenburn ()
  "Use the zenburn theme for elscreen."
  (interactive)
  (set-face-attribute 'elscreen-tab-background-face nil
                      :background "snow4")
  (set-face-attribute 'elscreen-tab-control-face nil
                      :background "snow4"
                      :foreground "gray80"
                      :underline t)
  (set-face-attribute 'elscreen-tab-current-screen-face nil
                      :background "dim gray"
                      :foreground "gray80")
  (set-face-attribute 'elscreen-tab-other-screen-face nil
                      :background "snow4"
                      :foreground "gray80"
                      :underline t))

(defun elscreen-monokai ()
  "Use the monokai theme for elscreen."
  (interactive)
  (set-face-attribute 'elscreen-tab-background-face nil
                      :background "#383838")
  (set-face-attribute 'elscreen-tab-control-face nil
                      :background "snow4"
                      :foreground "gray80"
                      :underline t)
  (set-face-attribute 'elscreen-tab-current-screen-face nil
                      :background "#5f5f5f"
                      :foreground "gray80"
                      :underline t)
  (set-face-attribute 'elscreen-tab-other-screen-face nil
                      :background "#5f5f5f"
                      :foreground "gray80"
                      :underline nil))

(defvar elscreen-tab-configuration-store-filename
  "~/.emacs.d/.elscreen")

(defun elscreen-store ()
  "Store the elscreen tab configuration."
  (interactive)
  (if (desktop-save user-emacs-directory)
      (with-temp-file elscreen-tab-configuration-store-filename
        (insert (prin1-to-string (elscreen-get-screen-to-name-alist))))))

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

(defmacro elscreen-create-automatically (ad-do-it)
  "Automatically create a new screen when elscreen-next is run with only one\
screen.

AD-DO-IT do it do it do it."
  (` (if (not (elscreen-one-screen-p))
         (, ad-do-it)
       (elscreen-create)
       (elscreen-notify-screen-modification 'force-immediately)
       (elscreen-message "Auto Screen"))))

(defadvice elscreen-next (around elscreen-create-automatically activate)
  "Advice elscreen-next to add another screen if there aren't any."
  (elscreen-create-automatically ad-do-it))

(defadvice elscreen-previous (around elscreen-create-automatically activate)
  "Advice elscreen-previous to add another screen if there aren't any."
  (elscreen-create-automatically ad-do-it))

(defadvice elscreen-toggle (around elscreen-create-automatically activate)
  "Advice elscreen-toggle to add a screen if there aren't any."
  (elscreen-create-automatically ad-do-it))

(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)

(push #'elscreen-store kill-emacs-hook)
(elscreen-start)
(elscreen-restore)
(elscreen-monokai)
(elscreen-toggle-display-tab)

(provide 'avendael-elscreen)
;;; avendael-elscreen.el ends here
