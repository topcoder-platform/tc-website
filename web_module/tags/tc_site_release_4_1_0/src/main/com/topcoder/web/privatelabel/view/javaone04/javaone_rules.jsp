<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link rel=stylesheet href="http://java.sun.com/javaone/javaone2004.css">
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/doubleclick.css"/>

<title>2004 JavaOne Coding Challenge</title>



<jsp:include page="../script.jsp" />

</head>
	<body>
		<div align="center">
			<table border=0 cellspacing=0 width="800">
					<td colspan="2" align="left" valign="middle">
					<img src="/i/events/javaone04/banner_top.gif" width="800" height="106" border="0"/>
					</td>
				</tr>
				<tr>
					<td valign="top" width="164">
						<jsp:include page="links.jsp" /></td>
					<td valign="top">
				<!-- start breadcrumb -->
  						<table border="0" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0" >
   							<tr><td width="19"><img src="/i/clear.gif" width="634" height="20"></td></tr>
						</table>
  				<!-- end breadcrumb -->
  					<p></p>
  					<img src="/i/clear.gif" width="7" height="1"><img src="/i/events/javaone04/coding_challenge.gif" width="351" height="27" border="0">
  					<img src="/i/clear.gif" width="140" height="1"><a href="http://www.topcoder.com/"><img src="/i/events/javaone04/pbtc_logo.gif" width="130" height="27" border="0"/></a>
  						<p></p>
  						<p class="regmiddle"><strong><font size="4">Offical Rules and Regulations</font></strong></p>

  						<p class="regmiddle"><strong>Overview</strong><br/>
  						The 2004 JavaOne<sup>SM</sup> Coding Challenge will take place entirely at the JavaOne<sup>SM</sup>
  						Conference at the Moscone Center in San Francisco, CA from June 28th through June 30th.  Prizes will be awarded throughout
  						the Challenge, with the winner of each daily competition receiving a "grand" prize.</p>

  						<p class="regmiddle">All expenses to attend the JavaOne Conference, including the conference registration fee, and the
  						JavaOne Coding Challenge are the responsibility of the individual.</p>

  						<p class="regmiddle"><strong>Eligibility</strong><br/>
						Each contestant must have purchased one of the following attendee passes to the JavaOne Conference in order to
						participate in the JavaOne Coding Challenge:</p>

						<blockquote><ul class="regmiddle">
						<li>Conference Plus Pass</li>
						<li>Conference Pass</li></ul></blockquote>

  						<p class="regmiddle">To register for the JavaOne Conference, visit
  						<a href="http://javaone.medialiveinternational.com/sf2004/registration.html" target="_blank">http://javaone.medialiveinternational.com/sf2004/registration.html</a></p>

						<p class="regmiddle">The JavaOne Coding Challenge is open to citizens and lawful permanent residents of the United States*,
						and to all non-immigrants currently in the United States* with a valid Visa, who are at least 18 years of age.</p>

						<p class="regmiddle"><font size="1">*Including the U.S. territories of Guam, Puerto Rico and the U.S. Virgin Islands</font></p>

						<p class="regmiddle">Employees and former employees of TopCoder, Inc., Sun Microsystems, Inc., JavaOne Conference
						sponsors and exhibitors, and those involved in the production (including prize suppliers), implementation and
						distribution of this tournament and their advertising or promotion agencies, parent companies, service providers,
						agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the
						tournament and members of the immediate families and/or persons living in the same household as such persons,
						are ineligible to enter the tournament.</p>

						<p class="regmiddle"><strong>Registration</strong><br/>
                        Registration for the JavaOne Coding Challenge will occur onsite at JavaOne.  To register for the competition, individuals will be required to provide their first name, last name, email address, and cell phone number (in case we need to notify you of your advancement to the final round).  Registrants will also create a unique username ("handle") and password to log in to the Competition Arena.  All participants will be identified solely by their handle in the Competition Arena, however the full name and handle of each competitor may be published on TopCoder's and/or Sun's website, announcing the results of the competition.</p>

                        <p class="regmiddle">All information provided during registration will be the property of Sun Microsystems, Inc.</p>

						<p class="regmiddle"><strong>Competitions</strong><br/>
						The JavaOne Coding Challenge provides a hands-on experience for conference attendees to apply what they learn during
						the conference tracks.  Following each day's technical presentations, attendees can proceed to the TopCoder arena
						where attendees will attempt to solve various problems in the "Competition Arena."  At the conclusion of each day's
						Qualifying Round, a 4-person competition will be held.  The four individuals who achieved the highest two scores for
						their respective problem during the Qualification Round will be invited to compete in the afternoon's competition.
						The schedule of competitions is as follows:</p>

<table width="604" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
<tr>
<td width="33%" class="sidebarTitle">Date</td>
<td width="34%" class="sidebarTitle">Problem Set Theme</td>
<td width="33%" class="sidebarTitle">Time</td>
</tr>

<tr>
<td width="33%" class="sidebarText">Monday, June 28</td>
<td width="34%" class="sidebarText">Web Services - Qualification</td>
<td width="33%" class="sidebarText">11:00 am - 4:00 pm</td>
</tr>

