<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.reg.controller.request.Login" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
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
<jsp:include page="style.jsp">
    <jsp:param name="key" value="tc_creative"/>
</jsp:include>
</head>

<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>


<body>

<strong>Forgot your password?</strong><br>
If you cannot remember your password
<A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=PasswordEmail" class="bodyText">click here</A> and we can
send it
to you via email.
<br><br>
<strong>New to TopCoder?</strong><br>
<A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/">Register now</A>. After you complete the registration process,
we
will send your account activation code via email.
<br><br>

<form method="post" name="frmLogin" action="${sessionInfo.secureAbsoluteServletPath}">
    <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= nextpage %>">
    <input type="hidden" name="module" value="Login">

    <div align="center">
        <%= message %>
        <table cellpadding="0" cellspacing="0" border="0" class="regFields">
            <tr>
                <td class="name">
                    Handle:
                </td>
                <td class="value">
                    <input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                </td>
            </tr>
            <tr>
                <td class="name">
                    Password:
                </td>
                <td class="value">
                    <input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                </td>
            </tr>
            <tr>
                <td class="value">
                    &#160;
                </td>
                <td class="value">
                    <a href="#" onclick="document.frmLogin.submit();return false;" class="bodyText">Login</a>
                </td>
            </tr>
        </table>

        <p><br/></p>

        <script type="text/javascript">
            document.frmLogin.<%=Login.USER_NAME%>.focus();
        </script>

</form>


</body>
</html>