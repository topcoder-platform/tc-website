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
                     <a href="/pl/?&module=Static&d1=google&d2=google_sched">Schedule</a> &nbsp;|&nbsp; 
                     <font color="006633">Rules</font> &nbsp;|&nbsp; 
                     <a href="/pl/?&module=Static&d1=google&d2=google_registration">Registration</a> &nbsp;|&nbsp;
                     <a href="/pl/?&module=Static&d1=google&d2=google_faq">FAQ</a> &nbsp;|&nbsp; 
                     <a href="/pl/?&module=Static&d1=google&d2=google_practice">Practice Arena</a>
                  </font>
                  </div><br><br>
                  
                  <table border=0 cellspacing=0 width="100%">
                     <tr>
                        <td valign="top">
                        <b><font size="+1">Official Rules and Regulations</font></b>
                        <img hspace="10" vspace="5" src="/i/events/google2003/codejam_info.gif" width="150" height="390" border="0" align="right" valign="top">

                  <p><font size="-2">&nbsp; &nbsp; &nbsp; &nbsp;<a href="#summary">Summary of the Tournament</a> | <a href="#about">About the Tournament</a> | <a href="#prizes">About the Prizes</a> | <a href="#conditions">Conditions of Participation</a></font></p> 
                  <p><font size="-1"><font color="#ff0000">No purchase necessary to enter or win.</font></font></p>
		
                  <a name="summary"></a>
                  <font color="006633"><strong>Summary of the Tournament</strong></font>

<p><font size="-1">
The Google&#153; Code Jam 2003 is being offered by Google Inc. ("Google") and TopCoder, Inc. ("TopCoder").  Google is using the results of the Code Jam 2003 to identify possible candidates for employment.  Google Code Jam 2003 will take place between Wednesday, October 1 and Friday, November 14, 2003.  It begins with a 2-week online registration, after which all registered individuals will participate in a Qualification Round to determine who will compete in the programming tournament.  The tournament consists of three (3) days of qualification, two (2) online elimination rounds and one (1) onsite final round.  All participants who compete in Round 1 (the first online elimination round) will receive a Google Code Jam 2003 t-shirt.  In addition, Google will award a total of  $25,000 in cash prizes to the 25 finalists in the tournament.
<br><br>
<strong>Eligibility</strong><br>
All individuals who are 18 years of age or older are eligible to register and compete in the Google Code Jam 2003.  All citizens and lawful permanent residents of the following countries (and all non-immigrants currently residing in the United States with a valid Visa) are eligible to win cash prizes after completing the appropriate affidavit and tax form:
<ul>
<li>	Australia 
<li>	Canada (excluding Quebec) 
<li>	China 
<li>	India 
<li>	Ireland 
<li>	New Zealand 
<li>	Sweden 
<li>	United Kingdom 
<li>	United States (including the U.S. territories of Guam, Puerto Rico and the U.S. Virgin Islands) 
</ul>
Google and TopCoder have not yet confirmed that issuing cash prizes is legal in countries other than those listed above.  Therefore, while participants who do not meet the citizenship requirements to win prize money are still eligible to compete, these individuals may be required to donate any cash prizes to charity. Participants will choose a charity to receive their winnings from the TopCoder approved list of charities. A prize-winning participant may request a new charity be added to the list, however it shall remain in Google's sole discretion to add that charity after reviewing the proposed charity's credentials.
<br><br>
Employees of Google and TopCoder, and those involved in the development, production, implementation and distribution of this tournament and their advertising or promotional agencies, parent companies, agents, directors, subsidiaries or affiliates, or any other persons living in the same household as such persons, are ineligible to enter the tournament.
<br><br>

