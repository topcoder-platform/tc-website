<%@ page import="com.topcoder.web.common.BaseServlet,
         		 com.topcoder.web.forums.ForumConstants,
         		 java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

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
                <jsp:param name="title" value="Forum Search"/>
            </jsp:include>

<span class="bodySubtitle">Forum Search</span><br>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" colspan="2">Search Forum Content</td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Query:</strong></td>
      <td class="rtTextCell100">
         <input name="q" size="50" maxlength="100" value="" id="terms" type="text">
         <input value="Search" onclick="" type="submit">
         &#160;<a href="#" onclick="openWin('searchTips.jsp','st',300,400);" class="rtLinkNew">Search Tips</a>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Forum:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="objID" id="objID01">
<option value="all">All Categories</option>
<option value="f50">&#160;Evolving Strategy</option>
<option value="f51">&#160;Bugs, Suggestions and General Feedback</option>
<option value="f52">&#160;Algorithm Competition Discussion</option>
<option value="f53">&#160;TopCoder Arena Plugins Discussion</option>
<option value="f54">&#160;Component Competition Discussion</option>
<option value="f55">&#160;General Discussion</option>
<option value="f56">&#160;Getting Started</option>
<option value="f57">&#160;Employment Discussion</option>
<option value="f58">&#160;Component Review Board</option>
</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Date Range:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="dateRange" id="daterange01">
<option value="all" selected="selected">All</option>
<option value="yesterday">&#160;Yesterday - 5/18/05</option>
<option value="last7days">&#160;Last 7 Days - 5/12/05</option>
<option value="last30days">&#160;Last 30 Days - 4/19/05</option>
<option value="last90days">&#160;Last 90 Days - 2/18/05</option>
<option value="thisyear">&#160;This Year - 1/1/05</option>
<option value="lastyear">&#160;Last Year - 1/1/04</option>
</select>
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Handle:</strong></td>
      <td class="rtTextCell100">
         <input name="userID" size="20" maxlength="50" id="username01" value="" type="text" />
         (Leave field blank to search all users)
      </td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Results Per Page:</strong></td>
      <td class="rtTextCell100">
<select size="1" name="dateRange" id="daterange01">
<option value="10" selected="selected">10</option>
<option value="15">15</option>
<option value="30">30</option>
</select>
      </td>
   </tr>
</table>

</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>