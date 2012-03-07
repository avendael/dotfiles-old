;;-- JDEE --;;

(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/extensions/elib"))
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/extensions/jde/lisp"))
(setq defer-loading-jde nil)
(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '(("\\.java\\'" . jde-mode))
	     auto-mode-alist)))
  (require 'jde))
(defun java-default-indent ()
  (setq c-set-style 'java
	c-basic-offset 4
	tab-width 4
	indent-tabs-mode nil))
(defun java-mode-untabify ()
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "[ \t]+$" nil t)
        (delete-region (match-beginning 0) (match-end 0)))
      (goto-char (point-min))
      (if (search-forward "\t" nil t)
          (untabify (1- (point)) (point-max))))
    nil)
(add-hook 'jde-mode-hook 'java-default-indent)
(add-hook 'jde-mode-hook 'linum-mode)
(add-hook 'jde-mode-hook
            '(lambda ()
               (make-local-variable 'write-contents-hooks)
               (add-hook 'write-contents-hooks 'java-mode-untabify)))
