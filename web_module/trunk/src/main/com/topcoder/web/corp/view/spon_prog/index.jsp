<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.corp.Constants"
         errorPage="../exc/InternalError.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<title>TopCoder Corporate Services</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css" />

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
        <jsp:include page="../includes/left.jsp">
            <jsp:param name="level1" value="sponsorship"/>
            <jsp:param name="level2" value="index"/>
        </jsp:include>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD width="100%" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<table border="0" width="100%"><tr><td CLASS="bodyText" width="100%">
<FONT SIZE="3" COLOR="#666666"><B>TopCoder Sponsor Program</B></FONT><BR/>
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
     <form method="POST" action="<%=request.getContextPath()%>/Tx/?op=begin">
       <input type="hidden" name="back-to" value="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>"/>
       <input type="hidden" name="prod-id" value="1"/> <!-- product id -->
       <table>
         <tr><td width="100%" align ="center"><input type="submit" value=" buy it "/></td></tr>
       </table>
     </form>
</td></tr>
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="30"><IMG SRC="/i/clear.gif" WIDTH="30" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="../includes/foot.jsp"/>

</BODY>
</HTML>
