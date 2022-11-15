# Thunderbird_Email_Tips
Some tips for using Thunderbird e-mail (currently 3.05) with Dovecot IMAP server on ohm.bu.edu in the EDF:

Try not to let it create an account automatically... do it by hand.  Important settings:

 * Account name "username@ohm.bu.edu" (substitute your user name)
 * IMAP Mail server
   * Name:  ohm.bu.edu  Port:  143
   * Security:  STARTTLS (don''t check "secure authentication")
   * Under "Advanced:"
     * IMAP server directory:  "Mail/" (i.e.) must be your mail directory and end in "/"
     * Do not check "Show only subscribed..."
     * Do not check "Allow server to override..."

For the outgoing SMTP settings, these seem to work fine:

 * Server name:  physics.bu.edu
 * Port: 2525
 * Secure Authentication: No
 * Connection Security: STARTTLS


