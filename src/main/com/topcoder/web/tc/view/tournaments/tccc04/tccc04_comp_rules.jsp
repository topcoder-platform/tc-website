<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Overview</title>

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
   <jsp:param name="tabLev1" value="component"/>
   <jsp:param name="tabLev2" value="details"/>
   <jsp:param name="tabLev3" value="rules"/>
</jsp:include>
            
            <p>
                        <a href="#eligibility">Eligibility</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#conditions">Conditions of Participation</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#structure">Competition Structure</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#prizes">About the Prizes</a></p>

            <h2>Overview of the Tournament</h2>

            <h3><font color="#CC0000">No purchase necessary to enter or win. The tournament is void where prohibited.</font></h3>

            <p>
            The 2004 TopCoder Collegiate Challenge ("TCCC") Component Design and Development Competition ("CDDC") will take place between January 27th and April 16th, 2004.  It will consist of two competitions - the design competition and the development competition.  Each competition will consist of two (2) online elimination rounds, and one (1) onsite final round, being the Championship round.  The prize purse for this tournament is $60,000 in cash, with $40,000 being awarded for the design competition and $20,000 for the development competition.  The top four (4) scorers after Online Round #2 in each competition will advance to the onsite Championship round, being held at the Boston Park Plaza Hotel & Towers in Boston, Massachusetts on April 16th, 2004.
            </p>
            
<!-- eligibility -->
            <a name="eligibility"></a>
            <h2><a href="#top"><img src="/i/tournament/tccc04/back_to_top.gif" alt="back to top" width="83" height="23" border="0" align="right">
            </a>Eligibility</h2>

            <p>
            TopCoder members meeting the following eligibility criteria are eligible to compete in the CDDC: 
            </p>
            <ul>
            <li>Must be at least 18 years of age (as of January 27, 2004); AND</li>
            <li>Must be matriculated full-time at an accredited college or university; AND</li>
            <li>If not a US resident, must be living in, and participating from, your country of residence; AND</li>
            <li>Must not have been permanently suspended from participating in TopCoder Component Development projects</li>
            </ul>
            
            <p>
            TopCoder members who are 18 years of age or older are eligible to win cash prizes, unless otherwise prohibited. The TopCoder Collegiate Challenge is void in the Quebec province of Canada, and elsewhere where prohibited by applicable law. Cash prizes will not be paid to residents of Cuba, Iran, Iraq, Libya, North Korea, Sudan, or Syria.
            </p>
            <p>
            Those members who are eligible to compete in both the Algorithm Competition of the TCCC and in the CDDC will be permitted to participate in both.  In addition, members will be allowed to compete in both the design and development competitions of the CDDC.  However, if one member participates in Online Rounds #1 and #2 of both the design and development competitions AND qualifies as one of the finalists in each, then the member will only be permitted to advance in one of the competitions.  The following criteria will be used to determine which competition the member will advance to:
            </p>

            <ul>
            <li>The member will advance to the competition in which he/she achieved a higher cumulative score. (Details of how cumulative score is calculated are provided below.)</li>
            <li>If the member's cumulative score is the same in both competitions, then the member will advance to the competition in which he/she achieved a higher individual component score for his/her Online Round #2 component.</li>
            <li>If the member's Online Round #2 individual component score is the same for both competitions, then the member will choose the competition in which he/she will compete.</li>
            </ul>

            <p>
            Employees of TopCoder, Inc. and those involved in the production (including prize suppliers), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament.
            </p>
            
