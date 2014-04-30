<%--
  - Copyright (C) 2010 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: Login page.
  -
  - Changes in 1.1 (Release Assembly - TopCoder Password Recovery Revamp v1.0 )
  - - Change the entry link of password recovery from /tc?module=RecoverPassword" to /tc?module=FindUser".
  - - Add this code document
  - 
--%>
<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.authentication.Login" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    if (nextpage == null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
    if (nextpage == null) nextpage = request.getHeader("Referer");
    if (nextpage == null) nextpage = "http://" + request.getServerName();
    String message = (String) request.getAttribute("message");
    if (message == null) message = request.getParameter("message");
    if (message == null) message = "";
%>

<html>
<head>
    <title>TopCoder | Login</title>

    <jsp:include page="../script.jsp"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

    <SCRIPT type="text/javascript">
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
    </SCRIPT>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="login"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">

    <!-- Left Column Begins -->
    <td width="170" style="vertical-align: top">
        <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value=""/>
        </jsp:include>
    </td>
    <!-- Left Column Ends -->

    <!-- Gutter Begins -->
    <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
    <!-- Gutter Ends -->

    <!-- Center Column begins -->
    <td width="100%">
		
		<div class="loginAreaBox">
			<div class="loginLeftSide">
				<dl class="whatYouCanDo">
					<dt>New to TopCoder? Register now!</br>As a member you can...</dt>
					<dd class="iconCompetition">Access and compete in our competitions</dd>
					<dd class="iconMagnifier">View past competitions and statistics</dd>
					<dd class="iconDiscuss">Have full access to the community forums</dd>
				</dl>
                <div class="regLink"><a href="https://<%=Constants.REG_SERVER_NAME%>/reg2/">Register for a TopCoder account here.</a></div>
			</div>
			<div class="loginRightSide">
				<div class="loginFormWrapper">
                    <div class="errorText"><%= message %></div>
					<div class="loginCheck">You must enter a username and a password.</div>
					 <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>">
						<input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>">
						<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="Login">
						<dl>
							<dd>
								<label>Username:</label>
								<input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="50" />
							</dd>
							<dd>
								<label>Password:</label>
								<input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="30" />
							</dd>
						</dl>
						<div class="formCommand">
							<div class="checkboxWrapper">
								<input type="checkbox" name="<%=Login.REMEMBER_USER%>" id="remeberMe">
								<label for="remeberMe">Remember Me</label>
								<div class="clear"></div>
							</div>
							<a href="JavaScript:document.frmLogin.submit()" class="btnLoginNew">Login</a>
						</div>
						<div class="forgotPasswordSection">
							<h3>Forgot your password?</h3>
							<p>If you cannot remember your password, <a href="http://www.topcoder.com/password-recovery/" target="_blank" class="redColor">click here</a> and we can help you restore your account.</p>
						</div>
						<script>
							document.frmLogin.username.focus();
						</script>
					</form>
				</div>
			</div>
			<div class="clear"></div>
		</div>

    </div>
</td>
<!-- Center Column ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<td width="170"><img src="/i/clear.gif" width="170" height="1" alt="" border="0"></td>
<!-- Left Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<!-- Footer begins -->
<jsp:include page="../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

