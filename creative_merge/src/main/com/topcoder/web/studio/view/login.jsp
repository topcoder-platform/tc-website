<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
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
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>


<body>

<div align="center">
    <div class="contentOut">

        <jsp:include page="top.jsp">
            <jsp:param name="section" value="default"/>
        </jsp:include>
         <jsp:include page="topNav.jsp">
             <jsp:param name="node" value="none"/>
         </jsp:include>

        <div class="contentIn">


            <img src="/i/studio/layout/contentInN.gif" alt="" style="display:block;"/>

            <div style="text-align:left; padding: 0px 10px 0px 10px;">

<h1>Login</h1>
<div align="center">
<div align="left" style="width:500px;">
    <strong>Forgot your password?</strong>
    If you cannot remember your password
    <A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=PasswordEmail" class="bodyText">click
        here</A> and we can
    send it
    to you via email.
    <br><br>
    <strong>New to TopCoder?</strong><br>
    <A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/">Register now</A>. After you complete the
    registration process,
    we
    will send your account activation code via email.
    <br><br>

    <form method="post" name="frmLogin" action="${sessionInfo.secureAbsoluteServletPath}">
        <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= nextpage %>">
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
                    <td colspan="2" align="center"><input type="checkbox" name="<%=Login.REMEMBER_USER%>">
                        Remember
                        Me</td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="image" src="/i/studio/layout/btn_login.gif" onmouseover="this.src='/i/studio/layout/btn_login_on.gif'" onmouseout="this.src='/i/studio/layout/btn_login.gif'">
                    </td>
                </tr>
            </table>

            <br><br>

            <script type="text/javascript">
                document.frmLogin.<%=Login.USER_NAME%>.focus();
            </script>

        </div>
    </form>
</div>
</div>

            </div>
            <img src="/i/studio/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>

        <jsp:include page="foot.jsp"/>

        <img src="/i/studio/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>