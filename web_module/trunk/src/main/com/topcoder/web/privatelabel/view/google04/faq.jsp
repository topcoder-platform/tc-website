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
			<jsp:param name="selectedTab" value="faq"/>
			</jsp:include>
			</div>


			<br/><br/>
			<span class=bigTitle>FAQ</span>
			<span valign=top>
			<jsp:include page="right.jsp" />
			</span>

			<br/><br/>
			<b>Is there a way to practice before my qualification attempt?</b><br/>
			Once you've registered for the Google Code Jam, you may use your handle and password to login to the competition arena.  Within the arena there is a practice area that mimics the functionality of the real competition.  Nothing that you do in the practice room will count against you in the competition.
			<br/><br/>
			<b>Can I attempt to qualify more than once?</b><br/>
			You may only register a single account and use that one account to attempt to qualify one time.  Registering more than one account and/or attempting more than one qualification are violations of the competition rules.
			<br/><br/>
			<b>What resources can I use to help me during the competition?</b><br/>
			You may utilize any reference materials, including those found on the Internet.  You may not collaborate with any other person.  
			<br/><br/>
			<b>Can I use code that has already been written as a part of my solution?</b><br/>
			Only code that has been authored by you may be used in a code submission.  No third-party source code may be used as a part of any code submission.
			<br/><br/>
			<b>I've submitted a solution for a problem, but the time has not run out.  Can I submit again?</b><br/>
			No.  During the Qualification Round, you may only submit one time for a given problem, so be sure to test before submitting.
			<br/><br/>
			<b>What does the score that I received in the qualification round mean?</b><br/>
			The score that you end up with when you have completed your qualification attempt may or may not be your final score.  When the Qualification Round has ended, all submissions will be run against a series of predetermined system test cases.  If your submission produces the wrong result (or runs more than 8 seconds) for any of the test cases, you will lose all points for that submission.  The points that you receive for a submission are a factor of the time elapsed between opening the problem statement and submitting the solution.  Whether or not you get to keep those points is determined during the system testing process, which will take place after the end of the Qualification Round.
			<br/><br/>
			<b>How will I know if I have qualified for the first round of the Google Code Jam?</b><br/>
			Shortly following the Qualification Round, the testing will be done.  As soon as the testing is completed, the qualifiers for Round 1 will be posted at www.topcoder.com/googlecodejam <http://www.topcoder.com/googlecodejam>.  In addition, an email will be sent to all participants indicating whether or not each has advanced.
			<br/><br/>
			Questions not addressed here should be directed to <A href="mailto:googlecodejam@topcoder.com">googlecodejam@topcoder.com</A>
			<br/><br/>
			Good luck!
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