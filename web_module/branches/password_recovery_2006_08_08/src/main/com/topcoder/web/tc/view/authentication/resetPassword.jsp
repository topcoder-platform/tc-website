<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.controller.request.authentication.FindUser,                 
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
<input type="hidden" name="pr" value='<%= request.getParameter("pr")%>'/>
<input type="hidden" name="hc" value='<%= request.getParameter("hc")%>'/>
Enter your password: <input type="password" name="password">
<br>
Retype your password: <input type="password" name="passwordVerif">
         
<a href="JavaScript:setPassword()" class="bodyText">Submit</a>

</form>

   </div>
</div>

</body>
</html>