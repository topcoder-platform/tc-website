<%@ page import="com.topcoder.web.common.BaseServlet"%>
<%@ page import="com.topcoder.web.reg.controller.request.Login"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
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

</head>

<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>


<body>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <img src="/i/clear.gif" alt="" width="380" height="1" border="0"/><br/>

                        <p><b>Forgot your password?</b><br/>
                            If you cannot remember your password <A href="/tc?module=PasswordEmail" class="bodyText">click
                            here</A>
                            and we can send it to you via email.</p>
                    </td>
                </tr>
                <tr valign="middle">
                    <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>">
                        <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= nextpage %>">
                        <input type="hidden" name="module" value="Login">
                        <td class="bodyText" align="center">
                            <table border="0" cellpadding="3" cellspacing="0">
                                <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0">
                                </td></tr>
                                <tr valign="top">
                                    <td class="errorText" colspan="3">
                                        <p><%= message %></p>
                                    </td>
                                </tr>

                                <tr valign="middle">
                                    <td nowrap class="bodyText" align="right">Handle:</td>
                                    <td colspan="2" align="left">
                                        <input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                                    </td>
                                </tr>

                                <tr valign="middle">
                                    <td nowrap class="bodyText" align="right">Password:</td>
                                    <td align="left">
                                        <input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                                    </td>
                                    <td nowrap class="bodyText">
                                        &#160;&#160;<a href="JavaScript:document.frmLogin.submit()" class="bodyText">Login&#160;&gt;</a>
                                    </td>
                                </tr>


                                <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0">
                                </td></tr>
                            </table>
                            <p><br/></p>

                            <script type="text/javascript">
                                document.frmLogin.<%=Login.USER_NAME%>.focus();
                            </script>

                        </td>
                    </form>
                </tr>
            </table>
</body>
</html>