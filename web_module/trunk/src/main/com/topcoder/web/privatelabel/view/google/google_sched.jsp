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

<!-- TCO Header -->

<a name="top_page"></a>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
   <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
         <td valign="top" width="150">
            <img src="/i/clear.gif" width="150" height="10" border="0"/><br />

            <table border="0" width="100%" cellspacing="0" cellpadding="0">
               <tr><td bgcolor="#AA1002" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
               <tr>
                  <td bgcolor="#AA1002">
                  <td class="bodyText" valign="top" align="center">
                  <a href="/"><img src="/i/events/google2003/pbtc_white.gif" width="150" height="50" border="0"/></a>
                  </td>
                  <td bgcolor="#AA1002">
               </tr>
               <tr><td bgcolor="#AA1002" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
            </table><br />

            <table border="0" width="100%" cellspacing="0" cellpadding="0">
               <tr><td bgcolor="#3366CC" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
               <tr>
                  <td bgcolor="#3366CC">
                  <td class="bodyText" valign="top" align="center">
                  <p><br /></p>
                  <p><font color="#3366CC"><b>Important Dates</b></font></p>
                  <p><b>Registration Starts</b><br />
                  Wednesday, October 1st</p>
                  <p><b>Online Round 1</b><br />
                  Friday, October 24th</p>
                  <p><b>Onsite Championship Round</b><br />
                  Friday, November 14th</p>
                  <p><br /></p>
                  </td>
                  <td bgcolor="#3366CC">
               </tr>
               <tr><td bgcolor="#3366CC" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
            </table><br />

            <table border="0" width="100%" cellspacing="0" cellpadding="0">
               <tr><td bgcolor="#339966" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
               <tr>
               <td bgcolor="#339966">
               <td class="bodyText" align="center" valign="top">
               <p><br /></p>
               <p><font color="#339966"><b>Cash Prizes</b></font></p>
               <p>1st Place - $10,000<br />
               2nd Place - $5,000<br />
               3rd Place - $3,500<br />
               4th Place - $1,250</p>
               <p><br /></p>
               </td>
               <td bgcolor="#339966">
               </tr>
               <tr><td bgcolor="#339966" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
            </table><br />
     
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins-->
         <td width="100%" valign="top" class="bodyText">
       
         <table  width="100%" align="center" border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr><td colspan="9"><img src="/i/clear.gif" width="10" height="10"></td></tr>
            <tr><td colspan="9" align="center"><img src="/i/events/google2003/google_logo_white.gif" width="300" height="150" border="0"/></td></tr>
            <tr><td colspan="9"><img src="/i/clear.gif" width="10" height="10"></td></tr>
            <tr><td colspan="9" align="center"><img src="/i/events/google2003/google_tagline.gif" width="173" height="15" border="0"/></td></tr>
            <tr><td colspan="9"><img src="/i/clear.gif" width="10" height="20"></td></tr>

            <tr>
               <td width="50%">&nbsp;</td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_overview"><font size=-1>Overview</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td id=0 bgcolor=#3366cc align=center width=95 nowrap><font color=#ffffff size=-1><b>Schedule</b></font></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_rules_overview"><font size=-1><img src="/i/events/google2003/rules_arrow_blue.gif" width="15" height="10" border="0"/>Rules</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_registration"><font size=-1>Register Now</font></a></td>
               <td width="50%">&nbsp;</td>
            </tr>
            <tr>
               <td colspan=9 bgcolor=#3366cc><img width=1 height=1 alt=""></td>
            </tr>
         </table><br />

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

    </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="google_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>