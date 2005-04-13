<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
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

</head>

    <body class=corporate bgcolor="#ffffff" text="#000000" link="#0000CC" vlink="#800080" alink="#ff0000" topmargin=2>

	<div align="center">
<%-- Google Header--%>
<img src="/i/events/google2003/codejam_logo.gif" alt="Google Code Jam logo">

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
                     <jsp:param name="selectedTab" value="overview"/>
                  </jsp:include>

                  </div><br><br>

                  <table border=0 cellspacing=0 width="100%">
                     <tr>
                        <td valign="top">
                        <b><font size="+1">Tough problems. Intense competition. No pressure.</font></b>
                        <img hspace="10" vspace="5" src="/i/events/google2003/codejam_info.gif" width="150" height="390" border="0" align="right" valign="top">

                        <p><font size="-1">Do you have exceptional programming skills? Can you make computers perform like silicon puppets with just a few well-expressed commands? Are you at ease when faced with a  hard stop and a group of peers evaluating every line of your code? Here�s your opportunity to display the grace of the true professional in a reward-rich environment.
                        <br><br>
                        Google is looking for engineers with the programming skill to
                        rewrite the world's information infrastructure. The Google
                        Code Jam 2003 is one way we hope to find them. While we don't
                        impose arbitrary deadlines on our engineers, we do put a
                        premium on well-implemented code. And we appreciate the
                        thought process required to create it. In fact, we appreciate
                        clear thinking in all its forms, from
                        <a href="http://www.google.com/puzzles/">puzzle solving</a>
                        to chess mastery (one of our interns was an International
                        Grand Master).
                        <br><br>
                        <font color="006633" size="3"><b>Say it your way</b></font><br><br>
                        Use Java, C++, C# or VB.NET. Pick any of these programming languages to code your solutions. All are acceptable and none is given an advantage.
                        <br><br>
                        <font color="006633" size="3"><b>How it works</b></font><br><br>

                        Download the Google Code Jam 2003 Online Round Competition Manual <a href="/i/events/google2003/Competition_Manual_Addendum.pdf">here</a>.
                        <br><br>
                        The tournament is a timed contest where all participants compete online to solve the same problems under the same time constraints.  Here�s the line-by-line documentation:
                        <ul>
                        <strong>Download the Arena</strong><br>
                        The TopCoder&#174; Competition Arena (a Java Applet) is where you begin. Download the app, read the problem statements, then code solutions, compile and test those solutions and submit the code for points. You can download the arena ahead of time to work on sample problems prior to the competition.
                        <br><br>
                        <strong>Coding Phase</strong><br>
                        At the designated date and time, competitors enter the Arena and are placed in groups of ten into virtual rooms. All participants are presented with the same set of three problems of escalating difficulty. In a race to see who can create an accurate solution in the shortest amount of time, competitors try to out-think and out-code their opponents. The Leader Board tallies the points during each step of the competition.
                        <br><br>
                        <strong>Challenge Phase</strong><br>
                        During the Challenge Phase, competitors view each other's code and try to "break'" that code by passing test cases through the submitted code, with the hope that the results are not satisfied by the software written. Breaking another developer's code is the most direct form of competition for a programmer. In this phase, points are awarded for successful challenges and deducted for unsuccessful challenges.
                        <br><br>
                        <strong>System Tests</strong><br>
                        Within minutes of the end of the Challenge Phase, the automated, objective system tests determine the accuracy of all submissions and award final points to all competitors. The assessment of your performance and presentation of stats is nearly instantaneous, as is the gratification of knowing how you did against a competitive field.
                        </ul>
                        </font></p>

                        <font color="006633" size="3"><b>Are You Ready?</b></font>
                        <p><font size="-1">
                        Registration for the Google Code Jam 2003 opens on October 1st and ends on October 15th, 2003. Registration is unlimited, but only the top 500 scorers from the Qualification Round will advance to Round 1 of the Code Jam 2003 on October 24th.
                        <br><br>
                        The competitors with the top 250 scores from Round 1 will advance to Round 2 on October 27th. The top 25 performers in Round 2 will be invited to compete for cash prizes in the Championship Round onsite at the Googleplex (Mountain View, CA) on November 14th.
                        </font></p>

                        <ul>
                        <table width="450" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                           <tr>
                              <td class="sidebarTitle" width="30%">Date</td>
                              <td class="sidebarTitle" width="20%">Time*</td>

                              <td class="sidebarTitle" width="50%">Status</td>
                           </tr>
                           <tr valign="top">
                              <td class="sidebarText">Wednesday, October 1</td>
                              <td class="sidebarText">8:00 AM</td>
                              <td class="sidebarText">Registration Opens</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText" nowrap>Wednesday, October 15</td>
                              <td class="sidebarText">5:00 PM</td>
                              <td class="sidebarText">Registration Closes</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText">Friday, October 17</td>
                              <td class="sidebarText">8:00 AM</td>
                              <td class="sidebarText">Qualification Round begins</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText">Monday, October 20</td>
                              <td class="sidebarText">8:00 AM</td>
                              <td class="sidebarText">Qualification Round ends</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText">Friday, October 24</td>
                              <td class="sidebarText">9:00 PM</td>
                              <td class="sidebarText">Round 1 - 500 participants</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText">Monday, October 27</td>
                              <td class="sidebarText">9:00 PM</td>
                              <td class="sidebarText">Round 2 - 250 participants</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText">Friday, November 14</td>
                              <td class="sidebarText">4:00 PM</td>
                              <td class="sidebarText">Championship Round - 25 participants</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText" colspan="3">*All times are Eastern Time</td>
                           </tr>
                        </table>
                        </ul>
                        <font color="006633" size="3"><b>Prizes</b></font>
                        <p><font size="-1">
                        The 500 participants in Round 1 will receive a "Google Code Jam 2003" t-shirt. The top four scorers in the Championship Round will receive the following cash prizes:
                        <ul>
                        1st Place - $10,000<br>
                        2nd Place - $5,000<br>
                        3rd Place - $3,500<br>
                        4th Place - $1,250<br>
                        </ul>
                        Those finalists not finishing as one of the top four scorers in the Championship Round will each receive $250.

                        </td>
                     </tr>
                     <tr>
                        <td><p><br /></p>
                              <p><a href="/"><img align="right" src="/i/events/google2003/google_pbtc.gif" width="100" height="33" border="0" hspace="5"></a>
                              <font size="-1">To find out more detailed information about the Google Code Jam 2003, including a list of the prizes, please read the <a href="/pl/?module=Static&d1=google&d2=google_rules_overview">Terms and Conditions</a>.
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
<a href="/tc?module=Static&d1=about&d2=index">About TopCoder</a> -
<a href="http://www.google.com/jobs/">We're Hiring</a>
</small>
</p>
</div>
</body>
</html>