<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
  com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google04.css"/>
<title>Google Code Jam 2004</title>
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
					<td width="49%" valign=bottom align=right><a href="/"><img align="right" src="/i/events/google2003/google_pbtc.gif" border="0"></a></td>
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
			<jsp:param name="selectedTab" value="schedule"/>
			</jsp:include>
			</div>


			<br/><br/>
			<span class=bigTitle>Schedule</span>
			<span valign=top>
			<table class=smallBoxTable align=right cellspacing=0 cellpadding=0>
				<tr>
					<td align=center nowrap=nowrap class=smallBlueBox>
					<span class=bodyTextBlue>Important Dates</span>
					<br/><br/>
					<b>Registration Starts</b><br/>
					Wednesday, September 1st
					<br/><br/>
					<b>Qualification Round</b><br/>
					Wednesday, September 15th
					<br/><br/>
					<b>Championship Round</b><br/>
					Friday, October 15th
					</td>
				</tr>
				<tr><td>&#160;</td></tr>
				<tr>
					<td align=center nowrap=nowrap class=smallGreenBox>
					<span class=bodyTextGreen>$30,000 in<br/>Cash Prizes!</span>
					<br/><br/>
					<b>1st Place - $10,000</b><br/>
					2nd Place - $5,000<br/>
					3rd Place - $2,500<br/>
					4th Place - $1,000
					<br/><br/>
					5th to 50th Place<br/>get $250 each!
					</td>
				</tr>
			</table>
			</span>
			<br/><br/>

			<!-- Qualification Rounds begins -->
			<span class=greenSubtitle>Qualification Rounds</span><br/>
			The top 100 scorers from each problem presented during the Qualification Round will be eligible to compete in Round 1 of the Code Jam 2003.</p>
			<br/><br/>

			<a name="sched"></a>
			<table width="400" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
				<tr>
					<td class="sidebarTitle" width="25%">Round</td>
					<td class="sidebarTitle" width="35%">Date and Time*</td>
					<td class="sidebarTitle" width="21%" align="center"># of Participants</td>
					<td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
				</tr>
				<tr valign="top">
					<td class="sidebarText">Qualification Round</td>
					<td class="sidebarText">8:00 AM Friday, October 17 through<br />8:00 AM Monday, October 20<br /></td>
					<td class="sidebarText" align="center">All eligible members</td>
					<td class="sidebarText" align="center">500</td>
				</tr>
				<tr valign="top">
					<td class="sidebarText" colspan="4">*NOTE: All times are Eastern Time</td>
				</tr>
			</table>
			<!-- Qualification Rounds ends -->
			<br/><br/>

			<!-- Online Elimination Rounds begins -->
			<span class=greenSubtitle>Online Elimination Rounds</span><br/>
			Everyone who competes in Round 1 must log in to the TopCoder Competition Arena no later than ten minutes prior to the start of the online round.  All start times will be communicated as Eastern Time.  If a coder does not participate, for any reason, in an online round he/she has advanced to, it will be treated as an automatic loss in that round of competition.
			<br/><br/>

			<table width="400" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
				<tr>
					<td class="sidebarTitle" width="25%">Round</td>
					<td class="sidebarTitle" width="35%">Date and Time*</td>
					<td class="sidebarTitle" width="21%" align="center"># of Participants</td>
					<td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
				</tr>
				<tr valign="top">
					<td class="sidebarText">Online Round 1</td>
					<td class="sidebarText">Friday, October 24th<br />Register: 6:00 PM<br />START: 9:00 PM<br /></td>
					<td class="sidebarText" align="center">500</td>
					<td class="sidebarText" align="center">250</td>
				</tr>
				<tr valign="top">
					<td class="sidebarText">Online Round 2</td>
					<td class="sidebarText">Monday, October 27th<br />START: 9:00 PM<br /></td>
					<td class="sidebarText" align="center">250</td>
					<td class="sidebarText" align="center">25</td>
				</tr>
				<tr valign="top">
					<td class="sidebarText" colspan="4">NOTE: All times are Eastern Time. In the event that an online round must be cancelled for any reason, the "raindate" will be the following day at the same time.</td>
				</tr>
			</table>
			<br/><br/>

			<!-- Online Elimination Rounds ends -->

			<!-- Onsite Championship Round begins -->
			<span class=greenSubtitle>Onsite Championship Round</span><br/>
			Up to 25 coders will compete in the Championship Round being held onsite at Google's headquarters.  Each finalist is responsible for arriving at Google's headquarters to compete.
			<br/><br/>

			<table width="400" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
				<tr>
					<td class="sidebarTitle" width="25%">Round</td>
					<td class="sidebarTitle" width="35%">Date and Time*</td>
					<td class="sidebarTitle" width="21%" align="center"># of Participants</td>
					<td class="sidebarTitle" width="19%" align="center"># of Advancers</td> 
				</tr>
				<tr valign="top">
					<td class="sidebarText">Championship Round</td>
					<td class="sidebarText">Friday, November 14th<br />START: 5:00 PM<br /></td>
					<td class="sidebarText" align="center">25</td>
					<td class="sidebarText" align="center">n/a</td>
				</tr>
				<tr valign="top">
					<td class="sidebarText" colspan="4">*NOTE: All times are Eastern Time. The time of the onsite round is subject to change.</td>
				</tr>
			</table>

			<br/><br/>
			To find out more detailed information about the Google Code Jam 2004, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=google04&d2=rules">Terms and Conditions</a>.
			</div>
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>