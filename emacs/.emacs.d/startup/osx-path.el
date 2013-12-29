;; Setup the OSX execution paths
(if (not (getenv "TERM_PROGRAM"))
    (setenv "PATH"
            (shell-command-to-string "source $HOME/.bash_profile && printf $PATH")))

(add-to-list 'exec-path (concat "/Users/" (getenv "USER") "/bin"))
(add-to-list 'exec-path "/usr/local/Cellar/ctags/5.8/bin")
(add-to-list 'exec-path "/usr/local/sbin")
(add-to-list 'exec-path "/usr/local/bin")

(setq ctags-path "/usr/local/Cellar/ctags/5.8/bin/ctags")
