<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<title>TopCoder Corporate Services</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="../includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="../includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG src="/i/corp/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD width="100%" valign="top"><img src="/i/corp/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<table border="0" width="100%"><tr><td CLASS="bodyText" width="100%">
<FONT SIZE="3" COLOR="#666666"><B>Premium Content</B></FONT><BR/>
<P>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci.
</P>

<P>
olor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci.
                       tuer adipiscing elit, sed diam nut laoreet dolore magna aliquam erat volu adminim veniam.
</P>

<P>
Oem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                       ut laoreet dolore magna aliquam erat voctetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                       Rt wisi enim adminim veniam, quis nostrud exerci.lutpat. Ut wisi enim adminim veniam, quis nostrud exerci.
</P>

<P>
                       Dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                       ut laoreet dolore magna aliquam erat volutpased diam nonummy nibh euismod tincidunt
                       Nagna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci.
                       tuer adipiscing elit, sed diam nut laoreet dolore magna aliquam erat volu adminim veniam, qt. Ut
                       wisi enim adminim veniam, quis nostrud exerci.
                       tuer adipiscing elit, sedsed dagna aliquam erat volu adminim veniam, qveniam.
</P>
<P><BR/></P>
</td></tr>
<tr><td>
<%--
 <table>
         <tr><td width="100%" align ="center"><a href="<%=request.getContextPath()+"/Tx/?"+TransactionServlet.KEY_OPERATION+"="+TransactionServlet.OP_TERMS+"&back-to="+request.getAttribute(Constants.KEY_LINK_PREFIX)+"&prod-id=1"%>">buy it</a></td></tr>
       </table>
       --%>
     </form>
</td></tr>
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="30"><IMG src="/i/corp/clear.gif" WIDTH="30" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/foot.jsp"/>

</BODY>
</HTML>
