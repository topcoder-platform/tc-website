<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Rules</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="algorithm"/>
   <jsp:param name="tabLev2" value="details"/>
   <jsp:param name="tabLev3" value="rules"/>
</jsp:include>

            <p>
                        <a href="#eligibility">Eligibility</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#structure">Competition Structure</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#prizes">About the Prizes</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#conditions">Conditions of Participation</a></p>
                        
    <!-- overview -->

            <h2>Overview of the Tournament</h2>


            <h3><font color="#CC0000">No purchase necessary to enter or win. The tournament is void where prohibited.</font></h3>

            <p>
            The 2004 TopCoder Collegiate Challenge ("TCCC") Algorithm Competition will take place between February 
            23 and April 16, 2004.  It will consist of one (1) online qualification round, four (4) online elimination 
            rounds and two (2) onsite final rounds, being the Semifinal and Championship rounds.  The prize purse for this 
            competition is $40,000 in cash.  Up to 500 competitors will receive a prize just for competing in Online Round 
            #1.  The top 24 finishers in the online rounds will advance to the onsite Semifinal and Championship rounds, 
            being held at the Boston Park Plaza Hotel & Towers in Boston, Massachusetts, USA on April 15 and 16.
            </p>
            
<!-- eligibility -->
            <a name="eligibility"></a>
            <h2><a href="#top"><img src="/i/tournament/tccc04/back_to_top.gif" alt="back to top" width="83" height="23" border="0" align="right">
            </a>Eligibility</h2>

            <p>
            TopCoder members meeting the following eligibility criteria are eligible to compete in the TCCC: 
            </p>
            <ul>
            <li>Must be at least 18 years of age (as of February 1, 2004)</li>
            <li>Must be matriculated full-time at an accredited college or university</li>
            </ul>
            <p>
            The TopCoder Collegiate Challenge is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law. Cash prizes will not be paid to residents of Cuba, Iran, Iraq, Libya, North Korea, Sudan, or Syria.
            </p>
            <p>
            Employees of TopCoder, Inc. and those involved in the production (including prize suppliers), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.
            </p>
            
            <p><span class="bodySubtitle">Registration</span><br/>
            Registration for the 2004 TopCoder Collegiate Challenge will open at 9:00AM EST on Sunday, February 1, and will close at 9:00AM EST on Monday, February 23.  In order to be eligible to compete in the Algorithm Competition, each competitor must be a registered TopCoder member and have registered separately for the Algorithm Competition.  Registration for the competition is unlimited, however each individual may only register once.</p>

            <p><span class="bodySubtitle">Qualification Round</span><br/>
            The Qualification Round will be open for 24 hours from 12:00PM EST on Monday, February 23 through 12:00PM EST on Tuesday, February 24.  Each competitor may attempt to qualify at any time during the 24 hours.  Competitors may only attempt to qualify one time during the 24 hours.</p>

            <p>The Qualification Round will consist of two phases: the Coding Phase and System Testing Phase.  NOTE: The Qualification Round will not include a Challenge Phase.</p>
            
            <p><b>The Qualification Round Coding Phase</b> is a timed event where contestants are presented with one of five possible problem sets.  Each problem set contains two questions representing two levels of complexity and, accordingly, two levels of point earnings potential. Points for a question are awarded upon submission of any solution that successfully compiles and are calculated based on the total time elapsed from the time the question was opened to the time it was submitted.  Competitors will have 60 minutes to complete either or both of the problems.  The 60 minutes will begin to elapse once the first problem is opened.  The timer in the coding window will count down to the end of the 60 minutes.  NOTE: Qualification will end promptly at 12:00PM EST on Tuesday, February 24.  A competitor who begins the qualification attempt after 11:00AM EST on Tuesday February 24 will have less than 60 minutes to attempt qualification.</p>

            <p><b>The Qualification Round System Testing Phase</b> is applied to all submitted code at the conclusion of the Qualification Round. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given question.</p>

            <p>Upon logging in to the TopCoder Arena during the Qualification Round, each competitor who has registered for the Algorithm Competition will receive a message indicating which set of problems he/she has been assigned.  The 100 highest scorers from each of the five problem sets presented during the Qualification Round will be eligible to compete in Online Round #1 of the Algorithm Competition.  A maximum of 500 competitors will advance.  Advancers will be posted within 24 hours after the conclusion of the Qualification Round.  Members will be rated at the conclusion of the Qualification Round based on their performance against others with the same problem set.</p>

