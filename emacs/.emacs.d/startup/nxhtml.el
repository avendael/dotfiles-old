(autoload 'django-html-mumamo-mode "~/.emacs.d/extensions/nxhtml/autostart.el")
(setq auto-mode-alist
      (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
(setq mumamo-background-colors nil)
;(add-to-list 'auto-mode-alist '(("\\.html?$" . django-html-mumamo-mode)))