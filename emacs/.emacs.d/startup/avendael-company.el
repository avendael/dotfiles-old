;;; avenadel-company.el --- Avendael's company customizations

;;; Commentary:
;;
;; Make company play nice with other Emacs packages.
;;; Code:
(require 'company)

(setq global-company-mode 1)
;(add-to-list 'company-backends 'company-yasnippet)
(setq company-minimum-prefix-length 1)
(add-hook 'elpy-mode-hook
    (lambda ()
        (set (make-local-variable 'company-backends)
            '((company-dabbrev-code company-yasnippet)))))

(provide 'avendael-company)
;;; avendael-company.el ends here
