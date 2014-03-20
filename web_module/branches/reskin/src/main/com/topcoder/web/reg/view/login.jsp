<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.reg.controller.request.Login" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>TopCoder Registration</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>

    <script type="text/javascript">
        function submitEnter(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
                document.frmLogin.submit();
                return false;
            } else return true;
        }
    </script>

</head>

<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>
    <body>
		<jsp:include page="header.jsp" />
		<div id="heading" class="registrationSuccessfulHedading">	
			<div class="inner">
				<h1>Edit Profile</h1>
			</div><!-- END .inner -->
		</div>
		<div class="loginAreaBox">
			<div class="loginLeftSide">
				<div class="accessLogos">
					<a href="#"><img src="/i/logo-topcoder.png" width="136" height="21" alt="TopCoder"></a><br>
					<a href="#"><img src="/i/logo-tc-studio.png" width="135" height="45" alt="TopCoder Studio"></a><br>
					<a href="#"><img src="/i/logo-tc-cockpit.png" width="136" height="71" alt="TopCoder Cockpit"></a>
				</div>
			</div>
			<div class="loginRightSide">
				<div class="loginFormWrapper">
					<span class="bigRed"><%= message %></span>
					 <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>">
						<input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>">
						<input type="hidden" name="module" value="Login">
						<dl>
							<dd>
								<label>Handle:</label>
								<input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="50" onkeypress="submitEnter(event)">
							</dd>
							<dd>
								<label>Password:</label>
								<input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="30" onkeypress="submitEnter(event)">
							</dd>
						</dl>
						<div class="formCommand">
							<div class="checkboxWrapper">
								<input type="checkbox" name="rem" id="remeberMe">
								<label for="remeberMe">Remember Me</label>
								<div class="clear"></div>
							</div>
							<a href="#" onclick="document.frmLogin.submit();return false;" class="btnLoginNew">Login</a>
						</div>
						<div class="forgotPasswordSection">
							<h3>Forgot your password?</h3>
							<p>If you cannot remember your password, <a href="http://community.topcoder.com/tc?module=FindUser" class="redColor">click here</a> and we can help you restore your account.</p>
						</div>
						<script>
							document.frmLogin.<%=Login.USER_NAME%>.focus();
						</script>
					</form>
				</div>
			</div>
			<div class="clear"></div>
		</div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
