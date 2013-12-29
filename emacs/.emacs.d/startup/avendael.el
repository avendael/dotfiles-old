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
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun buffer-untabify ()
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

new-buffer-name: The name to be used for the buffer to be opened.
cmd: The command to be used for remote connection ie. ssh.
switches: Arguments for cmd ie. avendael@remote-host.com"
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

username: The username to be used for connecting to the remote host.
host: The remote host to connect to."
  (interactive "sConnect as: \nsConnect to: ")
  (open-remote-term (concat username "@" host ":term")
               "ssh"
               (concat username "@" host)))

(defun open-dir-term (new-buffer-name dirname)
  "Open a terminal to the specified directory.

new-buffer-name: The name to be used for the buffer to be opened.
project-dir: The directory to open a shell to."
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

(defun project-term (project-dir)
  "Open a terminal starting at the default directory where projects are
located.

project-dir: The project root directory"
  (interactive (let ((default-directory root-project-directory))
                 (call-interactively 'open-project-term))))

(defun open-project-term (project-dir)
  "Open a terminal to the specified project directory.

project-dir: The project root directory"
  (interactive "DProject DIR: ")
  (open-dir-term
   (concat (if (string= (car (last (split-string project-dir "/"))) "")
               (car (last (split-string project-dir "/" 2)))
             (car (last (split-string project-dir "/"))))
           ".proj:term") project-dir)
  (list project-dir))

;; Remapped keys
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "s-m") 'point-to-register)
(global-set-key (kbd "s-j") 'jump-to-register)
(global-set-key (kbd "C-M-<f11>") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-c C-M-S-c") 'crosshairs)
(global-set-key (kbd "C-x M-f") 'ffip)
(global-set-key (kbd "C-x SPC") 'just-one-space)
(global-set-key (kbd "C-x ?") help-map)
(local-set-key (kbd "C-h") 'backward-delete-char-untabify)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)
(define-key compilation-shell-minor-mode-map (kbd "M-{") 'elscreen-previous)
(define-key compilation-shell-minor-mode-map (kbd "M-}") 'elscreen-next)
(define-key compilation-shell-minor-mode-map (kbd "C-c M-{") 'compilation-previous-file)
(define-key compilation-shell-minor-mode-map (kbd "C-c M-}") 'compilation-next-file)

;;-- Additional frame bindings --;;
(global-set-key (kbd "C-x 5 n") 'ns-next-frame)
(global-set-key (kbd "C-x 5 p") 'ns-prev-frame)
(global-set-key (kbd "s-{") 'elscreen-previous)
(global-set-key (kbd "s-}") 'elscreen-next)

;; Osx style bindings
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-Z") 'undo-tree-redo)
(global-set-key (kbd "<s-left>") 'move-beginning-of-line)
(global-set-key (kbd "<s-right>") 'move-end-of-line)
(global-set-key (kbd "<s-up>") 'scroll-down-command)
(global-set-key (kbd "<s-down>") 'scroll-up-command)
(global-set-key (kbd "<C-s-f>") 'maximize-frame)

;; Windmove
(global-set-key (kbd "s-f") 'windmove-right)
(global-set-key (kbd "s-s") 'windmove-left)
(global-set-key (kbd "s-e") 'windmove-up)
(global-set-key (kbd "s-d") 'windmove-down)

(global-set-key (kbd "C-;") 'ace-jump-mode)

(set-frame-parameter nil 'alpha '(90 90))

(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'diff-hl-mode)
(add-hook 'prog-mode-hook 'wrap-region-mode)

(add-hook 'html-mode-hook 'linum-mode)
(add-hook 'html-mode-hook 'wrap-region-mode)
(add-hook 'html-mode-hook 'diff-hl-mode)
