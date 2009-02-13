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
                  
                  <!-- Tab bar links-->
                  <jsp:include page="googlelinks.jsp" >
                     <jsp:param name="selectedTab" value="faq"/>
                  </jsp:include>

                  </div><br><br>

                  <table border=0 cellspacing=0 width="100%">
                     <tr>
                        <td valign="top">
                        <b><font size="+1">Google FAQs</font></b>
                        <img hspace="10" vspace="5" src="/i/events/google2003/codejam_info.gif" width="150" height="390" border="0" align="right" valign="top">

                        <p><font size="-1">
                        <font color="006633" size="3"><b>Is there a way to practice before my qualification attempt? </b></font><br><br>
Once you've registered for the Google Code Jam, you may use your handle and password to login to the competition arena.  Within the arena there is a practice area that mimics the functionality of the real competition.  Nothing that you do in the practice room will count against you.<br><br>

                        <font color="006633" size="3"><b>What resources can I use to help me during the competition?</b></font><br><br>
You may utilize any reference materials, including those found on the Internet.  You may not collaborate with any other person.<br><br>

                        <font color="006633" size="3"><b>Can I attempt to qualify more than once?</b></font><br><br>
 You may only register a single account.  Registering more than one account is a violation of the competition rules. <br><br>

                        <font color="006633" size="3"><b>Can I use code that has already been written as a part of my solution?</b></font><br><br>
Only code that has been authored by you may be used in a code submission.  No third-party source code may be used as a part of any code submission.<br><br>

                        <font color="006633" size="3"><b>I've submitted a solution for a problem, but the time has not run out.  Can I submit again?</b></font><br><br>
The Coding Phase of all online rounds following the qualification round will allow you to submit a problem more than once. If you’ve already submitted a
problem and you choose to submit again, your score for that submission will be adjusted to account for the
additional lapsed time since your last submission, as well as an additional penalty of 10% of the maximum
point value for the problem. <br><br>

                        <font color="006633" size="3"><b>What does the score that I received in the qualification round mean?</b></font><br><br>
The score that you end up with when you have completed the qualification process may or may not be your final score.  When the qualification period has ended, all submissions will be run against a series of system test cases.  If your submission produces the wrong result (or runs more than 8 seconds) for any of the test cases, you will lose your points for that submission.  The points that you receive for a submission is only a factor of the time elapsed between opening the problem statement and submitting the solution.  Whether or not you get to keep those points is determined during the system testing process.<br><br>

                        <font color="006633" size="3"><b>How will I know if I have qualified for the first round of the Google Code Jam?</b></font><br><br>
Shortly following the qualification period, the testing will be done.  As soon as the testing is completed the qualifiers for the first round will be posted <a href="/pl/?module=Static&d1=google&d2=google_overview">here</a>.  In addition, an email will be sent to all qualifiers indicating whether or not each has advanced.<br><br>

                        </font>
                        </p>
                        </td>
                     </tr>
                     <tr>
                        <td><p><br /></p>
                              <p><a href="/"><img align="right" src="/i/events/google2003/google_pbtc.gif" width="100" height="33" border="0" hspace="5"></a>
                              <font size="-1">To find out more detailed information about the Google Code Jam 2003, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=google&d2=google_rules_overview">Terms and Conditions</a>.
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
<a href="/?t=about_tc&c=index">About TopCoder</a> -
<a href="http://www.google.com/jobs/">We're Hiring</a>
</small>
</p>
</div>
</body>
</html>