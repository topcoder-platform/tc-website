<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         errorPage="exc/InternalError.jsp"
         import="com.topcoder.web.corp.Constants" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>TopCoder Corporate</title>
<script language="JavaScript" src="/js/script.js"></script>
</head>
<body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
<jsp:include page="includes/top.jsp"/>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
    <!-- Left Column Begins -->
      <td width="170" valign="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </td>
      <!-- Left Column Ends -->

      <!-- Gutter Begins -->
      <td valign="top"><img src="/i/clear.gif" width="10" height="1"></td>
      <!-- Gutter Ends -->

<!-- Body Area -->

      <td class="statTextBig" width="100%" valign="top"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
         <table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" width="100%">
                <tr>
                       <td valign="top" width="50%" class="bodyText">
                       <font size="3" color="#666666"><b>Candidate Screening</b></font><br><br>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
                      <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=screening&d2=index" class="bodyText">Learn More &gt;</a>
                       </td>
                       <td valign="top"><img src="/i/clear.gif" width="8" height="1"></td>
                       <td valign="top" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="1" height="1"></td>
                       <td valign="top"><img src="/i/clear.gif" width="8" height="1"></td>
                       <td valign="top" width="50%" class="bodyText">
                       <font size="3" color="#666666"><b>Employment Services</b></font><br><br>
                       Dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
                       tuer adipiscing elit, sed diam nut laoreet dolore magna aliquam erat volu adminim veniam, q
                      <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=tces&d2=index" class="bodyText">Learn More &gt;</a>                 
                       </td>
                </tr>
                <tr>
                       <td colspan="5"><img src="/i/clear.gif" width="1" height="6"></td>
                </tr>                           
                <tr>
                       <td bgcolor="#CCCCCC" colspan="5"><img src="/i/clear.gif" width="1" height="1"></td>
                </tr>           
                <tr>
                       <td colspan="5"><img src="/i/clear.gif" width="1" height="8"></td>
                </tr>
                <tr>
                       <td valign="top" width="50%" class="bodyText">
                       <font size="3" color="#666666"><b>Premium Content</b></font><br><br>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat voctetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       Rt wisi enim adminim veniam, quis nostrud exerci.lutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
                      <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=prem_content&d2=index" class="bodyText">Learn More &gt;</a>
                       </td>
                       <td valign="top"><img src="/i/clear.gif" width="8" height="1"></td>
                       <td valign="top" width="1" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="1" height="1"></td>
                       <td valign="top"><img src="/i/clear.gif" width="8" height="1"></td>
                       <td valign="top" width="50%" class="bodyText">
                       <font size="3" color="#666666"><b>Account Administration</b></font><br><br>
                       Dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat volutpased diam nonummy nibh euismod tincidunt 
                       Nagna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
                       tuer adipiscing elit, sed diam nut laoreet dolore magna aliquam erat volu adminim veniam, qt. Ut 
                       wisi enim adminim veniam, quis nostrud exerci. 
                       tuer adipiscing elit, sedsed dagna aliquam erat volu adminim veniam, qveniam, q
                      <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=acc_admin&d2=index" class="bodyText">Manage Account&nbsp;&gt;</a>                      
                       </td>
                </tr>
                <tr>
                       <td colspan="5"><img src="/i/clear.gif" width="1" height="6"></td>
                </tr>                           
                <tr>
                       <td bgcolor="#CCCCCC" colspan="5"><img src="/i/clear.gif" width="1" height="1"></td>
                </tr>           
                <tr>
                       <td colspan="5"><img src="/i/clear.gif" width="1" height="8"></td>
                </tr>
                <tr>
                       <td valign="top" width="50%" class="bodyText">
                       <font size="3" color="#666666"><b>Sponsorship</b></font><br><br>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat voctetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       Rt wisi enim adminim veniam, quis nostrud exerci.lutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
                      <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=spon_prog&d2=index" class="bodyText">Learn More &gt;</a>
                       </td>
                       <td valign="top"><img src="/i/clear.gif" width="8" height="1"></td>
                       <td valign="top" width="1" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="1" height="1"></td>
                       <td valign="top"><img src="/i/clear.gif" width="8" height="1"></td>
                       <td valign="top" width="50%" class="bodyText">&#160;</td>
                </tr>           
                                                
         </table>
<p><br></p>    
     </td>

<!-- Body Area Ends -->

      <!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
      <!-- Gutter Ends -->
   </tr>
</table>
  <!-- Body Ends -->

  <jsp:include page="includes/foot.jsp"/>

</body>
</html>
