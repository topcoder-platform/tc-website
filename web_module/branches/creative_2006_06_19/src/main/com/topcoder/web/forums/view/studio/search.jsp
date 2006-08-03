<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>TopCoder Studio</title>

<jsp:include page="style.jsp">
    <jsp:param name="key" value="tc_creative_forums"/>
</jsp:include>
    <script type="text/javascript">
        function openWin(url, name, w, h) {
            win = window.open(url, name, "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
            win.location.href = url;
            win.focus();
        }
    </script>
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
   <td colspan="3" style="padding-bottom:3px;"><strong>
      <A href="?module=Category&categoryID=1&mc=84597" class="rtbcLink">Forums</A> >
      Search</strong>
   </td>
</tr>
</table>

<table class="rtTable" cellpadding="0" cellspacing="0">
<tbody><tr>
<td class="rtHeader" colspan="2">Search Criteria</td>
</tr>
<tr>
<td class="rtTextCell" nowrap="nowrap"><strong>Query:</strong></td>
<td class="rtTextCell100">
<input name="query" size="50" maxlength="100" value="" id="query" type="text">
<input name="Search" value="Search" alt="Search" onclick="" type="submit">
&nbsp;<a href="#" onclick="openWin('searchTips.jsp','st',600,400);" class="rtLinkOld">Search Tips</a>
</td>
</tr>
<tr>
<td class="rtTextCell" nowrap="nowrap"><strong>Forum:</strong></td>
<td class="rtTextCell100">
<select size="1" name="scope" id="scope">
<option value="all" selected="selected">All Forums</option>
<option value="c13">Round Tables</option>
<option value="f7126">&nbsp;&nbsp;&nbsp;Evolving Strategy</option>
<option value="f7166">&nbsp;&nbsp;&nbsp;Bugs, Suggestions and General Feedback</option>
<option value="f7167">&nbsp;&nbsp;&nbsp;Algorithm and High School Competitions Discussion</option>
<option value="f148126">&nbsp;&nbsp;&nbsp;TopCoder Arena Plugins Discussion</option>
<option value="f205768">&nbsp;&nbsp;&nbsp;Component Competition Discussion</option>
<option value="f244237">&nbsp;&nbsp;&nbsp;General Discussion</option>
<option value="f327735">&nbsp;&nbsp;&nbsp;Getting Started in TopCoder Competitions</option>
<option value="f440104">&nbsp;&nbsp;&nbsp;General Employment Discussion</option>
<option value="f505803">&nbsp;&nbsp;&nbsp;Educational Discussion</option>
<option value="f506048">&nbsp;&nbsp;&nbsp;Marathon Match Discussion</option>
<option value="c14">Algorithm Matches</option>
<option value="c21">High School Matches</option>
<option value="c19">Assembly Contests</option>
<option value="c17">Marathon Matches</option>
<option value="c8">News Discussions</option>
<option value="c6">Sponsor Discussions</option>
<option value="f505952">&nbsp;&nbsp;&nbsp;AMD Developer Central</option>
<option value="f504997">&nbsp;&nbsp;&nbsp;Java(TM) Studio Creator Discussion</option>
<option value="f505829">&nbsp;&nbsp;&nbsp;MSN Employment Discussion</option>
<option value="f504996">&nbsp;&nbsp;&nbsp;VeriSign Employment Discussion</option>
<option value="f504998">&nbsp;&nbsp;&nbsp;Yahoo! Employment Discussion</option>
<option value="f504999">&nbsp;&nbsp;&nbsp;NSA Employment Discussion</option>
<option value="f505918">&nbsp;&nbsp;&nbsp;UBS Employment Discussion</option>
<option value="f506075">&nbsp;&nbsp;&nbsp;AOL Developer and Employment Discussion</option>
<option value="f506076">&nbsp;&nbsp;&nbsp;Bloomberg Employment Discussion</option>
</select>
</td>
</tr>
<tr>
<td class="rtTextCell" nowrap="nowrap"><strong>Date Range:</strong></td>
<td class="rtTextCell100">
<select size="1" name="dateRange" id="dateRange">
<option value="all" selected="selected">All</option>
<option value="dateYesterday">Yesterday (8/2/06)</option>
<option value="dateLast7Days">Last 7 Days (7/27/06)</option>
<option value="dateLast30Days">Last 30 Days (7/4/06)</option>
<option value="dateLast90Days">Last 90 Days (5/5/06)</option>
<option value="dateThisYear">This Year (1/1/06)</option>
<option value="dateLastYear">Last Year (1/1/05)</option>
</select>
</td>
</tr>
<tr>
<td class="rtTextCell" nowrap="nowrap"><strong>Handle:</strong></td>
<td class="rtTextCell100">
<input name="handle" size="20" maxlength="50" id="handle" value="" type="text">&nbsp;
(Leave field blank to search all users)
</td>
</tr>
<tr>
<td class="rtTextCell" nowrap="nowrap"><strong>Results Per Page:</strong></td>
<td class="rtTextCell100">
<select size="1" name="resultSize" id="resultSize">
<option value="10">10</option>
<option value="20" selected="selected">20</option>
<option value="30">30</option>
<option value="50">50</option>
</select>
</td>
</tr>
</tbody>
</table>

        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
