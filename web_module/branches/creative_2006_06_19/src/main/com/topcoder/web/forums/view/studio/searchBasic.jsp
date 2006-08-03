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

<jsp:include page="searchResults.jsp" />


        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
