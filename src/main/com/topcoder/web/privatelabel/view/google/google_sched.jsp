<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link rel=stylesheet href="http://www.google.com/google.css">

<title>Google Code Jam 2003</title>

<style><!--
body,td,font,p,a
{
    font-family:arial,sans-serif
	}
.sidebarBox
{
	border: 1px solid #95D597;
	}
.sidebarText
{
	color: #333;
	line-height: 14px;
	background-color: #EEEEEE;
	}
.sidebarTitle
{
	color: #333;
	background-color: #CCCCCC;
	}
//-->
</style>

<jsp:include page="../script.jsp" />

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

</head>

    <body class=corporate bgcolor="#ffffff" text="#000000" link="#0000CC" vlink="#800080" alink="#ff0000" topmargin=2>
	
	<div align="center">
<%-- Google Header--%>
<img width="276" height="110" src="http://www.google.com/codejam/codejam_logo.gif" alt="Google Code Jam logo">

<table border=0 cellspacing=5 width="740">
   <tr> 
      <td style="background-color: #006633">
         <table class=sidebar bgcolor="#ffffff" cellpadding=15 cellspacing=0 border=0 width="100%">
            <tr>
               <td valign="top">
                  <div class=content> 
                  <div align="center">
	            <font size="-1">
                     <a href="/pl/?&module=Static&d1=google&d2=google_overview">Overview</a> &nbsp;|&nbsp; 
                     <font color="006633">Schedule</font> &nbsp;|&nbsp; 
                     <a href="/pl/?&module=Static&d1=google&d2=google_rules_overview">Rules</a> &nbsp;|&nbsp; 
                     <a href="/pl/?&module=Static&d1=google&d2=google_registration">Registration</a> &nbsp;|&nbsp; 
                     <a href="/pl/?&module=Static&d1=google&d2=google_practice">Practice Arena</a> &nbsp;|&nbsp; 
<%--                     <a href="Javascript:openWin('?module=Static&d1=google&d2=google_quick_launch','comp',300,225);">Practice Arena</a>--%>
                  </font>
                  </div><br><br>
                  
                  <table border=0 cellspacing=0 width="100%">
                     <tr>
                        <td valign="top">
                        <b><font size="+1">Schedule</font></b>
                        <img hspace="10" vspace="5" src="/i/events/google2003/codejam_info.gif" width="150" height="390" border="0" align="right" valign="top">
                        
<!-- Qualification Rounds begins -->
                  <p><font color="006633" size="3"><b>Qualification Rounds</b></font></p>
                  <p><font size="-1">The top 100 scorers from each problem presented during the Qualification Round will be eligible to compete in Round 1 of the Code Jam 2003.</font></p>

                     <a name="sched"></a>
                     <table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                        <tr>
                           <td class="sidebarTitle" width="25%">Round</td>
                           <td class="sidebarTitle" width="35%">Date and Time*</td>
                           <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                           <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                        </tr>
                        <tr valign="top">
                           <td class="sidebarText">Qualification Round</td>
                           <td class="sidebarText">8:00 AM Friday, October 17 through<br />
                              8:00 AM Monday, October 20<br />
                           </td>
                           <td class="sidebarText" align="center">All eligible members</td>
                           <td class="sidebarText" align="center">500</td>
                        </tr>

                        <tr valign="top">
                           <td class="sidebarText" colspan="4">
                           *NOTE: All times are Eastern Time
                           </td>
                        </tr>
                     </table>
            
<!-- Qualification Rounds ends -->

<!-- Online Elimination Rounds begins -->
                  <p><A name="online"></A><font color="006633" size="3"><b>Online Elimination Rounds</b></font></p>
                  <p><font size="-1">Everyone who competes in Round 1 must log in to the TopCoder Competition Arena no later than ten minutes prior to the start of 
                  the online round.  All start times will be communicated as Eastern Time.  If a coder does not participate, for any reason, in an online 
                  round he/she has advanced to, it will be treated as an automatic loss in that round of competition. </font></p>
            
                  <table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
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
                           *NOTE: All times are Eastern Time. In the event that an online round must be cancelled for any reason, the "raindate" 
                           will be the following day at the same time.
                        </td>
                     </tr>
                  </table>
            
<!-- Online Elimination Rounds ends -->

<!-- Onsite Championship Round begins -->
                  <p><font color="006633" size="3"><b>Onsite Championship Round</b></font></p>
                  <p><font size="-1">Up to 25 coders will compete in the Championship Round being held onsite at Google's headquarters.  Each finalist is responsible for arriving at Google's headquarters to compete.</font></p>
            
                  <table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                     <tr>
                        <td class="sidebarTitle" width="25%">Round</td>
                        <td class="sidebarTitle" width="35%">Date and Time*</td>
                        <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                        <td class="sidebarTitle" width="19%" align="center"># of Advancers</td> 
                     </tr>
                     <tr valign="top">
                        <td class="sidebarText">Championship Round</td>
                        <td class="sidebarText">
                           Friday, November 14th<br />
                           START: 3:00 PM<br />
                        </td>
                        <td class="sidebarText" align="center">25</td>
                        <td class="sidebarText" align="center">n/a</td>
                     </tr>

                     <tr valign="top">
                        <td class="sidebarText" colspan="4">
                           *NOTE: All times are Eastern Time. The time of the onsite round is subject to change.
                        </td>
                     </tr>
                  </table>
            
                        </td>
                     </tr>
                     <tr>
                        <td><p><br /></p>
                              <p><a href="http://www.topcoder.com"><img align="right" src="/i/events/google2003/google_pbtc.gif" width="100" height="33" border="0" hspace="5"></a>
                              <font size="-1">To find out more detailed information about the Google Code Jam 2003, including a list of the prizes, please read the <a href="http://www.topcoder.com/pl/?&module=Static&d1=google&d2=google_rules_conditions">Terms and Conditions</a>.
                              </font></p>
                        </td>
                     </tr>
                  </table>
                  </div>
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>
</div>
<p><div class=footer> 
<small> &copy;2003 Google - 
<a href="http://www.google.com/">Home</a> - 
<a href="http://www.google.com/about.html">All About Google</a> - 
<a href="http://www.topcoder.com/?t=about_tc&c=index">About TopCoder</a> - 
<a href="http://www.google.com/jobs/">We're Hiring</a> 
</small>
</p>
</div>
</body>
</html>