<!-- structure -->
            <a name="structure"></a>
            <h2><a href="#top"><img src="/i/tournament/tccc04/back_to_top.gif" alt="back to top" width="83" height="23" border="0" align="right">
            </a>Competition Structure</h2>
         
            <p><span class="bodySubtitle">Online Elimination Rounds</span><br/>
            Everyone who competes in an online round must login to the TopCoder Competition Arena no later than ten minutes prior to the start of the online round. (See the <a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_schedule">schedule</a> for competition dates and times.) TopCoder members from around the world may be participating in these rounds, <b>but all start times will be communicated as Eastern Time, so contestants in different time zones must adjust accordingly</b>. If a coder does not participate, for any reason, in an online round they have advanced to, it will be treated as an automatic loss in that round of competition.</p>

            <p>All competitors who have qualified for an online round will be assigned to a specific room. TopCoder will determine all room assignments prior to the start of each online round in a manner such that the average competitor rating (following the Qualification Round) for each room will be similar.</p>

            <p><span class="bodySubtitle">Scoring and Advancing during Online Rounds</span><br/>
            After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next online round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round (see Competition Round Structure) for each coder. In order to advance, a coder must finish each round with a positive (i.e., greater-than-zero) point total. The structure of the online rounds is as follows:</p>

            <ul>
            <li><b>Online Round #1</b><br/>
            Up to 500 coders will compete in Round #1 and up to 200 will advance.  The winner of each of the 50 rooms will automatically advance to Online Round #2.  The remaining 150 spots will be "wildcards", and will be awarded based on total points across all rooms.  (In the event there are less than 50 room winners in Round #1, the total number of wildcard spots will be equal to 200 minus the actual number of room winners.)</li>

            <li><b>Online Round #2</b><br/>
            Up to 200 coders will compete and up to 100 will advance.  The winner of each of the 20 rooms will automatically advance to Online Round #3.  The remaining 80 spots will be wildcards and will be awarded based on total points across all rooms.  (In the event there are less than 20 room winners in Round #2, the total number of wildcard spots will be equal to 100 minus the actual number of room winners.)</li>

            <li><b>Online Round #3</b><br/>
            Up to 100 coders will compete and up to 50 will advance.  The winner of each of the 10 rooms will automatically advance to Online Round #4.  The remaining 40 spots will be wildcards and will be awarded based on total points across all rooms.  (In the event there are less than 10 room winners in Round #3, the total number of wildcard spots will be equal to 50 minus the actual number of room winners.)</li>

            <li><b>Online Round #4</b><br/>
            Up to 50 coders will compete and up to 24 will advance.  The winner of each of the 5 rooms will automatically advance to the field of Semifinalists.  The remaining 19 spots will be wildcards and will be awarded based on total points across all rooms.  (In the event there are less than 5 room winners in Round #4, the total number of wildcard spots will be equal to 24 minus the actual number of room winners.)</li>
            </ul>

            <p>NOTE:  In the event of a tie for any advancing position (i.e., room winner or wildcard spot), the tie will be resolved in the following manner:</p>

            <ul>
            <li>Total points acquired (higher is better) during the rounds of the tournament in which all of the tied participants were presented with the same set of problems (excludes the Qualification Round)</li>
            <li>If a tie still remains, then by rating (higher is better) following the Qualification Round</li>
            <li>If a tie still remains, all tied coders will advance to the next round</li>
            </ul>

            <p>With the exception of the Qualification Round, each online and onsite round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase. (Note: the format of these competition rounds is similar to the format of the Single Round Matches.)</p>

            <p><b>The Coding Phase</b> is a timed event where all contestants are presented with the same three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time the problem was opened until the time it was submitted.</p>

            <p><b>The Challenge Phase</b> is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points as a penalty, applied against their total score in that round of competition. </p>

            <p><b>The System Testing Phase</b> is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</p>

            <p><span class="bodySubtitle">Onsite Semifinal and Championship Rounds</span><br/>
            The twenty-four (24) advancers from Online Round #4 will travel to the Boston Park Plaza Hotel & Towers on Wednesday, April 14 to compete in the Semifinal round of the tournament being held on Thursday, April 15.  All contestants must arrive at the Boston Park Plaza Hotel & Towers no later than 4:00 pm on Wednesday, April 14.  If a contestant is unable to attend the onsite rounds, he/she will forfeit his/her eligibility to receive a prize, and his/her spot in the tournament will be given to the next highest overall scorer from Online Round #4.  All 24 advancing competitors will be required to confirm their ability to travel to and attend the onsite finals by <b>6:00PM EST on Wednesday, March 24</b>.</p>

            <p>TopCoder will provide travel arrangements for each competitor, up to a cost of $1,000 per person.  (That is, if a contestant's airfare is greater than $1,000, the contestant will be responsible for the difference between the cost of the airfare and $1,000.)  The Boston Park Plaza Hotel & Towers will provide travel arrangements to and from the airport and TopCoder will provide accomodations and certain meals for each contestant.  All other expenses are the responsibility of the contestant.  TopCoder will <b>not</b> provide travel or lodging accommodations for competitor guests at the 2004 TCCC.</p>

            <p>TopCoder will determine the room assignments for the Semifinal rooms prior to the start of each Semifinal round, in a manner such that the average competitor rating (following the Qualification Round) for each room will be similar.</p>

            <p>The Semifinal Round will consist of three (3) rooms of eight (8) coders each. The winner in each room will advance to the Championship Round.  The 2nd and 3rd place finishers in each round will participate in one (1) Wildcard Round.  The winner of the Wildcard Round will also advance to the Championship Round.</p>

            <p>The Championship Round will be a single round of four (4) coders. First, second, third and fourth place in the Championship round are determined by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship Round will be the coder with the highest point total for the round. In the event of a tie in the Semifinal and/or Championship rounds, the tie will be resolved in the following manner (in order):</p>

            <ul>
            <li>Total points acquired (higher is better) during Online Rounds #1, #2, #3 and #4 of the 2004 TopCoder Collegiate Challenge</li>
            <li>If a tie still remains, then by rating (higher is better) following the Qualification Round</li>
            <li>If a tie still remains in the Semifinal round, then all tied coders will advance to the Championship Round</li>
            <li>If a tie still remains in the Championship round, then the prize money will be distributed equally amongst the tied coders</li>
            </ul>
                     
<!-- prizes -->
              <a name="prizes"></a>
            <h2><a href="#top"><img src="/i/tournament/tccc04/back_to_top.gif" alt="back to top" width="83" height="23" border="0" align="right">
            </a>About the Prizes</h2>
            

            <p>The tournament will award prizes to up to 500 competitors and $40,000 in cash prizes.  Any and all applicable 
            taxes on prizes are the sole responsibility of the prizewinner.  Prizes will be distributed as follows:</p>

            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="50%" class="sidebarTitle">Competitor(s)</td>
                    <td width="50%" class="sidebarTitle" align="right">Prize</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">1st place finisher* - Algorithm Competition Champion</td>
                    <td width="50%" class="sidebarText" align="right">$25,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">2nd place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$9,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">3rd place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$4,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">4th place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$2,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">500 competitors who compete in Online Round #1 </td>
                    <td width="50%" class="sidebarText" align="right">Limited edition 2004 TopCoder Collegiate Challenge t-shirt</td>
                </tr>

                <tr>
                    <td colspan="2" class="sidebarText">* Prize will be awarded at the conclusion of the Championship Round.
                        Winner must be present at the onsite rounds to receive prize.</td>
                </tr>
            </table>

<!-- Conditions of Participation -->
            <a name="conditions"></a>
            <h2><a href="#top"><img src="/i/tournament/tccc04/back_to_top.gif" alt="back to top" width="83" height="23" border="0" align="right">
            </a>Conditions of Participation</h2>
         
         <p>By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder, which 
         are final, binding and conclusive in all matters.</p>

         <h3><font color="#CC0000">Contestants must not cheat. All ideas for any code and/or challenge submitted must be 
         the contestant's alone.</font></h3>

         <p>Winners in each online and onsite round of competition will be those competitors who win the most points in their respective rooms. 
         All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to 
         the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>

         <p>Prizewinners will be notified via e-mail within 10 days of the completion of the Online Round #1 that they have 
         won a prize.  Contestants who advance to Online Round #4 must complete the following documents online by 9:00 pm 
         EST on Wednesday, March 17, 2004:</p>

         <ul>
         <li>Update member profile - all information contained in the member's profile must be updated prior to attending the onsite finals</li>
         <li>Competitor questionnaire - the questions and responses will be published in the 2004 TopCoder Collegiate Challenge Program</li>
         <li>Travel form - provides TopCoder with the appropriate travel information in the event you advance to the onsite tournament rounds</li>
         </ul>

         <p>Contestants who advance to Online Round #4 must also complete the following documents and return them to TopCoder 
         by Wednesday, March 24, 2004:</p>

         <ul>
         <li>Affidavit of Eligibility and Liability and Publicity Release (must be notarized unless you already have a notarized 
         affidavit on file with TopCoder)</li>
         <li>Applicable tax form (unless your tax form is already on file with TopCoder)</li>
         </ul>

         <p>Prizes will be presented within 60 days of making an eligibility determination. Unclaimed or undeliverable prizes 
         will not be awarded.  Competitors who do not submit the required information listed above by the applicable deadlines 
         will forfeit their prizes.</p>

         <p>As a condition of participation in the tournament, all information provided in each competitor's TopCoder member profile 
         must be comprehensive, accurate and up-to-date. TopCoder may require each competitor to complete an additional registration form 
         to register for the tournament. In order to be eligible to participate in the tournament, each competitor must have completed any and 
         all registration forms required by TopCoder.</p>

         <p>As a condition of winning and redeeming a cash prize, winners will be required to return by Wednesday, March 17, 
         2004 a completed (i) competitor questionnaire, and (ii) travel form; and by Wednesday, March 24, 2004 a completed 
         (i) notarized Affidavit of Eligibility and Liability and Publicity Release, and (ii) IRS Form W-9 or W-8BEN, as appropriate, 
         if one is not already on file with TopCoder. In completing the Affidavit of Eligibility and Liability and Publicity Release, a 
         winner (i) confirms his/her eligibility, (ii) represents and warrants that he/she has not cheated; that the idea for the 
         code and/or challenge submitted is his/hers alone, (iii) verifies the accuracy of the demographic information submitted 
         to, and contained in, the TopCoder member database, (iv) authorizes TopCoder to publicize the tournament's results, (v) 
         agrees to sign any applicable forms required by tax authorities, (vi) licenses to TopCoder rights to all information submitted 
         during the tournament (including rights to source code and other executables), and (vii) releases TopCoder from liability 
         arising out of any prize won. TopCoder requires contestants to complete the Form W-9 or W-8BEN for tax reporting 
         purposes. If prize notification is returned as undeliverable, or if the winner fails to return the Affidavit, or the W-9 or 
         W-8BEN, as specified, the winner will be disqualified and the prize money won by the disqualified winner will be forfeited. 
         Providing false information in the registration process or in the required forms described in this paragraph will disqualify 
         a winner.</p>

         <p>By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its 
         affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective 
         directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property 
         damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, 
         from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, 
         use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard 
         to, any prize given.</p>

         <p>In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This 
         includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, 
         for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to TopCoder 
         and any and all rights to said use, without further compensation.  Furthermore, all prizewinners agree to promptly notify 
         TopCoder if a third-party contacts the prizewinner regarding employment opportunities and/or media interest as a result 
         of the prizewinner's participation in the tournament.</p>

         <p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this 
         tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder 
         suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, 
         or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is 
         not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized 
         intervention or technical failures of any sort.</p>
         
            <p><span class="bodySubtitle">Other</span><br />
            The tournament is void in whole or in part where prohibited by law.</p>

            <p>A list of tournament winners by coder handles will be available on the web site at http://www.topcoder.com/, and will be
            displayed for at least 3 months after the end of the tournament.</p>

            <p>The results of the online rounds of competition will be considered, by TopCoder, to be final at 11:00 AM EST on the day following 
            the round of competition.  Any appeals regarding the validity of these results must be received by TopCoder at the 
            <A href="mailto:service@topcoder.com" class="bodyText">service@topcoder.com</A> email address no later than 11:00 AM EST 
            on the second day following the date on which the round of competition was held.  For the onsite rounds of competition, competitors 
            may appeal the results within five (5) minutes following the announcement of the results.</p>

            <p>This tournament is brought to you by TopCoder, Inc. (http://www.topcoder.com/) 703 Hebron Avenue, Glastonbury, CT 06033.</p>

                     
        <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
