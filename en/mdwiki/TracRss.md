# TracRss
# Using RSS with Trac
[TracGuideToc](TracGuideToc.md)

Several of the Trac modules support content syndication using the RSS ([Really Simple Syndication](http://en.wikipedia.org/wiki/RSS)) XML format. RSS pushes out updates to Trac whenever they occur and to whoever has subscribed to it. Using the RSS subscription feature in Trac, you can easily monitor progress of the project, a set of issues or even changes to a single file.

Trac supports RSS feeds in:

 * TracTimeline — Use the RSS feed to *subscribe to project events*. Monitor overall project progress in your favorite RSS reader.
 * TracTickets, TracReports, and TracQuery — Allows syndication of report and ticket query results. Be notified about important and relevant issue tickets.
 * TracBrowser and TracRevisionLog — Syndication of file changes. Stay up to date with changes to a specific file or directory.

## How to access RSS data
Anywhere in Trac where RSS is available, you should find a small orange *RSS* icon, typically at the bottom of the page:
{{{#!html
<a rel="nofollow" style="padding-left: 20px; background: url(../../chrome/common/feed.png) left center no-repeat;  border: none;"><span style="color: #666;padding: 0 0 2px; font-size: 11px;">RSS feed</span></a>
}}}
Clicking the icon will access the RSS feed for that specific resource.

*Note:* Different modules provide different data in their RSS feeds. Usually the syndicated information corresponds to the current view. For example, if you click the RSS link on a report page, the feed will be based on that report. It might be explained by thinking of the RSS feeds as an _alternate view of the data currently displayed_.

Since Trac 1.0 an RSS feed can be retrieved from a Trac site that requires authentication. Hover over the RSS icon, right click and //copy link address//.

## Links
 * _Specifications:_
   * http://blogs.law.harvard.edu/tech/rss — RSS 2.0 Specification.

 * _Multi-platform RSS readers:_
   * http://www.rssowl.org/ — Open source, Eclipse-based, RSS reader for Linux, Mac and Windows systems that supports https and authenticated feeds.

 * _Linux/BSD/*n*x systems:_
   * http://liferea.sourceforge.net/ — Open source GTK2 RSS Reader for Linux.
   * [Akregator](http://akregator.sourceforge.net/) — Open source KDE RSS Reader, part of KDE-PIM.

 * _Mac OS X systems:_
   * http://ranchero.com/netnewswire/ — An excellent RSS reader for Mac OS X, has both free and paid versions.
   * http://www.utsire.com/shrook/ — An RSS reader for Max OS X that supports https, even with self signed certificates, and authenticated feeds.
   * http://vienna-rss.sourceforge.net/ — Open source Feed Reader for Mac OS X with smart folders support.

 * _Windows systems:_
   * http://www.rssreader.com/ — Free and powerful RSS Reader for MS Windows.
   * http://www.sharpreader.net/ — A free RSS Reader written in .NET for MS Windows.

 * _Firefox:_
   * http://www.mozilla.org/products/firefox/ — Mozilla Firefox features plenty [add-ons](https://addons.mozilla.org/en-US/firefox/search/?q=rss&appver=&platform=) for supporting RSS.

----
See also: TracGuide, TracTimeline, TracReports, TracBrowser
