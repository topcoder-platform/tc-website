<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>TopCoder Studio</title>

<jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_creative_forums"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="../left.jsp">
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
<form name="formSearch" method="post" action="/">
<input type="hidden" name="module" value="Search" />
<input type="hidden" name="status" value="search" />
<input type="hidden" name="scope" value="all" />
<input type="hidden" name="dateRange" value="all" />
<input type="hidden" name="mode" value="basic" />
<input name="query" size="20" maxlength="100" value="" id="query" type="text">
<input name="Search" value="Search" type="submit" alt="Search" onclick="">
<br>
<A href="?module=Search" class="rtbcLink">Advanced Search</A>

</form>
    </td>
    <td align="right" nowrap="nowrap" valign="top">
        <A href="?module=History" class="rtbcLink">My Post History</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Watches" class="rtbcLink">My Watches</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
    </td>
</tr>
<tr>
   <td colspan="2" style="padding-bottom:3px;"><b>
   <A href="main.html" class="rtbcLink">Forums</A> > 
   Round Tables
   </b></td>
</tr>
</table>

            

<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" width="100%"><a href="?module=Category&categoryID=13&sortField=16&sortOrder=1" class="rtbcLink">Forum</a></td>
      <td class="rtHeader">T./M.</td>
      <td class="rtHeader" align="center" colspan="2" nowrap="nowrap"><a href="?module=Category&categoryID=13&sortField=9&sortOrder=1" class="rtbcLink">Last Post</a></td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=7166" class="rtLinkBold">Bugs, Suggestions and General Feedback</A>
      <br/><div class="rtDescIndent">Report bugs, request enhancements, provide general feedback on existing functionality.  This includes TopCoder's website as well as the algorithm arena.</div></td>
      <td class="rtThreadCell">2284&nbsp;/&nbsp;11184</td>
      <td class="rtThreadCell"><b>Mon, Jul 31 2006 at 10:56 AM</b></td>
      <td class="rtThreadCell"><a href="/tc?module=MemberProfile&cr=10083726" class="coderText">Enogipe</a></td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=244237" class="rtLinkOld">General Discussion</A>
      <br/><div class="rtDescIndent">Discuss anything "TopCoder" that doesn't fit into the other categories.  </div></td>
      <td class="rtThreadCell">822&nbsp;/&nbsp;10185</td>
      <td class="rtThreadCell"><b>Mon, Jul 31 2006 at 10:34 AM</b></td>
      <td class="rtThreadCell"><a href="/tc?module=MemberProfile&cr=15469019" class="coderText">harhazahavarye</a></td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=505803" class="rtLinkBold">Educational Discussion</A>
      <br/><div class="rtDescIndent">Get helpful advice and become a better programmer.</div></td>
      <td class="rtThreadCell">362&nbsp;/&nbsp;3015</td>
      <td class="rtThreadCell"><b>Sun, Jul 30 2006 at 8:01 AM</b></td>
      <td class="rtThreadCell"><a href="/tc?module=MemberProfile&cr=20394568" class="coderText">boba5551</a></td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap">
      <A href="?module=ThreadList&forumID=327735" class="rtLinkBold">Getting Started in TopCoder Studio Creative Competitions</A>
      <br/><div class="rtDescIndent">Check here for help and advice on getting started as a TopCoder competitor.</div></td>
      <td class="rtThreadCell">187&nbsp;/&nbsp;1312</td>
      <td class="rtThreadCell"><b>Sun, Jul 30 2006 at 8:16 AM</b></td>
      <td class="rtThreadCell"><a href="/tc?module=MemberProfile&cr=11916670" class="coderText">pgp</a></td>
   </tr>
</table>

<div>
<div style="float:right;"><a href=""><img border="none" src="/i/interface/btn_rss.gif"/></a></div>
A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings. <A href="?module=Category&categoryID=13&markRead=t" class="rtbcLink">(Mark all as read)</A>
</div>


        <jsp:include page="../foot.jsp"/>
    </div>
</div>
</body>
</html>