<strong>Registration</strong><br>
Registration will open on Wednesday, October 1 at 8:00AM EDT and will close on Wednesday, October 15 at 5:00PM EDT.  Registration is unlimited.
<br><br>
<strong>Qualification Round</strong><br>
The Qualification Round will be open for 72 hours from 8:00AM EDT Friday, October 17 through 8:00AM EDT Monday, October 20, 2003. Each competitor may participate in the Qualification round at any time during the 72 hours. 
<br><br>
The Qualification Round will consist of two phases: the Coding Phase and System Testing Phase.
<ul>
<li>	The Qualification Round Coding Phase is a timed event where contestants are presented with one of five possible problem sets.  Each problem set contains two questions representing two levels of complexity and, accordingly, two levels of point earnings potential. Points for a question are awarded upon submission of any solution that successfully compiles and are calculated based on the total time elapsed from the time the question was opened to the time it was submitted.  Competitors will have 60 minutes to complete the set of two problems.
<br><br>
<li>	The Qualification Round System Testing Phase is applied to all submitted code. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given question. 
</ul>

The top 100 scorers from each of the five problem sets presented during the Qualification Round will be eligible to compete in Round 1 of the Code Jam 2003.  
<br><br>
<strong>The Competition Field</strong><br>
Up to 500 individuals will qualify to compete in Round 1.  The top 250 scorers from Round 1 will advance to Round 2.  The top 25 scorers from Round 2 will advance to the Championship Round, which will be held onsite at Google’s headquarters in Mountain View, CA, USA.
<br><br>
The Rounds will be held on the following dates:
</font></p>

                <table width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr valign="top">
                    <td class="sidebarTitle">Round</strong></td>
                    <td class="sidebarTitle">Date and Time * (all Eastern Time)</strong></td>
                    </tr>
                <tr valign="top">
                    <td class="sidebarText">	Round 1</td>
                    <td class="sidebarText">Friday, October 24, 2003<br>
Sign in:  6:00 PM – 8:55 PM<br>
START:          9:00 PM 
</td>
                    </tr>

                <tr valign="top">
                    <td class="sidebarText" nowrap>Round 2</td>
                    <td class="sidebarText">Monday, October 27, 2003<br>
START:          9:00 PM
</td>
                    </tr>
                
                <tr valign="top">
                    <td class="sidebarText">Championship Round</td>

                    <td class="sidebarText">Friday, November 14, 2003<br>
START:          4:00 PM
</td>
                    </tr>
                
                <tr valign="top">
                  <td class="sidebarText" colspan="2"><font size="-2">*NOTE:  In the event a Round must be cancelled for any reason, the "raindate" will be the following day at the same time.</td>

                </tr>
            </table>
<br><br>
<a name="about"></a>
<font color="006633"><strong>About the Tournament</strong></font>
<p><font size="-1">
<strong>Use of Plugins in the Competition Arena</strong><br>
The use of external TopCoder Arena plugins or any modifications to the TopCoder Arena functionality is strictly prohibited.
<br><br>
<strong>Online Elimination Rounds</strong><br>
Everyone who competes in Round 1 must log in to the TopCoder Competition Arena no later than ten minutes prior to the start of the online round.  All start times will be communicated as Eastern Time, so contestants in other time zones must adjust accordingly.  If a coder does not participate, for any reason, in an online round he/she has advanced to, it will be treated as an automatic loss in that round of competition. 
<br><br>
All competitors who have been invited to compete will be randomly assigned to specific rooms, with up to 10 people in each room.  TopCoder will determine all room assignments prior to the start of each online round. 
<br><br>
<strong>Scoring and Advancing</strong><br>
After each round of competition, the top scorers will be identified and will advance to the next round.  Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round (see Competition Round Structure) for each coder. In order to advance, a coder must finish each round with a positive (i.e., greater-than-zero) point total. The structure of the online rounds is as follows:
<ul>
<strong>Round 1 (online)</strong><br>
<li>	Up to 500 coders will compete in Round 1 and up to 250 will advance.  The 250 highest scoring competitors will advance to Round 2.  Each coder must have positive points to advance, so if there are less than 250 competitors who score positive points, only those competitors with a positive point total will advance.  
<br><br>
<strong>Round 2 (online)</strong><br>
<li>	Up to 250 coders will compete and up to 25 will advance.  The 25 highest scoring competitors will advance to the Championship Round.  Each coder must have positive points to advance, so if there are less than 25 competitors who score positive points, only those competitors with a positive point total will advance.
<br><br>
NOTE:  In the event of a tie for any advancing position, the tie will be resolved in the following manner:
<ul>
<li>	Total points acquired (higher is better) during the previous rounds of the tournament, excluding the Qualification Round 
<li>	If a tie still remains, all tied coders will advance to the next round
</ul>
</ul>

