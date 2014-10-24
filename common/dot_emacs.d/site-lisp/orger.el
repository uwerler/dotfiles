(require 'org)
(require 'ox-publish)
(require 'ox-html)

(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
	(sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
	(sequence "|" "CANCELED(c)")))

(setq org-agenda-files (directory-files "~/org/agenda" t "\\.org$"))

(setq orger-pub-to "/ssh:akb.io:/var/www/htdocs/org/")

(setq org-publish-project-alist
      '(
	("org-notes"
	 :base-directory "~/org/"
	 :base-extension "org"
	 :publishing-directory orger-pub-to
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-preamble t
	 )
	("org-static"
	 :base-directory "~/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory orger-pub-to
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("bolddaemon"
	 :base-directory "~/org/websites/bolddaemon/"
	 :base-extension "org"
	 :publishing-directory "/ssh:akb.io:/var/www/bolddaemon/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 :auto-preamble t
	 )
	("org" :components ("org-notes" "org-static"))
	))

(provide 'orger)
