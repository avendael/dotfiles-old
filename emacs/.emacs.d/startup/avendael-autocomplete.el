;;; avenadel-autocomplete.el --- Avendael's autocomplete customizations

;;; Commentary:
;;
;; Make autocomplete play nice with other Emacs packages.
;;; Code:
(require 'auto-complete-config)

(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-flyspell-workaround)
(ac-linum-workaround)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(define-key ac-mode-map (kbd "C-x M-TAB") 'completion-at-point)

(provide 'avendael-autocomplete)
;;; avendael-autocomplete.el ends here
