<%@  page
  language="java"
  isErrorPage="true" 
  import="com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>
<% String appContext = request.getContextPath(); %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Recruiting Reports</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/corpStyle.css">
    <jsp:include page="script.jsp" />
    
  </HEAD>
  <body>

  
  
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">
     <TR>
        <TD WIDTH="15" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
        <TD WIDTH="206" BGCOLOR="#000000"><A HREF="/?t=index" TARGET="_parent"><IMG SRC="/i/logo.gif" WIDTH="206" HEIGHT="49" BORDER="0" VSPACE="10"/></A></TD>
        <TD WIDTH="20" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" HSPACE="35"/></TD>
        <TD WIDTH="100%" BGCOLOR="#000000" ALIGN="right" VALIGN="top">
          <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
            <TR>
              <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><A TARGET="_parent" HREF="/?&amp;t=tces&amp;c=index"><IMG SRC="/i/tces_button.gif" ALT="" WIDTH="102" HEIGHT="17" BORDER="0"/></A></TD>
              <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif" CLASS="time" NOWRAP="0">
                <SPAN CLASS="registerToday">ERROR</SPAN></TD>              
              <TD VALIGN="middle" BGCOLOR="#43515E" WIDTH="100%" BACKGROUND="/i/steel_gray_bg.gif" ALIGN="right" CLASS="globalNavSmall" NOWRAP="0">&#160;<A HREF="/?t=index" CLASS="globalNavSmall" TARGET="_parent">TopCoder Home</A></TD>
              <TD WIDTH="50" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0" VSPACE="8"/></TD>
            </TR>
          </TABLE>
        </TD>
      </TR>
    </TABLE>


    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
    <TD CLASS="registerNav" WIDTH="10" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="21" BORDER="0"></TD></TD>            
    <TD WIDTH="100%" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000" class="bodyText" VALIGN="middle"><A HREF="/?t=tces&c=index" CLASS="subNav" TARGET="_parent">TCES Program</A>&#160;&#160;|&#160;&#160;<A HREF="/tces/?task=MainTask" CLASS="subNav" TARGET="_parent">Campaign List</A></TD>
    </TR>
    </TABLE>



  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">
<!-- Left Column Begins -->
      <TD WIDTH="25"><img src="/i/clear.gif" width="25" HEIGHT="11" alt="" BORDER="0"></TD>
<!-- Left Column Ends -->

      <!-- Gutter Begins -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="8"></TD>
       <!-- Gutter Ends -->
       <!-- Body Area -->
       <!-- Center Column Begins -->
      <TD class="bodyText" width="100%"><img src="/i/clear.gif" width="400" HEIGHT="11" BORDER="0"><BR>

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
          <TR>
            <TD WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="bodyText" COLSPAN="2" VALIGN="top" WIDTH="100%">
              <IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P></P>
              <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                <TR>
                  <TD class="bodyText" HEIGHT="18" COLSPAN="20"><BR></TD>                  
                </TR>                
                <TR>
                  <TD class="bodyText" HEIGHT="18" align="left" colspan="20">

                      <!-- Error message content pane -->
     An error has occurred.  If you would like to report this to TopCoder click <A class="bodyText" HREF="mailto:service@topcoder.com">here</A>.
<%if (exception!=null) exception.printStackTrace();%>
<%--
<!-- web-app debug time stack trace  BEGIN -->
<hr><b><i>Trace information is provided for web application debug time only</i></b><br>
<pre>
<% 
Exception excCaught = (Exception)request.getAttribute("caught-exception");
if( excCaught != null ) { 
     excCaught.printStackTrace(new java.io.PrintWriter(out));
}
else if ( exception!=null ) exception.printStackTrace(new java.io.PrintWriter(out));
%>
</pre>
<hr>
<!-- web-app debug time stack trace END -->
--%>


                  </TD>
                </TR>

              </TABLE>
              <P><BR></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>

</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
      <!-- Right Column Begins -->
      <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
        <!-- Right Column Include Begins -->
        <!--include virtual="/includes/public_right_col.shtml"-->
        <!-- Right Column Include Ends -->
      </TD>
      <!-- Right Column Ends -->
      <!-- Gutter -->
      <TD WIDTH="25"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
    </TR>
</TABLE>

<!-- Footer begins -->
<jsp:include page="foot.jsp" />             
<!-- Footer ends -->

</BODY>
</HTML>
