;;-- Ediff --;;
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function
      (lambda (&optional arg)
	(if (> (frame-width) 80)
	    (split-window-horizontally arg)
	  (split-window-vertically arg))))