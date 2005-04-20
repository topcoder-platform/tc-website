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
                 <table border="0" width="100%" cellpadding="7" cellspacing="0"><tr><td valign="top"><img src="/i/events/javaone05/coding_challenge.gif" width="351" height="27" border="0" /></td>
                 <td align="right" valign="top"><a href="/"><img src="/i/events/javaone05/pbtc_logo.gif" width="130" height="27" border="0" /></a></td></tr></table>
<div class="regmiddle">
<strong><font size="4">Offical Rules and Regulations</font></strong>
<br><br>
<strong>Overview</strong><br/>
The 2005 JavaOne<sup>SM</sup> Coding Challenge will take place entirely at the JavaOne<sup>SM</sup> Conference at the Moscone Center in San Francisco, CA from June 27th through June 29th.  Prizes will be awarded throughout the Challenge, with the winner of each daily competition receiving a "grand" prize.
<br><br>    
All expenses to attend the JavaOne<sup>SM</sup> conference, including the conference registration fee, and the JavaOne<sup>SM</sup> Coding Challenge are the responsibility of the individual.
<br><br>
<strong>Eligibility</strong><br/>
Each contestant must have purchased one of the following attendee passes to the JavaOne<sup>SM</sup> Conference in order to participate in the JavaOne<sup>SM</sup> Coding Challenge:


<ul>
<li>Conference Plus Pass</li>
<li>Conference Pass</li>
<li>JavaOne<sup>SM</sup> Pavilion Guest Pass</li>
</ul>


To register for the JavaOne<sup>SM</sup> conference, visit <A href="http://java.sun.com/javaone/sf/registration.jsp">http://java.sun.com/javaone/sf/registration.jsp</A> 
<br><br>    
The JavaOne<sup>SM</sup> Coding Challenge is open to citizens and lawful permanent residents of the United States*, and to all non-immigrants currently in the United States* with a valid Visa, who are at least 18 years of age.
<br><br>    
*Including the U.S. territories of Guam, Puerto Rico and the U.S. Virgin Islands
<br><br>    
Employees and former employees of TopCoder, Inc., Sun Microsystems, Inc., JavaOne<sup>SM</sup> Conference sponsors and exhibitors, and those involved in the production (including prize suppliers), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.
<br><br>
<strong>Competitions</strong><br/>
The JavaOne<sup>SM</sup> Coding Challenge provides a hands-on experience for conference attendees to apply what they learn during the conference tracks.  Following each day's technical presentations, attendees can proceed to the TopCoder arena where attendees will attempt to solve various problems in the "Competition Arena."  At the conclusion of each day's Qualification Round, a 4-person competition will be held.  The four individuals who achieved the highest cumulative score for their respective problem set during the Qualification Round will be invited to compete in the afternoon's competition. The schedule of competitions is as follows:
<br><br>

<table width="604" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
<tr>
<td class="sidebarTitle">Date</td>
<td class="sidebarTitle">Track</td>
<td class="sidebarTitle">Time (all times are PT)</td>
</tr>
<tr>
<td width="33%" class="sidebarText">Monday, June 27</td>
<td width="34%" class="sidebarText" nowrap="nowrap">Service-oriented Architectures - Qualification</td>
<td width="33%" class="sidebarText">11:00AM - 3:30PM</td>
</tr>
<tr>
<td width="33%" class="sidebarText">Monday, June 27</td>
<td width="34%" class="sidebarText">Service-oriented Architectures - Competition</td>
<td width="33%" class="sidebarText">4:30PM - 6:00PM</td>
</tr>
<tr>
<td width="33%" class="sidebarText">Tuesday, June 28</td>
<td width="34%" class="sidebarText">Enterprise Services - Qualification</td>
<td width="33%" class="sidebarText">11:00AM - 3:30PM</td>
</tr>
<tr>
<td width="33%" class="sidebarText">Tuesday, June 28</td>
<td width="34%" class="sidebarText">Enterprise Services - Competition</td>
<td width="33%" class="sidebarText">4:30PM - 6:00PM</td>
</tr>
<tr>
<td width="33%" class="sidebarText">Wednesday, June 29</td>
<td width="34%" class="sidebarText">Mobility - Qualification</td>
<td width="33%" class="sidebarText">11:00AM - 3:30PM</td>
</tr>
<tr>
<td width="33%" class="sidebarText">Wednesday, June 29</td>
<td width="34%" class="sidebarText">Mobility - Competition</td>
<td width="33%" class="sidebarText">4:30PM - 6:00PM</td>
</tr>
</table>