<strong>Competition Round Structure</strong><br>
Each online and onsite round of competition (excluding the Qualification Round) consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase. The Qualification Round will consist only of the Coding Phase and System Testing Phase.  (See "Qualification Round" above for details regarding the Coding Phase and System Testing Phase of the Qualification Round.)
<ul>
<li>	The Coding Phase is a timed event where all contestants are presented with the same three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a question are awarded upon submission of any solution that successfully compiles and are calculated based on the total time elapsed from the time the question was opened to the time it was submitted. 
<br><br>
<li>	The Challenge Phase is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points as a penalty, applied against their total score in that round of competition. 
<br><br>
<li>	The System Testing Phase is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.
</ul>

<strong>Onsite Championship Round</strong><br>
The 25 advancers from Round 2 will travel to Google’s headquarters to compete in the Championship Round of the tournament being held on Friday, November 14, 2003.  Each finalist must confirm his/her attendance in the Championship Round by October 30, 2003.  If a contestant does not confirm his/her attendance in the Championship Round by said date, he/she will forfeit eligibility to receive a prize, and his/her spot in the tournament will be given to the next highest scorer from Round 2.
<br><br>
Google will provide travel accommodations for each finalist to attend the Championship Round.  In addition, Google will provide overnight accommodations and all travel arrangements to and from the airport, as well as to and from Google’s headquarters.  All other expenses are the responsibility of the contestant.   
<br><br>
TopCoder will determine the room assignments for the Championship Round prior to the start of the Championship Round. 
<br><br>
The Championship Round will be a single round of 25 coders. The first, second, third and fourth place finishers in the Championship Round are determined by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship Round will be the coder with the highest point total for the round. In the event of a tie in the Championship Round, the tie will be resolved in the following manner (in order):

<ul>
<li>	Total points acquired (higher is better) during online Rounds 1 and 2
<li>	If a tie still remains in the Championship Round, then the prize money will be distributed equally among the tied coders
</ul>
</p></font>
<a name="prizes"></a>
<font color="006633"><b>About the Prizes</b></font>
<font size="-1"><p>
All participants who compete in Round 1 will receive a Google Code Jam 2003 t-shirt.  In addition, the 25 finalists in the Championship Round will receive cash prizes.  Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.  Prizes will be distributed as follows:
<br><br>
<table  width="500" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr valign="top">
                    <td class="sidebarTitle">Competitor(s)</td>
                    <td class="sidebarTitle">Prize</td>
                  </tr>
                <tr valign="top">
                    <td class="sidebarText"><b>1st place finisher* – Tournament Champion</b></td>
                    <td class="sidebarText"><b>$10,000</b>
</td>
                  </tr>

                <tr valign="top">
                    <td class="sidebarText" nowrap>2nd place finisher* in the Championship Round</td>
                    <td class="sidebarText" nowrap>$5,000
</td>
                  </tr>

                <tr valign="top">
                    <td class="sidebarText" nowrap>3rd place
                        finisher* in the Championship Round</td>
                    <td class="sidebarText" nowrap>$3,500
</td>
                  </tr>                
                <tr valign="top">
                    <td class="sidebarText" nowrap>4th place
                        finisher* in the Championship Round</td>
                    <td class="sidebarText" nowrap>$1,250
</td>
                  </tr>
                <tr valign="top">
                    <td class="sidebarText" nowrap>21 finalists not finishing with one of the top 4 scores* in the Championship Round</td>
                    <td class="sidebarText" nowrap>$250 each
