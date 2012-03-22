;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                           Avendael's dot emacs                          ;;;
;;;              Hacking emacs since 01/01/2011 and onwards ;)              ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;-- Standard behaviors --;;

;; Start the emacs server
(server-start)

;; Make the scratch buffer empty
(setq initial-scratch-message "")

;; Answer "y" or "n" instead of "yes" or "no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Put all backup files in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Always highlight matching parenthesis
(show-paren-mode t)

;;-- GUI Options --;;

;; Show column number in status bar
(column-number-mode t)

;; Show filesize in status bar
(size-indication-mode t)

;; Hide the scrollbar
(scroll-bar-mode nil)

;; Use spaces instead of tabs for indents
(setq-default indent-tabs-mode nil)

;; Indents are 4 spaces wide
(setq default-tab-width 4)

;; Obliterate trailing whitespaces before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Show the menu bar
(menu-bar-mode t)

;; Hide the toolbar
(tool-bar-mode -1)

;; Tell emacs to shutup when starting up
(setq inhibit-startup-message t)

;; Fix OSX paths
(when (equal system-type 'darwin) (load "~/.emacs.d/startup/osx-path"))

;;-- ELPA --;;

(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; IDO Mode --;;

(require 'ido)
(ido-mode)
(setq ido-enable-flex-matching t
      ido-everywhere t)

;;-- Shell Mode --;;

;; Hide passwords being typed in emacs shell mode
(add-hook
  'comint-output-filter-functions
  'comint-watch-for-password-prompt)

(defun n-shell-mode-hook ()
  "Shell mode customizations."
  (local-set-key '[up] 'comint-previous-input)
  (local-set-key '[down] 'comint-next-input)
  (local-set-key '[(shift tab)] 'comint-next-matching-input-from-input)
  (setq comint-input-sender 'n-shell-simple-send))

(defun n-shell-simple-send (proc command)
  "Various commands pre-processing before sending to shell."
  (cond
   ;; Checking for clear command and execute it.
   ((string-match "^[ \t]*clear[ \t]*$" command)
    (comint-send-string proc "\n")
    (erase-buffer))
   ;; Checking for man command and execute it.
   ((string-match "^[ \t]*man[ \t]*" command)
    (comint-send-string proc "\n")
    (setq command (replace-regexp-in-string "^[ \t]*man[ \t]*" "" command))
    (setq command (replace-regexp-in-string "[ \t]+$" "" command))
    ;;(message (format "command %s command" command))
    (funcall 'man command))
   ;; Send other commands to the default handler.
   (t (comint-simple-send proc command))))

(add-hook 'shell-mode-hook 'n-shell-mode-hook)

;;-- CUA Mode --;;

;; Enable CUA mode
(cua-mode t)

;; Disable CUA keys
(setq cua-enable-cua-keys nil)

;; Remapped keys
;(define-key ctl-x-map "?" 'help-command)
;(define-key global-map "\C-h" 'backward-delete-char-untabify)

;;-- Extensions --;;
(load "~/.emacs.d/startup/maxframe")
(load "~/.emacs.d/startup/nxhtml")
(load "~/.emacs.d/startup/color-theme")
(load "~/.emacs.d/startup/uniquify.el")
(load "~/.emacs.d/startup/yasnippet")
(load "~/.emacs.d/startup/pymacs")
(load "~/.emacs.d/startup/rope")
(load "~/.emacs.d/startup/autocomplete")
(load "~/.emacs.d/startup/autocomplete-python")
(load "~/.emacs.d/startup/python")
(load "~/.emacs.d/startup/flymake-cursor")
(load "~/.emacs.d/startup/org")

;;-- Custom functions --;;

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

(defun ant-compile ()
  "Travel up the path, find build.xml file and run compile."
  (interactive)
  (with-temp-buffer
    (while (and (not (file-exists-p "build.xml"))
                (not (equal "/" default-directory)))
      (cd ".."))
    (call-interactively 'compile)))

(setq ctags-path "/usr/local/Cellar/ctags/5.8/bin/ctags")
(defun create-tags (dir-name)
  "Create a tag file for the specified project directory. This function
uses ctags instead of etags."
  (interactive "DProject Directory: ")
  (shell-command (format "%s -e -R %s" ctags-path dir-name
                         (directory-file-name dir-name))))

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

;; Start the shell for the initial screen
(ansi-term "/bin/bash" (concat (getenv "USER") "@" (system-name) ":term"))

;; Define OSX infopaths
(setq Info-default-directory-list
      (list "/usr/local/Cellar/emacs/23.4/share/info/emacs/"
            "/usr/local/Cellar/emacs/23.3b/share/info/emacs/"
            "/usr/local/share/info/"
            "/usr/local/info/"
            "/usr/local/gnu/info/"
            "/usr/local/gnu/lib/info/"
            "/usr/local/gnu/lib/emacs/info/"
            "/usr/local/emacs/info/"
            "/usr/local/lib/info/"
            "/usr/local/lib/emacs/info/"
            "/usr/share/info/"
            "/Developer/usr/share/info"))

(defun remote-term (new-buffer-name cmd &rest switches)
  "Open a remote terminal with the specified arguments.

new-buffer-name: The name to be used for the buffer to be opened.
cmd: The command to be used for remote connection ie. ssh.
switches: Arguments for cmd ie. avendael@remote-host.com"
  (setq term-ansi-buffer-name (concat "*" new-buffer-name "*"))
  (setq term-ansi-buffer-name (generate-new-buffer-name term-ansi-buffer-name))
  (setq term-ansi-buffer-name (apply 'make-term term-ansi-buffer-name cmd nil switches))
  (set-buffer term-ansi-buffer-name)
  (term-mode)
  (term-char-mode)
  (term-set-escape-char ?\C-x)
  (switch-to-buffer term-ansi-buffer-name))

;; Make the scratch buffer persistent
(defvar persistent-scratch-filename "~/.emacs.d/persistent-scratch"
  "Location of *scratch* file contents for persistent-scratch.")

(defvar persistent-scratch-backup-dir "~/.emacs.d/backups/persistent-scratch"
  "Location of backups of the *scratch* buffer contents for persistent-scratch.")

(defun make-persistent-scratch-backup-name ()
  "Create a filename to backup the current scratch file by concatenating
PERSISTENT-SCRATCH-BACKUP-DIR with the current date and time."
  (concat persistent-scratch-backup-dir
          (replace-regexp-in-string (regexp-quote " ")
                                    "-"
                                    (current-time-string))))

(defun save-persistent-scratch ()
  "Write the contents of *scratch* to the file name PERSISTENT-SCRATCH-FILENAME,
making a backup copy in PERSISTENT-SCRATCH-BACKUP-DIR."
  (with-current-buffer (get-buffer "*scratch*")
    (if (file-exists-p persistent-scratch-filename)
        (copy-file persistent-scratch-filename
                   (make-persistent-scratch-backup-name)))
    (write-region (point-min) (point-max) persistent-scratch-filename)))

(defun load-persistent-scratch ()
  "Load the contents of PERSISTENT-SCRATCH-FILENAME into the *scratch* buffer,
clearing its contents first."
  (if (file-exists-p persistent-scratch-filename)
      (with-current-buffer (get-buffer "*scratch*")
        (delete-region (point-min) (point-max))
        (shell-command (format "cat %s" persistent-scratch-filename)
                       (current-buffer)))))

(load-persistent-scratch)
(push #'save-persistent-scratch kill-emacs-hook)