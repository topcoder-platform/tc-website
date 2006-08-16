<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.controller.request.authentication.FindUser,                 
                 com.topcoder.web.tc.controller.request.authentication.ResetPassword,                 
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Password Reset</title>

<SCRIPT type="text/javascript">
function setPassword() {
	if (document.frmPwd.password.value != document.frmPwd.passwordVerif.value) {
		alert("Password confirmation does not match password");
		return;
	}
	document.frmPwd.submit();
}
</SCRIPT>


<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_reg"/>
</jsp:include>
</head>

<body>

<form method="post" name="frmPwd" action="/tc">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ResetPassword"/>
<input type="hidden" name="<%= ResetPassword.PASSWORD_RECOVERY_ID %>" value='<c:out value="${param.pr}" escapeXML="true"/>' />
<input type="hidden" name="<%= ResetPassword.HASH_CODE %>" value='<c:out value="${param.hc}" escapeXML="true"/>'/>

         <tc-webtag:errorIterator id="err" name="error"><%=err%></tc-webtag:errorIterator></span>
<br>

Enter your password: <input type="password" name="<%= ResetPassword.PASSWORD %>">
<br>
Retype your password: <input type="password" name="<%= ResetPassword.PASSWORD_VERIF %>">
         
<a href="JavaScript:document.frmPwd.submit()" class="bodyText">Submit</a>

</form>

   </div>
</div>

</body>
</html>