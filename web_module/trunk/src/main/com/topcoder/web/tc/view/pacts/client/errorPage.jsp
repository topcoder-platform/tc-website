<%@ page language="java" 
session="true" 
isErrorPage="true" 
%>
<% if(exception!=null) exception.printStackTrace(); %>
<html>
<head>
   <TITLE>TopCoder :: Statistics</TITLE>
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
        <TR>
          <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/top_back_tab.gif" ALT="" WIDTH="19" HEIGHT="17" BORDER="0"/></TD>
          <TD VALIGN="middle" BGCOLOR="#43515E" WIDTH="100%" BACKGROUND="/i/steel_gray_bg.gif" ALIGN="right" CLASS="globalNavSmall"><A HREF="/tc?&module=Login" CLASS="globalNavSmall" TARGET="_parent">Login</A>&#160;&#160;&#160;:&#160;&#160;&#160;<A HREF="/?t=contacts&amp;c=index" CLASS="globalNavSmall" TARGET="_parent">Contacts</A>&#160;&#160;&#160;:&#160;&#160;&#160;<A HREF="/?t=index" CLASS="globalNavSmall" TARGET="_parent">Home</A></TD>
          <TD WIDTH="50" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0" VSPACE="8"/></TD>
        </TR>
        <TR>
          <TD VALIGN="middle" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
          <TD WIDTH="250" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/><A TARGET="_parent" HREF="/?t=tces&amp;c=index" CLASS="globalNavSmall"><IMG SRC="/i/jobs_banner.gif" WIDTH="178" HEIGHT="50" BORDER="0" HSPACE="10"/></A><!-- <IMG SRC="/i/clear.gif" WIDTH="72" HEIGHT="1" BORDER="0" VSPACE="20"/> --></TD>
          <TD CLASS="time" VALIGN="middle" NOWRAP="" ALIGN="right"><BR CLEAR="all"/><BR/><SPAN CLASS="smallBrackets">[ </SPAN> <A HREF="<%="https://"+request.getServerName()+"/Registration"%>" CLASS="registerToday" TARGET="_parent">Register Today</A> :<span class="time"><jsp:include page="date_time.jsp" /></span><SPAN CLASS="smallBrackets">]</SPAN><BR CLEAR="ALL"/><BR CLEAR="ALL"/></TD><TD WIDTH="50" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/></TD>

        </TR>
      </TABLE>
    </TD>
  </TR>
  <TR>
    <TD COLSPAN="2" BGCOLOR="#000000" VALIGN="bottom"><IMG SRC="/i/logo_btm_tab.gif" ALT="" WIDTH="187" HEIGHT="6" BORDER="0"/></TD>
    <TD COLSPAN="2" BGCOLOR="#000000" ALIGN="right"><A HREF="Javascript:arena()" CLASS="registerNav"><IMG SRC="/i/label_download_applet.gif" ALT="Download the Applet" WIDTH="134" HEIGHT="17" BORDER="0"/></A><A HREF="/index?t=schedule&amp;c=practice_room" CLASS="registerNav"><IMG SRC="/i/label_visit_practice_room.gif" ALT="Visit the Practice Room" WIDTH="141" HEIGHT="17" BORDER="0"/></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
  </TR>
</TABLE>




 <TABLE BGCOLOR="#CCCCCC" CELLSPACING="0" CELLPADDING="0" BORDER="0" HEIGHT="69%" WIDTH="100%">
 <TR>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="170"> <IMG ALT="" BORDER="0" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG BORDER="0" HEIGHT="8" WIDTH="10" SRC="/i/clear.gif"></TD>
 <TD valign="top" bgcolor="#CCCCCC" width="100%" class="bodyText"><IMG BORDER="0" VSPACE="5" HEIGHT="1" width="400" src="/i/clear.gif"><BR><DIV CLASS="header">Navigation Error</DIV></TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="10"><IMG BORDER="0" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="170"><IMG BORDER="0" HEIGHT="1" WIDTH="170" SRC="/i/clear.gif"><BR></TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="10"><IMG HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"></TD>
 <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG HEIGHT="1" WIDTH="170" SRC="/i/clear.gif"><BR></TD>
 <TD BGCOLOR="#CCCCCC" WIDTH="25"><IMG BORDER="0" HEIGHT="1" WIDTH="25" SRC="/i/clear.gif"></TD>
 </TR>
 </TABLE>
   <jsp:include page="/foot.jsp" /> 
</body>
</html>
