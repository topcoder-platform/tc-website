<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.Constants" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Login</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<!-- Top begins -->
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="login"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="login"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="login"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Login"/>
        </jsp:include>
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
                            String username = request.getParameter(Login.USER_NAME);
                            if(username==null) username = "";
                        %>

                        <p><%= message %></p>
                        <% if (sessionInfo.isAnonymous()) { %>
                            <p>New to TopCoder? <a href="/?module=Registration" class="bodyText">Register</a> today!</p>
                        <% } else { %>
                            <p>If you are not <%=sessionInfo.getHandle()%>, and would like to create a new account <a href="/?module=Logout&<%=BaseServlet.NEXT_PAGE_KEY%>=/?<%=Constants.MODULE_KEY+"=Registration"%>" class="bodyText">click here</a>.
                        <% } %>

                    </td>
                </tr>


               <tr valign="top">
                    <td class="statText" width="100%">
                        <img src="/i/clear.gif" alt="" width="380" height="1" border="0"/><br/>
                        <p><span class="statTextBig">Forgot your password?</span><br/>
                        If you cannot remember your password <A href="index?t=authentication&amp;c=recover_password" class="statText">click here</A>
                        and we can send it to you via email.</p>

                        <p><span class="statTextBig">New to TopCoder?</span><br/>
                        <A class="statText" href="https://<jsp:getProperty name="sessionInfo" property="ServerName"/>/reg/index.jsp">Register now.</A>
                        After you complete the registration process, we will send your account activation code via email.</p>


                    </td>
                </tr>

            </table>

            <div align="center">

            <p><br></p>

            <table width="350" border="0" cellpadding="3" cellspacing="0" class="loginForm">
                <tr><td class="testTableTitle">Login</td></tr>
                <tr valign="middle">
                  <form method="post" name="frmLogin" action="/">
                    <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= nextpage %>">
                    <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="Login">
                    <td class="statText" align="center">
                        <table border="0" cellpadding="3" cellspacing="0">
                           <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>

                            <tr valign="middle">
                                <td nowrap class="loginText" align="right">User Name:</td>
                                <td colspan="2" align="left"><input type="text" name="<%=Login.USER_NAME%>" value="<%= username %>" maxlength="15" size="12" onkeypress="submitEnter(event,document.frmLogin)"></td>
                            </tr>

                            <tr valign="middle">
                                <td nowrap class="loginText" align="right">Password:</td>
                                <td align="left"><input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event,document.frmLogin)"></td>
                                <td nowrap class="loginText">&#160;&#160;<a href="JavaScript:document.frmLogin.submit()" class="loginText">Login&#160;&gt;</a></td>
                            </tr>

                           <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                        </table>

                    <script>
                      document.frmLogin.<%=username.equals("")?Login.USER_NAME:Login.PASSWORD%>.focus();
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
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" alt="" border="0"></td>
<!-- Left Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

