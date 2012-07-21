(autoload 'django-html-mumamo-mode "~/.emacs.d/extensions/nxhtml/autostart.el")
(setq auto-mode-alist
      (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
(setq mumamo-background-colors nil)
;(add-to-list 'auto-mode-alist '(("\\.html?$" . django-html-mumamo-mode)))

;; Mumamo is making emacs 23.3 freak out:
(when (and (equal emacs-major-version 23)
           (>= emacs-minor-version 3))
  (eval-after-load "bytecomp"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function))
  ;; tramp-compat.el clobbers this variable!
  (eval-after-load "tramp-compat"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function)))
