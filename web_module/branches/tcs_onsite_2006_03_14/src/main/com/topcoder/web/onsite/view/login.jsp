<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.onsite.controller.request.Login,
                 com.topcoder.web.onsite.Constants" %>
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
        <title>TopCoder | Wager | Login</title>
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
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="middle">
                <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
                    <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= nextpage %>">
                    <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="Login">
                    <td class="bodyText" align="center">
                        <table border="0" cellpadding="3" cellspacing="0">
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
                        </table>
                        <p><br/></p>
                        <script>
                            document.frmLogin.<%=Login.USER_NAME%>.focus();
                        </script>
                    </td>
                </form>
            </tr>
        </table>
    </body>
</html>

