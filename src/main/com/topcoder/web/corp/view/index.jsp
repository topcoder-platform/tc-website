<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         errorPage="exc/InternalError.jsp"
         import="com.topcoder.web.corp.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder Corporate</TITLE>
<script language="JavaScript" src="/js/script.js"></script>
</HEAD>
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
      <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"></TD>
      <!-- Gutter Ends -->

<!-- Body Area -->

      <TD CLASS="statTextBig" width="100%" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="95%">
                <TR>
                       <TD VALIGN="top" WIDTH="50%" CLASS="bodyText">
                       <FONT SIZE="3" COLOR="#666666"><B>Candidate Evaluation Application</B></FONT><BR><BR>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
                      <A HREF="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=screening&d2=index" CLASS="bodyText">Learn More &gt;</A>
                       </TD>
                       <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="8" HEIGHT="1"></TD>
                       <TD VALIGN="top" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1"></TD>
                       <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="8" HEIGHT="1"></TD>
                       <TD VALIGN="top" WIDTH="50%" CLASS="bodyText">
                       <FONT SIZE="3" COLOR="#666666"><B>TCES - TopCoder Employment Services</B></FONT><BR><BR>
                       Dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
                       tuer adipiscing elit, sed diam nut laoreet dolore magna aliquam erat volu adminim veniam, q
                      <A HREF="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=tces&d2=index" CLASS="bodyText">Learn More &gt;</A>                 
                       </TD>
                </TR>
                <TR>
                       <TD COLSPAN="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="6"></TD>
                </TR>                           
                <TR>
                       <TD BGCOLOR="#CCCCCC" COLSPAN="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1"></TD>
                </TR>           
                <TR>
                       <TD COLSPAN="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD>
                </TR>
                <TR>
                       <TD VALIGN="top" WIDTH="50%" CLASS="bodyText">
                       <FONT SIZE="3" COLOR="#666666"><B>Premium Content</B></FONT><BR><BR>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat voctetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       Rt wisi enim adminim veniam, quis nostrud exerci.lutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
                      <A HREF="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=prem_content&d2=index" CLASS="bodyText">Learn More &gt;</A>
                       </TD>
                       <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="8" HEIGHT="1"></TD>
                       <TD VALIGN="top" WIDTH="1" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1"></TD>
                       <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="8" HEIGHT="1"></TD>
                       <TD VALIGN="top" WIDTH="50%" CLASS="bodyText">
                       <FONT SIZE="3" COLOR="#666666"><B>Account Administration</B></FONT><BR><BR>
                       Dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat volutpased diam nonummy nibh euismod tincidunt 
                       Nagna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
                       tuer adipiscing elit, sed diam nut laoreet dolore magna aliquam erat volu adminim veniam, qt. Ut 
                       wisi enim adminim veniam, quis nostrud exerci. 
                       tuer adipiscing elit, sedsed dagna aliquam erat volu adminim veniam, qveniam, q
                      <A HREF="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=acc_admin&d2=index" CLASS="bodyText">Manage Account&nbsp;&gt;</A>                      
                       </TD>
                </TR>
                <TR>
                       <TD COLSPAN="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="6"></TD>
                </TR>                           
                <TR>
                       <TD BGCOLOR="#CCCCCC" COLSPAN="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1"></TD>
                </TR>           
                <TR>
                       <TD COLSPAN="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8"></TD>
                </TR>
                <TR>
                       <TD VALIGN="top" WIDTH="50%" CLASS="bodyText">
                       <FONT SIZE="3" COLOR="#666666"><B>[TC] Sponsor Program</B></FONT><BR><BR>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat voctetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       Rt wisi enim adminim veniam, quis nostrud exerci.lutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
                      <A HREF="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=spon_prog&d2=index" CLASS="bodyText">Learn More &gt;</A>
                       </TD>
                       <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="8" HEIGHT="1"></TD>
                       <TD VALIGN="top" WIDTH="1" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1"></TD>
                       <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="8" HEIGHT="1"></TD>
                       <TD VALIGN="top" WIDTH="50%" CLASS="bodyText">&#160;</TD>
                </TR>           
                                                
         </TABLE>
<P><BR></P>    
     </TD>

<!-- Body Area Ends -->

      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="includes/foot.jsp"/>

</BODY>
</HTML>
