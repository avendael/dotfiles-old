;;; avendael-cedet.el --- Avendael's cedet customizations

;;; Commentary:
;;
;; This is not really being used since I stopped using JDEE in favor of IntelliJ IDEA.
;; I would love to someday use Emacs for Java development, but currently, IntelliJ
;; is the superior tool for that task.
;;; Code:

(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/extensions/cedet/common"))
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/extensions/cedet/contrib"))
(load-file (expand-file-name "~/.emacs.d/extensions/cedet/common/cedet.el"))
(setq semantic-default-submodes
      '(global-semantic-idle-scheduler-mode
	global-semanticdb-minor-mode
	global-semantic-idle-summary-mode
	global-semantic-decoration-mode
	global-semantic-highlight-func-mode
	global-semantic-stickyfunc-mode
	global-semantic-mru-bookmark-mode))
;(setq semantic-load-turn-everything-on t)
(require 'senator)
(require 'semantic)
(require 'semantic-ia)
(require 'wisent)
(require 'wisent-java-tags)

; Use the full Java 1.5 grammar to parse Java
(autoload 'wisent-java-default-setup "wisent" "Hook run to setup Semantic in 'java-mode'." nil nil)
(setq jde-auto-parse-enable nil)
(setq jde-enable-senator nil)

(provide 'avendael-cedet)
;;; avendael-cedet.el ends here
