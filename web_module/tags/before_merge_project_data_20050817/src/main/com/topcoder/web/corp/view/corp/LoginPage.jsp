<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.controller.request.Login,
                 com.topcoder.web.corp.model.SessionInfo,
                 com.topcoder.web.corp.Constants,
                 com.topcoder.web.common.BaseServlet" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Login</title>

<jsp:include page="includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="includes/top_generic.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="includes/left_generic.jsp" />
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%"><img src="/i/corp/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="bodyText" width="100%">

                        <%
                            String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
                            if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
                            if(nextpage==null) nextpage = request.getHeader("Referer");
                            if(nextpage==null) nextpage = "http://"+request.getServerName();
                            String message = (String)request.getAttribute("message");
                            if(message==null) message = "";
                        %>

                        <p><%= message %></p>
                        <% if (sessionInfo.isAnonymous()) { %>
                            <p>New to TopCoder? <a href="<%=sessionInfo.getServletPath()%>?module=Registration" class="bodyText">Register</a> today!</p>
                        <% } else { %>
                            <p>If you are not <%=sessionInfo.getHandle()%>, and would like to create a new account <a href="<%=sessionInfo.getServletPath()%>?module=Logout&<%=BaseServlet.NEXT_PAGE_KEY%>=<%=sessionInfo.getServletPath()%>?<%=Constants.KEY_MODULE+"=Registration"%>" class="bodyText">click here</a>.
                        <% } %>

                    </td>
                </tr>
            </table>

            <div align="center">

            <p><br></p>

            <table width="350" border="0" cellpadding="3" cellspacing="0" class="loginForm">
                <tr><td class="testTableTitle">Login</td></tr>
                <tr valign="middle">
                  <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>">
                    <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= nextpage %>">
                    <input type="hidden" name="module" value="Login">
                    <td class="statText" align="center">
                        <table border="0" cellpadding="3" cellspacing="0">
                           <tr><td colspan="3"><img src="/i/corp/clear.gif" width="10" height="3" alt="" border="0"></td></tr>

                            <tr valign="middle">
                                <td nowrap class="loginText" align="right">User Name:</td>
                                <td colspan="2" align="left"><input type="text" name="<%=Login.KEY_USER_HANDLE%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event,document.frmLogin)"></td>
                            </tr>

                            <tr valign="middle">
                                <td nowrap class="loginText" align="right">Password:</td>
                                <td align="left"><input type="password" name="<%=Login.KEY_USER_PASS%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event,document.frmLogin)"></td>
                                <td nowrap class="loginText">&#160;&#160;<a href="JavaScript:document.frmLogin.submit()" class="loginText">Login&#160;&gt;</a></td>
                            </tr>

                           <tr><td colspan="3"><img src="/i/corp/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                        </table>

                    <script>
                      document.frmLogin.<%=Login.KEY_USER_HANDLE%>.focus();
                    </script>

                    </td></form>
                </tr>
            </table>

            <p><br></p>
            <p><br></p>

            </div>
        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/corp/clear.gif" width="170" height="1" alt="" border="0"></td>
<!-- Left Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

