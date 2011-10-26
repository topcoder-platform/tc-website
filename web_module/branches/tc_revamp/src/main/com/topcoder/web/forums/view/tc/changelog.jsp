<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>TopCoder Forums</title>
<jsp:include page="script.jsp" />
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_forums"/>
    </jsp:include>


</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="forums"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">

<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="includes/global_left.jsp">
        <jsp:param name="node" value="forums"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
<td width="100%" class="rtBody">

<jsp:include page="page_title.jsp">
    <jsp:param name="image" value="forums"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<span class="rtbc"><a href="?module=Main" class="rtbcLink">Forums</a> <img src="/i/interface/exp_w.gif" align="absmiddle"/> Change Log</span>

<!-- Links to versions -->

<p>
    <b>2.1.2 - 2007.xx.xx</b>
    <ul>
        <li>Adjust VB, C# and Java code viewers so that it doesn't swallow the l in long literals like 1L -dok</li>
    </ul>
</p>
<p>
    <b>2.1.1 - 2007.09.12</b>
    <ul>
        <li>Add login and logout processes instead of using the main site -dok</li>
    </ul>
</p>
<p>
    <b>2.1.0 - 2007.09.06</b>
    <ul>
        <li>Include jtsl.jar and standard.jar in packaging -dok</li>
        <li>Use new left nav -dok</li>
        <li>Use new SSO code -dok</li>
    </ul>
</p>

<p>
    <b>2.0.4 - 2007.05.xx</b>
    <ul>
        <li>charset = utf-8 <%-- dont' for get to set the local in the jive properties--%></li>
    </ul>
</p>


<p>
    <b>>2.0.3 - 2007.05.02</b>
    <ul>
        <li>Updated the web cache.</li>
        <li>Expanded search to include software categories.</li>
        <li>Added an option to collapse read posts in the threaded view, to improve readability of long threads.</li>
        <li>Added a [h] tag equivalent to the [handle] tag.</li>
        <li>Added "Your vote: {score}" tooltip to message ratings.</li>
    </ul>
</p>

<p>
    <b>2.0.2 - 2007.04.16</b>
    <ul>
        <li>Improved performance for users having many software permissions.</li>
        <li>Added software forums watches.</li>
    </ul>
</p>

<p>
    <b>2.0.1 - 2007.03.14</b>
    <ul>
        <li>Refactored code/EJBs/DB schema, improved response time for several pages.</li>
        <li>Added a "Cancel" option to preview and post pages.</li>
        <li>Removed links to nonexistent component pages.</li>
        <li>Fixed an error in downloading attachments with names containing spaces in Firefox.</li>
        <li>Fixed an error where calling malformed thread view URLs exceeded the request limit.</li>
    </ul>
</p>

<p>
    <b>2.0 - 2007.02.12</b>
    <ul>
        <li>Migrated software forums into TopCoder Forums. Browse all forums from one place with the latest features!
        </li>
        <li>Integrated software registration and administration processes with TC/TCS sites and online review.</li>
        <li>Enabled software forum moderators to create or edit forums.</li>
        <li>Added watches for software categories. Members can modify, delete, or unsubscribe from software-related
            email notifications.
        </li>
    </ul>
</p>

<p>
    <b>1.3.0 - 2007.01.17</b>
    <ul>
        <li>Updated category view to display categories with subcategories.</li>
        <li>Added attachment support for messages.</li>
        <li>Expanded options for header links pointing to external articles and sites.</li>
        <li>Enabled request throttle.</li>
    </ul>
</p>

<p>
    <b>1.2.1 - 2006.09.11</b>
    <ul>
        <li>Added timezones to displayed dates.</li>
        <li>Added filters for limiting the maximum width of images and displaying shortened links.</li>
        <li>Created a syntax highlighter for Python.</li>
    </ul>
</p>

<p>
    <b>1.2.0 - 2006.08.14</b>
    <ul>
        <li>Deployed <a href="http://studio.topcoder.com/forums">TopCoder Studio Forums</a>.</li>
        <li>Fixed a case sensitivity error concerning [handle] tags.</li>
        <li>Improved the efficiency of "Mark all as read".</li>
    </ul>
</p>

<p>
    <b>1.1.13 - 2006.07.17</b>
    <ul>
        <li>Fixed view of collapsed posts in IE.</li>
        <li>Fixed a database issue with read tracking.</li>
        <li>Added support for header links (pointing to external websites, articles, etc.) for forum and thread views.
        </li>
    </ul>
</p>

<p>
    <b>1.1.12 - 2006.07.10</b>
    <ul>
        <li>Fixed an idempotence issue with previewing.</li>
        <li>Fixed [handle] tag display for unrated coders.</li>
    </ul>
</p>

<p>
    <b>1.1.11 - 2006.03.29</b>
    <ul>
        <li>Modified unread categories to update immediately when "mark all as read" option is chosen.</li>
        <li>Added links to view threads in search results.</li>
        <li>Fixed a Javascript bug appearing at each keystroke while using non-IE browsers.</li>
        <li>Added HTML filtering: prohibited keywords and attributes not explicitly allowed are escaped.</li>
        <li>Allowed tags/attributes are now controlled through global properties.</li>
        <li>Updated "Response to post" links in threaded view to no longer require a page refresh.</li>
        <li>Removed posts from non-authorized categories from the main RSS feed.</li>
    </ul>
</p>

<p>
    <b>1.1.10 - 2006.03.07</b>
    <ul>
        <li>Updated left navigation, header, CSS.</li>
        <li>Fixed voting display errors.</li>
    </ul>
