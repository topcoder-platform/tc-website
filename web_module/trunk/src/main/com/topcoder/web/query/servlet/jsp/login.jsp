<%@  page 
  language="java"
  errorPage="errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.query.common.*,
          com.topcoder.web.query.bean.*" %>
<jsp:useBean id="LoginTask" scope="request" class="com.topcoder.web.query.bean.LoginTask" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  </HEAD>
  <BODY BGCOLOR="#43515E" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0" onLoad="self.focus();document.login.<%=Constants.HANDLE_PARAM%>.focus()">
  <jsp:include page="top.jsp" />

  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
      <TD WIDTH="170" bgcolor="#001935" VALIGN="top">
      </TD>
      <TD WIDTH="4" BGCOLOR="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD class="statText" width="100%" bgcolor="#001935" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
            

<p class='notice'>
<jsp:getProperty name="LoginTask" property="Message" />
</p>

<FORM NAME="login" METHOD="POST" ACTION="<jsp:getProperty name="LoginTask" property="ServletPath"/>">
   <INPUT TYPE="HIDDEN" NAME="<%= Constants.TASK_PARAM %>" VALUE="<%= Constants.LOGIN_TASK %>">
                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="132" ALIGN="center">
                  <TR>
                    <TD CLASS="statTextBig" VALIGN="top" HEIGHT="14">Handle:</TD>
                  </TR>
                  <TR>
                    <TD HEIGHT="25" VALIGN="TOP">
                      <INPUT MAXLENGTH="25" SIZE="20" NAME="<%=Constants.HANDLE_PARAM%>" TYPE="TEXT" VALUE="<jsp:getProperty name="LoginTask" property="HandleInput" />">
                    </TD>
                  </TR>
                  <TR>
                    <TD CLASS="statTextBig" VALIGN="top" HEIGHT="14">Password:</TD>
                  </TR>
                  <TR>
                    <TD HEIGHT="25" VALIGN="TOP">
                      <INPUT MAXLENGTH="25" SIZE="20" NAME="<%=Constants.PASSWORD_PARAM%>" TYPE="Password" VALUE="">
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
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
</TABLE>
    </TD>
      <TD WIDTH="4" bgcolor="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
      <TD WIDTH="10" bgcolor="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
      </TD>
      <TD WIDTH="25" bgcolor="#001935"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
    </TR>
  </TABLE>
  </BODY>
</HTML>
