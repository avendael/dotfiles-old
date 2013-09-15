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

;; Put all emacs tmp files in one place
;(setq temporary-file-directory "~/.emacs.d/tmp")
;(setq auto-save-file-name-transforms '((".*", temporary-file-directory t)))

;; Always highlight matching parenthesis
(show-paren-mode t)

;;-- GUI Options --;;

;; Show column number in status bar
(column-number-mode t)

;; Show filesize in status bar
(size-indication-mode t)

;; Hide the scrollbar
(set-scroll-bar-mode nil)

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

;; Automatically follow symlinks of version controlled files
(setq vc-follow-symlinks 1)

;; Sentence ends with only one space
(setq sentence-end-double-space nil)

;; Always use gnus for email
(setq mail-user-agent 'gnus-user-agent)

;; The directory where projects are located
(setq root-project-directory (concat "/Users/" (getenv "USER") "/Development/Projects/"))

;; Fix OSX paths and bindings
(when (equal system-type 'darwin)
  (load "~/.emacs.d/startup/osx-path")
;  (setq mac-option-key-is-meta nil)
;  (setq mac-command-key-is-meta t)
;  (setq mac-command-modifier 'meta)
;  (setq mac-option-modifier 'super)
)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;-- ELPA --;;
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'custom-safe-themes
             "cead5b757549e6272f7ffebbb87e190dc2b4036e4d035ba2eefdc41a23ba11a9"
             "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d")
(load-theme 'zenburn t)

;;-- Expand Region --;;
(require 'expand-region)
(global-set-key (kbd "C-M-S-SPC") 'er/expand-region)

;;-- Chrome Edit Server --;;
(load "~/.emacs.d/extensions/edit-server")
(require 'edit-server)
(edit-server-start)

;;-- Tramp --;;
; Workaround for ssh config ControlMaster auto and ControlPersist yes
(setq tramp-default-method "scpx")

;;-- CUA Mode --;;
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; Windmove
(windmove-default-keybindings)

;; Winner Mode
(winner-mode)

;; Electric Pair
(electric-pair-mode)

;;-- Extensions --;;
(setq base-init-directory "~/.emacs.d/startup/")

(defun init-customization (init-file)
  (if (file-exists-p (concat base-init-directory init-file ".el"))
      (load (concat base-init-directory init-file))))

(init-customization "gpg")
(init-customization "shell")
(init-customization "desktop")
(init-customization "dired")
(init-customization "lambda")
(init-customization "ido")
(init-customization "elscreen")
(init-customization "elscreen-buffer-list")
(init-customization "uniquify")
(init-customization "yasnippet")
(init-customization "python")
(init-customization "autocomplete")
(init-customization "desktop")
(init-customization "pony")
(init-customization "flymake-cursor")
(init-customization "org")
(init-customization "wrap-region")
(init-customization "avendael")

(elscreen-start)
(elscreen-restore)

(defun create-tags (dir-name)
  "Create a tag file for the specified project directory. This function
uses ctags instead of etags."
  (interactive "DProject Directory: ")
  (shell-command (format "%s -e -R %s" ctags-path dir-name
                         (directory-file-name dir-name))))

;; Allow tramp sudo on remote hosts
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elscreen-tab-background-face ((t (:background "gray30"))))
 '(elscreen-tab-control-face ((t (:background "bisque4" :foreground "gray80" :underline t))))
 '(elscreen-tab-current-screen-face ((t (:background "dark slate blue" :foreground "gray80"))))
 '(elscreen-tab-other-screen-face ((t (:background "bisque4" :foreground "gray80" :underline t))))
 '(org-hide ((t (:foreground "3f3f3f"))) t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes (quote ("124e34f6ea0bc8a50d3769b9f251f99947d6b4d9422c6d85dc4bcc9c2e51b39c" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" default "cead5b757549e6272f7ffebbb87e190dc2b4036e4d035ba2eefdc41a23ba11a9")))
 '(virtualenv-root "~/Development/Libraries/python-venv/"))
(put 'dired-find-alternate-file 'disabled nil)
