<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder - Portal</TITLE>
<jsp:include page="script.jsp"/>
</HEAD>
<% String appContext = request.getContextPath(); %> 
<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/p/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
<!-- Body Area -->

      <% Exception excCaught = (Exception)request.getAttribute("caught-exception");
         String contentPane;
         if( excCaught != null ) {
            contentPane = "error-pane.jsp";
//            excCaught.printStackTrace(new java.io.PrintWriter(out));
         }
         else {
            contentPane = "content-pane.jsp";
         }
      %>
      <jsp:include page="<%=contentPane%>"/>

<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/p/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="includes/foot.jsp"/>

</BODY>
</HTML>
