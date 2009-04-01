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
<BODY bgcolor="#CCCCCC" topmargin="0" marginheight="0" LEFTMARGIN="0" marginwidth="0">

 <table bgcolor="#CCCCCC" cellspacing="0" cellpadding="0" border="0" height="69%" width="100%">
 <tr>
 <td valign="top" bgcolor="#CCCCCC" width="170"> <img ALT="" border="0" height="1" width="10" src="/i/clear.gif"></td>
 <td valign="top" bgcolor="#CCCCCC" width="10"><img border="0" height="8" width="10" src="/i/clear.gif"></td>
 <td valign="top" bgcolor="#CCCCCC" width="100%" class="bodyText"><img border="0" VSPACE="5" height="1" width="400" src="/i/clear.gif"><BR><DIV class="header"><%=message==null?"Navigation Error":message%></DIV></td>
 <td bgcolor="#CCCCCC" width="10"><img border="0" height="1" width="10" src="/i/clear.gif"></td>
 <td valign="top" bgcolor="#CCCCCC" width="170"><img border="0" height="1" width="170" src="/i/clear.gif"><BR></td>
 <td bgcolor="#CCCCCC" width="10"><img height="1" width="10" src="/i/clear.gif"></td>
 <td valign="top" bgcolor="#CCCCCC" width="100%"><img height="1" width="170" src="/i/clear.gif"><BR></td>
 <td bgcolor="#CCCCCC" width="25"><img border="0" height="1" width="25" src="/i/clear.gif"></td>
 </tr>
 </table>
</body>
</html>
