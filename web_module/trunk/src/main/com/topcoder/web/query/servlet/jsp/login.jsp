<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.query.common.*,
          com.topcoder.web.query.bean.*" %>
<jsp:useBean id="LoginTask" scope="request" class="com.topcoder.web.query.bean.LoginTask" />
<jsp:useBean id="Authentication" scope="request" class="com.topcoder.web.query.common.Authentication" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>Query Tool</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  </HEAD>
  <BODY BGCOLOR="#333333" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0" onLoad="self.focus();document.login.<%=Constants.HANDLE_PARAM%>.focus()">
  <jsp:include page="top.jsp" />

  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
      <TD WIDTH="170" bgcolor="#000000" VALIGN="top">
      </TD>
      <TD WIDTH="4" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD CLASS="statText" width="100%" BGCOLOR="#000000" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
          <TR>
            <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD CLASS="statText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <p CLASS="statText">
                <jsp:getProperty name="Authentication" property="ErrorMessage" />
              </p>
              <FORM NAME="login" METHOD="POST" ACTION="<jsp:getProperty name="LoginTask" property="ServletPath"/>">
                <INPUT TYPE="HIDDEN" NAME="<%= Constants.TASK_PARAM %>" VALUE="<%=Constants.LOGIN_TASK %>"/>
                <INPUT TYPE="HIDDEN" NAME="<%= Constants.REDIRECT_PAGE_PARAM%>" VALUE="<%=Authentication.getRequestedURL()%>"/>
                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="132" ALIGN="center">
                  <TR>
                    <TD CLASS="statTextBig" VALIGN="top" HEIGHT="14">Handle:</TD>
                  </TR>
                  <TR>
                    <TD HEIGHT="25" VALIGN="TOP">
                      <INPUT MAXLENGTH="15" SIZE="15" NAME="<%=Constants.HANDLE_PARAM%>" TYPE="TEXT" VALUE="<jsp:getProperty name="LoginTask" property="HandleInput" />">
                    </TD>
                  </TR>
                  <TR>
                    <TD CLASS="statTextBig" VALIGN="top" HEIGHT="14">Password:</TD>
                  </TR>
                  <TR>
                    <TD HEIGHT="25" VALIGN="TOP">
                      <INPUT MAXLENGTH="15" SIZE="15" NAME="<%=Constants.PASSWORD_PARAM%>" TYPE="Password" VALUE="">
                    </TD>
                  </TR>
                  <TR>
                    <TD CLASS="statTextBig" VALIGN="top">
                      <A HREF="Javascript:void document.login.submit();" CLASS="statTextBig">Login &gt;&gt;</A>
                    </TD>
                  </TR>
                </TABLE>
              </FORM>
              <P><BR></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000000" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>
</TABLE>
    </TD>
      <TD WIDTH="4" bgcolor="#000000"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
      <TD WIDTH="10" bgcolor="#000000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
      </TD>
      <TD WIDTH="25" bgcolor="#000000"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
    </TR>
  </TABLE>
  </BODY>
</HTML>
