<%@ page language="java" 
session="true" 
isErrorPage="true" 
%>
<% if (exception!=null) exception.printStackTrace();
   String message = (String)request.getAttribute("message");
 %>
<html>
<head>
   <TITLE>Query Tool Error</TITLE>
</HEAD>
<BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">

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