<br><br>
<strong>Competition Structure</strong><br/>
Java will be the only allowable programming language in the competition.  Each competition will have 3 phases - the Coding Phase, the Challenge Phase and the System Testing Phase.  The following describes the different phases of competition: 

<ul>
<li><strong>The Coding Phase</strong> is a timed event where all contestants are presented with either one of two possible questions or the same questions, depending on the round.  If an individual is presented with more than one (1) question during a round of competition, the questions will have varying levels of complexity and, accordingly, varying levels of point earnings potential. Multiple problems may be worked on in any order, and at the same time.  A solution to a problem may be submitted multiple times, however a point penalty of 10% of the maximum value of the problem will be assessed for each submission.  Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated based on the total time elapsed from the time the problem was opened to the time it was submitted, regardless of the time it took to submit any previous solutions to that problem, if any.  (NOTE:  Each participant will be presented with one (1) of two questions in the Qualification Round.  Two (2) questions will be presented to each participant during each competition.)</li>
<li><strong>The Challenge Phase</strong> is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 25 points as a penalty, applied against their total score in that round of competition.  (NOTE:  There is no Challenge Phase during the Qualification Round.)</li>
<li><strong>The System Testing Phase</strong> is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</li>
</ul>

During each competition, the Coding Phase will last 60 minutes.  After a 5-minute intermission, the Challenge Phase will commence and will last 10 minutes.  The System Testing Phase begins immediately following the end of the Challenge Phase.
<br><br>
<strong>About the Prizes</strong><br/>
Prizes will be awarded to each person who participates in the Qualification Rounds.  The winner of each day's competition will be awarded a "grand" prize.  The prizes are as follows:
<br><br>

<table width="604" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
<tr>
<td width="30%" class="sidebarTitle">Participant(s)</td>
<td width="70%" class="sidebarTitle">Prize</td>
</tr>
<tr>
<td class="sidebarText" valign="top">Grand Prize (3)*</td>
<td class="sidebarText">
<ul>
<li>One complimentary full Conference pass to the 2006 JavaOne conference, valued at $1,995 (travel and lodging excluded)</li>
<li>A collection of 23 <A href="JavaScript:void window.open('/pl/?&module=Static&d1=javaone05&d2=book_titles','Books','top=2,left=2,width=685,height=655,scrollbars=1,status=0');"">Java Series Publications</A>, valued at over $950**</li>
</ul>
</td>
</tr>
<tr><td class="sidebarText" valign="top">1st Runner Up (3)*</td><td class="sidebarText">$500 gift certificate to redeem in the JavaOne conference Retail Store</td></tr>
<tr><td class="sidebarText" valign="top">2nd Runner Up (3)*</td><td class="sidebarText">$250 gift certificate to redeem in the JavaOne conference Retail Store</td></tr>
<tr><td class="sidebarText" valign="top">3rd Runner Up (3)*</td><td class="sidebarText">$125 gift certificate to redeem in the JavaOne conference Retail Store</td></tr>
<tr><td class="sidebarText" valign="top">First 800 Participants</td><td class="sidebarText">One JavaOne Coding Challenge T-Shirt and Messenger Bag</td></tr>
<tr><td class="sidebarText"colspan="2">*One Grand Prize and one 1st, 2nd, and 3rd Runner-Up prize awarded daily<br>**Titles subject to change based on availability</td></tr>
</table>

<br><br>
Prizes will be awarded daily at the conclusion of the competition. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.
<br><br>
All contestants will only be allowed to win once during the competitions.  All contestants will be checked to ensure their eligibility, and that they have not won in any of the prior daily competitions during the 2005 JavaOne<sup>SM</sup> Coding Challenge. 
<br><br>
<strong>Conditions of Participation</strong><br/>
By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder and Sun Microsystems, which are final, binding and conclusive in all matters.
<br><br>
<span class="bigRed">Contestants must not cheat. All ideas for any code and/or challenge submitted must be the contestant's alone.</span>
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
A list of tournament winners will be available on the web site at <A href="/javaone2005">www.topcoder.com/javaone2005</A> and will be displayed for at least 3 months after the end of the tournament.
<br><br>
This tournament is brought to you by Sun Microsystems, Inc. (<A href="http://www.sun.com">http://www.sun.com</A>), 901 San Antonio Road, Palo Alto, CA 94303 and TopCoder, Inc. (<A href="/">http://www.topcoder.com</A>) 703 Hebron Avenue, Glastonbury, CT 06033.

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