<tr>
<td width="33%" class="sidebarText">Monday, June 28</td>
<td width="34%" class="sidebarText">Web Services - Competition</td>
<td width="33%" class="sidebarText">5:00 pm - 6:30 pm</td>
</tr>

<tr>
<td width="33%" class="sidebarText">Tuesday, June 29</td>
<td width="34%" class="sidebarText">Enterprise Services - Qualification</td>
<td width="33%" class="sidebarText">11:00 am - 3:00 pm</td>
</tr>

<tr>
<td width="33%" class="sidebarText">Tuesday, June 29</td>
<td width="34%" class="sidebarText">Enterprise Services - Competition</td>
<td width="33%" class="sidebarText">3:30 pm - 5:00 pm</td>
</tr>

<tr>
<td width="33%" class="sidebarText">Wednesday, June 30</td>
<td width="34%" class="sidebarText">Mobility - Qualification</td>
<td width="33%" class="sidebarText">11:00 am - 3:00 pm</td>
</tr>

<tr>
<td width="33%" class="sidebarText">Wednesday, June 30</td>
<td width="34%" class="sidebarText">Mobility - Competition</td>
<td width="33%" class="sidebarText">3:30 pm - 5:00 pm</td>
</tr>
</table>

            <p class="regmiddle"><strong>Competition Structure</strong><br/>
            Java will be the only allowable programming language in the competition.  Each competition will have 3 phases -
            the Coding Phase, the Challenge Phase and the System Testing Phase.  The following describes the different phases
            of competition: </p>

            <blockquote><ul class="regmiddle">
            <li><strong>The Coding Phase</strong> is a timed event where all contestants are presented with either one of two possible
            questions or the same questions, depending on the round.  If an individual is presented with more than one (1) question
            during a round of competition, the questions will have varying levels of complexity and, accordingly, varying levels of
            point earnings potential. Multiple problems may be worked on in any order, and at the same time.  A solution to a problem
            may be submitted multiple times, however a point penalty of 10% of the maximum value of the problem will be assessed for
            each submission.  Points for a problem are awarded upon submission of any solution that successfully compiles and are
            calculated based on the total time elapsed from the time the problem was opened to the time it was submitted, regardless
            of the time it took to submit any previous solutions to that problem, if any.  (NOTE:  Each participant will be presented
            with one (1) of two questions in the Qualification Round.  Two (2) questions will be presented to each participant during
            each competition.)</li>

            <li><strong>The Challenge Phase</strong> is a timed event wherein each competitor has a chance to challenge the functionality
            of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the
            defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points as a
            penalty, applied against their total score in that round of competition.  (NOTE:  There is no Challenge Phase during the
            Qualification Round.)</li>

            <li><strong>The System Testing Phase</strong> is applied to all submitted code that has not already been successfully challenged.
            If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were
            originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code
            submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered
            flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful
            challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</li>
            </ul></blockquote>

            <p class="regmiddle"><strong>About the Prizes</strong><br/>
			Prizes will be awarded to each person who participates in the Qualification Rounds.  The winner of each day's competition will be
			awarded a 'grand' prize.  The prizes are as follows:</p>
<<<<<<< javaone_rules.jsp
			
<table width="604" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
<tr>
<td width="30%" class="sidebarTitle">Participant(s)</td>
<td width="70%" class="sidebarTitle">Prize</td>
</tr>

<tr>
<td width="30%" class="sidebarText" valign="top">Grand Prize (3)*</td>
<td width="70%" class="sidebarText">
<ul>
<li>One complimentary full Conference pass to the 2005 JavaOne conference, valued at $1,995 (travel and lodging excluded)</li>
<li>A collection of 23 <A href="Javascript:openWin('/pl/?&module=Static&d1=javaone05&d2=book_titles','comp',685,655);">Java Series Publications</a>, valued at over $950** </li>
<li>One Zodiac Mobile Entertainment console and package from TapWave, valued at $625</li>
</ul>
</td>
</tr>

<tr>
<td width="30%" class="sidebarText">1st Runner Up (3)*</td>
<td width="70%" class="sidebarText">$500 gift certificate to redeem in the JavaOne Conference Retail Store</td>
</tr>

<tr>
<td width="30%" class="sidebarText">2nd Runner Up (3)*</td>
<td width="70%" class="sidebarText">$250 gift certificate to redeem in the JavaOne Conference Retail Store</td>
</tr>

<tr>
<td width="30%" class="sidebarText">3rd Runner Up (3)*</td>
<td width="70%" class="sidebarText">$125 gift certificate to redeem in the JavaOne Conference Retail Store</td>
</tr>

<tr>
<td width="30%" class="sidebarText">First 1,000 Participants</td>
<td width="70%" class="sidebarText">One JavaOne Coding Challenge T-Shirt and Messenger Bag</td>
</tr>
<tr>
<td width="100%" class="sidebarText" colspan="2">
*One Grand Prize and one 1st, 2nd, and 3rd Runner-Up prize awarded daily<br/>
**Titles subject to change based on availability
</td>

