;;; avendael-gpg.el --- Avendael's gpg customizations

;;; Commentary:
;;
;; Enable ezmode gpg encrypt/decrypt.
;;
;;; Code:
(require 'epa-file)

(epa-file-enable)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

(provide 'avendael-gpg)
;;; avendael-gpg.el ends here
