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

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="hs_overview"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
<%--
                <div align="center">
                    <img src="/i/hs/banner.jpg" alt="TopCoder High School" border="0">
                </div>

                    <span class="title">2007 TopCoder High School Tournament</span>
                    <br><br>
          <span class="bigRed">No purchase necessary to enter or win.  Void where prohibited.</span>
          <h3>Overview of the Tournament</h3>
          The 2008 TopCoder High School ("TCHS") Tournament will take place between December, 2007 and March, 2008. The prize purse for this competition is at least $50,000 in scholarships and other prizes, and up to 2,000 competitors will receive a participatory prize.
          <br><br>
          <h3>Eligibility</h3>
          TopCoder members meeting the following criteria are eligible to compete in the TCHS Tournament:
          <ul>
            <li>Must be at least 13 years of age, but not more than 20 years of age (as of December 19, 2007); AND</li>
            <li>Must be currently pursuing a secondary education; AND</li>
            <li>Must NOT be matriculated full-time at a college or university; AND</li>
            <li>Must have competed in at least three (3) rated TCHS SRMs between July 12, 2007 and December 19, 2007.</li>
          </ul>

TopCoder members who are between 13 and 20 years of age or older (inclusive) as of December 19, 2007 are eligible to win scholarships and prizes, unless otherwise prohibited. The TopCoder High School Tournament is void in the Quebec province of Canada and elsewhere where prohibited by applicable law. Scholarships and prizes will not be paid to residents of Cuba, Iran, Iraq, Libya, North Korea, Sudan, or Syria. 
<br /><br />
Employees of TopCoder, Inc. and of all official tournament sponsors, regardless of commitment date as sponsor, including any companies involved in the production (including prize suppliers), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families (parent, child, sibling, and spouse of each) and/or persons living in the same household as such persons, are ineligible to enter the tournament. TopCoder members who are performing internships for any official tournament sponsor during the tournament are also ineligible to compete. 
<br /><br />
In the event that a competitor is disqualified from any round, no other competitors will be added in his/her place. The only exception to this is advancement to the onsite rounds. 
<br /><br />

<h3>Registration</h3>
Registration for the 2008 TopCoder High School Tournament will open later this year. In order to compete in a Regional Round, competitors must have registered for the tournament prior to the close of registration. In order to be eligible to compete in any of the TCHS Tournament, competitors must be a registered TopCoder High School member and have registered separately for the Tournament. There is no limit to the number of registrants for the tournament; however each individual may only register once. 
<br /><br />