</tr>
</table>
            
            <p class="regmiddle">Prizes will be awarded daily at the conclusion of the competition. Any and all applicable taxes on 
            prizes are the sole responsibility of the prizewinner.</p>	
            
            <p class="regmiddle">All contestants will only be allowed to win once during the competitions.  We will monitor all contestants 
            to ensure their eligibility, and that they have not won in any of the prior competitions during the 2004 JavaOne Coding Challenge.</p>	
            
=======

						<table width="604" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="30%" class="sidebarTitle">Participant(s)</td>
                    <td width="70%" class="sidebarTitle">Prize</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText" valign="top">Grand Prize (3)*</td>
                    <td width="70%" class="sidebarText">
                    <ul>
                    <li>One complimentary full Conference pass to the 2005 JavaOne conference, valued at $1,995 (travel and lodging excluded)</li>
                    <li>A collection of 23 <A href="Javascript:openWin('/pl/?module=Static&d1=javaone04&d2=book_titles','comp',685,655);">Java Series Publications</a>, valued at over $950** </li>
                    <li>One Zodiac Mobile Entertainment console and package from TapWave, valued at $625</li>
                    </ul>
                    </td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">1st Runner Up (3)*</td>
                    <td width="70%" class="sidebarText">$500 gift certificate to redeem in the JavaOne Conference Retail Store</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">2nd Runner Up (3)*</td>
                    <td width="70%" class="sidebarText">$250 gift certificate to redeem in the JavaOne Conference Retail Store</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">3rd Runner Up (3)*</td>
                    <td width="70%" class="sidebarText">$125 gift certificate to redeem in the JavaOne Conference Retail Store</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">First 1,000 Participants</td>
                    <td width="70%" class="sidebarText">One JavaOne Coding Challenge T-Shirt and Messenger Bag</td>
                </tr>
                <tr>
                    <td width="100%" class="sidebarText" colspan="2">
                    *One Grand Prize and one 1st, 2nd, and 3rd Runner-Up prize awarded daily<br/>
                    **Titles subject to change based on availability
                    </td>

                </tr>
            </table>

            <p class="regmiddle">Prizes will be awarded daily at the conclusion of the competition. Any and all applicable taxes on
            prizes are the sole responsibility of the prizewinner.</p>

            <p class="regmiddle">All contestants will only be allowed to win once during the competitions.  We will monitor all contestants
            to ensure their eligibility, and that they have not won in any of the prior competitions during the 2004 JavaOne Coding Challenge.</p>

>>>>>>> 1.7.46.3
            <p class="regmiddle"><strong>Conditions of Participation</strong><br/>
			By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder and Sun Microsystems,
			which are final, binding and conclusive in all matters.</p>

            <p class="regmiddle"><strong><font color="#FF0000">Contestants must not cheat. All ideas for any code and/or challenge
            submitted must be the contestant's alone.</font></strong></p>

            <p class="regmiddle">All decisions relating to the viability of submissions, the ranking of submissions and all other matters
            pertaining to the tournament shall be within the sole discretion of TopCoder or its designees and shall be final and binding
            in all respects.</p>

            <p class="regmiddle">By participating in the 2004 JavaOne Coding Challenge, each competitor releases and agrees to hold
            harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, including Sun Microsystems,
            Inc., and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from
            and against any and all liability for any loss, property damage or damage to person, including without limitation, death
            and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or
            participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder and Sun Microsystems
            specifically disclaim all liability associated with, and make no warranties with regard to, any prize given.</p>

            <p class="regmiddle">In addition, all competitors agree to cooperate with TopCoder, Inc.'s and Sun Microsystems, Inc.'s
            publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and
            state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements
            made by, or attributed to, them relating to TopCoder and any and all rights to said use, without further compensation.
            Furthermore, all competitors agree to promptly notify TopCoder if a third-party contacts them regarding employment
            opportunities and/or media interest as a result of their participation in the tournament.</p>

            <p class="regmiddle">TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with
            competing in this tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever,
            including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site,
            or the tournament process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate
            or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer
            virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</p>

            <p class="regmiddle"><strong>Other</strong><br/>
			The tournament is void in whole or in part where prohibited by law.</p>

			<p class="regmiddle">A list of tournament winners will be available on the web site at
			<a href="/pl/?module=Static&d1=javaone04&d2=javaone_overview">www.topcoder.com/javaone2004</a> and will be displayed for
			at least 3 months after the end of the tournament.</p>

			<p class="regmiddle">This tournament is brought to you by Sun Microsystems, Inc. (<a href="http://www.sun.com/">http://www.sun.com</a>),
			901 San Antonio Road, Palo Alto, CA 94303 and TopCoder, Inc. (<a href="http://www.topcoder.com/">http://www.topcoder.com</a>) 703 Hebron Avenue, Glastonbury, CT 06033.</p>


					</td>
				</tr>
			</table>
			<jsp:include page="foot.jsp" />
		</div>
	</body>
</html>