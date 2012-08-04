(require 'maxframe)
;(mf-display-padding-height 46 nil nil
;       "The default value of 45 leaves the titlebar tucked up under"
;       " the menu bar on OSX Lion"
;       " See http://debbugs.gnu.org/cgi/bugreport.cgi?bug=10449")
(add-hook 'window-setup-hook 'maximize-frame t)

;(defvar maxframe-maximized-p nil "maxframe is in fullscreen mode")
;(defun toggle-maxframe ()
;  "Toggle maximized frame"
;  (interactive)
;  (setq maxframe-maximized-p (not maxframe-maximized-p))
;  (cond (maxframe-maximized-p (maximize-frame))
;        (t (restore-frame))))
;(define-key global-map [(alt return)] 'toggle-maxframe)
