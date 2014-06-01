;;; avendael-lambda.el --- Avendael's pretty-lambdada customizations

;;; Commentary:
;;
;; Pretty lambda everywhere.
;;
;;; Code:
(require 'pretty-lambdada)

(add-to-list 'pretty-lambda-auto-modes 'python-mode)
(pretty-lambda-for-modes)

(provide 'avendael-lambda)
;;; avendael-lambda.el ends here
