<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.aolicq.controller.request.Login" %>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge :: Powered by TopCoder</title>


    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>
    <script type="text/javascript" src="/js/arena.js"></script>
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
<jsp:include page="topNav.jsp"/>
	<div id="wrapper">
	<jsp:include page="aolicqTop.jsp"/>
        
        <div class="secondary-body" id="learn-more">        
        	<div class="siteBoxFull">

			<h2 class="login">Login</h2>

                <div align="center">
					<div align="left" id="tc-login">
					<p><strong>Forgot your password?</strong><br/>
                    If you cannot remember your password <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword" class="bodyText">click here</a> and we can help you restore your account.</p>

                    <p><strong>New to TopCoder?</strong><br />
                    <a href="https://<%=ApplicationServer.SERVER_NAME%>/reg/?module=Main&amp;rt=9">Register now</a>. After you complete the registration process, we will send your account activation code via email.</p>

                    <form method="post" name="frmLogin" action="${sessionInfo.secureAbsoluteServletPath}">
                    <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>" />
                    <input type="hidden" name="module" value="Login" />

					<div align="center">
						<span class="tc-alert"><%= message %></span>
						<table cellpadding="2" cellspacing="0" border="0">
							<tr>
								<td class="name">Handle:</td>
								<td class="value"><input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="15" size="30" onkeypress="submitEnter(event)" class="textfield" tabindex="1" /></td>
							</tr>
							<tr>
								<td class="name">Password:</td>
								<td class="value"><input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="30" size="30" onkeypress="submitEnter(event)" class="textfield" tabindex="2" /></td>
							</tr>
							<tr>
								<td colspan="2"><input type="checkbox" name="<%=Login.REMEMBER_USER%>" />Remember Me</td>
							</tr>
							<tr>
								<td colspan="2" class="tc-login"><input type="image" src="/i/events/aolicq/interface/btnLogin.png"/></td>
							</tr>
						</table>

					<br /><br />
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="tcFoot.jsp"/>

</body>
</html>