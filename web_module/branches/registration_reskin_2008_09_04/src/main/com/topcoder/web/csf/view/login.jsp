<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.csf.controller.request.Login" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <%--    <script type="text/javascript">
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
    </script>--%>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
</head>

<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>


<body>

<div align="center">
    <div id="content">

        <jsp:include page="top.jsp"/>

        <jsp:include page="primaryNav.jsp">
            <jsp:param name="selectedTab" value=""/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Login</span>
            </div>

            <div align="center">
                <div align="left" style="width:250px; margin:20px 0px 40px 0px;">
                    <form method="post" name="frmLogin" action="${sessionInfo.secureAbsoluteServletPath}">
                        <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>">
                        <input type="hidden" name="module" value="Login">

                        <div align="center"><span class="bigRed"><%= message %></span></div>
                        <table cellpadding="2" cellspacing="0" border="0">
                            <tr>
                                <td style="color: #82AA31; font-size: 11px; font-weight: bold;" colspan="2">
                                    Enter the login information below.
                                </td>
                            </tr>
                            <tr>
                                <td style="color: #82AA31; font-size: 11px;">
                                    Username:
                                </td>
                                <td>
                                    <input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="80" <%--onkeypress="submitEnter(event)"--%> class="TextBox">
                                </td>
                            </tr>
                            <tr>
                                <td style="color: #82AA31; font-size: 11px;">
                                    Password:
                                </td>
                                <td>
                                    <input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="80" <%--onkeypress="submitEnter(event)"--%> class="TextBox">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <BUTTON name="submit" value="submit" type="submit" class="button">Login</BUTTON>
                                </td>
                            </tr>
                        </table>

                        <A href="http://www.networkmashups.com/Forgotpassword.aspx">Forgot your password? Click
                            here!</A>
                        <br>
                        <%--
                                        <A href="http://www.networkmashups.com/Signup.aspx">Don't have an account? Create one!</A>
                        --%>

                        <script type="text/javascript">
                            document.frmLogin.<%=Login.USER_NAME%>.focus();
                        </script>

                    </form>
                </div>
            </div>

        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>

</body>
</html>