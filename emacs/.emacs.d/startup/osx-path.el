;; Setup the OSX execution paths
(if (not (getenv "TERM_PROGRAM"))
       (setenv "PATH"
               (shell-command-to-string "source $HOME/.bash_profile && printf $PATH")))
(add-to-list 'exec-path (concat "/Users/" (getenv "USER") "/bin"))
(add-to-list 'exec-path "/usr/local/Cellar/ctags/5.8/bin")
(add-to-list 'exec-path "/usr/local/sbin")
(add-to-list 'exec-path "/usr/local/bin")

;; Define OSX infopaths
(setq Info-default-directory-list
      (list "/usr/local/Cellar/emacs/24.1/share/info/emacs/"
            "/usr/local/share/info/"
            "/usr/local/info/"
            "/usr/local/gnu/info/"
            "/usr/local/gnu/lib/info/"
            "/usr/local/gnu/lib/emacs/info/"
            "/usr/local/emacs/info/"
            "/usr/local/lib/info/"
            "/usr/local/lib/emacs/info/"
            "/usr/share/info/"
            "/Developer/usr/share/info"))
