# OhmServerMigration2018
## Working notes on ohm.bu.edu

### EDF Database

User authentication based on login username/pw for ohm.  Uses an apache mod.  To add a new user:

 * Add user to ohm
 * Edit /etc/apache2/sites-available/edfdb.conf
 * `sudo service apache2 reload`
 * Add user to 'emp' table in database with at least 'user' permissions
 * Set billing rate to a non-null value for user

BU IT is complaining about vulnerabilities on ohm, which is reasonable since it is running the now unsupported CentOS5 and a very old Drupal, amongst other things.

*2018-02-13* Meeting with Guoan

Services on ohm we need to preserve / port:
 * IMAP server for my email (maybe no one elses?)
 * Basic web services including maybe a few CGIs like the CMS firmware database
   * Move public EDF page at edf.bu.edu to Wordpress (already started [here](http://sites-staging.bu.edu/edf) (temporary link)
 * TWiki for CMS
 * Trac (mainly Wiki) for EDF
 * EDF legacy database

### Work Log

*2018-03-13*

Need WinXP virtual box running again.  Root disk is pretty full on new machine, need to update.
Meanwhile, delete `/VirtualBox/HardDisks/Win7Test.vdi`.  From `ampere.bu.edu` copy over
`/VirtualBox/HardDisks/WinXP-60GB.vdi`.

*2018-03-06*

Successful transfer!  Ohm now running Ubuntu 16.04.
Getting my multi-color page to work required dump/reload of GDBM database
file in ...myPage/editPage/my_page.db and changing the file ownership
to www-data.

Everything else seems OK so far.

Need to

*2018-03-02*

Checkout some things with Guoan.

 * quark.bu.edu/twiki     -- public stuff ok, can't log in, no users listed
 * quark.bu.edu/trac      -- seems OK
 * quark.bu.edu/svn/edf   -- seems OK

*2018-02-22*

Testing edfDB on quark.bu.edu.  The make_bill_sql.cgi executable in /var/www/edfdb/bin fails (fixed now).

Creating PDF of bills fails, need executable external_bill_new.cgi in /var/www/cgi-bin.
It's a perl script, and I think now the problem is just that the server won't execute
things in /var/www/cgi-bin.  (fixed now)

Need to install *html2ps* and fix the bill printing script.

*2018-02-21* My Wordpress effort declared good enough, requested to go live.
Send Guoan some supporting libraries to build make_bill_sql.c

*2018-02-13* Created Wordpress site and figured out how to do basic editing.  Need to get a student to copy over more of the content, probably only a couple of days work.

Database:  CGI scripts in use in /var/www/edfdb/bin:

make_bill_sql.cgi
 * public_html/mysql_not_here/edf/src
 * DB_fix_2010/mysql/edf/src
 * src/edfdb_src <-- most recent, 11/2/10

www-sql
 * src/www-sql-0.5.7 (see http://www-sql.sourceforge.net/)


