<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.codinginterface.longcontest.Constants,
                 com.topcoder.web.common.BaseServlet" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    if (nextpage == null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
    if (nextpage == null) nextpage = request.getHeader("Referer");
    if (nextpage == null) nextpage = "http://" + request.getServerName();
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>
<html>
<head>
    <title>TopCoder</title>
    <jsp:include page="../script.jsp" />
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
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
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="long_contests"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
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
                            If you cannot remember your password <A href="/tc?module=PasswordEmail" class="bodyText">click
                            here</A>
                            and we can send it to you via email.</p>

                        <p><b>New to TopCoder?</b><br/>
                            <A class="bodyText" href="https://<jsp:getProperty name="sessionInfo" property="serverName"/>/Registration">Register
                                now.</A>
                            After you complete the registration process, we will send your account activation code via
                            email.</p>
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
                                        <input type="text" name="<%=Constants.KEY_USER_HANDLE%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                                    </td>
                                </tr>

                                <tr valign="middle">
                                    <td nowrap class="bodyText" align="right">Password:</td>
                                    <td align="left">
                                        <input type="password" name="<%=Constants.KEY_USER_PASS%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                                    </td>
                                    <td nowrap class="bodyText">
                                        &#160;&#160;<a href="JavaScript:document.frmLogin.submit()" class="bodyText">Login&#160;&gt;</a>
                                    </td>
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