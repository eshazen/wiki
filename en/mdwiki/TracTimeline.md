# TracTimeline
# The Trac Timeline
[TracGuideToc](TracGuideToc.md)

Trac's timeline feature provides a historic view of the project in a single report.

It lists all Trac events that have occurred in chronological order, a brief description of each event and if applicable, the person responsible for the change.

The timeline lists these kinds of events:
 * *Wiki page events* — Creation and changes
 * *Ticket events* — Creation and resolution/closing and optionally other changes
 * *Source code changes * — Repository check-ins
 * *Milestone * — Milestone completed

Each event entry provides a hyperlink to the specific event in question, who authored the change as well as a brief excerpt of the actual comment or text, if available.

It is possible to filter the displayed events with the various filters in the option panel:
 * _View changes from_ — the date from which to start displaying events (current date if empty). Events that occurred after this date will not be shown, only those that occurred before that date.
 * _and X days back_ — how many days backwards in time to get events.
 * _done by_ — the author of an event. It accepts a space-separated list of authors for which events should be included. Alternatively, if the author names are prefixed by a "-" character, then the events having those authors will be excluded, and all the others included. Single or double quotes can be used for specifying author names containing space characters. _(since 0.12)_
 * _Changesets in all repositories_ — if you have more than one repository connected to your Trac project, then you can filter the output so events from specific repositories are not shown. _(since 0.12)_
 * _Milestones reached_ — display or hide milestones reached.
 * _Opened and closed tickets_ — display or hide ticket open or close events.
 * _Wiki changes_ — display or hide Wiki change events.

See !TracIni's [wiki:TracIni#timeline-section "[timeline] section"] for timeline configuration options.

## RSS Support

The Timeline module supports subscription using RSS 2.0 syndication. To subscribe to project events, click the orange *XML* icon at the bottom of the page. See TracRss for more information on RSS support in Trac.

----
See also: TracGuide, TracIni, TracWiki, WikiFormatting, TracRss, TracNotification
