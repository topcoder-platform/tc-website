<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="hs_overview"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center" style="padding: 0px 0px 0px 0px;">
            <div class="myTCBody">

                <div align="center" style="margin-top: 15px;">
                    <img src="/i/hs/banner.jpg" alt="TopCoder High School" border="0">
                </div>

                <p>
                    <span class="title">2007 TopCoder High School Tournament <br>Official Rules and Regulations</span>
                    <br><br>
<span class="bigRed">No purchase necessary to enter or win.  Void where prohibited.</span>
<br><br>
<span class="subtitle">Overview of the Tournament</span><br>
The 2007 TopCoder High School ("TCHS") Tournament will take place between February 27 and May 19, 2006.  It will consist of four (4) online Regional elimination rounds and two (2) onsite final rounds, being the Semifinal and Championship Rounds. The top 25 finishers in the online Regional rounds will advance to the onsite Semifinal and Championship rounds, being held on the campus of Purdue University in West Lafayette, Indiana, USA on May 19, 2007.
<br><br>
<span class="subtitle">Eligibility</span><br>
TopCoder members meeting the following criteria are eligible to compete in the TCHS Tournament: 
<ul>
<li>Must be at least 13 years of age, but not more than 20 years of age (as of February 27, 2007); AND</li>
<li>Must be currently pursuing a secondary education; AND</li>
<li>Must NOT be matriculated full-time at a college or university; AND</li>
<li>Must have competed in at least four (4) rated regional SRMs as of February 27, 2007.</li>
</ul>

TopCoder members who are between 13 and 20 years of age or older (inclusive) as of February 27, 2007 are eligible to win scholarships and prizes, unless otherwise prohibited. The TopCoder High School Tournament is void in the Quebec province of Canada and elsewhere where prohibited by applicable law. Scholarships and prizes will not be paid to residents of Cuba, Iran, Iraq, Libya, North Korea, Sudan, or Syria.
<br><br>
Employees of TopCoder, Inc. and of all official tournament sponsors, regardless of commitment date as sponsor, including any companies involved in the production (including prize suppliers), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.  TopCoder members who are performing internships for any official tournament sponsor between February 13, 2007 and May 19, 2007 are also ineligible to compete.  
<br><br>
In the event that a competitor is disqualified from any round, no other competitors will be added in his/her place. The only exception to this is advancement to the onsite rounds. 
<br><br>
<span class="subtitle">Registration</span><br>
Registration for the 2007 TopCoder High School Tournament will open at 9:00 AM EST on Monday, February 13, 2007, and will close at 6:00 PM EST on Monday, February 26, 2007.  In order to compete in a Regional Round, competitors must have registered for the tournament prior to 6:00 PM EST on Monday, February 26, 2007.  In order to be eligible to compete in any of the TCHS Tournament, competitors must be a registered TopCoder High School member and have registered separately for the Tournament.  There is no limit to the number of registrants for the tournament; however each individual may only register once.
<br><br>
<span class="subtitle">Online Elimination Rounds</span><br>
All team members and individuals who have competed in at least four (4) rated regional SRMs prior to February 27, 2007 and who have registered for the tournament are eligible to compete in Online Regional Round 1.
<br><br>
Everyone who competes in an online round must register for each round in the TopCoder Competition Arena no later than five (5) minutes prior to the start of the online round.  TopCoder will communicate each Online Regional Round in Eastern Standard Time (UTC/GMT -5) or Eastern Daylight Time (UTC/GMT -4), as appropriate.  <b>Contestants may be located and competing in time zones other than Eastern Standard/Daylight Time and must adjust accordingly.</b>  If a coder does not participate, for any reason, in an online round he/she has advanced to, it will be treated as an automatic loss in that round of competition. 
<br><br>
Countries have been assigned to a particular region <A href="/tc?module=Static&d1=hs&d2=regions">here</A>.  Competitors may only compete in the Regional Round for their country’s region.
<br><br>
All competitors in a Region will be randomly assigned to virtual competition rooms. Rooms will be created such that each room has a maximum of 25 competitors. The number of rooms in each Regional round is maximum # advancers in the round/25.
<br><br>
The dates and times of the online Regional rounds of competition are as follows: 
<br><br>

