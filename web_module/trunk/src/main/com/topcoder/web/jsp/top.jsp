<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.CoderRegistration,
          com.topcoder.ejb.DataCache.*,
          com.topcoder.common.web.util.*,
          java.text.DecimalFormat,
          com.topcoder.common.web.data.Navigation" %>
<%
   String color = "#cccccc";
   DataCache dcHome = com.topcoder.common.web.util.Cache.get();
   Navigation nav = (Navigation) session.getAttribute ( "navigation" );
   if ( nav == null ) nav = new Navigation();
   if ( nav.getLoggedIn() )
   {
     HashMap h = null;
     if (nav.getUser() != null) h = nav.getUser().getUserTypeDetails();
     if ( h!=null && h.containsKey("Coder") )
     {
       int rating = ((CoderRegistration)h.get("Coder")).getRating().getRating();
       if ( rating > 2199 ) {
         color = "#ff0000";
       } else if ( rating > 1499 && rating < 2200 ) {
         color = "#ffff00";
       } else if ( rating > 1199 && rating < 1500 ) {
         color = "#66cccc";
       } else if ( rating > 899 && rating < 1200 ) {
         color = "#ccff99";
       } else {
         color = "#cccccc";
       }
     }
   }
%>
<A NAME="top"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">
 <TR>
    <TD WIDTH="15" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
    <TD WIDTH="206" BGCOLOR="#000000"><A HREF="/?t=index" TARGET="_parent"><IMG SRC="/i/logo.gif" WIDTH="206" HEIGHT="49" BORDER="0" VSPACE="10"/></A></TD>
    <TD WIDTH="20" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" HSPACE="15"/></TD>
    <TD WIDTH="100%" BGCOLOR="#000000" ALIGN="right" VALIGN="top">
      <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
        <TR>
<!--
          <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><A TARGET="_blank" HREF="http://www.topcodersoftware.com"><IMG SRC="/i/tcs_button.gif" ALT="" WIDTH="144" HEIGHT="17" BORDER="0"/></A></TD>
-->
          <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><A TARGET="_blank" HREF="http://www.topcodersoftware.com"><IMG SRC="/i/tcs_button.gif" ALT="" WIDTH="144" HEIGHT="17" BORDER="0"/></A><A TARGET="_parent" HREF="/?&amp;t=tces&amp;c=index"><IMG SRC="/i/tces_button.gif" ALT="" WIDTH="81" HEIGHT="17" BORDER="0"/></A></TD>
          <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif" CLASS="time" NOWRAP="0">
            <SPAN CLASS="registerToday">&#160;&#160;&#160;&#160;Current Member Count</SPAN>&#160;:&#160; <%=new DecimalFormat("#,##0").format(dcHome.getMemberCount())%></TD>    
          <!-- <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif" CLASS="time" NOWRAP="0"></TD> -->             
          <TD VALIGN="middle" BGCOLOR="#43515E" WIDTH="100%" BACKGROUND="/i/steel_gray_bg.gif" ALIGN="right" CLASS="globalNavSmall" NOWRAP="0"><A TARGET="_parent" HREF="/?t=about_tc&amp;c=index" CLASS="globalNavSmall">About [TC]</A>&#160;&#160;&#160;:&#160;&#160;&#160;<% if ( nav.getLoggedIn() ) { %><A HREF="/?t=authentication&amp;c=submit_logout" CLASS="globalNavSmall" TARGET="_parent">Logout</A><% } else { %><A HREF="/?t=authentication&amp;c=login" CLASS="globalNavSmall" TARGET="_parent">Login</A><%}%>&#160;&#160;&#160;:&#160;&#160;&#160;<A HREF="/?t=contacts&amp;c=index" CLASS="globalNavSmall" TARGET="_parent">Contacts</A>&#160;&#160;&#160;:&#160;&#160;&#160;<A HREF="/?t=index" CLASS="globalNavSmall" TARGET="_parent">Home</A></TD>
          <TD WIDTH="15" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0" VSPACE="8"/></TD>
        </TR>
        <TR>
          <TD VALIGN="middle" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
          <TD BGCOLOR="#000000" ALIGN="center" NOWRAP="0"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/><!-- <A TARGET="_parent" HREF="/?&t=tces&amp;c=index"><IMG SRC="/i/jobs_banner2.gif" ALT="" WIDTH="170" HEIGHT="46" VSPACE="5" BORDER="0"/></A><A TARGET="_parent" HREF="/index?t=about_tc&amp;c=membr_teams"><IMG SRC="/i/teams_banner.gif" ALT="" WIDTH="170" HEIGHT="46" VSPACE="5" BORDER="0"/></A> --></TD>
          <TD CLASS="time" VALIGN="middle" NOWRAP="" ALIGN="right"><!-- <BR/><SPAN CLASS="registerToday">&#160;&#160;&#160;&#160;Current Member Count</SPAN>&#160;:&#160; <%=new DecimalFormat("#,##0").format(dcHome.getMemberCount())%> --><% if ( nav.getLoggedIn() ) { %>Welcome Back <SPAN CLASS="smallBrackets">[ </SPAN> <A href="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=<%=nav.getUser().getUserId()%>" class="statText" TARGET="_parent"><FONT color="<%=color%>"><B><%=nav.getUser().getHandle()%></B></FONT></A><SPAN CLASS="smallBrackets">]</SPAN> :<span class="time"><jsp:include page="date_time.jsp" /></SPAN><% } else { %><BR/><SPAN CLASS="smallBrackets">[ </SPAN> <A HREF="<%="https://"+request.getServerName()+"/reg/index.jsp"%>" CLASS="registerToday" TARGET="_parent">Register Today</A> :<span class="time"><%@ include file="date_time.jsp" %></span><SPAN CLASS="smallBrackets">]</SPAN><% }%><BR CLEAR="ALL"/><a href="Javascript:tcTime()" class="statText">Current time at TopCoder</a><BR/><BR/></TD> 
        </TR>
      </TABLE>
    </TD>
  </TR>
  <!-- <TR>
    <TD COLSPAN="4" BGCOLOR="#000000" ALIGN="right"><A TARGET="_parent" HREF="Javascript:arena()" CLASS="registerNav"><IMG SRC="/i/label_download_applet.gif" ALT="Download the Applet" WIDTH="134" HEIGHT="17" BORDER="0"/></A><A TARGET="_parent" HREF="/index?t=schedule&amp;c=practice_room" CLASS="registerNav"><IMG SRC="/i/label_visit_practice_room.gif" ALT="Visit the Practice Room" WIDTH="141" HEIGHT="17" BORDER="0"/></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
  </TR> -->
</TABLE>
<jsp:include page="menu.jsp" />
