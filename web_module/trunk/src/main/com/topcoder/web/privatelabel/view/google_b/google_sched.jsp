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

            <h2>Schedule</h2>
            
<!-- Qualification Rounds begins -->
           <p><span class="bodySubtitle">Qualification Rounds</span><br />
           The top 100 scorers from each problem presented during the Qualification Round will be eligible to compete in Round 1 of the Extreme Challenge.</p>

            <a name="sched"></a>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Qualification Round</td>
                    <td class="sidebarText">
                        8:00 AM Friday, October 17 through<br />
                        8:00 AM Monday, October 20<br />
                    </td>
                    <td class="sidebarText" align="center">All eligible members</td>
                    <td class="sidebarText" align="center">100</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. In the event a Qualification Round must be cancelled for any reason, the "raindate" 
                        will be the following day at the same time.
                    </td>
                </tr>
            </table><br />
<!-- Qualification Rounds ends -->

<!-- Online Elimination Rounds begins -->
            <A name="online"></A><p><span class="bodySubtitle">Online Elimination Rounds</span><br />
            Everyone who competes in Round 1 must log in to the TopCoder Competition Arena no later than ten minutes prior to the start of 
            the online round.  All start times will be communicated as Eastern Time.  If a coder does not participate, for any reason, in an online 
            round he/she has advanced to, it will be treated as an automatic loss in that round of competition. </p>
            
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round 1</td>
                    <td class="sidebarText">
                        Friday, October 24th<br />
                        Sign in:  8:55 PM<br />
                        START: 9:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">500</td>
                    <td class="sidebarText" align="center">250</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round 2</td>
                    <td class="sidebarText">
                        Monday, October 27th<br />
                        START: 9:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">250</td>
                    <td class="sidebarText" align="center">25</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. In the event a Qualification Round must be cancelled for any reason, the "raindate" 
                        will be the following day at the same time.
                    </td>
                </tr>
            </table>
<!-- Online Elimination Rounds ends -->

<!-- Onsite Championship Round begins -->
            <p><span class="bodySubtitle">Onsite Championship Round</span><br />
            Up to 25 coders will compete in the Championship Round being held onsite at Google’s headquarters.  Each finalist is responsible for arriving at Google’s headquarters to compete.</p>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Onsite Championship Round</td>
                    <td class="sidebarText">
                        Friday, November 14th<br />
                        START: 3:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">25</td>
                    <td class="sidebarText" align="center">n/a</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. The times of the onsite rounds are subject to change.
                    </td>
                </tr>
            </table><br />
            
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