<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gicj05.css"/>
<title>Google India Code Jam 2005, Powered by TopCoder</title>
</head>
<body>


<table border=0 width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width="49%">&#160;</td>
		<td align=center>
			<table border=0 width=100% cellpadding=0 cellspacing=0>
				<tr>
					<td width="49%"></td>
					<td valign=bottom align=center><img border=0 src="/i/events/gicj05/gicj05_logo.gif" alt="Google India Code Jam logo"></td>
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
			<jsp:param name="selectedTab" value="rules"/>
			</jsp:include>
			</div>

			<br><br>

			<span class=bigTitle>Official Rules and Regulations</span>
			<span valign=top>
			<jsp:include page="right.jsp" />
			</span>

			<br><br>
         <span class="bigRed">No purchase necessary to enter or win.  The tournament is void where prohibited.</span>
			<br><br>
         <span class="greenSubtitle">Summary of the Tournament</span><br>
         The Google&#153; India Code Jam 2005 (GICJ05) is being offered by Google Inc. ("Google") and TopCoder, Inc. ("TopCoder").  Google is using the results of the GICJ05 to identify possible employees for their Bangalore, India office.  The GICJ05 will take place between Tuesday, February 8 and Saturday, March 26, 2005.  It begins with an 18-day online registration, after which all registered individuals will participate in a Qualification Round to determine who will compete in the programming tournament.  The tournament consists of one (1) day of qualification, one (1) online elimination round and one (1) onsite final round.  All participants who compete in Round 1 (the online elimination round) will receive a Google India Code Jam 2005, Powered by TopCoder t-shirt.  In addition, Google will award 1,000,000INR in cash prizes to the 50 finalists in the tournament.
         <br><br>
         <strong>Eligibility</strong><br>
         All individuals who are 18 years of age or older by February 8, 2005 [AND RESIDENTS OF A SPECIFIED LIST OF COUNTRIES TO BE PROVIDED BY GOOGLE INDIA] may register and compete in the Google India Code Jam 2005.  
         <br><br>
         Registrants who are 18 years of age or older are eligible to win cash prizes, unless otherwise prohibited. The Google India Code Jam 2005 is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law.
         <br><br>
         Employees of Google and TopCoder and those involved in the production (including prize suppliers), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.
         <br><br>
         <strong>Registration</strong><br>
         Registration will open on Tuesday, February 8 at 9:00AM IST and will close on Friday, February 25 at 6:00PM IST.  Registration is unlimited, however each individual may only register once.
         <br><br>
         <strong>Qualification Round</strong><br>
         The Qualification Round will be open for 24 hours from 12:00PM IST Saturday, February 26 through 12:00PM IST Sunday, February 27, 2005.
         <br><br>
         The Qualification Round will consist of two phases: the Coding Phase and System Testing Phase.
         <ul>
         <li><strong>The Qualification Round Coding Phase</strong> is a timed event where contestants are presented with one of [NUMBER TBD] possible problem sets.  Each problem set contains two questions representing two levels of complexity and, accordingly, two levels of point earnings potential. Points for a question are awarded upon submission of any solution that successfully compiles and are calculated based on the total time elapsed from the time the question was opened to the time it was submitted.  Competitors will have 60 minutes to complete either or both of the problems.  The 60 minutes will begin to elapse once the first problem is opened.  The timer in the coding window will count down to the end of the 60 minutes.  A competitor who begins the qualification attempt within the final 60 minutes of the Qualification Round will have less than 60 minutes to attempt qualification.</li>
         <li><strong>The Qualification Round System Testing Phase</strong> is applied to all submitted code after the conclusion of the Qualification Round Coding Phase. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given question. </li>
         </ul>
         The Qualification Round will contain xx virtual rooms and xx problem sets.  The top xx scorers from each of the xx problem sets presented during the Qualification Round will be eligible to compete in Round 1 of the GICJ05. 
         <br><br>
         <strong>The Competition Field</strong><br>
         Up to 500 individuals will qualify to compete in Round 1.  The top 50 scorers from Round 1 will advance to the Championship Round, which will be held onsite at Google's office in Bangalore, India.
         <br><br>
         The Rounds will be held on the following dates:

         <br><br>
         <table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox" align=center>
         <tr valign="top">
         <td class="sidebarTitle">Round</strong></td>
         <td class="sidebarTitle">Date and Time * (all India Standard Time)</strong></td>
         </tr>
         <tr valign="top">
         <td class="sidebarText" nowrap=nowrap>Round 1</td>
         <td class="sidebarText">Saturday, March 5, 2005<br>Sign in: 9:00 AM - 11:55 AM<br>START: 12:00 PM (Noon) 
         </td>
         </tr>
         <tr valign="top">
         <td class="sidebarText" nowrap=nowrap>Championship Round</td>
         <td class="sidebarText">Saturday, March 26, 2005<br>START: 12:00 PM (Noon)
         </td>
         </tr>
         <tr valign="top">
         <td class="sidebarText" colspan="2">*NOTE: In the event a Round must be cancelled for any reason, the "raindate" will be the following day at the same time.</td>
         </tr>
         </table>
         <br><br>
         
         <span class="greenSubtitle">About the Tournament</span><br>
         <strong>Use of Plugins in the Competition Arena</strong>
         The use of external TopCoder Arena plugins or any modifications to the TopCoder Arena functionality is strictly prohibited.
         <br><br>
         <strong>Online Elimination Round</strong><br>
         Everyone who competes in Round 1 must log in to the TopCoder Competition Arena no later than ten minutes prior to the start of the online round.  All start times will be communicated as India Standard Time, so contestants in other time zones must adjust accordingly.  If a coder does not participate, for any reason, in the online round, it will be treated as an automatic loss in that round of competition. 
         <br><br>
         All competitors who have been invited to compete will be randomly assigned to specific rooms, with up to 10 people in each room.  TopCoder will determine all room assignments prior to the start of each online round. 
         <br><br>
         <strong>Scoring and Advancing</strong><br>
         After each round of competition, the top scorers will be identified and will advance to the next round.  Coder advancement is determined by comparing the total point values from all three phases of the round (see Competition Round Structure) for each coder. In order to advance, a coder must finish each round with a positive (i.e., greater-than-zero) point total. The structure of the online rounds is as follows:
         <br><br>
         <strong>Round 1 (online)</strong><br>
         <ul>
         <li>Up to 500 coders will compete in Round 1 and up to 50 will advance.  The 50 highest scoring competitors will advance to the Championship Round.  Each coder must have positive points to advance, so if there are less than 50 competitors who score positive points, only those competitors with a positive point total will advance.</li>
         </ul>
         <strong>NOTE:</strong>  In the event of a tie for any advancing position, all tied coders will advance to the Championship Round.
         <br><br>
         <strong>Competition Round Structure</strong><br>
         Each online and onsite round of competition (excluding the Qualification Round) consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase. The Qualification Round will consist only of the Coding Phase and System Testing Phase.  (See "Qualification Round" above for details regarding the Coding Phase and System Testing Phase of the Qualification Round.)

         <ul>         
         <li>The Coding Phase is a timed event where all contestants are presented with the same three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a question are awarded upon submission of any solution that successfully compiles and are calculated based on the total time elapsed from the time the question was opened to the time it was submitted.</li>
         <li>The Challenge Phase is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 25 points as a penalty, applied against their total score in that round of competition.</li>
         <li>The System Testing Phase is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</li>
         </ul>

         <strong>Onsite Championship Round</strong><br>
         The 50 advancers from Round 1 will travel to Google's Bangalore, India office to compete in the Championship Round of the tournament being held on Saturday, March 26, 2005.  Each finalist must confirm his/her attendance in the Championship Round by March 11, 2005.  If a contestant does not confirm his/her attendance in the Championship Round by said date, he/she will forfeit eligibility to receive a prize, and his/her spot in the tournament will be given to the next highest scorer from Round 1.
         <br><br>
         Google will provide all travel accommodations for each finalist to attend the Championship Round.  In addition, Google will provide overnight accommodations and all travel arrangements to and from the airport, as well as to and from Google's Bangalore office.  All other expenses are the responsibility of the contestant.   
         <br><br>
         TopCoder will determine the room assignments for the Championship Round prior to the start of the Championship Round. 
         <br><br>
         The Championship Round will be a single round of 50 coders. The placement of finishers in the Championship Round is determined by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship Round will be the coder with the highest point total for the round. In the event of a tie in the Championship Round, the tie will be resolved in the following manner (in order):

         <ul>
         <li>Total points acquired (higher is better) during online Round 1</li>
         <li>If a tie still remains in the Championship Round, then the prize money will be distributed equally among the tied coders</li>
         </ul>

         <span class="greenSubtitle">About the Prizes</span><br>
         All participants who compete in Round 1 will receive a Google India Code Jam 2005, Powered by TopCoder t-shirt.  In addition, the 50 finalists in the Championship Round will receive cash prizes totaling 1,000,000 INR.  Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.  Prizes will be distributed as follows:
         <br><br>
         
         <table  width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox" align=center>
         <tr valign="top">
         <td class="sidebarTitle">Competitor(s)</td>
         <td class="sidebarTitle" align=right>Prize</td>
         </tr>
         <tr valign="top">
         <td class="sidebarText"><b>1st place finisher* - Tournament Champion</b></td>
         <td class="sidebarText" align=right><b>250,000 INR</b>
         </td>
         </tr>
         <tr valign="top">
         <td class="sidebarText" nowrap>2nd place finisher* in the Championship Round</td>
         <td class="sidebarText" nowrap align=right>175,000 INR
         </td>
         </tr>
         <tr valign="top">
         <td class="sidebarText" nowrap>3rd place
         finisher* in the Championship Round</td>
         <td class="sidebarText" nowrap align=right>125,000 INR
         </td>
         </tr>                
         <tr valign="top">
         <td class="sidebarText" nowrap>4th place
         finisher* in the Championship Round</td>
         <td class="sidebarText" nowrap align=right>85,000 INR
         </td>
         </tr>                
         <tr valign="top">
         <td class="sidebarText" nowrap>5th place
         finisher* in the Championship Round</td>
         <td class="sidebarText" nowrap align=right>45,000 INR
         </td>
         </tr>
         <tr valign="top">
         <td class="sidebarText" nowrap>6th - 10th place
         finishers* in the Championship Round</td>
         <td class="sidebarText" nowrap align=right>20,000 INR each
         </td>
         </tr>
         <tr valign="top">
         <td class="sidebarText" nowrap>11th - 20th place
         finishers* in the Championship Round</td>
         <td class="sidebarText" nowrap align=right>10,000 INR each
         </td>
         </tr>
         <tr valign="top">
         <td class="sidebarText" nowrap>21st - 32nd place
         finishers* in the Championship Round</td>
         <td class="sidebarText" nowrap align=right>6,250 INR each
         </td>
         </tr>
         <tr valign="top">
         <td class="sidebarText" nowrap>33rd - 50th place
         finishers* in the Championship Round</td>
         <td class="sidebarText" nowrap align=right>2,500 INR each
         </td>
         </tr>
         <tr valign="top">
         <td class="sidebarText" nowrap>Up to 500 competitors who compete in Round 1 </td>
         <td class="sidebarText" nowrap align=right>"Google India Code Jam 2005, Powered by TopCoder" t-shirt
         </td>
         </tr>
         <tr valign="top">
         <td class="sidebarText" colspan="2">* Winner must be present at the onsite round to receive prize.</td>
         </tr>
         </table>
         
         <br><br>
         <span class="greenSubtitle">Conditions of Participation</span><br>
         By participating in the tournament, you agree to be bound by these rules and to all decisions of Google and TopCoder, which are final, binding and conclusive in all matters.  Also, by participating in this tournament, you consent to providing certain information to Google for recruiting purposes.  Such information shall include your registration information and your competition statistics.
         <br><br>
         <span class="bigRed">Contestants must not cheat. All ideas for any code and/or challenge submitted must be the contestant's alone.</span>
         <br><br>
         Winners in each round of competition will be those competitors who win the most points in their respective rooms. All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.
         <br><br>
         Prizewinners will be announced upon completion of the Championship Round.  Any prizewinner claiming a cash prize must complete an Affidavit of Eligibility and Liability and Publicity Release onsite before claiming the prize (Google will provide the prizewinners with this document prior to the start of the Championship Round).
         <br><br>
         Prizes will be sent to the prizewinners after the conclusion of the Championship Round.  All t-shirts will be sent after the conclusion of the Championship Round to competitors using the address given during registration.  Unclaimed or undeliverable prizes will not be awarded.
         <br><br>
         As a condition of participation in the tournament, all information provided by you upon registration must be comprehensive, accurate and up-to-date. Google and/or TopCoder may require you to complete an additional registration form to register for the tournament. In order to be eligible to participate in the tournament, you must have completed any and all registration forms required by Google and TopCoder.
         <br><br>
         As a condition of winning and redeeming a cash prize, winners will be required to complete and provide to Google a completed Affidavit of Eligibility and Liability and Publicity Release (the "Affidavit").  In completing the Affidavit, a winner (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (c) verifies the accuracy of the information submitted in the Google India Code Jam 2005 registration process, (d) authorizes TopCoder and Google to publicize the tournament's results, (e) agrees to sign any applicable forms required by tax authorities, (f) licenses to TopCoder and Google rights to all information submitted during the tournament (including rights to source code and other executables), and (g) releases TopCoder and Google from liability arising out of any prize won. 
         <br><br>
         If prize notification is returned as undeliverable, or if the winner fails to submit the Affidavit, the winner will be disqualified and the prize money won by the disqualified winner will be forfeited. Providing false information in the registration process or in the required forms described in this paragraph will disqualify a winner.
         <br><br>
         By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless Google and TopCoder, their affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. Google and TopCoder specifically disclaim all liability associated with, and make no warranties with regard to, any prize given.
         <br><br>
         In addition, all prizewinners agree to cooperate with Google's and TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and country) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to Google and TopCoder and any and all rights to said use, without further compensation.  
         <br><br>
         Google and TopCoder reserve the right, in their sole discretion, to revoke any and all privileges associated with competing in this tournament, and to take any other action they deem appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, or otherwise being in violation of the rules. Google and TopCoder reserve the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.
         <br><br>
         <span class="greenSubtitle">Other</span><br>
         The tournament is void in whole or in part where prohibited by law.
         <br/><br/>
         This tournament is brought to you by TopCoder, Inc. (http://www.topcoder.com/) 703 Hebron Avenue, Glastonbury, CT 06033 and Google Inc. (http://www.google.com) 1600 Amphitheatre Parkway, Mountain View, CA 94043.

			<br><br>
			</div>
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>