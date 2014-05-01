<%--
  - Author: vangavroche, TCSASSEMBLER
  - Version: 1.1 (Release Assembly - TopCoder Password Recovery Revamp v1.0)
  - Copyright (C) 2010 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Changes in 1.1 (Release Assembly - TopCoder Password Recovery Revamp v1.0 )
  - - Change the entry link of password recovery from /tc?module=RecoverPassword" to /tc?module=FindUser".
  - - Add this code document
  - 
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.codinginterface.longcontest.Constants,
                 com.topcoder.web.codinginterface.longcontest.controller.request.Login" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>
<html>
<head>
    <title>TopCoder</title>
    <jsp:include page="script.jsp"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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

<html>
<head>

<body>
<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="includes/global_left.jsp">
                <jsp:param name="node" value="m_long_contests"/>
            </jsp:include>
            <%-- Left Column Ends --%>

            <%-- Center Column Begins --%>
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="long_comps_topcoder"/>
                <jsp:param name="title" value="Login"/>
            </jsp:include>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <img src="/i/clear.gif" alt="" width="380" height="1" border="0"/><br/>

                        <p><b>Forgot your password?</b><br/>
                        If you cannot remember your password <A href="http://www.topcoder.com/password-recovery/" target="_blank" class="bodyText">click here</A>
                        and we can help you restore your account.</p>

                        <p><b>New to TopCoder?</b><br/>
                            <A class="bodyText" href="http://www.topcoder.com/?action=showlogin">Register
                                now.</A>
                            After you complete the registration process, we will send your account activation code via
                            email.</p>
                    </td>
                </tr>
                <tr valign="middle">
                    <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>">
                        <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>">
                        <input type="hidden" name="module" value="Login">
                        <td class="bodyText" align="center">
                            <table border="0" cellpadding="3" cellspacing="0" class="paddingTable3">
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
                                        <input type="text" name="<%=Constants.KEY_USER_HANDLE%>" value="" maxlength="30" size="12" onkeypress="submitEnter(event)">
                                    </td>
                                </tr>

                                <tr valign="middle">
                                    <td nowrap class="bodyText" align="right">Password:</td>
                                    <td align="left">
                                        <input type="password" name="<%=Constants.KEY_USER_PASS%>" value="" maxlength="30" size="12" onkeypress="submitEnter(event)">
                                    </td>
                                    <td nowrap class="bodyText">
                                        &#160;&#160;<a href="JavaScript:document.frmLogin.submit()" class="bodyText">Login&#160;&gt;</a>
                                    </td>
                                </tr>

                                                            <tr valign="middle">
                                <td nowrap class="bodyText" colspan="3">
                                    <input type="checkbox" name="<%=Login.REMEMBER_USER%>"> Remember Me</td>
                            </tr>

                                <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0">
                                </td></tr>
                            </table>
                            <p><br/></p>

                            <script>
                                document.frmLogin.<%=Constants.KEY_USER_HANDLE%>.focus();
                            </script>

                        </td>
                    </form>
                </tr>
            </table>
        </td>

        <%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <%-- Right Column Ends --%>

        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
    </tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>
