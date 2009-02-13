<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
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
<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="http://<%=ApplicationServer.SERVER_NAME%>/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="http://<%=ApplicationServer.SERVER_NAME%>/css/coders.css"/>
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

<div style="float:right;">
<a href="http://<%=ApplicationServer.SERVER_NAME%>/"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/tc_logo.gif" border=0/></a>
</div>
<A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tournaments&d2=tco06&d3=about"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/tco06_logo_AMDgrn.gif" border=0/></A>

<div style="padding: 20px 40px 200px 40px;" align="center">
   <div style="width: 500px;" align="center" class="bodyText">

   <span class="bigTitle">Component Competition Wager System</span>
   <br><br>
   
    <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
        <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= nextpage %>">
        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="Login">
            <table border="0" cellpadding="3" cellspacing="0" class="bodyText">
                <tr valign="top">
                    <td class="bodyText" colspan="3" align="center">
                        <span class="bigRed"><%= message %></span>
                    </td>
                </tr>
                <tr valign="middle">
                    <td align="right">Handle:</td>
                    <td colspan="2" align="left">
                        <input type="text" name="<%=Constants.USER_NAME%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                     </td>
                </tr>
                <tr valign="middle">
                    <td align="right" width="50%">Password:</td>
                    <td align="left">
                        <input type="password" name="<%=Constants.PASSWORD%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                    </td>
                    <td width="50%">
                        &#160;&#160;<a href="JavaScript:document.frmLogin.submit()">Login&#160;&gt;</a>
                    </td>
                </tr>
            </table>
      <script>
          document.frmLogin.<%=Constants.USER_NAME%>.focus();
      </script>
    </form>

   </div>
</div>
</body>
</html>
