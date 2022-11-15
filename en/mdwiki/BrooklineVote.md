# BrooklineVote
## Bulk E-mailing

Did this on my home machine and it seems to work:

 * https://rianjs.net/2013/08/send-email-from-linux-server-using-gmail-and-ubuntu-two-factor-authentication

## Database Work

 * SVN:  http://edf.bu.edu/svn/edf/EricHome/BrooklineVote/DB/
 * Test: [TMM](https://ohm.bu.edu/~hazen/online/test_query.cgi) [Doorknock](http://ohm.bu.edu/~hazen/online/doorknock.cgi)

*2019-03-17*

 * Added column `V2018_0508_TOWN_STATUS` to table *frequent*
 * Updated column using `find_voter_changes.pl` to have current data from table *updated*
 * Edit `doorknock.cgi` to include 2018 election (some rows are NULL, not sure if this is an issue)

So the updated *frequent* table has changes from the new data but old folks who may no longer be registered are not purged.  Updated the `mail_by_precinct.pl` script to include 2018.

*2019-03-16*

Existing database in `~hazen/public_html/cgi-bin` using `test.db` with two different scripts, `doorknock.cgi` and `allvoters.cgi`.  Stored in http://edf.bu.edu/svn/edf/EricHome/BrooklineVote/DB/online

New data for 2019 in http://edf.bu.edu/svn/edf/EricHome/BrooklineVote/DB/March2019

Attempting import from `TOWN_RECENT_PRECINCT13.03.119.csv` but get error

Modify script import_csv.sql to insert "V" at front of any field name which starts with a digit, as this
was done somehow in existing DB (e.g. "V2017-0502_TOWN_STATUS").

*Create new table "updated"* with new info from `TOWN_RECENT_PRECINCT13.03.119.csv`:
```
   $ ./import_csv.pl TOWN_RECENT_PRECINCT13.03.119.csv updated test.db
```

So, now what we need to do is to use this table to update both *voters* and *frequent* in the
database, with all fields updated matched by `residentid`.

Confirmed that `residentid` is unique in all tables (voters, updated, frequent)

Wrote [find_voter_changes.pl](http://edf.bu.edu/svn/edf/EricHome/BrooklineVote/DB/March2019/find_voter_changes.pl) to update selected table (voters, frequent) with changes from [TOWN_RECENT_PRECINCT13.03.119.csv](http://edf.bu.edu/svn/edf/EricHome/BrooklineVote/DB/March2019/TOWN_RECENT_PRECINCT13.03.119.csv)

Used this to update the database which is now live.  However, we need to add the latest column for 2018 votes to the frequent table.

*2018-05-01*

Mailing labels by precinct with selection or code based on HH age range and whether voted in 2017.  Script [mail_by_precinct.pl](http://ohm.bu.edu/svn/edf/EricHome/BrooklineVote/DB/mail_by_precinct.pl) creates a CSV file for specified precinct with age limits and selection based on 2017 vote.  Optionally print labels for entire precinct's households with 2 character code for gate/voting status.

Mailings done for Precincts 6, 8, 12.

Generate CSV file, then use LibreOffice 5 to make labels:

 * Open CSV file and save as ODT (check "quoted field as text" in import)
 * File->New->Database
   * "Connect to Existing", "Spreadsheet", "Next"
   * "Next", uncheck "Open the database for editing"
   * Finish, save in file somewhere
 * File->New->Labels
   * Select database, table
   * Select label type "Avery Letter Size", "5160 Address"
   * Select and position fields (two leading spaces is good, blank line a t top too)
   * "New Document"
   * F4 or View->Data Sources
 * Tools->Mail Merge Wizard
   * "Next" 6 times to "Save, Print or Send"
   * Save merged document, Save as single document, "Save Documents"
   * Finish



*2018-04-29*

Thinking about mobile "door knock" page.  Need:

 * Initial selection, done using existing DB search form
 * Select by street, sort numeric by house number


*2018-04-07*

Change requests:

 * Add mailing list extract:  suppress duplicate addresses, identify likely addressee based on age.

This SQL gives a list of all the duplicated addresses:

```
   select streetname, streetno, aptno, count(*)
   from frequent
   group by streetname, streetno, aptno
   having count(*) > 1;
```

Done as [extract_mail.pl](http://edf.bu.edu/svn/edf/EricHome/BrooklineVote/DB/extract_mail.pl).

*2018-01-01*

Change requests:

 * Add 'not' option to negate search next to each form textbox (done)
 * make single '%' a special case which matches an non-NULL or non-blank value (done)


*2018-03-25*

Prototype working as r3070 in SVN "online" folder.

Change requests from Sara:

 * Add new column "comment" (text)
 * Add new column "voterid" (text)
 * Add new column "email" (text)
 * Add new column "electedofficial" (text) with name "ELO" or something
 * Add existing column "ocupation" (sic) [done]
 * Change !HouseNo column title in table to "No" [done]
 * Rationalize form layout [done]
 * Sort by up to 4 columns [done]
 * Display query row count [done]
 * Date of Birth displayed as age in table [done]
 * Create an optimized print view [done]
 * Change column display order [done]:

ID, Precinct, No, Street, Apt, First, Last,
Phone, EMail, Age, Sex, Occup., 15, 16, 17, Comment

*2018-03-10*

Wrote script [import_csv.pl](http://edf.bu.edu/svn/edf/EricHome/BrooklineVote/DB/import_csv.pl) to import CSV to SQLite db.  Seems to work but dates are not handled correctly.
Now all data is in `voters.db`.  Dump to sql using sqlite3 CLI `.dump`.  Wrote perl script to re-format dates (`fix_dates.pl`) and create fixed DB `voters_new.db`).

Can't figure out how to extract year from date in SQLite except with:

`substr(date(birthdate),1,4))`.

This code will make a summary of ages by 5-year groups:
```
SELECT count(ROWID),
  (2018 - cast( substr( date( birthdate),1,4) as int))/5*5 as age
  from frequent
  group by age
  order by age;
```

For frequent voters, this produces:

```
10,15
227,20
251,25
342,30
569,35
1000,40
1346,45
1314,50
1249,55
1342,60
1453,65
1486,70
1027,75
616,80
386,85
244,90
66,95
15,100
```

Thinking about apartment buildings.  What we want is a query to generate a list of all unique addresses with more than `n` distinct apartment numbers.  This seems promising:

```
select streetno, streetname, count(distinct aptno)
from voters
where aptno != ''
group by streetname, streetno
order by streetname, streetno;
```

Here is a version where we use a sub-select to filter the results to > 10 apartments per address:

```
SELECT sub.*
  FROM(
    SELECT streetno, streetname, count(distinct aptno) AS napt
    FROM voters
    WHERE aptno != ''
    GROUP BY streetname, streetno
    ORDER BY napt desc
  ) sub
  WHERE sub.napt > 10;
```

This is not very accurate because not all apartments have registered voters in them.  In fact, it would be useful to know what fraction of each large multi-unit actually have frequent voters.  For this I think we need to pull in the property database.
