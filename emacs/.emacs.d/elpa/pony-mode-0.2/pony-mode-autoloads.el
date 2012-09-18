;;; pony-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (pony-mode-disable pony-load-snippets pony-test-hl-files
;;;;;;  pony-test-down pony-test-up pony-test-goto-err pony-test-open
;;;;;;  pony-test pony-tags pony-south-initial pony-south-migrate
;;;;;;  pony-south-schemamigration pony-south-convert pony-syncdb
;;;;;;  pony-startapp pony-shell pony-browser pony-temp-server pony-stopserver
;;;;;;  pony-runserver pony-loaddata pony-dumpdata pony-flush pony-manage
;;;;;;  pony-manage-run pony-list-commands pony-goto-settings pony-reverse-url
;;;;;;  pony-goto-template pony-template-decorator pony-fabric-deploy
;;;;;;  pony-fabric pony-fabric-run pony-fabric-list-commands pony-fabric-p
;;;;;;  pony-db-shell pony-get-db-settings pony-buildout-bin pony-buildout
;;;;;;  pony-buildout-list-bin pony-buildout-cmd pony-setting pony-get-setting
;;;;;;  pony-setting-p pony-get-settings-file pony-command-if-exists
;;;;;;  pony-command-exists pony-active-python pony-manage-cmd pony-rooted-sym-p
;;;;;;  pony-project-root pony-get-app pony-get-class pony-get-func
;;;;;;  pony-reload-mode pony-configfile-p pony-localise pony-mini-file
;;;;;;  pony-dir-excursion pony-manage-pop pony-comint-pop pony-pop
;;;;;;  pony-read-file pony-locate pony-find-file chomp) "pony-mode"
;;;;;;  "pony-mode.el" (20556 35246))
;;; Generated autoloads from pony-mode.el

