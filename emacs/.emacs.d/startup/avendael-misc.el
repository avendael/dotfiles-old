;;; avendael-misc.el --- Miscellaneous functions and customizations

;;; Commentary:
;;
;; TODO: Get rid of this file.  Put things in their proper places.  Otherwise, this will be an
;;       excuse for you to be lazy and just dump everything here.
;;
;; Miscellaneous functions and customizations that doesn't necessarily belong to a package.
;;
;;; Code:
(defun count-words-buffer ()
  "Count the number of words in the current buffer;
print a message in the minibuffer with the result."
  (interactive)
  (let ((count 0))
    (save-excursion
      (goto-char (point-min))
      (while (< (point) (point-max))
	(forward-word 1)
	(setq count (1+ count)))
      (message "Buffer contains %d words." count))))

(defun toggle-transparency ()
  "Toggle transparent or opaque display."
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha)) 100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(90 90))))

(defun avendael-join-next-line ()
  "Join the next line with the current line."
  (interactive)
  (next-line)
  (delete-indentation))
(global-set-key (kbd "C-S-j") 'avendael-join-next-line)

(defun avendael-newline-above-and-indent ()
  "Open a new line above and indent it."
  (interactive)
  (move-beginning-of-line nil)
  (open-line 1)
  (funcall indent-line-function))
(global-set-key (kbd "C-S-o") 'avendael-newline-above-and-indent)

(defun ant-compile ()
  "Travel up the path, find build.xml file and run compile."
  (interactive)
  (with-temp-buffer
    (while (and (not (file-exists-p "build.xml"))
                (not (equal "/" default-directory)))
      (cd ".."))
    (call-interactively 'compile)))

(defun eshell/clear ()
  "Clear contents in eshell."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun buffer-untabify ()
  "Remove all tabs and convert them to spaces."
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (delete-region (match-beginning 0) (match-end 0)))
    (goto-char (point-min))
    (if (search-forward "\t" nil t)
        (untabify (1- (point)) (point-max))))
  nil)

(defun shell-pwd ()
  "Opens a shell with the name of the pwd as a prefix to the buffer name."
  (interactive)
  (let ((splitdir (split-string default-directory "/" t)))
    (if (or (equal (length splitdir) 0) (equal splitdir nil))
        (shell "*rootdir:shell*")
      (shell (concat "*" (car (last splitdir)) ":shell*")))))

(defun open-remote-term (new-buffer-name cmd &rest switches)
  "Open a remote terminal with the specified arguments.

NEW-BUFFER-NAME: The name to be used for the buffer to be opened.
CMD: The command to be used for remote connection ie. ssh.
SWITCHES: Arguments for cmd ie. avendael@remote-host.com"
  (setq term-ansi-buffer-name new-buffer-name)
  (setq term-ansi-buffer-name (generate-new-buffer-name term-ansi-buffer-name))
  (setq term-ansi-buffer-name (apply 'make-term term-ansi-buffer-name cmd nil switches))
  (set-buffer term-ansi-buffer-name)
  (term-mode)
  (term-char-mode)
  (term-set-escape-char ?\C-x)
  (switch-to-buffer term-ansi-buffer-name))

(defun remote-term (username host)
  "Open a remote terminal using ssh with the specified arguments.

USERNAME: The username to be used for connecting to the remote host.
HOST: The remote host to connect to."
  (interactive "sConnect as: \nsConnect to: ")
  (open-remote-term
      (concat username "@" host ":term")
      "ssh"
      (concat username "@" host)))

(defun open-dir-term (new-buffer-name dirname)
  "Open a terminal to the specified directory.

NEW-BUFFER-NAME: The name to be used for the buffer to be opened.
DIRNAME: The directory to open a shell to."
  (with-current-buffer (get-buffer "*scratch*")
    (cd dirname)
    (setq term-ansi-buffer-name new-buffer-name)
    (setq term-ansi-buffer-name (generate-new-buffer-name term-ansi-buffer-name))
    (setq term-ansi-buffer-name (apply 'make-term term-ansi-buffer-name
                                       (concat "/bin/bash" nil nil)
                                       nil nil))
    (set-buffer term-ansi-buffer-name)
    (term-mode)
    (term-char-mode)
    (term-set-escape-char ?\C-x)
    (switch-to-buffer term-ansi-buffer-name)))

(defvar ctags-path "/usr/local/bin/ctags")
(defun create-tags (dir-name)
  "Create a tag file for the specified project directory.
This function uses ctags instead of etags.

DIR-NAME - The directory name"
  (interactive "DProject Directory: ")
  (shell-command
   (format "%s -e -R %s" ctags-path dir-name (directory-file-name dir-name))))

(defun toggle-sticky-buffer-window ()
  "Toggle whether this window is dedicated to this buffer."
  (interactive)
  (set-window-dedicated-p
   (selected-window)
   (not (window-dedicated-p (selected-window))))
  (if (window-dedicated-p (selected-window))
      (message "Window is now dedicated.")
    (message "Window is no longer dedicated.")))

;; Remapped keys
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "s-m") 'point-to-register)
(global-set-key (kbd "s-j") 'jump-to-register)
(global-set-key (kbd "C-M-<f11>") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-c C-M-S-c") 'crosshairs)
(global-set-key (kbd "C-x M-f") 'ffip)
(global-set-key (kbd "C-x SPC") 'just-one-space)

;; Additional frame bindings
(global-set-key (kbd "C-x 5 n") 'ns-next-frame)
(global-set-key (kbd "C-x 5 p") 'ns-prev-frame)
(global-set-key (kbd "C-x 5 /") 'winner-undo)
(global-set-key (kbd "C-x 5 ?") 'winner-redo)

(global-set-key (kbd "s-'") 'company-yasnippet)

(global-set-key (kbd "C-;") 'ace-jump-mode)

(set-frame-parameter nil 'alpha '(90 90))

(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'diff-hl-mode)
(add-hook 'prog-mode-hook 'wrap-region-mode)

(setq initial-frame-alist (set-frame-parameter nil 'fullscreen 'fullheight))
(setq linum-relative-current-symbol "")
(toggle-transparency)

(provide 'avendael-misc)
;;; avendael-misc.el ends here
