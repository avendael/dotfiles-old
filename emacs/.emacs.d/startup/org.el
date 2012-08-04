;; Org Mode
(require 'org-install)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-switchb)
(setq org-directory "~/Dropbox/org/")
(setq org-mobile-directory "~/Dropbox/MobileOrg/")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/inbox.org")
(setq org-completion-use-ido t)
(setq org-outline-path-complete-in-steps nil)
(setq org-complete-tags-always-offer-all-agenda-tags t)
(add-to-list 'auto-mode-alist
             '("\\.\\(org\\|org.archive\\|txt\\)$" . org-mode))
;(add-hook 'org-mode-hook 'turn-on-flyspell 'append)
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c M-<") 'org-metaleft)
            (local-set-key (kbd "C-c M->") 'org-metaright)
            (local-set-key (kbd "C-c s M-<") 'org-shiftmetaleft)
            (local-set-key (kbd "C-c s M->") 'org-shiftmetaright)))

(setq org-disputed-keys
      (quote (([(shift up)] . [(meta p)]) ;; org-shiftup
              ([(shift down)] . [(meta n)]) ;; org-shiftdown
              ([(shift left)] . [(meta \[)]) ;; org-shiftleft
              ([(shift right)] . [(meta \])]) ;; org-shiftright
              ([(control shift right)] . [(meta P)]) ;; org-shiftcontrolright
              ([(control shift left)] . [(meta N)]) ;; org-shiftcontrolleft
              ([(control return)] . [(control meta return)])))) ;; org-insert-todo-heading
(setq org-replace-disputed-keys t)
(setq org-log-done t)
(setq org-agenda-files (list "~/Dropbox/org/work.org"
                             "~/Dropbox/org/personal.org"
                             "~/Dropbox/org/home.org"))
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING" . t) ("HOLD" . t))
              (done ("WAITING" . nil) ("HOLD" . nil))
              ("TODO" ("WAITING" . nil) ("CANCELLED" . nil) ("HOLD" . nil))
              ("NEXT" ("WAITING" . nil) ("CANCELLED" . nil) ("HOLD" . nil))
              ("DONE" ("WAITING" . nil) ("CANCELLED" . nil) ("HOLD" . nil)))))
