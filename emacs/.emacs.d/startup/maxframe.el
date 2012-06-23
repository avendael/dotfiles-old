(load "~/.emacs.d/extensions/maxframe/maxframe.el")
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)