;;; avendael-ido.el --- Avendael's ido customizations

;;; Commentary:
;;
;; This requires three packages to be installed:
;;
;;    1. ido-ubiquitous
;;    2. ido-vertical-mode
;;    3. smex
;;
;;; Code:
(require 'ido)
(require 'ido-ubiquitous)
(require 'ido-vertical-mode)
(require 'smex)

;; The ido part
(ido-mode)
(setq ido-enable-flex-matching t
      ido-everywhere t)
(ido-ubiquitous-mode)
(ido-vertical-mode 1)

;; The smex part
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(provide 'avendael-ido)
;;; avendael-ido.el ends here
