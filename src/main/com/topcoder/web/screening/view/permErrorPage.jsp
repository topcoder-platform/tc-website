<%@ page language="java" isErrorPage="true" %>
<%@ page import="com.topcoder.web.screening.common.Constants"%>
<%@ taglib uri="/WEB-INF/screening.tld" prefix="screen" %>
<% if(request.getAttribute("Exception") != null)
{
    exception = (Throwable)request.getAttribute("Exception");
}
String message = (String)request.getAttribute("message");
 %>
<html>
<head>
<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>

<jsp:include page="/script.jsp"/>
</HEAD>
<BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="/includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="22" VALIGN="top" BGCOLOR="#000000">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="/includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><img src="/i/clear.gif" width="10" height="1" /></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0" /><BR>
<FONT SIZE="3" COLOR="#666666"><B>PERMISSION ERROR</B></FONT><BR/>
<P>
You do not have permission to access the requested resource.
</P><BR>

 <TABLE BGCOLOR="#CCCCCC" CELLSPACING="0" CELLPADDING="0" BORDER="0" HEIGHT="69%" WIDTH="100%">
 <TR>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="170"> <img alt="" border="0" height="1" width="10" src="/i/clear.gif" /></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><img border="0" height="8" width="10" src="/i/clear.gif" /></TD>
 <TD valign="top" bgcolor="#CCCCCC" width="100%" class="bodyText">
   <img border="0" vspace="5" height="1" width="400" src="/i/clear.gif" /><BR>
   <% if(exception != null && Constants.DEBUG.equals("true")) {
    exception.printStackTrace(new java.io.PrintWriter(out));
}
    exception.printStackTrace();
   %>
<%--   <DIV CLASS="header"><%=message==null?"Navigation Error":message%></DIV>--%>
 </TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="10"><img border="0" height="1" width="10" src="/i/clear.gif" /></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="170"><img border="0" height="1" width="170" src="/i/clear.gif" /><BR></TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="10"><img height="1" width="10" src="/i/clear.gif" /></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><img height="1" width="170" src="/i/clear.gif" /><BR></TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="25"><img border="0" height="1" width="25" src="/i/clear.gif" /></TD>
 </TR>
 </TABLE>
<P><BR/></P>
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</body>
</html>