<table class="sidebarBox" cellpadding="6" cellspacing="2" width="100%">
    <tr>
        <td class="sidebarTitle" colspan="4">Online Regional Rounds</td>
    </tr>
    <tr>
        <td class="sidebarTitle">Round of Competition</td>
        <td class="sidebarTitle">Date and Time*</td>
        <td class="sidebarTitle"># of Participants</td>
        <td class="sidebarTitle"># of Advancers</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #1 -<br>Gamma Region</td>
        <td class="sidebarText">Tuesday, February 27, 2007<br>
                                Register: 7:00 - 9:55 AM EST<br>
                                START: 10:00 AM EST</td>
        <td class="sidebarText" align="center">Up to 1,000</td>
        <td class="sidebarText" align="center">500</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #1 -<br>Alpha Region</td>
        <td class="sidebarText">Tuesday, February 27, 2007<br>
                                Register: 6:00 - 8:55 PM EST<br>
                                START: 9:00 PM EST</td>
        <td class="sidebarText" align="center">Up to 1,000</td>
        <td class="sidebarText" align="center">500</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #1 -<br>Delta Region</td>
        <td class="sidebarText">Thursday, March 1, 2007<br>
                                Register: 3:00 - 5:55 AM EST<br>
                                START: 6:00 AM EST</td>
        <td class="sidebarText" align="center">Up to 1,000</td>
        <td class="sidebarText" align="center">500</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #1 -<br>Beta Region</td>
        <td class="sidebarText">Thursday, March 1, 2007<br>
                                Register: 11:00 AM - 1:55 PM EST<br>
                                START: 2:00 PM EST</td>
        <td class="sidebarText" align="center">Up to 1,000</td>
        <td class="sidebarText" align="center">500</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #2 -<br>Gamma Region</td>
        <td class="sidebarText">Tuesday, March 6, 2007<br>
                                Register: 7:00 - 9:55 AM EST<br>
                                START: 10:00 AM EST</td>
        <td class="sidebarText" align="center">500</td>
        <td class="sidebarText" align="center">250</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #2 -<br>Alpha Region</td>
        <td class="sidebarText">Tuesday, March 6, 2007<br>
                                Register: 6:00 - 8:55 PM EST<br>
                                START: 9:00 PM EST</td>
        <td class="sidebarText" align="center">500</td>
        <td class="sidebarText" align="center">250</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #2 -<br>Delta Region</td>
        <td class="sidebarText">Thursday, March 8, 2007<br>
                                Register: 3:00 - 5:55 AM EST<br>
                                START: 6:00 AM EST</td>
        <td class="sidebarText" align="center">500</td>
        <td class="sidebarText" align="center">250</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #2 -<br>Beta Region</td>
        <td class="sidebarText">Thursday, March 8, 2007<br>
                                Register: 11:00 AM - 1:55 PM EST<br>
                                START: 2:00 PM EST</td>
        <td class="sidebarText" align="center">500</td>
        <td class="sidebarText" align="center">250</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #3 -<br>Gamma Region</td>
        <td class="sidebarText">Monday, March 12, 2007<br>
                                Register: 7:00 - 9:55 AM EST<br>
                                START: 10:00 AM EST</td>
        <td class="sidebarText" align="center">250</td>
        <td class="sidebarText" align="center">100</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #3 -<br>Alpha Region</td>
        <td class="sidebarText">Monday, March 12, 2007<br>
                                Register: 6:00 - 8:55 PM EST<br>
                                START: 9:00 PM EST</td>
        <td class="sidebarText" align="center">250</td>
        <td class="sidebarText" align="center">100</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #3 -<br>Delta Region</td>
        <td class="sidebarText">Monday, March 19, 2007<br>
                                Register: 3:00 - 5:55 AM EST<br>
                                START: 6:00 AM EST</td>
        <td class="sidebarText" align="center">250</td>
        <td class="sidebarText" align="center">100</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #3 -<br>Beta Region</td>
        <td class="sidebarText">Monday, March 19, 2007<br>
                                Register: 11:00 AM - 1:55 PM EST<br>
                                START: 2:00 PM EST</td>
        <td class="sidebarText" align="center">250</td>
        <td class="sidebarText" align="center">100</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #4 -<br>Gamma Region</td>
        <td class="sidebarText">Monday, April 2, 2007<br>
                                Register: 7:00 - 9:55 AM EST<br>
                                START: 10:00 AM EST</td>
        <td class="sidebarText" align="center">100</td>
        <td class="sidebarText" align="center">25</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #4 -<br>Alpha Region</td>
        <td class="sidebarText">Monday, April 2, 2007<br>
                                Register: 6:00 - 8:55 PM EST<br>
                                START: 9:00 PM EST</td>
        <td class="sidebarText" align="center">100</td>
        <td class="sidebarText" align="center">25</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #4 -<br>Delta Region</td>
        <td class="sidebarText">Monday, April 9, 2007<br>
                                Register: 3:00 - 5:55 AM EST<br>
                                START: 6:00 AM EST</td>
        <td class="sidebarText" align="center">100</td>
        <td class="sidebarText" align="center">25</td>
    </tr>
    <tr>
        <td class="sidebarText">Online Round #4 -<br>Beta Region</td>
        <td class="sidebarText">Monday, April 9, 2007<br>
                                Register: 11:00 AM - 1:55 PM EST<br>
                                START: 2:00 PM EST</td>
        <td class="sidebarText" align="center">100</td>
        <td class="sidebarText" align="center">25</td>
    </tr>
    <tr>
        <td class="sidebarText" colspan="4">*NOTE: In the event that a round must be cancelled for any reason, the round will take place the following day at the same time.</td>
    </tr>
