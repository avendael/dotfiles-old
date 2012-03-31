(load "~/.emacs.d/extensions/maxframe/maxframe.el")
(require 'maxframe)
(setq mf-display-padding-height 0)
(add-hook 'window-setup-hook 'maximize-frame t)