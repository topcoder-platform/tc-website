<%@ page contentType="text/html; charset=utf-8"
         import="com.topcoder.web.tc.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>

<html>
<head>
<title>Change Password</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_reg"/>
</jsp:include>
</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
<A href="/"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0" /></A>
</div>
<div align="center">
   <div style="padding: 0px 10px 10px 10px; width: 600px; text-align: center;">

<table cellspacing="0" cellpadding="0" class="pageTitleTable">
    <tr>
        <td width="100%" class="pageTitle"><img border="0" src="/i/header_registration_w.gif" alt="registration_w"/></td>
        <td align=right class="pageSubtitle">&#160;&#160;</td>
    </tr>
</table>
<br>
<span class="bigRed">Your password has been reset.</span>
<br>
<% if (request.getAttribute(Constants.EMAIL) != null) { %>
	Your email address on record is now:<br>
	<%= request.getAttribute(Constants.EMAIL) %>.
<% } %>
<br><br>
<a href="/tc?module=Login">Login</a>
</div>
</div>
</body>
</html>