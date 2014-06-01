;;; avendael-pony.el --- Avendael's pony customizations

;;; Commentary:
;;
;; Make the pony more fun to ride.
;;
;;; Code:
(require 'pony-mode)

(defun pony-key(binding function)
  "Bind function to binding in pony-minor-mode-map"
  (define-key pony-minor-mode-map binding function))

(add-hook 'pony-minor-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c P b") 'pony-browser)
             (local-set-key (kbd "C-c P d") 'pony-db-shell)
             (local-set-key (kbd "C-c P f") 'pony-fabric)
             (local-set-key (kbd "C-c P g t") 'pony-goto-template)
             (local-set-key (kbd "C-c P g s") 'pony-goto-settings)
             (local-set-key (kbd "C-c P r") 'pony-runserver)
             (local-set-key (kbd "C-c P m") 'pony-manage)
             (local-set-key (kbd "C-c P s") 'pony-shell)
             (local-set-key (kbd "C-c P !") 'pony-shell)
             (local-set-key (kbd "C-c P t") 'pony-test)
             (local-set-key (kbd "C-c P C-r") 'pony-reload-mode)
             (local-set-key (kbd "C-c C-p") `python-previous-statement)))

(provide 'avendael-pony)
;;; avendael-pony.el ends here