</table>


<br><br>
<span class="subtitle">Scoring and Advancing during Online Regional Rounds</span><br>
After each Online Regional Round, the highest scorers from across all rooms in the Region will be identified and will advance to the next online round.  Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round for each coder. In order to advance, a coder must finish each round with a positive (i.e., greater-than-zero) point total. The structure of each Online Regional Round is as follows:
<br><br>
<span class="subtitle">Online Regional Round #1</span><br>
<ul>
<li>Up to 200 spots will be open for individuals.  The remaining 800 spots will be open for teams. If there are less than 200 individuals, we will allow more teams to compete until the 1,000 spots are filled or there are no teams left.</li>
<li>Teams will advance until the 1,000 spots have been filled. If the number of available spots left within that 1,000 is not large enough to fully accommodate the next team, the full team will advance.</li>
<li>If there are more than 1,000 qualified participants in any Region prior to Round 1, we will limit it to the top 1,000 teams/individuals in the following manner:
  <ul>
  <li>We will advance the teams with the best average team placement for the four (4) regional rated events in which they placed the best.</li>
  <li>We will advance the individuals with the best average individual placement for the four (4) regional rated events in which they placed the best.</li>
  </ul>
</li>
</ul>
<span class="subtitle">Online Regional Round #2</span><br>
<ul>
<li>Up to 100 spots will be open for individuals. The remaining 400 spots will be open for teams. If there are less than 100 individuals, we will allow more teams to compete until the 500 spots are filled or there are no teams left.</li>
<li>Teams will advance until the 500 spots have been filled. If the number of available spots left within that 500 is not large enough to fully accommodate the next team, the full team will advance.</li>
</ul>
<span class="subtitle">Online Regional Round #3</span><br>
<ul>
<li>Up to 50 spots will be open for individuals.  The remaining 200 spots will be open for teams. If there are less than 50 individuals, we will allow more teams to compete until the 50 spots are filled or there are no teams left.</li>
<li>Teams will advance until the 250 spots have been filled. If the number of available spots left within that 250 is not large enough to fully accommodate the next team, the full team will advance.</li>
</ul>
<span class="subtitle">Online Regional Round #4</span><br>
<ul>
<li>Up to 20 spots will be open for individuals.  The remaining 80 spots will be open for teams.  If there are less than 20 individuals, we will allow more teams to compete until the 20 spots are filled or there are no teams left.</li>
<li>Teams will advance until the 100 spots have been filled. If the number of available spots left within that 100 is not large enough to fully accommodate the next team, the full team will advance.</li>
</ul>
Once a team has been eliminated from the online rounds of competition, members of the team can continue to compete in the individual track provided that their score during the round that their team is eliminated in is sufficient to advance them among the group of competing individuals.
<br><br>
Teams may only travel to the onsite finals with <b>three (3) team members</b>.  The top 6 teams and top 7 individuals from each Online Regional Round #4 (a total of 100 participants) will advance to the onsite finals.  
<br><br>
<b>NOTE:</b>  In the event of a tie for any advancing position during the Online Regional Rounds, the tie will be resolved in the following manner:
<ul>
<li>Total points acquired (higher is better) during the previous round of competition.</li>
<li>If a tie still remains, then by best average team/individual placement at the start of the tournament.</li>
<li>If a tie still remains, all tied coders will advance to the next round.</li>
</ul>
<span class="subtitle">Competition Round Structure</span><br>
Each online and onsite round of competition consists of three phases: Coding Phase, Challenge Phase, and System Testing Phase. (Note: The format of these competition rounds is similar to the format of TopCoder High School Single Round Matches.  The rules in place for TCHS Single Round Matches as of February 27, 2007 will also apply to the online and onsite rounds of the TCHS Tournament.)
<ul>
<li><b>The Coding Phase</b> is a timed event where all contestants are presented with the same three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time the problem was opened until the time it was submitted.  During the TCHS Tournament, the Coding Phase will last 85 minutes.</li>
<li><b>The Challenge Phase</b> is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 25 points as a penalty, applied against their total score in that round of competition.  During the TCHS Tournament, the Challenge Phase will last 10 minutes.</li>
<li><b>The System Testing Phase</b> is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</li>
</ul>

