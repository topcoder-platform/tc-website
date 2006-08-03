<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.Forum,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.WatchManager,
                 java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>

<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>TopCoder Studio</title>

<jsp:include page="style.jsp">
    <jsp:param name="key" value="tc_creative_forums"/>
</jsp:include>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="left.jsp">
    <jsp:param name="node" value="forums"/>
</jsp:include>

<div class="contentOuter">
   <div class="contentInner">
<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
   <td class="categoriesBox" style="padding-right: 20px;">
      <jsp:include page="categoriesHeader.jsp" />
   </td>
   <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
      <jsp:include page="searchHeader.jsp" />
    </td>
    <td align="right" nowrap="nowrap" valign="top">
        <A href="?module=History" class="rtbcLink">My Post History</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Watches" class="rtbcLink">My Watches</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
    </td>
</tr>
<tr>
   <td colspan="2" style="padding-bottom:3px;">&nbsp;</td>
</tr>
</table>

            

<table cellpadding="0" cellspacing="0" class="rtTable">
<tbody>
   <tr>
      <td class="rtHeader" width="100%">
      <A href="?module=Category&categoryID=13" class="rtbcLink">Round Tables</A>
      </td>
      <td class="rtHeader"><div style="width:80px;">T./M.</div>      </td>
      <td class="rtHeader" align="center" colspan="2"><div style="width:300px;">Last Post</div>      </td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=244237" class="rtLinkOld">General Discussion</A>
      <br/><div class="rtDescIndent">Discuss anything "TopCoder" that doesn't fit into the other categories.  </div>      </td>
      <td class="rtThreadCell" style="width: 80px;">765&nbsp;/&nbsp;9278      </td>
      <td class="rtThreadCell" style="width: 190px;"><b>Mon, Jun 26 2006 at 10:48 AM</b>      </td>
      <td class="rtThreadCell" style="width: 100px;"><a href="/tc?module=MemberProfile&cr=343655" class="coderText">Uranium-235</a>      </td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=7166" class="rtLinkOld">Bugs, Suggestions and General Feedback</A>
      <br/><div class="rtDescIndent">Report bugs, request enhancements, provide general feedback on existing functionality.</div>      </td>
      <td class="rtThreadCell" style="width: 80px;">2206&nbsp;/&nbsp;10679      </td>
      <td class="rtThreadCell" style="width: 190px;"><b>Mon, Jun 26 2006 at 9:24 AM</b>      </td>
      <td class="rtThreadCell" style="width: 100px;"><a href="/tc?module=MemberProfile&cr=132456" class="coderTextOrange">dok</a>      </td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=505803" class="rtLinkBold">Educational Discussion</A>
      <br/><div class="rtDescIndent">Give and get helpful advice.</div>      </td>
      <td class="rtThreadCell" style="width: 80px;">315&nbsp;/&nbsp;2572      </td>
      <td class="rtThreadCell" style="width: 190px;"><b>Mon, Jun 26 2006 at 6:23 AM</b>      </td>
      <td class="rtThreadCell" style="width: 100px;"><a href="/tc?module=MemberProfile&cr=15447970" class="coderText">rajkon</a>      </td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=327735" class="rtLinkBold">Getting Started in TopCoder Studio Creative Competitions</A>
      <br/><div class="rtDescIndent">Check here for help and advice on getting started as a competitor.</div>      </td>
      <td class="rtThreadCell" style="width: 80px;">180&nbsp;/&nbsp;1282      </td>
      <td class="rtThreadCell" style="width: 190px;"><b>Sat, Jun 24 2006 at 8:05 PM</b>      </td>
      <td class="rtThreadCell" style="width: 100px;"><a href="/tc?module=MemberProfile&cr=282718" class="coderText">Rustyoldman</a>      </td>
   </tr>
</tbody>
</table>
<br>
<table cellpadding="0" cellspacing="0" class="rtTable">
<tbody>
   <tr>
      <td class="rtHeader" width="100%">
      <A href="?module=Category&categoryID=14" class="rtbcLink">Creative Contests</A>
      </td>
      <td class="rtHeader"><div style="width:80px;">T./M.</div></td>
      <td class="rtHeader" align="center" colspan="2"><div style="width:300px;">Last Post</div></td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=505983" class="rtLinkBold">TC Studio 308</A>
      </td>
      <td class="rtThreadCell" style="width: 80px;">3&nbsp;/&nbsp;18      </td>
      <td class="rtThreadCell" style="width: 190px;"><b>Mon, Jun 26 2006 at 11:29 AM</b></td>
      <td class="rtThreadCell" style="width: 100px;"><a href="/tc?module=MemberProfile&cr=9958883" class="coderText">Minilek</a></td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=505982" class="rtLinkBold">TC Studio 307</A>
      </td>
      <td class="rtThreadCell" style="width: 80px;">16&nbsp;/&nbsp;147</td>
      <td class="rtThreadCell" style="width: 190px;"><b>Mon, Jun 26 2006 at 8:28 AM</b></td>
      <td class="rtThreadCell" style="width: 100px;"><a href="/tc?module=MemberProfile&cr=19786437" class="coderText">dskloet</a></td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=505607" class="rtLinkBold">TC Studio 168</A>
      </td>
      <td class="rtThreadCell" style="width: 80px;">1&nbsp;/&nbsp;1</td>
      <td class="rtThreadCell" style="width: 190px;"><b>Sun, Jun 25 2006 at 5:54 PM</b>
      </td>
      <td class="rtThreadCell" style="width: 100px;"><a href="/tc?module=MemberProfile&cr=343655" class="coderText">Uranium-235</a></td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=505584" class="rtLinkOld">TC Studio 148</A>
      </td>
      <td class="rtThreadCell" style="width: 80px;">2&nbsp;/&nbsp;9</td>
      <td class="rtThreadCell" style="width: 190px;"><b>Wed, Jun 21 2006 at 12:31 AM</b></td>
      <td class="rtThreadCell" style="width: 100px;"><a href="/tc?module=MemberProfile&cr=22265897" class="coderText">NEG</a></td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=505740" class="rtLinkBold">TC Studio 249</A>
      </td>
      <td class="rtThreadCell" style="width: 80px;">1&nbsp;/&nbsp;5</td>
      <td class="rtThreadCell" style="width: 190px;"><b>Fri, Jun 16 2006 at 6:20 PM</b></td>
      <td class="rtThreadCell" style="width: 100px;"><a href="/tc?module=MemberProfile&cr=260828" class="coderText">Larry</a></td>
   </tr>
   <tr>
      <td class="rtThreadCell" colspan="4"><A href="?module=Category&categoryID=14" class="rtLinkNew">...more</A>
      </td>
   </tr>
</tbody>
</table>

<div>
<div style="float:right;"><a href=""><img border="none" src="/i/interface/btn_rss.gif"/></a></div>
A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings. <A href="?module=Main&markRead=t" class="rtbcLink">(Mark all as read)</A><br>
The five most recent forums are displayed for each category other than Round Tables. Click a category's name to view its complete forum list.
</div>


        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
