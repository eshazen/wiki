# TracChangeset
# Trac Changeset Module

[TracGuideToc](TracGuideToc.md)
[PageOutline(2-5,Contents,pullout)](PageOutline(2-5,Contents,pullout).md)

Trac has a built-in functionality for visualizing "diffs", or changes to files.

There are different kinds of _change sets_.  Some correspond to revisions made in the repositories, others aggregate changes made in several revisions. Ultimately, any kind of difference can be shown.

The changeset view consists of two parts, the _header_ and the _diff views_.

## Changeset Header

The header shows an overview of the whole changeset.
Here you will find information such as:

 * Timestamp — When the changeset was commited
 * Author — Who commited the changeset
 * Message — A brief description from the author (the commit log message)
 * Location — Parent directory of all files affected by this changeset
 * Files — A list of files affected by this changeset

If more than one revision is involved in the set of changes being displayed, the _Timestamp_, _Author_ and _Message_ fields will not be shown.

A colored rectangle indicates how the file is affected by the changeset:

 [span(style=background:#bfb;border:1px solid #999;font-size:80%;margin-right:.5em,_  _)](span(style=background:#bfb;border:1px_solid_#999;font-size:80%;margin-right:.5em,_ __).md) Green: Added \\
 [span(style=background:#f88;border:1px solid #999;font-size:80%;margin-right:.5em,_  _)](span(style=background:#f88;border:1px_solid_#999;font-size:80%;margin-right:.5em,_ __).md) Red: Removed \\
 [span(style=background:#fd8;border:1px solid #999;font-size:80%;margin-right:.5em,_  _)](span(style=background:#fd8;border:1px_solid_#999;font-size:80%;margin-right:.5em,_ __).md) Yellow: Modified \\
 [span(style=background:#88f;border:1px solid #999;font-size:80%;margin-right:.5em,_  _)](span(style=background:#88f;border:1px_solid_#999;font-size:80%;margin-right:.5em,_ __).md) Blue: Copied \\
 [span(style=background:#ccc;border:1px solid #999;font-size:80%;margin-right:.5em,_  _)](span(style=background:#ccc;border:1px_solid_#999;font-size:80%;margin-right:.5em,_ __).md) Gray: Moved \\
The color legend is located below the header as a reminder.

## Diff Views

Below the header is the main part of the changeset, the diff view. Each file is shown in a separate section, each of which contains only the regions of the file that are affected by the changeset. There are two different styles to display the diffs: _inline_ or _side-by-side_. You can switch between the styles using the preferences form:

 * The _inline_ style shows the changed regions of a file underneath each other. A region removed from the file will be colored red, an added region will be colored green. If a region was modified, the old version is displayed above the new version. Line numbers indicate the exact position of the change in both the old and the new version of the file.
 * The _side-by-side_ style shows the old version on the left and the new version on the right and this will typically require more screen width than the inline style. Added and removed regions will be colored in the same way as with the inline style (green and red), and modified regions will have a yellow background.

In addition, various advanced options are available in the preferences form for adjusting the display of the diffs:
 * You can set how many lines are displayed before and after every change; if the value _all_ is used, then the full file will be shown.
 * You can toggle whether blank lines, case changes and white space changes are ignored, thereby letting you find the functional changes more quickly.

## The Different Ways to Get a Diff

### Examining a Changeset

When viewing a repository check-in, such as when following a changeset [wiki:TracLinks link] or a changeset event in the [wiki:TracTimeline timeline], Trac will display the exact changes made by the check-in.

There will be also navigation links to the _Previous Changeset_ to and _Next Changeset_.

### Examining Differences Between Revisions

Often you want to look at changes made on a file or on a directory spanning multiple revisions. The easiest way to get there is from the TracRevisionLog, where you can select the _old_ and the _new_ revisions of the file or directory, and then click the _View changes_ button.

### Examining Differences Between Branches

One of the core features of version control systems is the possibility to work simultaneously on different _Lines of Developments_, commonly called "branches". Trac enables you to examine the exact differences between such branches.

Using the *View changes ...* button in the TracBrowser allows you to enter _From:_ and _To:_ path/revision pairs. The resulting set of differences consist of the changes that should be applied to the _From:_ content to get to the _To:_ content.

For convenience, it is possible to invert the roles of the _old_ and the _new_ path/revision pairs by clicking the _Reverse Diff_ link on the changeset page.

### Checking the Last Change

Another way to examine changes is to use the _Last Change_ link provided by the TracBrowser.

This link will take you to the last change that was made on that path. From there, you can use the _Previous Change_ and _Next Change_ links to traverse the change history of the file or directory.

----
See also: TracGuide, TracBrowser
