<%@ page language="java" isErrorPage="true" %>
<%@ taglib uri="/WEB-INF/screening.tld" prefix="screen" %>
<% //if (exception!=null) exception.printStackTrace(out);
   String message = (String)request.getAttribute("message");
 %>
<html>
<head>
   <TITLE>Screening Tool Error</TITLE>
</HEAD>
<BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">

 <TABLE BGCOLOR="#CCCCCC" CELLSPACING="0" CELLPADDING="0" BORDER="0" HEIGHT="69%" WIDTH="100%">
 <TR>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="170"> <screen:img alt="" border="0" height="1" width="10" page="/ev/clear.gif" /></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><screen:img border="0" height="8" width="10" page="/ev/clear.gif" /></TD>
 <TD valign="top" bgcolor="#CCCCCC" width="100%" class="bodyText"><screen:img border="0" vspace="5" height="1" width="400" page="/ev/clear.gif" /><BR><% if(exception != null) {exception.printStackTrace(new java.io.PrintWriter(out)); }else {%><DIV CLASS="header">Exception is null</DIV><%}%><DIV CLASS="header"><%=message==null?"Navigation Error":message%></DIV></TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="10"><screen:img border="0" height="1" width="10" page="/ev/clear.gif" /></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="170"><screen:img border="0" height="1" width="170" page="/ev/clear.gif" /><BR></TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="10"><screen:img height="1" width="10" page="/ev/clear.gif" /></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><screen:img height="1" width="170" page="/ev/clear.gif" /><BR></TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="25"><screen:img border="0" height="1" width="25" page="/ev/clear.gif" /></TD>
 </TR>
 </TABLE>
</body>
</html>
