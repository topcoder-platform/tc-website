<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="rules"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        <h2>Component Competition Official Rules and Regulations</h2>
        
        <p>
            <a href="#eligibility">Eligibility</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#placement">Placement</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#schedule">Schedule</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#scoring">Scoring and Advancing</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#prizes">Prizes</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#conditions">Conditions of Participation</a>
        </p>
        <p><span class="bigRed">No purchase necessary to enter or win. Void where prohibited.</span></p>
        
        <div class="sub_content">
            <h3>Overview of the Tournament</h3>
            <p>The 2008 TopCoder Open Component Design and Development Competition ("CDDC") will take place between January 14 and May 15, 2008 and is part of the 2008 TopCoder Open ("Tournament"). It will consist of two competitions - the design competition and the development competition. Each competition will consist of six (6) weeks of online qualifying competitions and one (1) onsite Championship round. The prize purse for this tournament is $120,000 in cash, with $60,000 being awarded for each competition. Up to twelve (12) competitors in each competition with the highest cumulative placement scores after the online rounds will advance to the onsite Championship Round, at the Mirage Hotel and Casino in Las Vegas, Nevada, USA on May 11 - 15, 2008.</p>
            
            <a name="eligibility"></a>
            <h3>Eligibility</h3>
            <p>TopCoder members meeting the following eligibility criteria are eligible to compete in the CDDC:</p>
            <ul>
                <li>Must be at least 18 years of age as of January 14, 2008; AND</li>
                <li>If not a US resident, must be living in, and participating from, your country of residence; AND</li>
                <li>Must currently be eligible for participation in TopCoder Component projects (i.e., not suspended from TopCoder); AND</li>
                <li>Must not be a resident of Cuba, Iran, North Korea, Sudan or Syria.</li>
            </ul>
            <p>The TopCoder Open is void in the Quebec province of Canada and where prohibited by applicable law.</p>
            <p>Employees of TopCoder, Inc. and of all Tournament sponsors, regardless of commitment date as sponsor, including any companies involved in the production (including prize suppliers), implementation and distribution of this Tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the Tournament and members of their immediate families (parent, child, sibling, and spouse of each) and/or persons living in the same household as such persons, are ineligible to participate in the Tournament. If a competitor's employer signs on as an official sponsor of the Tournament after January 14, 2008, then that competitor will be removed from further participation in the Tournament. TopCoder members who are performing internships for any Tournament sponsor between January 14 and May 15, 2008 are also ineligible to compete.</p>
            <p>Those members who are eligible to compete in any of the four (4) Tournament competitions will be permitted to participate in any/all of them online. However, in the event a competitor becomes a finalist in more than one competition and the onsite competition times overlap, the competitor must choose only one competition in which to participate as a finalist by March 26, 2008.</p>
            
            <a name="placement"></a>
            <h3>Placement Scoring</h3>
            <p>Scoring in the CDDC is determined based on the placement for each submission. Placement is determined based on the score awarded for a particular component. For example, if 3 submissions were received for a component and the scores were 93, 89, and 71, the member receiving the score of 93 would be in 1st place and would receive 10 points.  Only members registered for the CDDC are considered when determining place and placement points. In order to receive placement points, a submission must pass the minimum component score of 75. Placement scoring is as follows:</p>
            <ul>
                <li>1st Place - 10 Points</li>
                <li>2nd Place - 7 Points</li>
                <li>3rd Place - 5 points</li>
                <li>4th Place - 4 Points</li>
                <li>5th Place (and lower) - 0 Points</li>
            </ul>
            <p><strong>Penalty points</strong><br />
            All final fixes will be completed according to the component schedule. If a competitor misses final fixes for a component, they will be docked one (1) placement point per day they are late with final fixes. TopCoder has the final determination on the imposition of any penalties.</p>
            
            <a name="schedule"></a>
            <h3>Schedule</h3>
            <p>Both the design and development competitions will have six (6) weeks of online competition and one (1) onsite Championship Round. Each competitor participating in an online round must submit his/her design and/or development submission for components by the submission deadline.  All start time will be communicated as Eastern Standard Time (UTC/GMT -5) unless otherwise noted.</p>
            <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                <tr>
                    <th>Schedule</th>
                    <th>Posted On or After</th>
                    <th colspan="2">Submission Deadline On or Before</th>
                </tr>
                <tr class="dark">
                    <td>Online Round</td>
                    <td>January 24, 2008<br />at <a target="_blank" href="<tc-webtag:linkTracking link='http://timeanddate.com/worldclock/fixedtime.html?month=1&day=24&year=2008&hour=9&min=0&sec=0&p1=98' refer='tco08_compSchedule' />">9:00 AM</a></td>
                    <td>March 6, 2008<br />at <a target="_blank" href="<tc-webtag:linkTracking link='http://timeanddate.com/worldclock/fixedtime.html?month=3&day=6&year=2008&hour=9&min=0&sec=0&p1=98' refer='tco08_compSchedule' />">9:00 AM</a></td>
                </tr>
            </table>
            <br />
            
            <a name="scoring"></a>
            <h3>Scoring and Advancing</h3>
            <p>During each week of competition, eligible competitors can submit design and development solutions for at least one eligible component by the submission deadline. Submissions will be scored by the TopCoder Review Boards and will be subject to final review and appeal in the same manner as component design and development submissions outside of the Tournament. Scoring of each submission by the TopCoder Review Boards is based on the criteria outlined in the Development Review Scorecard for the Development Contest or the criteria outlined in the Design Review Scorecard for the Design Contest. Note that the scorecards to be used for the CDDC are the ones that are in effect as of January 14, 2008, as may be amended from time to time. ALL SUBMISSIONS MUST BE RECEIVED BY THE SUBMISSION DEADLINE TO BE CONSIDERED A VIABLE ENTRY. THERE WILL BE NO EXCEPTIONS. There will be no elimination of contestants during the online competition.</p>
            <p>Up to the five (5) highest individual placement scores that each contestant receives for his/her submissions throughout the six (6) weeks of competition will be added together for a cumulative placement score. Up to twelve (12) competitors in each competition with the highest cumulative placement score greater than zero will advance to the onsite Championship round.</p>
            <p>In the event of a tie of cumulative placement score for advancement to the Championship round, the tie will be resolved in the following manner:</p>
            <ol>
                <li>Highest cumulative component score of the lesser number of components used to develop the cumulative placement score for the tied competitors.</li>
                <li>If a tie still remains, then the highest individual component score of the lesser number of components used to develop the cumulative placement score for the tied competitors.</li>
                <li>If a tie still remains, then all tied contestants will advance to the online Championship round.</li>
                <li>Components where the competitor earned 0 points will not be counted towards tiebreaker scores.</li>
            </ol>
            <p><strong>Example:</strong><br />
            Contestant #1 submits three components in the design competition, earning the following component and placement scores:<br />
            Component #1 - score 88.45; placement 2; placement score 7<br />
            Component #2 - score 76.33; placement 3; placement score 5<br />
            Component #3 - score 82.89; placement 3; placement score 5<br />
            Cumulative placement score: 7 + 5 + 5 = 17</p>
            <p>Contestant #2 submits two components in the design competition, earning the following component and placement scores:<br />
            Component #1 - score 92.56; placement 1; placement score 10<br />
            Component #2 - score 75.83; placement 2; placement score 7<br />
            Cumulative placement score: 10 + 7 = 17</p>
            <p>To determine who advances to Championship round, look at the highest cumulative component score of the lesser number of components used to develop the cumulative placement score for the tied competitors.<br />
            Contestant #1: 88.45 + 82.89 = 171.34<br />
            Contestant #2: 92.56 + 75.83 = 168.39<br />
            Contestant #1 would advance to the Championship round.</p>
            
            <h3>Onsite Semifinal and Championship Rounds</h3>
            <h4>Important Information</h4>
            <h4>Travel Confirmation</h4>
            <p>Up to twelve (12) competitors in the design competition from the six (6) weeks of online competition will travel to the Mirage on Sunday, May 11, 2008 to compete in the onsite Championship Round of the CDDC being held on Monday, May 12, 2008. All design competitors must arrive at the Mirage no later than 5:00 PM PDT (UTC/GMT -7) on Sunday, May 11, 2008.</p>
            <p>Up to twelve (12) competitors in the development competition from the six (6) weeks of online competition will travel to the Mirage on Monday, May 12, 2008 to compete in the onsite Championship Round of the CDDC being held on Wednesday, May 14, 2008. All development competitors must arrive at the Mirage no later than 5:00 PM PDT (UTC/GMT -7) on Monday, May 12, 2008.</p>
            <p>All competitors must confirm their attendance at the onsite Championship no later than 5:00 PM EDT (UTC/GMT -4) on Wednesday, March 26, 2008, and must have acquired any necessary travel visas and know for certain that they can travel to the United States. If a competitor is required to travel from outside the United States, it is necessary for the competitor to show proof of a visa and/or passport by 5:00 PM EDT (UTC/GMT -4) on Wednesday, March 26, 2008. Competitors may email a copy of their documents to <a href="mailto:jdamato@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a>. Competitors who fail to meet this requirement will be replaced as an onsite finalist.</p>
            <h4>Visa Assistance</h4>
            <p>TopCoder will issue visa invitation letters at the request of international competitors who require one to obtain a travel visa to enter the United States. All competitors that pass screening on at least one component will receive a request form to fill out if they require a letter. As soon as a competitor fills out the form in its entirety and returns it to TopCoder, the visa letter will be mailed. Competitors have until 5:00 PM EDT (GMT/UTC -4) on Wednesday, March 12, 2008 to request a letter. Visas can take a significant amount of time to obtain in certain countries; therefore, for those competitors who need a letter, it is in their best interest to request one well before the deadline. The cost of obtaining a visa is the sole responsibility of the competitor. See more information about <a href="/wiki/display/tc/Getting+your+Visa+and+Getting+it+Early">travel visas</a>.</p>
            <h4>Travel Details</h4>
            <p>TopCoder will provide air travel arrangements for each competitor. The flight will be reserved and paid for by TopCoder and will be for arrival on May 11, 2008 and departure on May 15, 16 or 17, 2008, whichever is most cost-effective. At TopCoder's sole discretion, TopCoder will pay for each competitor's airfare up to $1,500, but reserves the right to make exceptions to the maximum amount based on individual circumstances.  If a Competitor wishes to take a flight other than the one provided by TopCoder and/or wishes to stay in a hotel other than the Mirage or wishes to stay additional nights at the Mirage or another hotel, the Competitor shall be responsible for the entire cost of such a deviation from the accommodations and travel arrangements provided by TopCoder.  In addition, Competitor agrees to reimburse TopCoder for any costs, penalties, fines or fees incurred by TopCoder as a result of such a deviation.</p>
            <p>Ground transportation to and from McCarran International Airport will be provided for each competitor by TopCoder, as well as hotel accommodations and certain meals. All other expenses are the responsibility of the competitor. TopCoder will not provide travel or lodging accommodations for any guests of a competitor.</p>
            
            <h3>Onsite Championship Round</h3>
            <p>Each competitor will be given their assignment onsite.  The Onsite Championship round will be run the same way as an online competition except that <u>there will be no appeals phase</u>.  The winner will be determined after the review phase.</p>
            <p>The competitors in the onsite Design Championship Round will be given six (6) hours to design a component to interface with the winning graphical design from the Studio Championship Round.  While the Design competitors will not have access to the actual winning Studio submission, they will have access to the Studio competition requirements.  At the completion of the six (6) hour submission phase, the review board will review each submission using the standard TopCoder Design Scorecard.  The winner will be determined based on the highest review score.  The winner will be responsible for final fixes and supporting the design during the onsite Development Championship Round.</p>
            <p>The competitors of the onsite Development Championship Round will be given eight (8) hours to integrate the winning graphical design from the Studio Championship Round and the winning Design submission to create a working module.  The Development competitors will have access to both the winning Studio submission and the winning Design submission.  At the completion of the eight (8) hour submission phase, the review board will review each submission using the standard TopCoder Development Scorecard.  The winner will be determined based on the highest review score.</p>
            <p>In the event of a tie during the onsite Championship Round for either competition, the tie will be resolved in the following manner:</p>
            <ul>
                <li>The competitor who receives a majority of the higher scores from the Review Board will place higher.</li>
                <li>If a tie still remains, then the competitor who uploaded their final submission first will place higher.</li>
            </ul>
            
            <a name="prizes"></a>
            <h3>About the Prizes</h3>
            <p>The tournament will award $120,000 in cash prizes, with $60,000 being awarded for each competition. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner. Additionally, each component winner will be paid the component prize money for the associated online competition.</p>
            <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                <tr>
                    <th colspan="3">Prizes</th>
                </tr>
                <tr>
                    <th>Competitor(s)</th>
                    <th>Design Prize</th>
                    <th>Development Prize</th>
                </tr>
                <tr class="dark">
                    <td><strong>1st place finisher* in the Championship Round</strong></td>
                    <td><strong>$25,000</strong></td>
                    <td><strong>$25,000</strong></td>
                </tr>
                <tr class="light">
                    <td>2nd place finisher* in the Championship Round</td>
                    <td>$10,000</td>
                    <td>$10,000</td>
                </tr>
                <tr class="dark">
                    <td>3rd place finisher* in the Championship Round</td>
                    <td>$8,000</td>
                    <td>$8,000</td>
                </tr>
                <tr class="light">
                    <td>4th place finisher* in the Championship Round</td>
                    <td>$5,000</td>
                    <td>$5,000</td>
                </tr>
                <tr class="dark">
                    <td>5th place finisher* in the Championship Round</td>
                    <td>$1,500</td>
                    <td>$1,500</td>
                </tr>
                <tr class="light">
                    <td>6th place finisher* in the Championship Round</td>
                    <td>$1,500</td>
                    <td>$1,500</td>
                </tr>
                <tr class="dark">
                    <td>7th place finisher* in the Championship Round</td>
                    <td>$1,500</td>
                    <td>$1,500</td>
                </tr>
                <tr class="light">
                    <td>8th place finisher* in the Championship Round</td>
                    <td>$1,500</td>
                    <td>$1,500</td>
                </tr>
                <tr class="dark">
                    <td>9th place finisher* in the Championship Round</td>
                    <td>$1,500</td>
                    <td>$1,500</td>
                </tr>
                <tr class="light">
                    <td>10th place finisher* in the Championship Round</td>
                    <td>$1,500</td>
                    <td>$1,500</td>
                </tr>
                <tr class="dark">
                    <td>11th place finisher* in the Championship Round</td>
                    <td>$1,500</td>
                    <td>$1,500</td>
                </tr>
                <tr class="light">
                    <td>12th place finisher* in the Championship Round</td>
                    <td>$1,500</td>
                    <td>$1,500</td>
                </tr>
                <tr class="dark">
                    <td>Online participants who score at least 15 placement points for either the Design or the Development Competition</td>
                    <td>Limited edition 2008 TopCoder Open t-shirt</td>
                    <td>Limited edition 2008 TopCoder Open t-shirt</td>
                </tr>
                <tr class="light">
                    <td colspan="3">* Prize will be awarded after the conclusion of the Championship Round. Except for the award of t-shirts, the winner must be present at the onsite Awards Presentation to receive prize.</td>
                </tr>
            </table>
            <br />
            <p>In order for onsite finalists to receive their cash prize, they must first complete all CDDC and Tournament-related work for all online rounds and the Championship Round, including final fixes.</p>
            
            <a name="conditions"></a>
            <h3>Conditions of Participation</h3>
            <p>By participating in the CDDC and the Tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters. Also, by participating in the CDDC and the Tournament, you consent to provide certain information Tournament sponsors. Such information shall include the information contained in your TopCoder member profile, as well as your competition statistics.</p>
            <p><span class="bigRed">Competitors must not cheat. All ideas for designs and concepts submitted must be the competitor's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting a design that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions, the CDDC and/or the Tournament. TopCoder reserves the right, in its sole discretion, to remove any competitor from the CDDC and/or the Tournament whom it suspects of cheating.</span></p>
            <p>If a competitor is eliminated for cheating after he/she is confirmed as a finalist and travel accommodations have already been made for the competitor by TopCoder for the Onsite Round, that competitor will be responsible for reimbursing TopCoder for the cost of such accommodations.  TopCoder reserves the right to withhold any cash prizes earned or owed until the cost of such accommodations has been fully reimbursed.</p>
            <p>All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the CDDC and the Tournament are within the sole discretion of TopCoder or its designee and are final and binding in all respects.</p>
            <p>As a condition of participation in the CDDC and the Tournament, all information provided by you in your TopCoder member profile must be accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the CDDC and/or the Tournament. In order to be eligible to participate in the CDDC, you must have completed any and all registration forms required by TopCoder.</p>
            <p>Competitors who advance to the onsite Championship Round must complete the following items and submit them to TopCoder by 5:00 PM EDT on Wednesday, March 26, 2008:</p>
            <ul>
                <li>Confirmation of attendance/proof of travel documents - Please email <a href="mailto:jdamato@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a> to confirm your attendance onsite. If you require a passport and/or visa to visit the United States, you must show proof of your documents via a scanned copy of the necessary documents.</li>
                <li>Please <a href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto">submit a photo</a>, if you have not already done so.</li>
                <li>Please ensure your most up-to-date information is listed in your TopCoder profile in the event we need to mail your plane tickets or contact you via telephone.</li>
                <li>Competitor Questionnaire - the questions and responses may be published in the 2008 TopCoder Open program</li>
                <li>Travel form - provides TopCoder with the appropriate travel information for your trip to the onsite tournament rounds</li>
                <li>Affidavit of Eligibility and Liability and Publicity Release - TopCoder must receive the original copy of a notarized affidavit unless a notarized affidavit is already on file with TopCoder. The document must be postmarked by March 26, 2008, and must be sent in such a manner that it will arrive at TopCoder no later than April 26, 2008.</li>
                <li>TopCoder Competition Assignment Agreement - TopCoder must receive an executed copy of the Agreement unless an executed Agreement is already on file with TopCoder.  The Agreement must be postmarked by March 26, 2008, and must be sent in such a manner that it will arrive at TopCoder no later than April 26, 2008.</li>
                <li>Applicable tax form (unless one is already on file with TopCoder).</li>
                <li>If TopCoder already has a notarized affidavit, tax form, or Assignment Agreement on file for a Competitor, that Competitor may affirm such document online.</li>
            </ul>
            <p>A competitor who fails to submit the above items on time will not advance to the Onsite Round and will be replaced by the competitor with the next highest cumulative placement points.</p>
            <p>Except as otherwise provided in these rules, all prizes (cash prizes and participatory prizes) will be sent within 60 days of the completion of the Championship Round. Prizes which remain unclaimed or undeliverable for a period of six (6) months will be forfeited. Competitors who do not submit the required information by the applicable deadlines forfeit their prizes.</p>
            <p>As a condition of winning and redeeming a cash prize, competitors will be required to submit a completed (i) Competitor Questionnaire, (ii) Affidavit of Eligibility and Liability and Publicity Release, if one is not already on file with TopCoder, (iii) IRS Form W-9 or W-8BEN, if one is not already on file with TopCoder, (iv) TopCoder Competition Assignment Agreement, if one is not already on file with TopCoder, and (v) Travel Form. In completing the Affidavit of Eligibility and Liability and Publicity Release, a competitor who wins a cash prize (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated, (c) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder member database, (d) authorizes TopCoder to publicize the CDDC's results, (e) agrees to sign any applicable forms required by tax authorities, and (f) releases TopCoder from liability arising out of any prize won. TopCoder requires competitors to complete the Form W-9 or W-8BEN for tax reporting purposes.  Providing false information in the registration process or in any required forms will result in a forfeiture of a cash prize.  TopCoder requires the Competition Assignment Agreement to assign all rights to all information submitted during the CDDC and the Tournament to TopCoder for which the competitor is compensated.</p>
            <p>By participating in the CDDC and the Tournament and redeeming a prize, a competitor releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in the CDDC and the Tournament, or participation in any CDDC or Tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.</p>
            <p>In addition, all competitors winning a prize agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar events in the future, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation. Furthermore, all competitors winning a prize agree to promptly notify TopCoder if a third-party, including any CDDC or Tournament sponsors, contacts such competitor regarding employment opportunities and/or media interest as a result of the competitor's participation in the CDDC or the Tournament.</p>
            <p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in the CDDC and the Tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the competition process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the CDDC and/or the Tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort, or for any other reason.</p>
            
            <h3>Other</h3>
            <p>The CDDC and the Tournament are void in whole or in part where prohibited by law. A list of CDDC and Tournament winners by handles will be available on the web site at <a href="/tc">http://www.topcoder.com/tc</a>, and will be displayed for at least 3 months after the completion of the CDDC and the Tournament.</p>
            <p>The CDDC and the Tournament are brought to you by TopCoder, Inc. (<a href="/">http://www.topcoder.com/</a>) 95 Glastonbury Boulevard, Glastonbury, CT 06033.</p>

            
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
