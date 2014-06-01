;;; avendael-irc --- Avendael's ERC customizations

;;; Commentary:
;;
;; Connect to Avendael's znc server and use that for ERC.
;;
;;; Code:
(defadvice znc-erc (before znc-init-servers activate)
  "Advice znc-erc to initialize server credentials before running."
  (require 'znc)
  (require 'avendael-secrets)
  (znc-init-servers))

(provide 'avendael-irc)
;;; avendael-irc.el ends here
