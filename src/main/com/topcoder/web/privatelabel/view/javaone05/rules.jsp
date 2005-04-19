<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel=stylesheet href="/css/javaone05.css">
<title>2005 JavaOne Coding Challenge</title>
</head>
<body>
<map name="bannerMap">
<area shape="rect" alt="http://www.sun.com/" coords="697,4,799,72" href="http://www.sun.com/" target="_new">
<area shape="rect" alt="http://java.sun.com/" coords="624,3,694,72" href="http://java.sun.com/" target="_new">
<area shape="rect" alt="http://www.sun.com/javaone" coords="0,7,616,70" href="http://www.sun.com/javaone" target="_new">
</map>

<center>
<table id="main" width="800" cellpadding="0" cellspacing="0" border="0">
            <tr>
               <td colspan="2" align="left" valign="middle">
               <img src="/i/events/javaone05/banner_top.gif" border="0" usemap="#bannerMap" alt="JavaOne - Experiencing Java technology through education, industry, and community">
               </td>
            </tr>
            <tr>
               <td valign="top" width="164"><jsp:include page="links.jsp" /></td>
               <td valign="top" >
                 <p></p>
                 <img src="/i/clear.gif" width="7" height="1"><img src="/i/events/javaone05/coding_challenge.gif" width="351" height="27" border="0">
                 <img src="/i/clear.gif" width="140" height="1"><a href="/"><img src="/i/events/javaone05/pbtc_logo.gif" width="130" height="27" border="0"/></a>
                 <p></p>
<div class="regmiddle">
<strong><font size="4">Offical Rules and Regulations</font></strong>
<br><br>
<strong>Overview</strong><br/>
The 2005 JavaOne&#8480; Coding Challenge will take place entirely at the JavaOne&#8480; Conference at the Moscone Center in San Francisco, CA from June 27th through June 29th.  Prizes will be awarded throughout the Challenge, with the winner of each daily competition receiving a "grand" prize.
<br><br>	
All expenses to attend the JavaOne&#8480; conference, including the conference registration fee, and the JavaOne&#8480; Coding Challenge are the responsibility of the individual.
<br><br>
<strong>Eligibility</strong><br/>
Each contestant must have purchased one of the following attendee passes to the JavaOne&#8480; Conference in order to participate in the JavaOne&#8480; Coding Challenge:


<ul>
<li>Conference Plus Pass</li>
<li>Conference Pass</li>
<li>JavaOne&#8480; Pavilion Guest Pass</li>
</ul>


To register for the JavaOne&#8480; conference, visit http://java.sun.com/javaone/sf/registration.jsp 
<br><br>	
The JavaOne&#8480; Coding Challenge is open to citizens and lawful permanent residents of the United States*, and to all non-immigrants currently in the United States* with a valid Visa, who are at least 18 years of age.
<br><br>	
*Including the U.S. territories of Guam, Puerto Rico and the U.S. Virgin Islands
<br><br>	
Employees and former employees of TopCoder, Inc., Sun Microsystems, Inc., JavaOne&#8480; Conference sponsors and exhibitors, and those involved in the production (including prize suppliers), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.
<br><br>
<strong>Competitions</strong><br/>
The JavaOne&#8480; Coding Challenge provides a hands-on experience for conference attendees to apply what they learn during the conference tracks.  Following each day's technical presentations, attendees can proceed to the TopCoder arena where attendees will attempt to solve various problems in the "Competition Arena."  At the conclusion of each day's Qualification Round, a 4-person competition will be held.  The four individuals who achieved the highest cumulative score for their respective problem set during the Qualification Round will be invited to compete in the afternoon's competition. The schedule of competitions is as follows:
<br><br>

DATE	TRACK	TIME (all times are PT)
Monday, June 27	Service-oriented Architectures - Qualification	11:00AM - 3:30PM
Monday, June 27	Service-oriented Architectures - Competition 	4:30PM - 6:00PM
Tuesday, June 28	Enterprise Services - Qualification 	11:00AM - 3:30PM
Tuesday, June 28	Enterprise Services - Competition	4:30PM - 6:00PM
Wednesday, June 29	Mobility - Qualification 	11:00AM - 3:30PM
Wednesday, June 29	Mobility - Competition	4:30PM - 6:00PM

