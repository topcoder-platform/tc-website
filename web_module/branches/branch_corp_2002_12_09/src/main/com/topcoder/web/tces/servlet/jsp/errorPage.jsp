<%@ page language="java" 
session="true" 
isErrorPage="true" 
%>
<% if (exception!=null) exception.printStackTrace();
   String message = (String)request.getAttribute("message");
 %>
<html>
<head>
   <TITLE>TopCoder</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="/script.jsp" />
</HEAD>
<BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">
 <TR>
    <TD WIDTH="15" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
    <TD WIDTH="206" BGCOLOR="#000000"><A HREF="/?t=index" TARGET="_parent"><IMG SRC="/i/logo.gif" WIDTH="206" HEIGHT="49" BORDER="0" VSPACE="10"/></A></TD>
    <TD WIDTH="20" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" HSPACE="35"/></TD>
    <TD WIDTH="100%" BGCOLOR="#000000" ALIGN="right" VALIGN="top">
      <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
      </TABLE>
    </TD>
  </TR>
  <TR>
    <TD COLSPAN="2" BGCOLOR="#000000" VALIGN="bottom"><IMG SRC="/i/logo_btm_tab.gif" ALT="" WIDTH="187" HEIGHT="6" BORDER="0"/></TD>
  </TR>
</TABLE>

 <TABLE BGCOLOR="#CCCCCC" CELLSPACING="0" CELLPADDING="0" BORDER="0" HEIGHT="69%" WIDTH="100%">
 <TR>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="170"> <IMG ALT="" BORDER="0" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG BORDER="0" HEIGHT="8" WIDTH="10" SRC="/i/clear.gif"></TD>
 <TD valign="top" bgcolor="#CCCCCC" width="100%" class="bodyText"><IMG BORDER="0" VSPACE="5" HEIGHT="1" width="400" src="/i/clear.gif"><BR><DIV CLASS="header"><%=message==null?"Navigation Error":message%></DIV></TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="10"><IMG BORDER="0" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="170"><IMG BORDER="0" HEIGHT="1" WIDTH="170" SRC="/i/clear.gif"><BR></TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="10"><IMG HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG HEIGHT="1" WIDTH="170" SRC="/i/clear.gif"><BR></TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="25"><IMG BORDER="0" HEIGHT="1" WIDTH="25" SRC="/i/clear.gif"></TD>
 </TR>
 </TABLE>
</body>
</html>
