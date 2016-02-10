(setq
 user-mail-address "aaron@bolddaemon.com"
 user-full-name "Aaron Bieber")

(require 'mu4e)
(require 'mu4e-contrib)

(setq mu4e-html2text-command 'mu4e-shr2text)
(setq mu4e-maildir "~/Mail")
(setq mu4e-get-mail-command "mbsync -q fastmail")
(setq mu4e-headers-include-related t)
(setq mu4e-use-fancy-chars t)
(setq mu4e-compose-signature-auto-include nil)

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "mail.messagingengine.com"
      smtpmail-smtp-server "mail.messagingengine.com"
      smtpmail-smtp-service 587)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

(provide 'mail)