<!-- Conditions of Participation -->
            <a name="conditions"></a>
            <h2><a href="#top"><img src="/i/tournament/tccc04/back_to_top.gif" alt="back to top" width="83" height="23" border="0" align="right">
            </a>Conditions of Participation</h2>
            
         <p>
         By participating in the tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.</p>

         <h3><font color="#CC0000">Contestants must not cheat. All ideas for any code and/or challenge submitted must be the contestant's alone.</font></h3>

         <p>All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>

         <p>As a condition of participation in the tournament, all information provided by you in your TopCoder member profile must be comprehensive, accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the tournament. In order to be eligible to participate in the tournament, you must have completed any and all registration forms required by TopCoder.</p>

         <p>As a condition of winning and redeeming a cash prize, winners will be required to return by Friday, March 26, 2004 a completed (i) notarized Affidavit of Eligibility and Liability and Publicity Release, (ii) competitor questionnaire (the questions and responses will be published in the 2004 TopCoder Collegiate Challenge Guide), (iii) travel form, and (iv) IRS Form W-9, W-8BEN, or W-8ECI, as appropriate, if one is not already on file with TopCoder. In completing the Affidavit of Eligibility and Liability and Publicity Release, a winner (i) confirms his/her eligibility, (ii) represents and warrants that he/she has not cheated; that the idea for the code and/or challenge submitted is his/hers alone, (iii) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder member database, (iv) authorizes TopCoder to publicize the tournament's results, (v) agrees to sign any applicable forms required by tax authorities, (vi) assigns to TopCoder all rights to all information submitted during the tournament (including rights to source code and other executables), and (vii) releases TopCoder from liability arising out of any prize won. TopCoder requires contestants to complete the Form W-9, W-8BEN, or W-8ECI for tax reporting purposes. If prize notification is returned as undeliverable, or if the winner fails to return the Affidavit, or the appropriate tax form, the winner will be disqualified and the prize money won by the disqualified winner will be forfeited. Providing false information in the registration process or in the required forms described in this paragraph will disqualify a winner.</p>

         <p>By participating in a tournament and redeeming a prize, a winner releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this tournament, or participation in any tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.</p>

         <p>In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar future tournaments, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation.  Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party contacts the prizewinner regarding employment opportunities and/or media interest as a result of the prizewinner's participation in the tournament.</p>

         <p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in this tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the tournament process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</p>
 
 <!-- Competition Structure -->
            <a name="structure"></a>
            <h2><a href="#top"><img src="/i/tournament/tccc04/back_to_top.gif" alt="back to top" width="83" height="23" border="0" align="right">
            </a>Competition Structure</h2>
            
            <p><span class="bodySubtitle">Scoring and Advancing</span><br/>
            During each online round of competition, eligible competitors will submit design and development solutions for at least one eligible component by the submission due date.  Submissions will be scored by the TopCoder Review Boards and will be subject to final review and appeal in the same manner as standard component design submissions.</p>
            
            <p>ALL SUBMISSIONS MUST BE RECEIVED DURING THE ROUND'S SUBMISSION TIMELINE TO BE CONSIDERED A VIABLE ENTRY.  THERE WILL BE NO EXCEPTIONS.  There will be no elimination of contestants between Online Rounds #1 and #2.  All contestants who submit components that pass screening in Online Round #1 in either competition will be eligible to participate in Online Round #2 of the same competition. The specific structure of the online rounds is as follows:</p>

            <ul>
            <li><b>Online Round #1</b><br/>
            All eligible members may compete in Online Round #1 of either or both competition(s).  Those contestants who submit components that pass screening will advance to Online Round #2.</li>

            <li><b>Online Round #2</b><br/>
            All contestants who submitted components that passed screening in Online Round #1 will compete and the four (4) contestants in each competition with the highest cumulative score will advance to Round #3.  The Online Round #2 component score will be weighted more heavily than the Online Round #1 component score in calculating the cumulative score. Each contestant's cumulative score will be calculated as follows:<br/><br/>
               <ul>
               <li>Highest individual component score from Online Round #1 + (Highest individual component score from Online Round #2 x 1.3)</li>
            </ul>
            </ul>

            <p><span class="bodySubtitle">Onsite Championship Round</span><br/>
             Four (4) members will compete in each competition.  The member with the highest individual component score of the final submission will be declared the winner.</p>
             <p>
             The four (4) advancers from Online Round #2 in each competition will travel to the Boston Park Plaza Hotel & Towers on Thursday, April 15th to compete in the final review stage of Round #3 being held on Friday, April 16th.  All contestants must arrive at the Boston Park Plaza Hotel & Towers no later than 4:00 PM on Thursday, April 15th.  If a contestant is unable to attend the onsite round, he/she will forfeit his/her eligibility to receive a prize, and his/her spot in the tournament will be given to the next highest cumulative score from Online Round #2.</p>
             <p>
             TopCoder will provide travel arrangements for each competitor up to a cost of $1,000 per person.  (That is, if a contestant's airfare is greater than $1,000, the contestant will be responsible for the difference between the cost of the airfare and $1,000.)  The Boston Park Plaza Hotel & Towers will provide travel arrangements to and from the airport, and TopCoder will provide accomodations and certain meals for each contestant.  All other expenses are the responsibility of the contestant.  TopCoder will <b>not</b> provide travel or lodging accommodations for competitor guests at the 2004 TCCC.</p>
             <p>
             Championship Round #3 will be a single round of four (4) members in each competition.  Two winners will be crowned, one Design Champion and one Development Champion.  Each champion will be the members with the highest score of his/her component submission in each competition.</p>

            <p>Championship Tiebreaker:  In the event of a tie in the Championship Round, the tie will be resolved in the following manner (in order):</p>

            <ol>
            <li>By cumulative score at the end of Online Round #2 (highest cumulative score wins)</li>
            <li>If a tie still remains, then by the highest Online Round #2 submission score</li>
            <li>If a tie still remains, then the prize money will be distributed equally among the tied members</li>
            </ol>

<!-- About the Prizes -->
            <a name="prizes"></a>
            <h2><a href="#top"><img src="/i/tournament/tccc04/back_to_top.gif" alt="back to top" width="83" height="23" border="0" align="right">
            </a>About the Prizes</h2>
            
            <p>All contestants who submit components that pass screening in Online Round #1 will receive a prize.  The tournament will award $60,000 in cash prizes, with $40,000 being awarded for the design competition and $20,000 for the development competition.  Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.  Prizes will be distributed as follows:</p>

            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="30%" class="sidebarTitle">Design Competitor</td>
                    <td width="20%" class="sidebarTitle" align="right">Prize</td>
                    <td width="30%" class="sidebarTitle">Development Competitor</td>
                    <td width="20%" class="sidebarTitle" align="right">Prize</td>
                </tr>

                <tr>
                    <td class="sidebarText">1st place finisher* - Design Competition Champion</td>
                    <td class="sidebarText" align="right">$25,000</td>
                    <td class="sidebarText">1st place finisher* - Development Competition Champion</td>
                    <td class="sidebarText" align="right">$15,000</td>
                </tr>

                <tr>
                    <td class="sidebarText">2nd place finisher* in the Championship Round</td>
                    <td class="sidebarText" align="right">$9,000</td>
                    <td class="sidebarText">2nd place finisher* in the Championship Round</td>
                    <td class="sidebarText" align="right">$2,500</td>
                </tr>

                <tr>
                    <td class="sidebarText">3rd place finisher* in the Championship Round</td>
                    <td class="sidebarText" align="right">$4,000</td>
                    <td class="sidebarText">3rd place finisher* in the Championship Round</td>
                    <td class="sidebarText" align="right">$1,500</td>
                </tr>

                <tr>
                    <td class="sidebarText">4th place finisher* in the Championship Round</td>
                    <td class="sidebarText" align="right">$2,000</td>
                    <td class="sidebarText">4th place finisher* in the Championship Round</td>
                    <td class="sidebarText" align="right">$1,000</td>
                </tr>

                <tr>
                    <td class="sidebarText">Online Round #1 and #2 participants who pass screening</td>
                    <td class="sidebarText" align="right">Limited edition 2004 TopCoder Collegiate Challenge t-shirt</td>
                    <td class="sidebarText">Online Round #1 and #2 participants who pass screening</td>
                    <td class="sidebarText" align="right">Limited edition 2004 TopCoder Collegiate Challenge t-shirt</td>
                </tr>

                <tr>
                    <td colspan="4" class="sidebarText">* Prize will be awarded at the conclusion of the Championship Round.
                        Winner must be present at the onsite rounds to receive prize.</td>
                </tr>
            </table>

            <p><span class="bodySubtitle">Other</span><br />
            The tournament is void in whole or in part where prohibited by law.</p>

            <p>A list of tournament winners by coder handles will be available on the web site at http://www.topcoder.com/, and will be
            displayed for at least 3 months after the end of the tournament.</p>

            <p>Any appeals as to the outcome of a round of competition must be submitted via email to <A href="mailto:service@topcoder.com" class="bodyText">service@topcoder.com</A> by no later than 11:00 AM Eastern Time on the date following the round for which the appeal is being addressed.</p>

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
