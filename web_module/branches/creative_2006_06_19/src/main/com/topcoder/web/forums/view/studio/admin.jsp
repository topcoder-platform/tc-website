<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>TopCoder Studio</title>

<jsp:include page="style.jsp">
    <jsp:param name="key" value="tc_studio_forums"/>
</jsp:include>
</head>

<body>

<div align="center">
   <div class="contentOut">
   <jsp:include page="top.jsp">
       <jsp:param name="section" value="default"/>
   </jsp:include>
   <jsp:include page="topNav.jsp">
       <jsp:param name="node" value="forums"/>
   </jsp:include>
      <div class="contentIn">
         <img src="/i/studio/layout/contentInN.gif" alt="" style="display:block;" />
         <div class="contentSpacer">

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
      <strong>
      <a class="rtbcLink" href="/">Forums</a>
      &gt; Administration
      </strong>
      </td>
   </tr>
</table>


<form name="form1" method="post" action="/">
<input name="module" value="Admin" type="hidden">
<table class="rtTable" cellpadding="0" cellspacing="0">
   <tbody><tr>
      <td class="rtHeader" colspan="2">Admin Console</td>
   </tr>
   <tr>
      <td class="rtTextCell" nowrap="nowrap"><strong>Command:</strong></td>
      <td class="rtTextCell100">

        <select size="1" name="cmd">
        
                <option value="htmlEscape">Change angle brackets in old messages to HTML equivalents</option>
        
                <option value="Add test forums">Add test forums</option>
        
                <option value="Delete test forums">Delete test forums</option>
        
                <option value="createForumsAlgo">Create algorithm forums</option>
        
                <option value="deleteForumsAlgo">Delete empty algorithm forums</option>

        
                <option value="Create forum from EJB">Create forum from EJB</option>
        
                <option value="enableRatings">Enable ratings</option>
        
                <option value="enableRatingPerms">Enable rating permissions</option>
        
        </select>
      </td>
   </tr>
   <tr>

      <td class="rtTextCell" nowrap="nowrap"><strong>Contest:</strong></td>
      <td class="rtTextCell100">
        <select size="1" name="match">
        
                <option value="9994">SRM 314</option>
        
                <option value="9993">SRM 313</option>
        
                <option value="9992">SRM 312</option>
        
                <option value="9991">SRM 311</option>

        
                <option value="9990">SRM 310</option>
        
                <option value="9989">SRM 309</option>
        
                <option value="9988">SRM 308</option>
        
                <option value="9987">SRM 307</option>
        </select>
      </td>
   </tr>
</tbody>
</table>

<div align="right">
<input src="/i/roundTables/update.gif" alt="Update" type="image">
</div></form>

            
         </div>
         <img src="/i/studio/layout/contentInS.gif" alt="" style="display:block;" />
      </div>
      <jsp:include page="foot.jsp"/>
      <img src="/i/studio/layout/contentOutS.gif" alt="" style="display:block;"/>
   </div>
</div>

</body>
</html>