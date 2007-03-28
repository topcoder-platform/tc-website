<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.oracle.controller.request.Login" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/oracle/main.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/stats.css">
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

<div align="center">
    <div id="contentOut">
        <div id="contentIn">

                <h1>Login</h1>

                <div align="center" style="margin: 40px 0px 100px 0px;">

                        <form method="post" name="frmLogin" action="${sessionInfo.secureAbsoluteServletPath}">
                            <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>">
                            <input type="hidden" name="module" value="Login">

                            <div align="center"><strong><%= message %></strong></div>
                            <table border="0" cellpadding="2" cellspacing="0" style="margin: 20px;">
                            <tbody>
                                <tr>
                                    <td>
                                        <strong>Handle:</strong>
                                    </td>
                                    <td>
                                        <input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Password:</strong>
                                    </td>
                                    <td>
                                        <input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <button name="submit" value="submit" type="submit" class="button">Login</button>
                                    </td>
                                </tr>
                            </tbody>
                            </table>
    
                            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword">Forgot your password?</a><br>
                            <A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/">Not registered?</A>

                            <br><br>

                            <script type="text/javascript">
                                document.frmLogin.<%=Login.USER_NAME%>.focus();
                            </script>

                        </form>













<%--

                        <p><b>Forgot your password?</b><br/>
                            If you cannot remember your password
                            <A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword" class="bodyText">click
                                here</A>
                            and we can help you restore your account.</p>

                        <br><br>
                        <strong>New to TopCoder Studio?</strong><br>
                        <A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/">Register now</A>. After you complete
                        the
                        registration process,
                        we
                        will send your account activation code via email.
                        <br><br>

                        <form method="post" name="frmLogin" action="${sessionInfo.secureAbsoluteServletPath}">
                            <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>">
                            <input type="hidden" name="module" value="Login">

                            <div align="center">
                                <span class="bigRed"><%= message %></span>
                                <table cellpadding="2" cellspacing="0" border="0">
                                    <tr>
                                        <td class="name" align="right">
                                            Handle:
                                        </td>
                                        <td class="value">
                                            <input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="name" align="right">
                                            Password:
                                        </td>
                                        <td class="value">
                                            <input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="checkbox" name="<%=Login.REMEMBER_USER%>">
                                            Remember
                                            Me</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="image" src="/i/layout/btn_login.gif" onmouseover="this.src='/i/layout/btn_login_on.gif'" onmouseout="this.src='/i/layout/btn_login.gif'">
                                        </td>
                                    </tr>
                                </table>

                                <br><br>

                                <script type="text/javascript">
                                    document.frmLogin.<%=Login.USER_NAME%>.focus();
                                </script>

                            </div>
                        </form>
--%>


                </div>

        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>