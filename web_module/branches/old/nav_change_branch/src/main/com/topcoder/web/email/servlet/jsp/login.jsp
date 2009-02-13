<%@ page import="com.topcoder.web.email.servlet.*" %>

<html>
<head>
	<title>TopCoder E-Mail System</title>
</head>
<body>
<%@ include file="header.jsp" %>

<p class="bodyTextBig"><b>Please Login</b></p>

<form name="frmLogin" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.HOME_TASK%>">
	Name: <input type="text" size=40 maxlength=100 name="<%=EmailConstants.USERNAME%>" value="<%=request.getParameter(EmailConstants.USERNAME)%>"/>
	<br>
	Password: <input type="password" size=40 maxlength=100 name="<%=EmailConstants.USERPASS%>" value=""/>
	<br>
	<input type="submit" value="login">
</form>

<p>
<%@ include file="footer.jsp" %>

</body>
</html>
