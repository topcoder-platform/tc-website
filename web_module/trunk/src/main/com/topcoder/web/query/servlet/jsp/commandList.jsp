<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import= "com.topcoder.web.query.common.*,
          com.topcoder.web.query.bean.*"
%>
<%@ taglib uri="/query-taglib.tld" prefix="query"%>
<jsp:useBean id="CommandListTask" scope="request" class="com.topcoder.web.query.bean.CommandListTask" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
  </HEAD>
  <BODY BGCOLOR="#43515E" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0"">
  <jsp:include page="top.jsp" />

  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
      <TD WIDTH="170" bgcolor="#001935" VALIGN="top">
      </TD>
      <TD WIDTH="4" BGCOLOR="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
      <TD class="statText" width="100%" bgcolor="#001935" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
        <TABLE WIDTH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
          <TR><TD>Command List</TD></TR>

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
