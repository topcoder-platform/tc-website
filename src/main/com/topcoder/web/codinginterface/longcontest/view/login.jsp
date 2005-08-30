<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.codinginterface.longcontest.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  String message = (String)request.getAttribute("message");
  if(message==null) message = "";
%>

<html>
<head>
<title>TopCoder | Login</title>

<jsp:include page="../script.jsp" />

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

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
               <tr valign="top">
                    <td class="bodyText" width="100%">
                        <img src="/i/clear.gif" alt="" width="380" height="1" border="0"/><br/>
                        <p><b>Forgot your password?</b><br/>
                        If you cannot remember your password <A href="/tc?module=PasswordEmail" class="bodyText">click here</A>
                        and we can send it to you via email.</p>

                        <p><b>New to TopCoder?</b><br/>
                        <A class="bodyText" href="https://<jsp:getProperty name="sessionInfo" property="serverName"/>/Registration">Register now.</A>
                        After you complete the registration process, we will send your account activation code via email.</p>
                    </td>
                </tr>
                <tr valign="middle">
                  <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>">
                    <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= nextpage %>">
                    <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="Login">
                    <td class="bodyText" align="center">
                        <table border="0" cellpadding="3" cellspacing="0">
                           <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                            <tr valign="top">
                                <td class="errorText" colspan="3">
                                    <p><%= message %></p>
                                </td>
                            </tr>

                            <tr valign="middle">
                                <td nowrap class="bodyText" align="right">Handle:</td>
                                <td colspan="2" align="left"><input type="text" name="<%=Constants.KEY_USER_HANDLE%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)"></td>
                            </tr>

                            <tr valign="middle">
                                <td nowrap class="bodyText" align="right">Password:</td>
                                <td align="left"><input type="password" name="<%=Constants.KEY_USER_PASS%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)"></td>
                                <td nowrap class="bodyText">&#160;&#160;<a href="JavaScript:document.frmLogin.submit()" class="bodyText">Login&#160;&gt;</a></td>
                            </tr>


                           <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                        </table>
                        <p><br/></p>

                    <script>
                      document.frmLogin.<%=Constants.KEY_USER_NAME%>.focus();
                    </script>

                    </td>
                  </form>
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