<br><br>
<strong>Competition Structure</strong><br/>
Java will be the only allowable programming language in the competition.  Each competition will have 3 phases - the Coding Phase, the Challenge Phase and the System Testing Phase.  The following describes the different phases of competition: 

<ul>
<li>The Coding Phase is a timed event where all contestants are presented with either one of two possible questions or the same questions, depending on the round.  If an individual is presented with more than one (1) question during a round of competition, the questions will have varying levels of complexity and, accordingly, varying levels of point earnings potential. Multiple problems may be worked on in any order, and at the same time.  A solution to a problem may be submitted multiple times, however a point penalty of 10% of the maximum value of the problem will be assessed for each submission.  Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated based on the total time elapsed from the time the problem was opened to the time it was submitted, regardless of the time it took to submit any previous solutions to that problem, if any.  (NOTE:  Each participant will be presented with one (1) of two questions in the Qualification Round.  Two (2) questions will be presented to each participant during each competition.)</li>
<li>The Challenge Phase is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 25 points as a penalty, applied against their total score in that round of competition.  (NOTE:  There is no Challenge Phase during the Qualification Round.)</li>
<li>The System Testing Phase is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</li>
</ul>

During each competition, the Coding Phase will last 60 minutes.  After a 5-minute intermission, the Challenge Phase will commence and will last 10 minutes.  The System Testing Phase begins immediately following the end of the Challenge Phase.
<br><br>
<strong>About the Prizes</strong><br/>
Prizes will be awarded to each person who participates in the Qualification Rounds.  The winner of each day's competition will be awarded a "grand" prize.  The prizes are as follows:
<br><br>

Participant(s)	Prize
Grand Prize (3)*	
<ul>
<li>One complimentary full Conference pass to the 2006 JavaOne conference, valued at $1,995 (travel and lodging excluded)</li>
<li>A collection of 23 Java Series Publications, valued at over $950**</li>
</ul>
1st Runner Up (3)*	$500 gift certificate to redeem in the JavaOne conference Retail Store
2nd Runner Up (3)*	$250 gift certificate to redeem in the JavaOne conference Retail Store
3rd Runner Up (3)*	$125 gift certificate to redeem in the JavaOne conference Retail Store
First 800 Participants	One JavaOne Coding Challenge T-Shirt and Messenger Bag
*One Grand Prize and one 1st, 2nd, and 3rd Runner-Up prize awarded daily
**Titles subject to change based on availability 

<br><br>
Prizes will be awarded daily at the conclusion of the competition. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.
<br><br>
All contestants will only be allowed to win once during the competitions.  All contestants will be checked to ensure their eligibility, and that they have not won in any of the prior daily competitions during the 2005 JavaOne&#8480; Coding Challenge. 
<br><br>
<strong>Conditions of Participation</strong><br/>
By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder and Sun Microsystems, which are final, binding and conclusive in all matters.
<br><br>
Contestants must not cheat. All ideas for any code and/or challenge submitted must be the contestant's alone.
<br><br>
All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designees and shall be final and binding in all respects.
<br><br>
By participating in this competition and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, including Sun Microsystems, Inc., and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder and Sun Microsystems specifically disclaim all liability associated with, and make no warranties with regard to, any prize given.
<br><br>
In addition, all prizewinners agree to cooperate with TopCoder, Inc.'s and Sun Microsystems, Inc.'s publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation.  Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party contacts the prizewinner regarding employment opportunities and/or media interest as a result of the prizewinner's participation in the event.
<br><br>
TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.
<br><br>
<strong>Other</strong><br/>
The tournament is void in whole or in part where prohibited by law.
<br><br>
A list of tournament winners will be available on the web site at www.topcoder.com/javaone2005 and will be displayed for at least 3 months after the end of the tournament.
<br><br>
This tournament is brought to you by Sun Microsystems, Inc. (http://www.sun.com), 901 San Antonio Road, Palo Alto, CA 94303 and TopCoder, Inc. (http://www.topcoder.com) 703 Hebron Avenue, Glastonbury, CT 06033.

</div>
               </td>
            <tr>
               <td colspan="2" align="left" valign="middle">
                  <jsp:include page="foot.jsp" />
               </td>
            </tr>
            
         </table>
</center>
   </body>
</html>