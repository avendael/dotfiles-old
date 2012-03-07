;;-- Android Mode --;;
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/extensions/android/"))
(require 'android)
(require 'android-mode)

;;-- GUD Mode --;;
(add-hook 'gud-mode-hook
	  (lambda ()
	    (add-to-list 'gud-jdb-classpath
			 "~/dev/android-sdk-linux_86/platforms/android-8/android.jar")
	    ))