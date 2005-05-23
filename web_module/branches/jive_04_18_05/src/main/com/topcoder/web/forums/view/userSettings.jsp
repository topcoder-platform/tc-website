<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
<link type="text/css" rel="stylesheet" href="/css/stats.css"/>
<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="level1" value=""/>
            <jsp:param name="level2" value=""/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="User Settings"/>
            </jsp:include>

<div class="topLinksL">
<A href="/" class="rtbcLink">Search:</A>&#160;
<input name="q" size="20" maxlength="100" value="" id="terms" type="text">
<input value="Search" onclick="" type="submit">
&#160;<a href="" class="rtLinkNew">Search Tips</a>
</div>
<div class="topLinksR">
<A href="/" class="rtLinkNew">Post History</A>&#160;&#160;|&#160;&#160;<A href="/" class="rtLinkNew">My Watches</A>&#160;&#160;|&#160;&#160;<b>User Settings</b>
</div>

<div style="clear:both;">
<span class="bodySubtitle">User Settings</span><br>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" colspan="2">General Settings</td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Threads per Forum Page:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="objID" id="objID01">
<option value="" selected="selected">10</option>
<option value="">15</option>
<option value="">25</option>
<option value="">50</option>
</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Messages per Thread Page:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="objID" id="objID01">
<option value="" selected="selected">10</option>
<option value="">15</option>
<option value="">25</option>
<option value="">50</option>
</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Thread Page View:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="objID" id="objID01">
<option value="" selected="selected">Flat</option>
<option value="">Threaded</option>
<option value="">Tree</option>
</select>
      </td>
   </tr>
   <tr>
      <td class="rtHeader" colspan="2">Watch Preferences</td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Always watch threads I create:</strong></td>
      <td class="rtTextCell100">
<input name="alwaysWatchNewTopics" value="true" id="w01" type="radio">
<label for="w01">Yes</label>
&#160;
<input name="alwaysWatchNewTopics" value="false" id="w02" checked="checked" type="radio">
<label for="w02">No</label>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Always watch threads I reply to:</strong></td>
      <td class="rtTextCell100">
<input name="alwaysWatchNewTopics" value="true" id="w01" type="radio">
<label for="w01">Yes</label>
&#160;
<input name="alwaysWatchNewTopics" value="false" id="w02" checked="checked" type="radio">
<label for="w02">No</label>
      </td>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Send watch emails:</strong></td>
      <td class="rtTextCell100">
         <select name="watchFrequency"><option value="0" selected="selected">Immediately (default)</option><option value="1">Once per day</option><option value="2">Every other day</option><option value="3">Once per week</option></select>
         (foo@fooonyou.com)
      </td>
   </tr>
   </tr>
</table>
<div align="right">
<A href="/"><img src="/i/roundTables/save.gif" alt="Save" border="0" /></A>
</div>

</div>

<p><br></p>

</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>