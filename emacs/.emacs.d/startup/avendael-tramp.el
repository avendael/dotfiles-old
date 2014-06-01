;;; avendael-tramp.el --- Avendael's tramp customizations

;;; Commentary:
;;
;; Make tramp jump hoops for you.
;;
;;; Code:
(require 'tramp)
; Workaround for ssh config ControlMaster auto and ControlPersist yes
(setq tramp-default-method "scpx")

; Allow tramp sudo on remote hosts
; TODO: (causes a problem with localhost. Fix this)
;; (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
;; (add-to-list tramp-default-proxy-alist (quote("njord" nil "/ssh:user@ssh-host")))

(provide 'avendael-tramp)
;;; avendael-tramp.el ends here
