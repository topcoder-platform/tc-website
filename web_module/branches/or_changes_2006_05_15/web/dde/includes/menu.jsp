<%@ page import="com.topcoder.dde.util.ApplicationServer" %>

<!-- Main Navigation bar begins -->
<%
   boolean isSoftwarePage = "true".equals(request.getParameter("isSoftwarePage"));
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr><td height="4" class="headStripe"><img src="/images/clear.gif" alt="" height="4" border="0" /></td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CC0000">
    <tr valign="middle">
        <td class="topNav" width="49%">&#160;</td>
        <td class="topNav" nowrap><a href="/" class="topLink">Software</a></td>
        <td class="topNav" nowrap><a href="http://<%=ApplicationServer.TC_SERVER%>/corp/?module=Static&d1=corp&d2=tces_home" class="topLink">Employment Services</a></td>
        <td class="topNav" nowrap><a href="http://<%=ApplicationServer.TC_SERVER%>/corp/?module=Static&d1=corp&d2=spon_prog&d3=index" class="topLink">Marketing Services</a></td>
        <td class="topNav" width="49%">&#160;</td> 
    </tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>
