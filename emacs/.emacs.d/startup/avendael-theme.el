;;; avendael-theme.el --- Avendael's favorite theme

;;; Commentary:
;;
;; Not an own theme by itself.  It's a composition of existing themes, plus the avendael
;; secret sauce.
;;
;;; Code:
(require 'linum-relative)
(require 'popwin)

(add-to-list 'custom-safe-themes
    "cead5b757549e6272f7ffebbb87e190dc2b4036e4d035ba2eefdc41a23ba11a9"
    "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d")
(load-theme 'monokai t)
(popwin-mode 1)

(setq display-buffer-function 'popwin:display-buffer)
(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)
(push '("^\*helm-.+\*$" :regexp t) popwin:special-display-config)

(set-face-attribute 'default nil :family "Anonymous Pro" :height 150)
(setq-default line-spacing 1)

(provide 'avendael-theme)
;;; avendael-theme.el ends here
