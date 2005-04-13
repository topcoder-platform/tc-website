<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google04.css"/>
<title>Google Code Jam 2004, Powered by TopCoder</title>
<jsp:include page="../script.jsp" />
</head>
<body>


<table border=0 width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width="49%">&#160;</td>
		<td align=center>
			<table border=0 width=100% cellpadding=0 cellspacing=0>
				<tr>
					<td width="49%"></td>
					<td valign=bottom align=center><img border=0 src="/i/events/google2004/codejamLogo.gif" alt="Google Code Jam logo"></td>
					<td width="49%"></td>
				</tr>
			</table>
		</td>
		<td width="49%"></td>
	</tr>
	<tr>
		<td width="49%">&#160;</td>
		<td>
			<div class=greenBigBox>

			<!-- Tab bar links-->
			<div align=center>
			<jsp:include page="links.jsp" >
			<jsp:param name="selectedTab" value="overview"/>
			</jsp:include>
			</div>

			<br/><br/>

			<span class=bigTitle>Tough problems. Intense competition. No pressure.</span>
			<span valign=top>
			<jsp:include page="right.jsp" />
			</span>

			<br/><br/>
			Do you have exceptional programming skills? Can you make computers perform like silicon puppets with just a few well-expressed commands? Are you at ease when faced with a hard stop and a group of peers evaluating every line of your code? Here�s your opportunity to display the grace of the true professional in a reward-rich environment.
			<br/><br/>
			Google is looking for engineers with the programming skill to rewrite the world's information infrastructure. The Google Code Jam 2004 is one way we hope to find them. While we don't impose arbitrary deadlines on our engineers, we do put a premium on well-implemented code. And we appreciate the thought process required to create it. In fact, we appreciate clear thinking in all its forms, from puzzle solving to chess mastery (one of our interns was an International Grand Master).
			<br/><br/>
			<span class=greenSubtitle>Say it your way</span>
			<br/><br/>
			Use Java, C++, C# or VB.NET. Pick any of these programming languages to code your solutions. All are acceptable and none is given an advantage.
			<br/><br/>
			<span class=greenSubtitle>How it works</span>
			<br/><br/>
			Download the Google Code Jam 2004 Competition Manual <a href="/i/events/google2004/competitionManual2.pdf">here</a>.
			<br/><br/>
			The tournament is a timed contest where all participants compete online to solve the same problems under the same time constraints. Here�s the line-by-line documentation:
			<br/><br/>
			<div class=indented>
				<b>Download the Arena</b><br/>
				The TopCoder� Competition Arena (a Java Applet) is where you begin. Download the app, read the problem statements, then code solutions, compile and test those solutions and submit the code for points. You can download the arena ahead of time to practice on sample problems prior to the competition.
				<br/><br/>
				<b>Coding Phase</b><br/>
				At the designated date and time, competitors enter the Arena and are placed in groups of ten into virtual rooms. All participants are presented with the same set of three problems of escalating difficulty. In a race to see who can create an accurate solution in the shortest amount of time, competitors try to out-think and out-code their opponents. The Leader Board tallies the points during each step of the competition.
				<br/><br/>
				<b>Challenge Phase</b><br/>
				During the Challenge Phase, competitors view each other's code and try to "break'" that code by passing test cases through the submitted code, with the hope that the results are not satisfied by the software written. Breaking another developer's code is the most direct form of competition for a programmer. In this phase, points are awarded for successful challenges and deducted for unsuccessful challenges.
				<br/><br/>
				<b>System Tests</b><br/>
				Within minutes of the end of the Challenge Phase, the automated, objective system tests determine the accuracy of all submissions and award final points to all competitors. The assessment of your performance and presentation of stats is nearly instantaneous, as is the gratification of knowing how you did against a competitive field.
			</div>
			<br/>
			<span class=greenSubtitle>Are You Ready?</span>
			<br/><br/>
			Registration for the Google Code Jam 2004 opens on September 1st and ends on September 14th, 2004. Registration is unlimited, but only the top 500 scorers from the Qualification Round will advance to Round 1 of the Code Jam 2004 on September 20th.
			<br/><br/>
			The competitors with the top 250 scores from Round 1 will advance to Round 2 on September 23rd. The top 50 performers in Round 2 will be invited to compete for cash prizes in the Championship Round onsite at the Googleplex (Mountain View, CA) on October 15th.
			<br/><br/>

                        <table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox" align=center>
                           <tr>
                              <td class="sidebarTitle" width="30%">Date</td>
                              <td class="sidebarTitle" width="20%">Time*</td>

                              <td class="sidebarTitle" width="50%">Status</td>
                           </tr>
                           <tr valign="top">
                              <td class="sidebarText">Wednesday, September 1</td>
                              <td class="sidebarText">9:00 AM</td>
                              <td class="sidebarText">Registration Opens</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText" nowrap>Tuesday, September 14</td>
                              <td class="sidebarText">6:00 PM</td>
                              <td class="sidebarText">Registration Closes</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText">Wednesday, September 15</td>
                              <td class="sidebarText">12:00 PM</td>
                              <td class="sidebarText">Qualification Round begins</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText">Thursday, September 16</td>
                              <td class="sidebarText">12:00 PM</td>
                              <td class="sidebarText">Qualification Round ends</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText">Monday, September 20</td>
                              <td class="sidebarText">9:00 PM</td>
                              <td class="sidebarText">Round 1 - 500 participants</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText">Thursday, September 23</td>
                              <td class="sidebarText">9:00 PM</td>
                              <td class="sidebarText">Round 2 - 250 participants</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText">Friday, October 15</td>
                              <td class="sidebarText">3:45 PM</td>
                              <td class="sidebarText">Championship Round - 50 participants</td>
                           </tr>

                           <tr valign="top">
                              <td class="sidebarText" colspan="3">*All times are Eastern Time</td>
                           </tr>
                        </table>

			<br/>
			<span class=greenSubtitle>Prizes</span>
			<br/><br/>
			The 500 participants in Round 1 will receive a "Google Code Jam 2004, Powered by TopCoder" t-shirt. The top five scorers in the Championship Round will receive the following cash prizes:
			<br/><br/>
			<div class=indented>
			      <b>1st Place - $10,000</b><br/>
			      2nd Place - $7,000<br/>
			      3rd Place - $5,000<br/>
			      4th Place - $3,000<br/>
			      5th Place - $2,000<br/>
			</div>
			<br/>
			Those finalists not finishing as one of the top five scorers in the Championship Round will share $23,000.

			<br/><br/>
			To find out more detailed information about the Google Code Jam 2004, including a list of the prizes, please read the <a href="/pl/?module=Static&d1=google04&d2=rules">Terms and Conditions</a>.
			</div>
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>