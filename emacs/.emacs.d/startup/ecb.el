;;-- ECB --;;

(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/extensions/ecb"))
(require 'ecb)
(ecb-winman-winring-enable-support)
(setq ecb-winman-winring-name "dev")
(winring-initialize)
(setq winring-show-names t)
(desktop-save-mode 1)
; '(ecb-analyse-face ((((class color) (background dark)) (:underline t))))
; '(ecb-default-highlight-face ((((class color) (background dark)) (:underline t))))
; '(ecb-directory-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face :underline t))))
; '(ecb-history-face ((((class color) (background dark)) (:underline t))))
; '(ecb-method-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face))))
; '(ecb-source-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face :underline "magenta"))))