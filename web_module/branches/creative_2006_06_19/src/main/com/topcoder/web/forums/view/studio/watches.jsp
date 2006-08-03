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
   <td colspan="2" style="padding-bottom:3px;"><b>
   <A href="main.html" class="rtbcLink">Forums</A> > 
   My Watches
   </b></td>
</tr>
</table>

<h3>Watched Threads: 1</h3>

All watch updates will be emailed to your email address: <b>ntrefz@topcoder.com</b>.
Watches on content that hasn't been updated for more than 90 days will be automatically removed from your list.
To prevent any watch from being automatically deleted, toggle the "save" option.
<form name="form1" method="post" action="/">
<input name="module" value="Watches" type="hidden">
<input name="status" type="hidden">
<table class="rtTable" cellpadding="0" cellspacing="0">
<tbody>
   <tr>
      <td class="rtHeader" width="70%">Thread</td>
      <td class="rtHeader" width="30%">Author</td>
      <td class="rtHeader" align="right">Replies</td>
      <td class="rtHeader" align="right">Views</td>
      <td class="rtHeader" colspan="2" align="center">Last Post</td>
      <td class="rtHeader">Save</td>
      <td class="rtHeader">Delete</td>
   </tr>
   <tr>
      <td class="rtThreadCellWrap"><a href="?module=Message&amp;messageID=553806" class="rtLinkOld">bmp files</a></td>
      <td class="rtThreadCell"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15062676" class="coderText">sinn_md</a></td>
      <td class="rtThreadCell" align="right">2</td>
      <td class="rtThreadCell" align="right">43</td>
      <td class="rtThreadCell"><b>Aug 3, 2006 3:43 PM</b></td>
      <td class="rtThreadCell"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=21183970" class="coderText">ulzha</a></td>
      <td class="rtThreadCell" align="center"><input name="save512375" value="512375" onclick="Javascript:document.form1.delete512375.checked=false;" type="checkbox"></td>
      <td class="rtThreadCell" align="center"><input name="delete512375" value="512375" onclick="Javascript:document.form1.save512375.checked=false;" type="checkbox"></td>
   </tr>
</tbody>
</table>

<div align="right">
<input src="/i/roundTables/update.gif" alt="Update" onclick="form1.status.value='update'" type="image">
</div>

</form>
<p>


        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
