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
      <td colspan="3" style="padding-bottom:3px;">
         <div style="float:right;">
         [
         <span class="currentPage">1</span>
         <A href="?module=Thread&threadID=509704&start=15&mc=63&view=flat" class="rtbcLink">2</A>
         <A href="?module=Thread&threadID=509704&start=30&mc=63&view=flat" class="rtbcLink">3</A>
         <A href="?module=Thread&threadID=509704&start=45&mc=63&view=flat" class="rtbcLink">4</A>
         <A href="?module=Thread&threadID=509704&start=60&mc=63&view=flat" class="rtbcLink">5</A>
         ]
         &nbsp;&nbsp;&nbsp;<a href="?module=History&amp;userID=8416646&amp;sortField=9&amp;sortOrder=0&amp;start=25" class="rtbcLink">NEXT &gt;</a>
         </div>
      <strong>
      <a class="rtbcLink" href="/">Forums</a>
      &gt; Post History: 
      <a class="coderText" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8416646">Kawigi</a> (2141 posts)
      </strong>
      </td>
   </tr>
</table>


<table cellpadding="0" cellspacing="0" class="stat">
<tbody>
   <tr>
      <td class="title" colspan="5">
      Forum Post History
      </td>
   </tr>
   <tr>
      <td class="header" width="100%">
      <A href="">Post</A>
      </td>
      <td class="header">
      Forum
      </td>
      <td class="header">
      <A href="">Date</A>
      </td>
      <td class="headerR">
      Replies
      </td>
      <td class="headerR">
      Edits
      </td>
   </tr>
   <% boolean even = true; %>
   <%-- ITERATOR GOES HERE --%>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <a href="?module=Message&amp;messageID=553729" class="rtbcLink">Re: Magic T-shirt</a>
      (response to <a href="?module=Message&amp;messageID=553726" class="rtbcLink">post</a> by <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=275071" class="coderText">antimatter</a> (<a href="?module=History&amp;userID=275071" alt="Post history for antimatter" class="rtbcLink">history</a>))
      </td>
      <td class="value" nowrap="nowrap">
      <A href="">General Discussion</A>
      </td>
      <td class="value" nowrap="nowrap">
      Aug 3, 2006 9:45 AM EDT
      </td>
      <td class="valueR">
      0
      </td>
      <td class="valueR">
      <A href="">0</A>
      </td>
   </tr>
</tbody>
</table>
            

        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
