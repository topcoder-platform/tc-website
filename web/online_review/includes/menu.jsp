<%@ page import="com.topcoder.apps.review.ApplicationServer" %>
<!-- Main Navigation bar begins -->
<%
    boolean isDevelopmentPage = "true".equals(request.getParameter("isDevelopmentPage"));
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CC0000">
    <tr valign="middle">
        <td class="topNav" width="49%">&#160;</td>
        <td class="topNav" nowrap><a href="/" class="topLink">Software</a></td>
        <td class="topNav" nowrap><a href="http://<%=ApplicationServer.TC_SERVER%>/corp/?module=Static&d1=corp&d2=tces_home" class="topLink">Employment Services</a></td>
        <td class="topNav" nowrap><a href="http://<%=ApplicationServer.TC_SERVER%>/corp/?module=Static&d1=corp&d2=spon_prog&d3=index" class="topLink">Marketing Services</a></td>
        <td class="topNav" width="49%">&#160;</td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" alt="" border="0"></td></tr>
</table>
<!-- Main Navigation bar ends -->