<h3>Online Elimination Rounds</h3>
All individuals who have competed in at least three (3) rated TCHS SRMs between July 12, 2007 and December 19, 2007 and who have registered for the tournament are eligible to compete. 
<br /><br />
Everyone who competes in an online round must register for each round in the TopCoder Competition Arena no later than five (5) minutes prior to the start of the online round. TopCoder will communicate each Online Regional Round in Eastern Standard Time (UTC/GMT -5) or Eastern Daylight Time (UTC/GMT -4), as appropriate. <strong>Contestants may be located and competing in time zones other than Eastern Standard/Daylight Time and must adjust accordingly.</strong> If a coder does not participate, for any reason, in an online round he/she has advanced to, it will be treated as an automatic loss in that round of competition. 
<br /><br />
All competitors in a round will be randomly assigned to virtual competition rooms. Rooms will be created such that each room has a maximum of 25 competitors. The number of rooms in each round is (the # of competitors who advanced to the round)//25. 
<br /><br />
The dates and times of the online rounds of competition will be announced when registration opens. 
<br /><br />

<h3>Scoring and Advancing during Online Rounds</h3>
After each Online Regional Round, the highest scorers from across all rooms in the Region will be identified and will advance to the next online round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round for each coder. In order to advance, a coder must finish each round with a positive (i.e., greater-than-zero) point total. The structure for each Online Round will be announced when registration opens. 
<br /><br />

<h3>Competition Round Structure</h3>
Each online and onsite round of competition consists of three phases: Coding Phase, Challenge Phase, and System Testing Phase. (Note: The format of these competition rounds is similar to the format of TopCoder High School Single Round Matches. The rules in place for TCHS Single Round Matches as of December 19, 2007 will also apply to the online and onsite rounds of the TCHS Tournament.) 
<ul>
<li><strong>The Coding Phase</strong> is a timed event where all contestants are presented with the same three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time the problem was opened until the time it was submitted. During the onsite rounds of the TCHS Tournament, the Coding Phase will last 85 minutes.</li>
<li><strong>The Challenge Phase</strong> is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger. Unsuccessful challengers will incur a point reduction of 25 points as a penalty, applied against their total score in that round of competition. During the onsite rounds of the TCHS Tournament, the Challenge Phase will last 10 minutes.</li>
<li><strong>The System Testing Phase</strong> is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</li>
</ul>

<h3>Onsite Semifinal and Championship Rounds</h3>
<strong>The advancers from each the final Online Round will travel to onsite Semifinal round of the TCHS Tournament. More information on travel and visa requirements will be published when registration opens.</strong>
<br /><br />

<h3>About the Prizes</h3>
The tournament will award participatory prizes to up to 2,000 competitors and at least $50,000 in scholarships and prizes. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner. 
<br /><br />
Prize will be awarded at the conclusion of the Championship Round. Winners must be <strong>present</strong> at the onsite rounds to receive prize. TopCoder reserves the right to increase the total prize purse or change the prize breakdown distribution at its sole discretion at any point during the tournament. 
<br /><br />

<h3>Conditions of Participation</h3>
By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters. 
<br /><br />
Contestants must not cheat. All ideas for code and/or challenge submitted must be the contestant's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions. TopCoder reserves the right, in its sole discretion, to remove any competitor from the tournament who it suspects has cheated. 
<br /><br />
All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects. 
<br /><br />
All contestants who advance to  the final online round must complete the following items and submit them to TopCoder: 

<ul>
<li>Update your profile</li>
<li>Please submit a head shot by emailing <a href="mailto:memberphotos@topcoder.com">memberphotos@topcoder.com</a>, if we do not have one on file for you. If you also want your photo to be posted on your member profile on the TopCoder website, please submit your photo by clicking the "Click here to send your photo" link in the Update Profile section.</li>
</ul>
All contestants who advance to the onsite tournament rounds must complete the following items and submit them to TopCoder: 
<ul>
<li>Competitor questionnaire - the questions and responses will be published in the 2007 TopCoder High School Tournament Program</li>
<li>Travel/Lodging form - provides TopCoder with the appropriate information for your trip to the onsite tournament rounds</li>
<li>Affidavit of Eligibility and Liability and Publicity Release 
    <ul>
    <li>TopCoder must receive the original copy of a notarized affidavit unless a notarized affidavit is already on file with TopCoder. </li>
    <li>If TopCoder already has a notarized affidavit and a tax form on file for a contestant, that contestant may affirm the affidavit online. No hardcopy needs to be sent to TopCoder.</li>
    </ul>
</li>
<li>IRS Tax Form W-9 or W-8BEN, as appropriate 
    <ul>
    <li>TopCoder must receive the original copy of a signed tax form unless a tax form is already on file with TopCoder. </li>
    <li>If TopCoder already has a tax form on file for a contestant, the contestant does NOT need to send an additional tax form unless his/her address has changed. </li>
    </ul>
</li>
<li>Travel Waiver - Must be completed for all competitors under the age of 18. 
    <ul>
    <li>TopCoder must receive the original signed Travel Waiver.</li>
    </ul>
</li>
<li>Letter from your high school on official stationary that states you are currently a full time student. The letter must be written in English and signed by an official school staff member. The letter must be sent directly to TopCoder, Inc., Attn: Jessie D'Amato Ford, 703 Hebron Avenue, Glastonbury, CT, 06033, USA .</li>
</ul>

Failure to submit the above items on time will result in a forfeiture of advancement as an onsite finalist. In that case, the next highest scorer(s) from the final online round will advance. 
<br /><br />
All participatory prizes will be sent via the United States Postal Service. Unclaimed or undeliverable participatory prizes will be forfeited. Competitors who do not submit the required information listed above by the applicable deadlines will forfeit their participatory prize. 
<br /><br />
As a condition of participation in the tournament, all information provided by you in your TopCoder High School member profile must be comprehensive, accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the tournament. In order to be eligible to participate in the tournament, you must have completed any and all registration forms required by TopCoder. 
<br /><br />
As a condition of winning and redeeming a prize, certain contestants will be required to submit a completed (i) Competitor Questionnaire, (ii) Affidavit of Eligibility and Liability and Publicity Release, (iii) IRS Form W-9 or W-8BEN, as appropriate if one is not already on file with TopCoder, (iv) Travel Form, and (v) Travel Waiver, as appropriate. In completing the Affidavit of Eligibility and Liability and Publicity Release, a prize winner (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (c) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder High School member profile, (d) authorizes TopCoder to publicize the tournament's results, (e) agrees to sign any applicable forms required by tax authorities, (f) licenses to TopCoder rights to all information submitted during the tournament (including rights to source code and other executables), and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires contestants to complete the Form W-9 or W-8BEN for tax reporting purposes. If prize notification is returned as undeliverable, or if the prize winner fails to return the Questionnaire, Affidavit, W-9 or W-8BEN, Travel Form, or Travel Waiver, as specified, the prize winner will be disqualified and the prize won by the disqualified prize winner will be forfeited. Providing false information in the registration process or in the required forms described in this paragraph will disqualify a prize winner. 
<br /><br />
By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given. 
<br /><br />
In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation. Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party, including tournament sponsors, contacts the prizewinner regarding employment opportunities and/or media interest/interview as a result of the prizewinner's participation in the tournament. 
<br /><br />
TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort. 
<br /><br />

<h3>Other</h3>
The tournament is void in whole or in part where prohibited by law. 
<br /><br />
A list of tournament winners by coder handles will be available on the web site at <a href="/tc">http://www.topcoder.com/tc</a>, and will be displayed for at least 3 months after the end of the tournament. 
<br /><br />
This tournament is brought to you by TopCoder, Inc. (<a href="/">http://www.topcoder.com/</a>) 703 Hebron Avenue, Glastonbury, CT 06033.
--%>
            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>