</p>

<p>
    <b>1.1.9 - 2006.03.02</b>
    <ul>
        <li>Added message ratings.</li>
        <li>Added tabs, ratings section to user settings.</li>
        <li>Added highlighting and collapse options for rated messages.</li>
        <li>Displayed number of nested replies in post history, instead of direct replies.</li>
        <li>Added filtering to prevent XSS attacks.</li>
        <li>Added a "Mark read" option for all forums.</li>
    </ul>
</p>

<p>
    <b>1.1.8.1 - 2006.02.03</b>
    <ul>
        <li>Updated watch emails to include the original message author's handle and a direct link to the message in the
            thread.
        </li>
        <li>Set visible date of announcements (sticky posts) as that of most recent update.</li>
    </ul>
</p>

<p>
    <b>1.1.8 - 2006.01.31</b>
    <ul>
        <li>Created announcements (sticky posts).</li>
        <li>Fixed an issue where invalid usernames for [handle] tags would break subsequent handle tags.</li>
        <li>Added tags supporting RSS 2.0, Dublin Core.</li>
        <li>Added a default flat view option in settings, allowing newest flat posts to be seen with one click when
            navigating from another view.
        </li>
        <li>Removed "more..." from categories on the main page already displaying all forums.</li>
        <li>Added option to mark all threads in a category/forum as read for registered users.</li>
        <li>Fixed links to parent posts in "Flat (newest)" view.</li>
    </ul>
</p>

<p>
    <b>1.1.7 - 2005.10.18</b>
    <ul>
        <li>Extended "Mark watched threads as read" option to forum and category highlighting.</li>
        <li>Updated [code], [cpp] filters to not strip trailing "L" characters for longs.</li>
        <li>Forbid the posting of messages containing only whitespace in subject or body.</li>
        <li>Fixed improper escaping of <? ?> tags in Firefox textareas.</li>
        <li>Added [handle] tag, converting usernames into color-coded links.</li>
        <li>Added setting to hide all member photos.</li>
        <li>Fixed textarea escaping and formatting errors.</li>
        <li>Unified save/delete checkbox toggling in the Watches page.</li>
        <li>Added sorting on forum name, modification date in category view.</li>
        <li>Increased maximum watch limit to 2000.</li>
    </ul>
</p>

<p>
    <b>1.1.6 - 2005.09.14</b>
    <ul>
        <li>Updated main page such that each forum can display its N most recent posts, or posts made within the last N
            days.
        </li>
        <li>Displayed day of week in message headers.</li>
        <li>Added "Mark watched threads as read" option in user settings.</li>
    </ul>
</p>

<p>
    <b>1.1.5 - 2005.09.09</b>
    <ul>
        <li>Highlighted categories with unread forums in left navigation and category view.</li>
        <li>Fixed pluralization of post and edit counts.</li>
        <li>Populated "Algorithm Matches" category with previous rounds.</li>
    </ul>
</p>

<p>
    <b>1.1.4 - 2005.08.30</b>
    <ul>
        <li>Created category view.</li>
        <li>Added category tree to breadcrumbs on category, forum, thread, revision history, post, and preview pages.
        </li>
        <li>Fixed display of HTML escape sequences when messages are previewed/edited.</li>
        <li>Added sorting on message subject and date in post history.</li>
        <li>Updated advanced search to hide news discussion forums.</li>
        <li>Updated empty forums to show "Be the first to post in this forum."</li>
    </ul>
</p>

<p>
    <b>1.1.3 - 2005.08.15</b>
    <ul>
        <li>Created revision history of messages.</li>
        <li>Fixed code filter bug that eliminated starting characters of enclosed code blocks.</li>
        <li>Updated main, forum, thread, post history, watch, and search pages to hide handles when author data is
            unavailable.
        </li>
        <li>Added previous/next thread links in thread views.</li>
        <li>Moved date in message headers to the right.</li>
    </ul>
</p>

<p>
    <b>1.1.2 - 2005.08.03</b>
    <ul>
        <li>Added server-side read tracker for threads, forums, and categories.</li>
        <li>Added login redirect to main TopCoder login if forums can't be reached.</li>
        <li>Added option in user settings to disable email notifications for watches.</li>
        <li>Created syntax highlighters for C++, Java, C#, and VB, and a highlighter encompassing the 4 languages.</li>
        <li>Added flat view option displaying newest threads first.</li>
        <li>Added categories to advanced search.</li>
        <li>Modified paginator in thread list view to display the final page of a long list of messages.</li>
    </ul>
</p>

<p>
    <b>1.1.1 - 2005.07.20</b>
    <ul>
        <li>Fixed an error with the bottom paginator of the flat thread view.</li>
        <li>Displayed day of week in forums and thread lists.</li>
        <li>Displayed most recent member photos.</li>
        <li>Fixed links to post history in preview and original message when editing or replying.</li>
        <li>Enabled the use of specified HTML tags in messages.</li>
    </ul>
</p>

<p>
    <b>1.1 - 2005.07.18</b>
    <ul>
        <li>Deployed the current version of TopCoder Forums.</li>
        <li>Stripped HTML from message subjects.</li>
        <li>Fixed using quotes when posting or previewing messages.</li>
        <li>Added a user settings option to hide member photo in the forums.</li>
        <li>Created "Last Post" links.</li>
    </ul>
</p>

</td>
<!-- Center Column Ends -->

</tr>
</table>

<jsp:include page="foot.jsp"/>

</body>

</html>