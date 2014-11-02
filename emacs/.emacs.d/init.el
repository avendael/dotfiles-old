;;; init.el --- Avendael's emacs init.el

;;; Commentary:
;;
;; Evolution of init.el (does not include what packages are used along the way)
;;
;; TODO: Maybe move the story to a changelog.
;;
;; 2014 - Moved .emacs to .emacs.d/init.el.  Customizations are now provided as packages.
;;        Cask and Pallet are now being used to load packages from the package manager.
;;        Use the load-path instead of brute-force specifying where customizations are.
;;        Reduced init.el to a series of require calls.  Obey the flycheck as much as
;;        possible.
;; 2013 - package.el is being used to install packages.  A new Emacs installation can
;;        install packages based from a hand-crafted list.  Some custom functions to
;;        facilitate loading customizations.
;; 2012 - Package specific customizations moved from .emacs to .emacs.d/startup.
;;        Customizations are still as directives to the editor, only they are in a
;;        different file.
;; 2011 - Came from several years of pre-pathogen vim.  Init file is very vim-like.
;;        Each customization is as a directive to the editor Everything is in
;;        .emacs, with some comments to play nice with future self.
;;
;;; Code:
(let ((default-directory "~/.emacs.d"))
  ;; Pun not intended
  (normal-top-level-add-to-load-path '("startup" "secrets")))

;; Bootstrap before doing anything
(require 'avendael-bootstrap)

;; Base package customizations
(require 'avendael-base)
(require 'avendael-gpg)
(require 'avendael-theme)
(require 'avendael-dired)
(require 'avendael-shell)
(require 'avendael-tramp)
(require 'avendael-ido)
(require 'avendael-expand-region)
(require 'avendael-projectile)
(require 'avendael-yasnippet)
(require 'avendael-scratch)
(require 'avendael-org)
(require 'avendael-ediff)
(require 'avendael-python)
(require 'avendael-ruby)
(require 'avendael-flymake)
(require 'avendael-osx)

;; Third party package customizations
(require 'avendael-ag)
(require 'avendael-lambda)
(require 'avendael-irc)
(require 'avendael-flycheck)
(require 'avendael-uniquify)
(require 'avendael-company)
(require 'avendael-pony)
(require 'avendael-wrap-region)
(require 'avendael-helm)
(require 'avendael-misc)
(require 'avendael-windmove)
(require 'avendael-magit)
(require 'avendael-js)
(require 'avendael-web-mode)
(require 'avendael-powerline)
(require 'avendael-evil)
(require 'avendael-perspective)
(require 'avendael-tweet)

(provide 'init)
;;; init.el ends here
