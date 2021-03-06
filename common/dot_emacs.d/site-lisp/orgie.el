;;; orgie --- emacs specific orgieurations
;;; Commentary:
;;; Code:

(require 'org)
(require 'org-habit)

(setq x-selection-timeout 5)
(setq x-select-enable-clipboard-manager nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))

(setq org-plantuml-jar-path
      (expand-file-name "~/Docs/plantuml.jar"))

(setq org-directory "~/org"
      org-agenda-files (file-expand-wildcards "~/org/*.org")
      org-journal-dir "~/org/journal/"
      org-export-with-planning t
      org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)"))
      org-mobile-inbox-for-pull "~/.org/mobileorg.org"
      org-log-done 'time
      org-refile-targets '((org-agenda-files :maxlevel . 3))
      org-agenda-skip-scheduled-if-deadline-is-shown t)

;;; local
(setq org-mobile-directory "~/org/mobile")
;;; webdav
;;(setq org-mobile-directory "/davs:user@server:/path")

(setq org-capture-templates
      `(("t" "TODO"
	 entry (file+headline "~/org/todo.org" "TODOs")
	 ,(concat
	  "* TODO %?\n"
	  ":PROPERTIES:\n"
	  ":LOGGING: TODO(!) WAIT(!) DONE(!) CANCELED(!)\n"
	  ":END:\n") :prepend t)
	("f" "TODO with File"
	 entry (file+headline "~/org/todo.org" "TODOs")
	 ,(concat
	  "* TODO %?\n"
	  ":PROPERTIES:\n"
	  ":LOGGING: TODO(!) WAIT(!) DONE(!) CANCELED(!)\n"
	  ":END:\n"
	  "%i\n  %a") :prepend t)
	("b" "Bug"
	 entry (file+olp+datetree "~/org/bugs.org" "Bugs")
	 "* BUG %?\nEntered on %U\n  :PROPERTIES:\n  :FILE: %a\n  :END:\n" :prepend t)
	("p" "Protocol"
	 entry (file+headline "~/org/links.org" "Links")
         "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
	("L" "Protocol Link" entry (file+headline "~/org/links.org" "Links")
         "* %? %:link\n%:description\n")
        ("j" "Journal"
	 entry (file+olp+datetree "~/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a" :prepend t)))

(setq org-agenda-custom-commands
      '(("d" "Daily habits"
         ((agenda ""))
         ((org-agenda-show-log t)
          (org-agenda-ndays 7)
          (org-agenda-log-mode-items '(state))
          (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":DAILY:"))))
	("o" "OpenBSD"
	 ((agenda ""))
	 ((org-adenda-show-log t)
	  (org-agenda-ndays 7)
	  (org-agenda-log-mode-items '(state))
	  (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":OpenBSD:"))))
	("p" "OpenBSD Ports"
	 ((agenda ""))
	 ((org-adenda-show-log t)
	  (org-agenda-ndays 7)
	  (org-agenda-log-mode-items '(state))
	  (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":ports:"))))
	))

(provide 'orgie)

;;; orgie.el ends here