<span class="subtitle">Onsite Semifinal and Championship Rounds</span><br>
The twenty-five (25) advancers from each Online Regional Round #4 will travel to the campus of Purdue University on Friday, May 18, 2007 to compete in the Semifinal round of the TCHS Tournament being held on Saturday, May 19, 2007.  All contestants must arrive at the campus of Purdue University no later than 4:00 PM EDT on Friday, May 18, 2007.  All contestants must confirm their attendance at the onsite rounds no later than 8:00 AM EDT (UTC/GMT -4) on Monday, April 23, 2007.  That is, contestants must have acquired any necessary travel visas and know for certain that they can travel to the U.S. by that date and time.  All three members of a team must be able to travel to the U.S.  If any team member is unable to attend the onsite rounds, the team will forfeit its eligibility to receive any prizes awarded to onsite finalists, and the team’s spot in the tournament will be given to the eligible next team from Online Round #4.  If an individual is unable to attend the onsite rounds, he/she will forfeit his/her eligibility to receive any prizes awarded to onsite finalists, and his/her spot in the tournament will be given to the next eligible individual from Online Round #4.
<br><br>
At the end of each Online Regional Round #2, TopCoder will issue letters at the request of international competitors who require one to obtain a travel visa to enter the United States.  Visa letters can be requested by emailing MaryBeth Luce at <A href="mailto:mluce@topcoder.com">mluce@topcoder.com</A> and must be requested by Wednesday, April 11, 2007 at 5:00 PM EDT (UTC/GMT -4).  Visas can take a significant amount of time to obtain in certain countries; therefore, for those competitors who need a letter, it is in their best interest to request one well before the deadline.  The cost of obtaining a visa is the sole responsibility of the competitor.
<br><br>
Travel arrangements to Indianapolis, Indiana, USA are the responsibility of each competitor.  TopCoder may assist in making the reservations, but the cost is the responsibility of each competitor.  Each team is <b>required</b> to travel with an adult chaperone (i.e., a person who is 18 years of age or older).  The cost of the chaperone’s travel arrangements to Indianapolis, Indiana, USA is his/her responsibility.
<br><br>
TopCoder will provide ground transportation from the Indianapolis airport to the Purdue University campus and back to the Indianapolis airport.  TopCoder will also provide campus lodging accommodations on May 18 and 19, 2007 for finalists and chaperones, as well as all meals (breakfast, lunch and dinner) for each contestant on May 19, 2007.  All other expenses are the responsibility of the contestant.  
<br><br>
TopCoder will determine the room assignments for the Semifinal rooms prior to the start of the Semifinal Round, in a manner such that people on the same team tend to be placed in different rooms.  The dates and times of the onsite Semifinal and Championship Rounds are as follows: 
<br><br>
<table align="center" class="sidebarBox" cellpadding="6" cellspacing="2" width="400">
    <tr>
        <td class="sidebarTitle" colspan="2">Onsite Rounds</td>
    </tr>
    <tr>
        <td class="sidebarTitle">Round of Competition</td>
        <td class="sidebarTitle">Date and Time (Eastern Daylight Time)</td>
    </tr>
    <tr>
        <td class="sidebarText">Semifinal Round</td>
        <td class="sidebarText">Saturday, May 19, 2007 @ 10:00 AM</td>
    </tr>
    <tr>
        <td class="sidebarText">Championship Round</td>
        <td class="sidebarText">Saturday, May 19, 2007 @ 3:00 PM</td>
    </tr>
