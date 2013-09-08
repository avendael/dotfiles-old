;;-- IDO Mode --;;
(require 'ido)
(require 'ido-ubiquitous)
(ido-mode)
(setq ido-enable-flex-matching t
      ido-everywhere t)
(ido-ubiquitous-disable-in man)
(ido-ubiquitous-mode)

;;-- SMEX --;;
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
