<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.controller.request.Login,
                 com.topcoder.web.corp.Constants,
                 com.topcoder.shared.security.User,
                 com.topcoder.web.common.security.SessionPersistor,
                 com.topcoder.web.common.security.BasicAuthentication"
         %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%
   boolean isHomePage = "true".equals(request.getParameter("isHomePage"));
%>

<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">
    <tr valign="middle"><td class="login" width="100%">&nbsp;</td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr valign="middle">
        <td width="15"><img src="/i/corp/clear.gif" width="15" height="1" alt="" border="0"></td>
        <td width="206"><img src="/i/corp/logo.gif" width="206" height="49" border="0" alt="TopCoder Corporate Services" vspace="13"></td>
        <td width="99%"><img src="/i/corp/clear.gif" width="1" height="1" alt="" border="0" hspace="15"></td>
    </tr>
    <tr><td height="4" class="headStripe" colspan="3"><img src="/i/corp/clear.gif" alt="" height="4" alt="" border="0"></td></tr>
</table>
<!-- Header ends -->

<!-- Main Navigation bar begins -->
<table width="100%" border="0" cellpadding="3" cellspacing="0">
    <tr valign="middle"><td class="topNav" width="100%">&#160;</td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/i/corp/clear.gif" alt="" width="10" height="2" alt="" border="0"></td></tr>
</table>
<!-- Main Navigation bar ends -->