</table>

<br><br>
<b>The Semifinal Round</b> will consist of virtual rooms with a total of 100 competitors (72 team members and 28 individuals). The ten (10) highest scoring teams and the ten (10) highest scoring individuals in the Semifinal Round will advance to the Championship Round. 
<br><br>
<b>The Championship Round</b> will be a single round of forty (40) coders – thirty (30) team members and ten (10) individuals. Placement in the Championship Round is determined by comparing the total points of each coder. The winning team in the Championship Round will be the team with the best (i.e., lowest) team placement for the round. The winning individual in the Championship Round will be the individual with the best (i.e., lowest) individual placement in the round.  In the event of a tie in the Semifinal or Championship Rounds, the tie will be resolved in the following manner (in order):
<ul>
<li>Total points acquired (higher is better) during Online Regional Rounds #1, #2, #3 and #4 of the 2007 TCHS Tournament</li>
<li>If a tie still remains in the Semifinal Round, then all tied teams/individuals will advance to the Championship Round</li>
<li>If a tie still remains in the Championship Round, then the prize will be distributed equally among the tied teams or individuals</li>
</ul>

<span class="subtitle">Conditions of Participation</span><br>
By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.  
<br><br>
<span class="bigRed">Contestants must not cheat. All ideas for code and/or challenge submitted must be the contestant's alone.  TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions.  TopCoder reserves the right, in its sole discretion, to remove any competitor from the tournament who it suspects has cheated.</span>
<br><br>
All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.
<br><br>
All contestants who advance to the onsite tournament rounds must complete the following items and submit them to TopCoder by 5:00 PM EDT (UTC/GMT -4) on Wednesday, April 25, 2007:
<ul>
<li>Competitor questionnaire – the questions and responses will be published in the 2007 TopCoder High School Tournament Program</li>
<li>Travel/Lodging form – provides TopCoder with the appropriate information for your trip to the onsite tournament rounds</li>
<li>Affidavit of Eligibility and Liability and Publicity Release
  <ul>
  <li>TopCoder must receive the original copy of a notarized affidavit unless a notarized affidavit is already on file with TopCoder. The document must be postmarked by April 25, 2007, and must be sent in such a manner that it will arrive at TopCoder no later than May 4, 2007.</li>
  <li>If TopCoder already has a notarized affidavit and a tax form on file for a contestant, that contestant may affirm the affidavit online. No hardcopy needs to be sent to TopCoder.</li>
  </ul>
