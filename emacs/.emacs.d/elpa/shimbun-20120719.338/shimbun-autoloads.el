;;; shimbun-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (mew-shimbun-expire mew-shimbun-expire-all mew-shimbun-re-retrieve-all
;;;;;;  mew-shimbun-re-retrieve mew-shimbun-retrieve-all mew-shimbun-retrieve
;;;;;;  mew-shimbun-goto-folder mew-shimbun-goto-unseen-folder) "mew-shimbun"
;;;;;;  "mew-shimbun.el" (21012 61582 0 0))
;;; Generated autoloads from mew-shimbun.el

(autoload 'mew-shimbun-goto-unseen-folder "mew-shimbun" "\
Goto folder for SHIMBUN to have a few new messages.

\(fn)" t nil)

(autoload 'mew-shimbun-goto-folder "mew-shimbun" "\
Goto folder for SHIMBUN.
If called with '\\[universal-argument]', goto folder to have a few new messages.

\(fn &optional ARGS)" t nil)

(autoload 'mew-shimbun-retrieve "mew-shimbun" "\
Retrieve articles via SHIMBUN on this folder.

\(fn &optional NEWFLD)" t nil)

(autoload 'mew-shimbun-retrieve-all "mew-shimbun" "\
Retrieve all articles via SHIMBUN.

\(fn)" t nil)

(autoload 'mew-shimbun-re-retrieve "mew-shimbun" "\
Re-retrieve this message.
If called with '\\[universal-argument]', re-retrieve messages marked with
'mew-shimbun-mark-re-retrieve'.

\(fn &optional ARGS)" t nil)

(autoload 'mew-shimbun-re-retrieve-all "mew-shimbun" "\
Re-retrieve all messages in this folder.
If called with '\\[universal-argument]', re-retrieve messages in the region.

\(fn &optional ARG)" t nil)

(autoload 'mew-shimbun-expire-all "mew-shimbun" "\
Expire all shimbun folder.

\(fn)" t nil)

(autoload 'mew-shimbun-expire "mew-shimbun" "\
Expire this shimbun folder.

\(fn)" t nil)

;;;***

;;;### (autoloads (gnus-group-make-shimbun-groups gnus-group-make-shimbun-group
;;;;;;  gnus-summary-refer-shimbun-article) "nnshimbun" "nnshimbun.el"
;;;;;;  (21012 61582 0 0))
;;; Generated autoloads from nnshimbun.el

(autoload 'gnus-summary-refer-shimbun-article "nnshimbun" "\
Show a shimbun article pointed to by the given URL.

\(fn URL)" t nil)

(autoload 'gnus-group-make-shimbun-group "nnshimbun" "\
Create a new nnshimbun group.
The user will be prompted for a SERVER name and a GROUP name.  When
this command is called with a prefix argument, it makes an ephemeral
shimbun group.

\(fn SERVER GROUP &optional EPHEMERAL)" t nil)

(autoload 'gnus-group-make-shimbun-groups "nnshimbun" "\
Create all nnshimbun groups prepared for SERVER.

\(fn SERVER)" t nil)

;;;***

;;;### (autoloads nil nil ("sb-2ch.el" "sb-airs.el" "sb-aljazeera.el"
;;;;;;  "sb-arch-bluegate.el" "sb-asahi-html.el" "sb-asahi-mytown.el"
;;;;;;  "sb-asahi.el" "sb-atmarkit.el" "sb-atom-hash.el" "sb-atom.el"
;;;;;;  "sb-bbc.el" "sb-bbdb-ml.el" "sb-cgi-board.el" "sb-chise.el"
;;;;;;  "sb-cnet-jp.el" "sb-cnet.el" "sb-cnn-jp.el" "sb-coldsync.el"
;;;;;;  "sb-debian-jp.el" "sb-debian.el" "sb-debugmagazin-de.el"
;;;;;;  "sb-dennou.el" "sb-digiko.el" "sb-elips.el" "sb-emacs-w3m.el"
;;;;;;  "sb-emacswiki.el" "sb-engadget-ja.el" "sb-excite.el" "sb-exconn.el"
;;;;;;  "sb-f1fan.el" "sb-fau.el" "sb-ffii.el" "sb-fml.el" "sb-gendai-net.el"
;;;;;;  "sb-geocrawler.el" "sb-glimpse.el" "sb-gnome.el" "sb-haiku-os.el"
;;;;;;  "sb-hash.el" "sb-heise.el" "sb-hns.el" "sb-ibm-dev.el" "sb-impress.el"
;;;;;;  "sb-infoshop.el" "sb-itmedia.el" "sb-japantimes.el" "sb-javaconf.el"
;;;;;;  "sb-jpilot.el" "sb-jpo.el" "sb-kantei.el" "sb-kde.el" "sb-laut-de.el"
;;;;;;  "sb-linuxce-jp.el" "sb-lotusex.el" "sb-lump.el" "sb-m17n.el"
;;;;;;  "sb-macosx-jp.el" "sb-mailarc.el" "sb-mailman.el" "sb-mainichi.el"
;;;;;;  "sb-makanai.el" "sb-marc-aims.el" "sb-meadow.el" "sb-mew.el"
;;;;;;  "sb-mhonarc.el" "sb-mozilla-jp.el" "sb-msdn.el" "sb-msports-nifty.el"
;;;;;;  "sb-multi.el" "sb-n24-de.el" "sb-namazu.el" "sb-netbsd.el"
;;;;;;  "sb-nikkansports.el" "sb-nikkei.el" "sb-nytimes.el" "sb-opentechpress-jp.el"
;;;;;;  "sb-orca.el" "sb-palmfan.el" "sb-pcweb-column.el" "sb-perlentaucher-de.el"
;;;;;;  "sb-pilot-link.el" "sb-pilot-mailsync.el" "sb-plucker.el"
;;;;;;  "sb-pocketgames.el" "sb-rakuten.el" "sb-redhat.el" "sb-rediff.el"
;;;;;;  "sb-rss-blogs.el" "sb-rss-hash.el" "sb-rss.el" "sb-ruby.el"
;;;;;;  "sb-sankei.el" "sb-savannah.el" "sb-scipy.el" "sb-security-memo.el"
;;;;;;  "sb-slashdot-jp.el" "sb-slashdot.el" "sb-sml.el" "sb-sourceforge-jp.el"
;;;;;;  "sb-spiegel.el" "sb-sponichi.el" "sb-squeak-dev.el" "sb-squeak-ja.el"
;;;;;;  "sb-sueddeutsche-de.el" "sb-tcup.el" "sb-tdiary-ml.el" "sb-tdiary.el"
;;;;;;  "sb-tech-on.el" "sb-texfaq.el" "sb-text.el" "sb-the-onion.el"
;;;;;;  "sb-the-register.el" "sb-tigris.el" "sb-toshiba.el" "sb-vinelinux.el"
;;;;;;  "sb-w3m-dev.el" "sb-welt-de.el" "sb-wiki.el" "sb-wikimedia.el"
;;;;;;  "sb-wincefan.el" "sb-wired-jp.el" "sb-x51.el" "sb-xemacs.el"
;;;;;;  "sb-yahoo-auctions.el" "sb-yahoo-sports.el" "sb-yahoo.el"
;;;;;;  "sb-yomiuri-html.el" "sb-yomiuri.el" "sb-zdnet-jp.el" "sb-zeit-de.el"
;;;;;;  "shimbun-pkg.el" "shimbun.el") (21012 61585 482471 0))

;;;***

(provide 'shimbun-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; shimbun-autoloads.el ends here
