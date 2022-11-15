# Database_Development
This page is for notes related to the development/update of the EDF
administrative database.  The current system is workable, but suffers
from many defects.  My preference is to develop and test a new system
which is similar enough in the underlying schema that the existing
data can be migrated to the new system.

Here are my thoughts on what is needed to update the current system:

 * Provide more useful output to front office
   * Spreadsheets, etc for dept use
   * Upload files for UIS if possible
   * Reports for Rachel (spreadsheets)
   * Usable interface for guest users (Rachel)
 * New UI with uniform look/feel, uniform underlying technology (no mix of languages, etc).
   * Uniform interface for editing a list of items with underlying detail records
     * Search/filter terms remembered for session
     * Paging/scrolling of large result sets
     * Sort ascending/descending by column
   * Unified library of standard form gadgets, i.e.:
     * Pull-down list of projects with filter applied
     * Pull-downs for date selection (year, yyyy-mm, sundays, etc)
 * Better authentication (Authen::PAM or something like it)
 * use SQL transactions
 * General thoughts on technology
   * mySQL strongly preferred
   * Prefer Perl/DBI with CGI::Session or similar


