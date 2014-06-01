;;; avendael-base.el --- Avendael's base emacs customizations

;;; Commentary:
;;
;; Customizations on Emacs' base behavior.  This includes alterations to variables already
;; present in Emacs itself,  not on another Emacs package.  Customizations on packages
;; not included in the base installation of Emacs are on their own avendael-*.el file.
;;
;;; Code:

;; Start the Emacs server
(server-start)

;; Make the scratch buffer empty
(setq initial-scratch-message "")

;; Answer "y" or "n" instead of "yes" or "no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Put all backup files in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Put all emacs tmp files in one place
;(setq temporary-file-directory "~/.emacs.d/tmp")
;(setq auto-save-file-name-transforms '((".*", temporary-file-directory t)))

;; Always highlight matching parenthesis
(show-paren-mode t)

;; Show column number in status bar
(column-number-mode t)

;; Show filesize in status bar
(size-indication-mode t)

;; Hide the scrollbar
(set-scroll-bar-mode nil)

;; Use spaces instead of tabs for indents
(setq-default indent-tabs-mode nil)

;; Indents are 4 spaces wide
(setq tab-width 4)

;; Obliterate trailing whitespaces before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Show the menu bar
(menu-bar-mode t)

;; Hide the toolbar
(tool-bar-mode -1)

;; Tell emacs to shutup when starting up
(setq inhibit-startup-message t)

;; Automatically follow symlinks of version controlled files
(setq vc-follow-symlinks 1)

;; Sentence ends with only one space
(setq sentence-end-double-space nil)

;; Always use gnus for email
(setq mail-user-agent 'gnus-user-agent)

;; Because we're not losers
(winner-mode)

;; Electric Pair
(electric-pair-mode)

;; Enable some disabled commands
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Use utf-8 by default
;; TODO: move this to its own file
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq buffer-file-coding-system 'utf-8))
(setq current-language-environment "UTF-8")
;(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Fix OSX paths and bindings
;; TODO: move this to its own file
(when (equal system-type 'darwin)
  (setq mac-option-key-is-meta t)
  (setq mac-command-key-is-meta nil)
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)

  ;; Setup the OSX execution paths
  (if (not (getenv "TERM_PROGRAM"))
      (setenv "PATH"
              (shell-command-to-string "source $HOME/.bash_profile && printf $PATH")))
  (add-to-list 'exec-path (concat "/Users/" (getenv "USER") "/bin"))
  (add-to-list 'exec-path "/usr/local/Cellar/ctags/5.8/bin")
  (add-to-list 'exec-path "/usr/local/sbin")
  (add-to-list 'exec-path "/usr/local/bin")
  (setq ctags-path "/usr/local/Cellar/ctags/5.8/bin/ctags"))

(provide 'avendael-base)
;;; avendael-base.el ends here
