# TicketQuery
# !TicketQuery Wiki Macro

The !TicketQuery macro lets you display information on tickets within wiki pages.
The query language used by the `[TicketQuery](TicketQuery.md)` macro is described in [TracQuery#UsingtheTicketQueryMacro TracQuery] page.

## Usage

[MacroList(TicketQuery)](MacroList(TicketQuery).md)

## Example


|= **Example** =|= **Result** =|= **Macro** =|
|- ----------- -|- ---------- -|- --------- -|
|-----------------------------------------------------------

|=Number of [query:status=new&milestone= Triage tickets]: =|\
|------- -- ---------------------------- ------ --------- -|-
| **[TicketQuery(status=new&milestone=,count)](TicketQuery(status=new&milestone=,count).md)**|\
| `[TicketQuery(status=new&milestone=,count)](TicketQuery(status=new&milestone=,count).md)` |
|-----------------------------------------------------------

|=Number of new tickets: =|\
|------- -- --- -------- -|-
| **[TicketQuery(status=new,count)](TicketQuery(status=new,count).md)**|\
| `[TicketQuery(status=new,count)](TicketQuery(status=new,count).md)` |
|-----------------------------------------------------------

|=Number of reopened tickets: =|\
|------- -- -------- -------- -|-
| **[TicketQuery(status=reopened,count)](TicketQuery(status=reopened,count).md)**|\
| `[TicketQuery(status=reopened,count)](TicketQuery(status=reopened,count).md)` |
|-----------------------------------------------------------

|=Number of assigned tickets: =|\
|------- -- -------- -------- -|-
| **[TicketQuery(status=assigned,count)](TicketQuery(status=assigned,count).md)**|\
| `[TicketQuery(status=assigned,count)](TicketQuery(status=assigned,count).md)` |
|-----------------------------------------------------------

|=Number of invalid tickets: =|\
|------- -- ------- -------- -|-
| **[TicketQuery(status=closed,resolution=invalid,count)](TicketQuery(status=closed,resolution=invalid,count).md)**|\
| `[TicketQuery(status=closed,resolution=invalid,count)](TicketQuery(status=closed,resolution=invalid,count).md)` |
|-----------------------------------------------------------

|=Number of worksforme tickets: =|\
|------- -- ---------- -------- -|-
| **[TicketQuery(status=closed,resolution=worksforme,count)](TicketQuery(status=closed,resolution=worksforme,count).md)**|\
| `[TicketQuery(status=closed,resolution=worksforme,count)](TicketQuery(status=closed,resolution=worksforme,count).md)` |
|-----------------------------------------------------------

|=Number of duplicate tickets: =|\
|------- -- --------- -------- -|-
| **[TicketQuery(status=closed,resolution=duplicate,count)](TicketQuery(status=closed,resolution=duplicate,count).md)**|\
| `[TicketQuery(status=closed,resolution=duplicate,count)](TicketQuery(status=closed,resolution=duplicate,count).md)` |
|-----------------------------------------------------------

|=Number of wontfix tickets: =|\
|------- -- ------- -------- -|-
| **[TicketQuery(status=closed,resolution=wontfix,count)](TicketQuery(status=closed,resolution=wontfix,count).md)**|\
| `[TicketQuery(status=closed,resolution=wontfix,count)](TicketQuery(status=closed,resolution=wontfix,count).md)` |
|-----------------------------------------------------------

|=Number of fixed tickets: =|\
|------- -- ----- -------- -|-
| **[TicketQuery(status=closed,resolution=fixed,count)](TicketQuery(status=closed,resolution=fixed,count).md)**|\
| `[TicketQuery(status=closed,resolution=fixed,count)](TicketQuery(status=closed,resolution=fixed,count).md)` |
|-----------------------------------------------------------

|=Total number of tickets: =|\
|------ ------ -- -------- -|-
| **[TicketQuery(count)](TicketQuery(count).md)**|\
| `[TicketQuery(count)](TicketQuery(count).md)` |
|-----------------------------------------------------------

|=Number of tickets reported **or** owned by current user: =|\
|------- -- ------- -------- ------ ----- -- ------- ----- -|-
| **[TicketQuery(reporter=$USER,or,owner=$USER,count)](TicketQuery(reporter=$USER,or,owner=$USER,count).md)**|\
| `[TicketQuery(reporter=$USER,or,owner=$USER,count)](TicketQuery(reporter=$USER,or,owner=$USER,count).md)` |
|-----------------------------------------------------------

|=Number of tickets created this month: =|\
|------- -- ------- ------- ---- ------ -|-
| **[TicketQuery(created=thismonth..,count)](TicketQuery(created=thismonth..,count).md)**|\
| `[TicketQuery(created=thismonth..,count)](TicketQuery(created=thismonth..,count).md)` |
|-----------------------------------------------------------

|=Last 3 modified tickets: =|\
|----- - -------- -------- -|-
|**[TicketQuery(max=3,order=modified,desc=1,compact)](TicketQuery(max=3,order=modified,desc=1,compact).md)**|\
| `[TicketQuery(max=3,order=modified,desc=1,compact)](TicketQuery(max=3,order=modified,desc=1,compact).md)` |
|-----------------------------------------------------------
{{{#!th rowspan=2, style="text-align: left;"
Details of ticket #1:
}}}
{{{#!td style="border-bottom: 0;"
}}}
{{{#!td
`[TicketQuery(id=1,col=id|owner|reporter,rows=summary,table)](TicketQuery(id=1,col=id|owner|reporter,rows=summary,table).md)`
}}}
|-
{{{#!td colspan=2, style="border-top: 0;"
[TicketQuery(id=1,col=id|owner|reporter,rows=summary,table)](TicketQuery(id=1,col=id|owner|reporter,rows=summary,table).md)
}}}
|-----------------------------------------------------------

## Using the `[TicketQuery](TicketQuery.md)` Macro

The [trac:TicketQuery TicketQuery] macro lets you display lists of tickets matching certain criteria anywhere you can use WikiFormatting.

Example:
```
[TicketQuery(version=0.6|0.7&resolution=duplicate)](TicketQuery(version=0.6|0.7&resolution=duplicate).md)
```

This is displayed as:
  [TicketQuery(version=0.6|0.7&resolution=duplicate)](TicketQuery(version=0.6|0.7&resolution=duplicate).md)

Just like the [wiki:TracQuery#UsingTracLinks query: wiki links], the parameter of this macro expects a query string formatted according to the rules of the simple [wiki:TracQuery#QueryLanguage ticket query language]. This also displays the link and description of a single ticket:
```
[TicketQuery(id=123)](TicketQuery(id=123).md)
```

This is displayed as:
  [TicketQuery(id=123)](TicketQuery(id=123).md)

A more compact representation without the ticket summaries is:
```
[TicketQuery(version=0.6|0.7&resolution=duplicate, compact)](TicketQuery(version=0.6|0.7&resolution=duplicate,_compact).md)
```

This is displayed as:
  [TicketQuery(version=0.6|0.7&resolution=duplicate, compact)](TicketQuery(version=0.6|0.7&resolution=duplicate,_compact).md)

If you wish to receive only the number of defects that match the query, use the `count` parameter:
```
[TicketQuery(version=0.6|0.7&resolution=duplicate, count)](TicketQuery(version=0.6|0.7&resolution=duplicate,_count).md)
```

This is displayed as:
  [TicketQuery(version=0.6|0.7&resolution=duplicate, count)](TicketQuery(version=0.6|0.7&resolution=duplicate,_count).md)

A graphical use of the macro is with the `format=progress` attribute:
```
[TicketQuery(milestone=0.12.8&group=type,format=progress)](TicketQuery(milestone=0.12.8&group=type,format=progress).md)
```

For example for one of the upcoming milestones, bars are shown by ticket type:
[TicketQuery(milestone=0.12.8&group=type,format=progress)](TicketQuery(milestone=0.12.8&group=type,format=progress).md)

----
See also: TracQuery, TracTickets, TracReports, TracGuide
