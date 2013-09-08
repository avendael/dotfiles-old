;; Lambda mode
(load "~/.emacs.d/extensions/lambda/lambda-mode")
(require 'lambda-mode)
(setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))
(add-hook 'emacs-lisp-mode-hook #'lambda-mode 1)
