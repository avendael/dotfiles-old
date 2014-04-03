;;-- IDO Mode --;;
(require 'ido)
(require 'ido-ubiquitous)
(require 'ido-vertical-mode)
(ido-mode)
(setq ido-enable-flex-matching t
      ido-everywhere t)
(ido-ubiquitous-mode)
(ido-vertical-mode 1)

;;-- SMEX --;;
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
