<%
   boolean isSoftwarePage = "true".equals(request.getParameter("isSoftwarePage"));
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr><td height="4" class="headStripe"><img src="/images/clear.gif" alt="" height="4" border="0" /></td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CC0000">
    <tr valign="middle">
        <td class="topNav" width="49%">&#160;</td>
        <td class="topNav" nowrap><a href="http://www.topcoder.com/tc" class="topLink">Competition</a></td>
        <td class="topNav" nowrap><a href="http://www.topcoder.com/?t=development&c=index" class="topLink">Development</a></td>
<% if (isSoftwarePage) { %>
        <td class="topNavOn" nowrap><a href="http://www.topcoder.com/corp/?module=Static&d1=corp&d2=index" class="topLink">Corporate Services</a></td>
<% } else { %>
        <td class="topNav" nowrap><a href="http://www.topcoder.com/corp/?module=Static&d1=corp&d2=index" class="topLink">Corporate Services</a></td>
<%  } %>
        <td class="topNav" width="49%">&#160;</td> 
    </tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>
