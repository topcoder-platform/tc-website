<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.authentication.Login" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
    <title>TopCoder PACTs</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
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

<jsp:include page="../../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="pact_s"/>
<jsp:param name="title" value="Login"/>
</jsp:include>

     <form method="post" name="frmLogin" action="/PactsInternalServlet">
     <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>">
     <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="Login">

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="middle">
                    <td class="bodyText" align="center">
                        <table border="0" cellpadding="3" cellspacing="0">
                            <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0">
                            </td></tr>
                            <tr valign="top">
                                <td class="errorText" colspan="3">
                                        <tc-webtag:errorIterator id="err" name="error">
                                            <font color="#FF0000"><%=err%></font><br/>
                                        </tc-webtag:errorIterator>
                                </td>
                            </tr>

                            <tr valign="middle">
                                <td nowrap align="right">Username:</td>
                                <td colspan="2" align="left">
                                    <input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="30" size="12" onkeypress="submitEnter(event)">
                                </td>
                            </tr>

                            <tr valign="middle">
                                <td nowrap align="right">Password:</td>
                                <td align="left">
                                    <input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="30" size="12" onkeypress="submitEnter(event)">
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
                            document.frmLogin.<%=Login.USER_NAME%>.focus();
                        </script>

                    </td>
            </tr>
        </table>
       </form>

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../../foot.jsp" />
</body>
</html>