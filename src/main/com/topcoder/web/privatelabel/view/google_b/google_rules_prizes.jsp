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

        <td width="176" valign="top" colspan="2" bgcolor="#B8B8B8"><img src="/i/events/google2003/Logo_60gry.gif" width="176" height="77" border="0"/></td>

         <td width="100%" align="center" colspan="3">
         <OBJECT 
            classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            WIDTH="100%" HEIGHT="80" id="google" ALIGN="">
         <PARAM NAME=movie VALUE="google.swf">
         <PARAM NAME=quality VALUE=high> <PARAM NAME=salign VALUE=T>
         <PARAM NAME=bgcolor VALUE=#FFFFFF>
         <EMBED 
            src="/i/events/google2003/google.swf" 
            quality="high" 
            salign="T" 
            bgcolor="#FFFFFF"  
            WIDTH="100%" 
            HEIGHT="80" 
            NAME="google" 
            ALIGN="" 
            TYPE="application/x-shockwave-flash" 
            PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
         </EMBED>
         </OBJECT><br />
      </td>
        <td width="176" valign="top" colspan="2" bgcolor="#B8B8B8"><img src="/i/events/google2003/pbtc_gray.gif" width="176" height="77" border="0"/></td>
   </tr>
   
   <tr>
      <td colspan="7" width ="100%" align="center">
         <OBJECT 
            classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            WIDTH="100%" HEIGHT="150" id="google" ALIGN="">
         <PARAM NAME=movie VALUE="googletabs.swf">
         <PARAM NAME=quality VALUE=high> <PARAM NAME=salign VALUE=T>
         <PARAM NAME=bgcolor VALUE=#FFFFFF>
         <EMBED 
            src="/i/events/google2003/googletabs.swf" 
            quality="high" 
            salign="T" 
            bgcolor="#FFFFFF"  
            WIDTH="100%" 
            HEIGHT="150" 
            NAME="google" 
            ALIGN="" 
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
       
            <h2>Prizes</h2>
            
            <p>All participants who compete in Round 1 will receive a Google Extreme Challenge t-shirt.  In addition, the 25 finalists 
            in the Championship Round will receive cash prizes.  Any and all applicable taxes on prizes are the sole responsibility of 
            the prizewinner.  Prizes will be distributed as follows:</p>
            
            <a name="sched"></a>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="50%">Competitiors</td>
                    <td class="sidebarTitle" width="50%" align="right">Prize</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Up to 500 competitors who compete in Round 1 </td>
                    <td class="sidebarText" align="right">Google Extreme Coding Challenge t-shirt</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">21 finalists not finishing with one of the top 4 scores* in the Championship Round</td>
                    <td class="sidebarText" align="right">$250 each</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">4th place finisher* in the Championship Round </td>
                    <td class="sidebarText" align="right">$1,250</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">3rd place finisher* in the Championship Round</td>
                    <td class="sidebarText" align="right">$3,500</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">2nd place finisher* in the Championship Round</td>
                    <td class="sidebarText" align="right">$5,000</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText"><b>1st place finisher* - Tournament Champion</b></td>
                    <td class="sidebarText" align="right"><b>$10,000</b></td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="2">
                        *Prize will be awarded at the conclusion of the Championship Round.  Winner must be present at the onsite rounds to receive prize..
                    </td>
                </tr>
            </table><br />
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