;;; avendael-flymake.el --- Avendael's flymake config

;;; Commentary:
;;
;; Completely disable flymake.  We'll use flycheck instead.
;;
;;; Code:
(require 'flymake)

(delete '("\\.py\\'" elpy-flymake-python-init) flymake-allowed-file-name-masks)
(delete '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-init) flymake-allowed-file-name-masks)
(delete '("\\.xml\\'" flymake-xml-init) flymake-allowed-file-name-masks)
(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)
(delete '("\\.cs\\'" flymake-simple-make-init) flymake-allowed-file-name-masks)
(delete '("\\.p[ml]\\'" flymake-perl-init) flymake-allowed-file-name-masks)
(delete '("\\.php[345]?\\'" flymake-php-init) flymake-allowed-file-name-masks)
(delete '("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup) flymake-allowed-file-name-masks)
(delete '("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup) flymake-allowed-file-name-masks)
(delete '("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup) flymake-allowed-file-name-masks)
(delete '("\\.tex\\'" flymake-simple-tex-init) flymake-allowed-file-name-masks)
(delete '("\\.idl\\'" flymake-simple-make-init) flymake-allowed-file-name-masks)

(setq flymake-allowed-file-name-masks nil)

(defun flymake-display-warning (warning)
  "Disable annoying flymake popups.

WARNING: The stupid warning message."
    (message warning))

(provide 'avendael-flymake)
;;; avendael-flymake.el ends here
