<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<a name="top_page"></a>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
   <tr>

<!-- TCO Header -->

        <td width="176" valign="top" colspan="2" bgcolor="#B8B8B8"><img src="/i/clear.gif" width="176" height="77" border="0"/></td>

         <td width="100%" align="center" colspan="3" bgcolor="#B8B8B8">
            <img src="/i/clear.gif" width="300" height="10" border="0"/><br />
            <img src="/i/events/google2003/google_logo.gif" width="300" height="150" border="0"/>
         </td>
        <td width="176" valign="top" colspan="2" bgcolor="#B8B8B8"><img src="/i/events/google2003/pbtc_gray.gif" width="176" height="77" border="0"/></td>
   </tr>
   
   <tr>
      <td colspan="7" width ="100%" align="center">
       
         <OBJECT
                  type="application/x-shockwave-flash"
                  data="/i/events/google2003/google.swf"
                  classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
                  WIDTH="100%" 
                  HEIGHT="150" 
                  id="googletabs">
               <PARAM NAME=movie VALUE="/i/events/google2003/googletabs.swf">
               <PARAM NAME=quality VALUE=high>
               <PARAM NAME=bgcolor VALUE=#FFFFFF>
               <EMBED 
                  src="/i/events/google2003/googletabs.swf" 
                  quality=high 
                  bgcolor="#FFFFFF"  
                  WIDTH="100%" 
                  HEIGHT="150" 
                  NAME="googletabs" 
                  TYPE="application/x-shockwave-flash" 
                  PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
               </EMBED>
            </OBJECT><br />
            
        </td>
     </tr>

<!-- Gutter Begins -->
   <tr>
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
        <td width="150" valign="top"><img src="/i/clear.gif" width="150" height="1" border="0"/></td>
<!--Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins-->
         <td class="bodyText" valign="top">
            <img src="/i/clear.gif" width="500" height="1" border="0"/><br />
       
            <h2>Eligibility</h2>
            
            <p>The Google Extreme Challenge is open to citizens and lawful permanent residents of the U.S. (including the U.S. territories of Guam, 
            Puerto Rico and the U.S. Virgin Islands), and to all non-immigrants currently in the U.S. with a valid visa, who are 18 years of 
            age or older.</p>
            
            <p><br /></p>
                        
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
        <td width="150" valign="top"><img src="/i/clear.gif" width="150" height="1" border="0"/></td>
<!--Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="google_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>