</td>
                  </tr>
                <tr valign="top">
                    <td class="sidebarText" nowrap>Up to 500 competitors who compete in Round 1 </td>
                    <td class="sidebarText" nowrap>Google Code Jam 2003 t-shirt
</td>
                  </tr>
                
                <tr valign="top">
                  <td class="sidebarText" colspan="2"><font size="-2">*NOTE:  Prize will be awarded at the conclusion of the Championship Round.  Winner must be present at Google's headquarters to receive the prize.</td>

                </tr>
            </table>
</p></font>
<a name="conditions"></a>
<font color="006633"><b>Conditions of Participation</b></font><br><br>
<font size="-1">By participating in the tournament, contestants agree to be bound by these rules and to all decisions of Google and TopCoder, which are final, binding and conclusive in all matters.
<br>
<br>
<font color="#ff0000">Contestants must not cheat. All ideas for any code and/or challenge submitted must be the contestant's alone.
</font><br>
<br>
Winners in each round of competition will be those competitors who win the most points in their respective rooms. All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.
<br>
<br>
Prizewinners will be announced upon completion of the Championship Round.  Any prizewinner claiming a cash prize must complete the following documents onsite before claiming the prize (Google will provide the prizewinners with these documents upon conclusion of the Championship Round):
</font>
<ul>
<li><font size="-1">	Affidavit of Eligibility and Liability and Publicity Release 
</font>
<li><font size="-1">	Applicable tax form
</font>
</ul>

<font size="-1">Prizes will be presented onsite upon receipt of the documents identified above.  All t-shirts will be sent to competitors using the address given during registration.  Unclaimed or undeliverable prizes will not be awarded.
<br>
<br>
As a condition of participation in the tournament, all information provided during registration must be comprehensive, accurate and up-to-date. Google and/or TopCoder may require contestants to complete an additional registration form to register for the tournament. In order to be eligible to participate in the tournament, contestants must have completed any and all registration forms required by Google and TopCoder.
<br>
<br>
As a condition of winning and redeeming a cash prize, winners will be required
to complete and provide to Google a completed (i) Affidavit of Eligibility and
Liability and Publicity Release (the "Affidavit"), and (ii) IRS Form W-9 or W-8BEN,
as appropriate. In completing the Affidavit, a winner (i) confirms his/her eligibility,
(ii) represents and warrants that he/she has not cheated; that the idea for the
code and/or challenge submitted is his/hers alone, (iii) verifies the accuracy
of the information submitted in the Google Code Jam 2003 registration process,
(iv) authorizes TopCoder and Google to publicize the tournament's results, (v)
agrees to sign any applicable forms required by tax authorities, (vi) licenses
to TopCoder and Google rights to all information submitted during the tournament
(including rights to source code and other executables), and (vii) releases TopCoder
and Google from liability arising out of any prize won. Google requires contestants
to complete Form W-9 or W-8BEN, as applicable, for tax reporting purposes. <br>
<br>
If prize notification is returned as undeliverable, or if the winner fails to return the Affidavit or the applicable tax form, the winner will be disqualified and the prize money won by the disqualified winner will be forfeited. Providing false information in the registration process or in the required forms described above will disqualify a winner.
<br>
<br>
By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless Google and TopCoder, their affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. Google and TopCoder specifically disclaim all liability associated with, and make no warranties with regard to, any prize given.
<br>
<br>
In addition, all prizewinners agree to cooperate with Google’s and TopCoder's
publicity efforts, without further compensation. This includes the agreement
to use their name, handle, address (city and state) and likeness for publicity
purposes, where legal, for this or similar future tournaments, and to use the
statements made by, or attributed to, the winners relating to Google and TopCoder
and any and all rights to said use, without further compensation. <br>
<br>
Google and TopCoder reserve the right, in their sole discretion, to revoke any and all privileges associated with competing in this tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, or otherwise being in violation of the rules. Google and TopCoder reserve the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</font><br>
<br>
<font color="006633"><strong>Other</strong></font><br><br>
<font size="-1">The tournament is void in whole or in part where prohibited by law.
<p><br /></p>
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