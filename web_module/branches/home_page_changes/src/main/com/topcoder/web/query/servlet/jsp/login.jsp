<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.query.common.*,
          com.topcoder.web.query.request.*" %>
<jsp:useBean id="Login" scope="request" class="com.topcoder.web.query.request.Login" />
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo" />
<%
  String message = (String)request.getAttribute("message");
  if(message==null) message = "";
  String username = request.getParameter(Constants.HANDLE_PARAM);
  if(username==null) username = "";

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>Query Tool</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" href="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" href="/css/coders.css"/>
  </HEAD>
  <BODY bgcolor="#000000" topmargin="0" marginheight="0" LEFTMARGIN="0" marginwidth="0" onLoad="self.focus();document.login.<%=Constants.HANDLE_PARAM%>.focus()">
  <jsp:include page="top.jsp" />

  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="170" bgcolor="#000000" valign="top">
      </td>
      <td width="4" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="4" height="8"></td>
      <td class="statText" width="100%" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="400" height="1" VSPACE="5" border="0"><BR>
          <table border="0" cellspacing="0" cellpadding="0" width="100%">
          <tr>
            <td valign="top" width="11"><img src="/i/clear.gif" ALT="" width="11" height="1" border="0"/></td>
            <td class="statText" colspan="2" valign="top" width="100%"><img src="/i/clear.gif" ALT="" width="240" height="1" border="0"/>
              <p class="statText">
              <%=message%>
              </p>
              <FORM NAME="login" METHOD="POST" ACTION="<jsp:getProperty name="sessionInfo" property="ServletPath"/>">
                <INPUT TYPE="HIDDEN" NAME="<%= Constants.TASK_PARAM %>" VALUE="<%=Constants.LOGIN_TASK %>"/>
                <INPUT TYPE="HIDDEN" NAME="<%= Constants.STEP_PARAM%>" VALUE="<%=Constants.NEW_STEP%>"/>
                <table border="0" cellpadding="0" cellspacing="0" width="132" ALIGN="center">
                  <tr>
                    <td class="statTextBig" valign="top" height="14">Handle:</td>
                  </tr>
                  <tr>
                    <td height="25" valign="TOP">
                      <INPUT MAXLENGTH="15" SIZE="15" NAME="<%=Constants.HANDLE_PARAM%>" TYPE="TEXT" VALUE="<%=username%>">
                    </td>
                  </tr>
                  <tr>
                    <td class="statTextBig" valign="top" height="14">Password:</td>
                  </tr>
                  <tr>
                    <td height="25" valign="TOP">
                      <INPUT MAXLENGTH="15" SIZE="15" NAME="<%=Constants.PASSWORD_PARAM%>" TYPE="Password" VALUE="">
                    </td>
                  </tr>
                  <tr>
                    <td class="statTextBig" valign="top">
                      <A href="Javascript:void document.login.submit();" class="statTextBig">Login &gt;&gt;</A>
                    </td>
                  </tr>
                </table>
              </FORM>
              <P><BR></P>
    </td>
    <td valign="top" width="10"><img src="/i/clear.gif" ALT="" width="10" height="1" border="0"/></td>
  </tr>
  <tr>
    <td colspan="4" valign="top" bgcolor="#000000" width="100%"><img src="/i/clear.gif" ALT="" width="1" height="10" border="0"/></td>
  </tr>
</table>
    </td>
      <td width="4" bgcolor="#000000"><img src="/i/clear.gif" width="4" height="1" border="0"></td>
      <td width="10" bgcolor="#000000" valign="top"><img src="/i/clear.gif" width="10" height="1" border="0"><BR>
      </td>
      <td width="25" bgcolor="#000000"><img src="/i/clear.gif" width="25" height="1" border="0"></td>
    </tr>
  </table>
  <jsp:include page="bottom.jsp" />
  </BODY>
</HTML>