(autoload 'chomp "pony-mode" "\
Chomp leading and tailing whitespace www.emacswiki.org/emacs/ElispCookbook

\(fn STR)" nil nil)

(autoload 'pony-find-file "pony-mode" "\
Find files matching pattern in or below path

\(fn PATH PATTERN)" nil nil)

(autoload 'pony-locate "pony-mode" "\
Essentially duplicates the functionality of `locate-dominating-file'
but allows paths rather than filenames

\(fn FILEPATH)" nil nil)

(autoload 'pony-read-file "pony-mode" "\
Read the contents of `filepath'

\(fn FILEPATH)" nil nil)

(autoload 'pony-pop "pony-mode" "\
Wrap pop-to and get buffer

\(fn BUFFER)" nil nil)

(autoload 'pony-comint-pop "pony-mode" "\
This is the main entry point for sub-processes in Pony-mode.
It creates a comint interaction buffer, called `name', running
`command', called with `args'

\(fn NAME COMMAND ARGS)" nil nil)

(autoload 'pony-manage-pop "pony-mode" "\
Run manage.py commands in a commint buffer. Intended as a wrapper around
`pony-commint-pop', this function bypasses the need to construct manage.py
calling sequences in command functions.

\(fn NAME COMMAND ARGS)" nil nil)

(autoload 'pony-dir-excursion "pony-mode" "\
pony-comint-pop where we need to change into `dir` first

\(fn DIR &rest REST)" nil nil)

(autoload 'pony-mini-file "pony-mode" "\
Read a file from the minibuffer.

\(fn PROMPT &optional STARTDIR)" nil nil)

(autoload 'pony-localise "pony-mode" "\
Return buffer local varible or get & set it

\(fn VAR FUNC)" nil nil)

(autoload 'pony-configfile-p "pony-mode" "\
Establish whether this project has a .ponyrc file in the root

\(fn)" nil nil)

(autoload 'pony-reload-mode "pony-mode" "\


\(fn)" t nil)

(autoload 'pony-get-func "pony-mode" "\
Get the function currently at point

\(fn)" nil nil)

(autoload 'pony-get-class "pony-mode" "\
Get the class at point

\(fn)" nil nil)

(autoload 'pony-get-app "pony-mode" "\
Get the name of the pony app currently being edited

\(fn)" nil nil)

(autoload 'pony-project-root "pony-mode" "\
Return the root of the project(dir with manage.py in) or nil

\(fn)" nil nil)

(autoload 'pony-rooted-sym-p "pony-mode" "\
Expand the concatenation of `symb` onto `pony-project-root` and determine whether
that file exists

\(fn SYMB)" nil nil)

(autoload 'pony-manage-cmd "pony-mode" "\
Return the current manage command
This command will only work if you run with point in a buffer that is within your project

\(fn)" nil nil)

(autoload 'pony-active-python "pony-mode" "\
Fetch the active Python interpreter for this Django project.
Be aware of .ponyrc configfiles, 'clean', buildout, and
 virtualenv situations

\(fn)" nil nil)

(autoload 'pony-command-exists "pony-mode" "\
Is cmd installed in this app

\(fn CMD)" nil nil)

(autoload 'pony-command-if-exists "pony-mode" "\
Run `command` if it exists

\(fn PROC-NAME COMMAND ARGS)" nil nil)

(autoload 'pony-get-settings-file "pony-mode" "\
Return the absolute path to the pony settings file

\(fn)" nil nil)

(autoload 'pony-setting-p "pony-mode" "\
Predicate to determine whether a `setting' exists for the current project

\(fn SETTING)" nil nil)

(autoload 'pony-get-setting "pony-mode" "\
Get the pony settings.py value for `setting`

\(fn SETTING)" nil nil)

(autoload 'pony-setting "pony-mode" "\
Interactively display a setting value in the minibuffer

\(fn)" t nil)

(autoload 'pony-buildout-cmd "pony-mode" "\
Return the buildout command or nil if we're not in a buildout

\(fn)" nil nil)

(autoload 'pony-buildout-list-bin "pony-mode" "\
List the commands available in the buildout bin dir

\(fn)" nil nil)

(autoload 'pony-buildout "pony-mode" "\
Run buildout again on the current project

\(fn)" t nil)

(autoload 'pony-buildout-bin "pony-mode" "\
Run a script from the buildout bin/ dir

\(fn)" t nil)

(autoload 'pony-get-db-settings "pony-mode" "\
Get Pony's database settings

\(fn)" nil nil)

(autoload 'pony-db-shell "pony-mode" "\
Run sql-XXX for this project

\(fn)" t nil)

(autoload 'pony-fabric-p "pony-mode" "\
Is this project using fabric?

\(fn)" nil nil)

(autoload 'pony-fabric-list-commands "pony-mode" "\
List of all fabric commands for project as strings

\(fn)" nil nil)

(autoload 'pony-fabric-run "pony-mode" "\
Run fabric command

\(fn CMD)" nil nil)

(autoload 'pony-fabric "pony-mode" "\
Run a fabric command

\(fn)" t nil)

(autoload 'pony-fabric-deploy "pony-mode" "\
Deploy project with fab deploy

\(fn)" t nil)

(autoload 'pony-template-decorator "pony-mode" "\
Hai

\(fn)" nil nil)

(autoload 'pony-goto-template "pony-mode" "\
Jump-to-template-at-point

\(fn)" t nil)

(autoload 'pony-reverse-url "pony-mode" "\
Get the URL for this view

\(fn)" t nil)

(autoload 'pony-goto-settings "pony-mode" "\


\(fn)" t nil)

(autoload 'pony-list-commands "pony-mode" "\
List of managment commands for the current project

\(fn)" nil nil)

(autoload 'pony-manage-run "pony-mode" "\
Run the pony-manage command completed from the minibuffer

\(fn ARGS)" nil nil)

(autoload 'pony-manage "pony-mode" "\
Interactively call the pony manage command

\(fn)" t nil)

(autoload 'pony-flush "pony-mode" "\
Flush the app

\(fn)" t nil)

(autoload 'pony-dumpdata "pony-mode" "\
Dumpdata to json

\(fn)" t nil)

(autoload 'pony-loaddata "pony-mode" "\
Load a fixture into the current project's dev database

\(fn)" t nil)

(autoload 'pony-runserver "pony-mode" "\
Start the dev server

\(fn)" t nil)

(autoload 'pony-stopserver "pony-mode" "\
Stop the dev server

\(fn)" t nil)

(autoload 'pony-temp-server "pony-mode" "\
Relatively regularly during development, I need/want to set up a development
server instance either on a nonstandard (or second) port, or that will be accessible
to the outside world for some reason. Meanwhile, i don't want to set my default host to 0.0.0.0
This function allows you to run a server with a 'throwaway' host:port

\(fn)" t nil)

(autoload 'pony-browser "pony-mode" "\
Open a tab at the development server

\(fn)" t nil)

(autoload 'pony-shell "pony-mode" "\
Open a shell with the current pony project's context loaded

\(fn)" t nil)

(autoload 'pony-startapp "pony-mode" "\
Run the pony startapp command

\(fn)" t nil)

(autoload 'pony-syncdb "pony-mode" "\
Run Syncdb on the current project

\(fn)" t nil)

(autoload 'pony-south-convert "pony-mode" "\
Convert an existing app to south

\(fn)" t nil)

(autoload 'pony-south-schemamigration "pony-mode" "\
Create migration for modification

\(fn)" t nil)

(autoload 'pony-south-migrate "pony-mode" "\
Migrate app

\(fn)" t nil)

(autoload 'pony-south-initial "pony-mode" "\
Run the initial south migration for an app

\(fn)" nil nil)

(autoload 'pony-tags "pony-mode" "\
Generate new tags table

\(fn)" t nil)

(autoload 'pony-test "pony-mode" "\
Run tests here

\(fn)" t nil)

(autoload 'pony-test-open "pony-mode" "\
Open the file in a traceback at the line specified

\(fn)" t nil)

(autoload 'pony-test-goto-err "pony-mode" "\
Go to the file and line of the last stack trace in a test buffer

\(fn)" t nil)

(autoload 'pony-test-up "pony-mode" "\
Move up the traceback one level

\(fn)" t nil)

(autoload 'pony-test-down "pony-mode" "\
Move up the traceback one level

\(fn)" t nil)

(autoload 'pony-test-hl-files "pony-mode" "\
Highlight instances of Files in Test buffers

\(fn)" nil nil)

(defvar pony-snippet-dir (expand-file-name (concat (file-name-directory load-file-name) "/snippets")))

(autoload 'pony-load-snippets "pony-mode" "\
Load snippets if yasnippet installed

\(fn)" t nil)

(autoload 'pony-mode-disable "pony-mode" "\
Turn off pony-mode in this buffer

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("pony-mode-pkg.el") (20556 35246 932640))

;;;***

(provide 'pony-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pony-mode-autoloads.el ends here