</li>
<li>IRS Tax Form W-9 or W-8BEN, as appropriate
  <ul>
  <li>TopCoder must receive the original copy of a signed tax form unless a tax form is already on file with TopCoder. The document must be postmarked by April 25, 2007, and must be sent in such a manner that it will arrive at TopCoder no later than May 4, 2007.</li>
  <li>If TopCoder already has a tax form on file for a contestant, the contestant does NOT need to send an additional tax form unless his/her address has changed.</li>
  </ul>
</li>
<li>Travel Waiver – Must be completed for all competitors under the age of 18.
  <ul>
  <li>TopCoder must receive the original signed Travel Waiver. The document must be postmarked by April 25, 2007, and must be sent in such a manner that it will arrive at TopCoder no later than May 4, 2007.</li>
  </ul>
</li>
</ul>

Failure to submit the above items on time will result in a forfeiture of advancement as an onsite finalist.  In that case, the next highest scorer(s) from Online Regional Round #4 will advance.
<br><br>
All participatory prizes will be sent via the United States Postal Service by July 23, 2007. Unclaimed or undeliverable participatory prizes will be forfeited. Competitors who do not submit the required information listed above by the applicable deadlines will forfeit their participatory prize.
<br><br>
As a condition of participation in the tournament, all information provided by you in your TopCoder High School member profile must be comprehensive, accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the tournament. In order to be eligible to participate in the tournament, you must have completed any and all registration forms required by TopCoder.
<br><br>
As a condition of winning and redeeming a prize, certain contestants will be required to submit a completed (i) Competitor Questionnaire, (ii) Affidavit of Eligibility and Liability and Publicity Release, (iii) IRS Form W-9 or W-8BEN, as appropriate if one is not already on file with TopCoder, (iv) Travel Form, and (v) Travel Waiver, as appropriate. In completing the Affidavit of Eligibility and Liability and Publicity Release, a prize winner (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (c) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder High School member profile, (d) authorizes TopCoder to publicize the tournament's results, (e) agrees to sign any applicable forms required by tax authorities, (f) licenses to TopCoder rights to all information submitted during the tournament (including rights to source code and other executables), and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires contestants to complete the Form W-9 or W-8BEN for tax reporting purposes. If prize notification is returned as undeliverable, or if the prize winner fails to return the Questionnaire, Affidavit, W-9 or W-8BEN, Travel Form, or Travel Waiver, as specified, the prize winner will be disqualified and the prize won by the disqualified prize winner will be forfeited. Providing false information in the registration process or in the required forms described in this paragraph will disqualify a prize winner.
<br><br>
By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.
<br><br>
In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation.  Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party, including tournament sponsors, contacts the prizewinner regarding employment opportunities and/or media interest/interview as a result of the prizewinner’s participation in the tournament.
<br><br>
TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.
<br><br>
<span class="subtitle">Other</span><br>
The tournament is void in whole or in part where prohibited by law.
<br><br>
A list of tournament winners by coder handles will be available on the web site at <A href="/tc">http://www.topcoder.com/tc</A>, and will be displayed for at least 3 months after the end of the tournament.
<br><br>
This tournament is brought to you by TopCoder, Inc. (<A href="/">http://www.topcoder.com/</A>) 703 Hebron Avenue, Glastonbury, CT 06033.
<br><br>

                    <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=509013">Discuss TopCoder High School</a>
                    <br><br>
                </p>

            </div>

        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
