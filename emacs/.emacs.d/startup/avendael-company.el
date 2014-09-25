;;; avenadel-company.el --- Avendael's company customizations

;;; Commentary:
;;
;; Make company play nice with other Emacs packages.
;;; Code:
(require 'company)

(setq global-company-mode 1)
(setq company-minimum-prefix-length 1)

(provide 'avendael-company)
;;; avendael-company.el ends here
