<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" target="_blank" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" target="_blank" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" target="_blank" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="rules"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Component Competition Official Rules and Regulations</span></h1>
                <p>
                    <a href="#eligibility">Eligibility</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#placement">Placement Scoring </a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#schedule">Schedule</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#scoring">Scoring and Advancing</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#prizes">Prizes</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#conditions">Conditions of Participation</a>
                </p>
                <p><span class="bigRed">No purchase necessary to enter or win. Void where prohibited.</span></p>
                </p>
                
                <h2>Overview of the Tournament</h2>
                <p>The 2007 TopCoder Collegiate Challenge ("Tournament") Component Design and Development Competition ("CDDC") will take place between Monday, July 23 and November 2, 2007. It will consist of two competitions - the Design Competition and the Development Competition. Each competition will consist of five (5) weeks of online qualifying competitions, three (3) weeks of online Championship rounds and one (1) onsite Championship round. The total of the cash prizes for this tournament is $100,000 ($60,000 will be awarded for the Design Competition and $40,000 will be awarded for the Development Competition). The eight (8) competitors in each competition with the highest cumulative scores after the online rounds of competition will advance to the onsite Championship round at the Contemporary Resort at Walt Disney World in Orlando, Florida, USA.</p>
                
                <a name="eligibility"></a>

                <h2>Eligibility</h2>
                <p>TopCoder members meeting the following eligibility criteria are eligible to compete in the CDDC:</p>
                    <ul>
                        <li>Must be at least 18 years of age as of July 26, 2007; AND</li>
                        <li>Must currently be eligible for participation in TopCoder competitions (i.e., not suspended from TopCoder); AND</li>
                        <li>Must be matriculated full-time at an accredited college or university at some point between July 23, 2007 and November 3, 2007.</li>

                    </ul>
                <p>Competitors are eligible to win cash prizes, unless otherwise prohibited. The Tournament and the CDDC are void in the Quebec province of Canada, and elsewhere where prohibited by applicable law. Residents of Cuba, Iran, Iraq, North Korea, Sudan, or Syria are ineligible to receive cash prizes and are ineligible to attend the onsite Championship Round of competition as competitors.</p>
                <p>Employees of TopCoder, Inc. and of all Tournament sponsors, regardless of commitment date as sponsor, including any companies involved in the production (including prize suppliers), implementation and distribution of this Tournament and the CDDC and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the Tournament and the CDDC and members of their immediate families (parent, child, sibling, and spouse of each) and/or persons living in the same household as such persons, are ineligible to participate in the Tournament and the CDDC. If a competitor's employer signs on as a sponsor of the Tournament after July 23, 2007, then that competitor will be removed from further participation in the Tournament. TopCoder members who are performing internships for any Tournament sponsor between July 23 and November 2 are also ineligible to participate.</p>
                <p>Those competitors who are eligible to compete in any of the four Tournament competitions will be permitted to participate in any/all of them online. However, in the event a competitor becomes a finalist in more than one competition and the onsite competition times overlap, the competitor will be forced to choose only one competition in which to participate as a finalist by September 28, 2007. Competitors are allowed to compete in the online portions of both the Design Competition and the Development Competition. However, if a competitor participates in both the Design Competition and the Development Competition and qualifies as a finalist in each, then the competitor will be permitted to advance to the Championship round in only one of the competitions. The following criteria will be used to determine to which competition the competitor will advance:</p>
                    <ul>
                        <li>The competitor will advance to the competition in which he/she achieved a higher cumulative score.</li>
                        <li>If the competitor's cumulative score is the same for both competitions, then the competitor will choose the competition in which he/she will compete.</li>

                    </ul>
                
                <a name="placement"></a>
                <h2>Placement Scoring</h2>
                <p>A competitor's score is determined based on the placement for each of the competitor's submissions. The placement of the competitor's submissions is determined by the score awarded for a particular component. For example, if 3 submissions were received for a component and the scores were 93, 89, and 71, the competitor receiving the score of 93 would be in 1st place and would receive 10 points. Only the submissions of competitors who are registered for the CDDC are considered when determining place and placement points.  A submission must have a minimum score of 75 to be eligible to receive placement points. Placement scoring is as follows:</p>
                    <ul>
                        <li>1st Place - 10 Points</li>
                        <li>2nd Place - 7 Points</li>

                        <li>3rd Place - 5 points</li>
                        <li>4th Place - 4 Points</li>
                        <li>5th Place (and lower) - 0 Points</li>
                    </ul>
                <p style="font-weight:bold;">Penalty points</p>
                <p>All final fixes will be completed according to the component schedule. If a competitor misses final fixes for a component, they will be docked one (1) placement point per day they are late with final fixes. TopCoder will have final say on all penalties and deadlines.</p>

                
                <a name="schedule"></a>
                <h2>Schedule</h2>
                <p>Both the Design Competition and the Development Competition will have five (5) weeks of online competition, three (3) weeks of online Championship rounds, and one (1) onsite Championship round. Each competitor participating in an online round must submit his/her design and/or development submission for components by the submission deadline. All start times, registration deadlines and submission deadlines are stated in Eastern Daylight Time.</p>
                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="header">Round</td> 
                            <td class="header">All Projects Posted*</td> 
                            <td class="header">Registration Period</td> 
                            <td class="header">Submission Deadline</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Week 1 of Online Qualification Round</td> 
                            <td class="value">July 26, 2007 9:00 AM</td> 
                            <td class="value">72 Hours</td> 
                            <td class="value">August 2, 2007 9:00 AM</td>

                        </tr> 
                        <tr class="dark"> 
                            <td class="value">Week 2 of Online Qualification Round</td> 
                            <td class="value">August 2, 2007 9:00 AM</td> 
                            <td class="value">72 Hours</td> 
                            <td class="value">August 9, 2007 9:00 AM</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Week 3 of Online Qualification Round</td> 
                            <td class="value">August 9, 2007 9:00 AM</td> 
                            <td class="value">72 Hours</td> 
                            <td class="value">August 16, 2007 9:00 AM</td>

                        </tr>
                        <tr class="dark"> 
                            <td class="value">Week 4 of Online Qualification Round</td> 
                            <td class="value">August 16, 2007 9:00 AM</td> 
                            <td class="value">72 Hours</td> 
                            <td class="value">August 23, 2007 9:00 AM</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Week 5 of Online Qualification Round</td> 
                            <td class="value">August 23, 2007 9:00 AM</td> 
                            <td class="value">72 Hours</td> 
                            <td class="value">August 30, 2007 9:00 AM</td>

                        </tr>
                        <tr class="dark"> 
                            <td class="value">Championship Round (online portion component 1)</td> 
                            <td class="value">September 20, 2007 9:00 AM</td> 
                            <td class="value">72 Hours</td> 
                            <td class="value">September 27, 2007 9:00 AM</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Championship Round (online portion component 2)</td> 
                            <td class="value">October 4, 2007 9:00 AM</td> 
                            <td class="value">72 Hours</td> 
                            <td class="value">October 11, 2007 9:00 AM</td>

                        </tr>
                        <tr class="dark"> 
                            <td class="value">Championship Round (online portion component 3)</td> 
                            <td class="value">October 18, 2007 9:00 AM</td> 
                            <td class="value">72 Hours</td> 
                            <td class="value">October 25, 2007 9:00 AM</td>
                        </tr> 
 
                    <tr class="light"> 
                        <td class="value">Championship Round (onsite portion component 1)</td> 
                        <td class="value">October 31, 2007 11:30 AM</td> 
                        <td class="value">1.5 Hours</td> 
                        <td class="value">October 31, 2007 1:00 PM</td>
                    </tr>

                    <tr class="dark"> 
                        <td class="value">Championship Round (onsite portion component 2)</td> 
                        <td class="value">November 1, 2007 11:30 AM</td> 
                        <td class="value">1.5 Hours</td> 
                        <td class="value">November 1, 2007 1:00 PM</td>
                    </tr>

                    <tr class="light"> 
                        <td class="value">Championship Round (onsite portion component 3)</td> 
                        <td class="value">November 2, 2007 9:00 AM</td> 
                        <td class="value">1.5 Hours</td> 
                        <td class="value">November 2, 2007 10:30 AM</td>
                    </tr> 
 
                        <tr class="dark">
                            <td class="value" colspan="4">*All times are noted in Eastern Daylight Time (UTC/GMT -4). Click <a target="_blank" href="http://www.timeanddate.com/worldclock/fixedtime.html?month=8&day=17&year=2006&hour=9&min=0&sec=0&p1=179" alt="Time Zone">here</a> for your time zone.</td>
                        </tr> 
                    </tbody>
                </table> 
                <br /><br />
                
                <a name="scoring"></a>

                <h2>Scoring and Advancing</h2>
                <p>During each week of competition, competitors can submit design and development solutions for at least one eligible component by the submission deadline. Submissions will be scored by the TopCoder Review Boards and will be subject to final review and appeal in the same manner as standard component design and development competitions. Scoring of each submission by the TopCoder Review Boards is based on the criteria outlined in the Development Review Scorecard for the Development Contest or the criteria outlined in the Design Review Scorecard for the Design Contest. The scorecards which will be used for the CDDC are those that are in effect as of July 26, 2007.</p>
                <p>ALL SUBMISSIONS MUST BE RECEIVED ACCORDING TO THE SUBMISSION DEADLINE TO BE CONSIDERED A VIABLE ENTRY. THERE WILL BE NO EXCEPTIONS. There will be no elimination of contestants during the online competition.</p>
                <p>The four (4) highest individual placement scores that each contestant receives for his/her submissions throughout the five (5) weeks of competition will be added together for a cumulative placement score.  If the competitor does not have four scores, then all of that competitor's scores will be added together for a cumulative placement score.  A maximum of eight (8) competitors in both the Design Competition and the Development Competition with the highest cumulative placement score greater than zero will advance to the onsite Championship round.</p>
                <p>In the event of a tie of cumulative placement score among the advancers to the Championship round, the tie will be resolved in the following manner:</p>
                    <ul>

                        <li>Highest cumulative component score of the lesser number of components used to develop the cumulative placement score for the tied competitors.</li>
                        <li>If a tie still remains, then the highest individual component score of the lesser number of components used to develop the cumulative placement score for the tied competitors.</li>
                        <li>If a tie still remains, then all tied competitors will advance to the onsite Championship round.</li>
                    </ul>
                <p>Components where the competitor earned 0 points will not be counted towards tiebreaker scores.<br />
                Example:<br />

                Contestant #1 submits three components in the design competition, earning the following component and placement scores:<br />
                Component #1 - score 88.45; placement 2; placement score 7<br />
                Component #2 - score 76.33; placement 3; placement score 5<br />
                Component #3 - score 82.89; placement 3; placement score 5</p>
                <p>Cumulative placement score: 7 + 5 + 5 = 17<br />
                Contestant #2 submits two components in the design competition, earning the following component and placement scores:<br />

                Component #1 - score 92.56; placement 1; placement score 10<br />
                Component #2 - score 75.83; placement 2; placement score 7</p>
                <p>Cumulative placement score: 10 + 7 = 17<br />
                To determine who advances to Championship round, look at the highest cumulative component score of the lesser number of components used to develop the cumulative placement score for the tied competitors.<br />
                Contestant #1: 88.45 + 82.89 = 171.34<br />
                Contestant #2: 92.56 + 75.83 = 168.39</p>

                <p>Contestant #1 would advance to the Championship round.</p>
                
                <h2>Onsite Championship Round</h2>
                <h3>Important Information</h3>
                <p style="font-weight:bold;">Travel Confirmation</p>
                <p>A maximum of eight (8) competitors in each competition from the five (5) weeks of online competition will advance and travel to the Contemporary Resort on Tuesday, October 30 to compete in the final competitive stage of the CDDC held between Wednesday, October 30 and Friday, November 2, 2007. Up to four (4) alternates will be selected to compete at their discretion in the online rounds.  If a finalist cannot attend the TCCC the highest placing alternate from the online round will be named a replacement and will become an advancer.  All competitors must arrive at the Contemporary Resort no later than 2:00 PM EDT on Tuesday, October 30, 2007.</p>
                <p>All competitors must confirm their attendance at the onsite Championship no later than 5:00 PM EDT (UTC/GMT -4) on Friday, September 28, 2007, and must have acquired any necessary travel visas and know for certain that they can travel to the United States.  If a competitor is required to travel from outside the United States, it is necessary for the competitor to show proof of a visa and/or passport by 5:00 PM EDT (UTC/GMT -4) on Friday, September 28, 2007. Competitors may email a copy of their documents to <a target="_blank" href="mailto:jford@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a>. Competitors who fail to meet this requirement will be replaced as an onsite finalist.</p>

                <p style="font-weight:bold;">Visa Assistance</p>
                <p>Upon request, TopCoder will issue visa invitation letters for international competitors who require one to obtain a travel visa to enter the United States. All competitors who pass screening on at least one component will receive a visa letter request form. As soon as a competitor returns a completed form, their letter will be mailed. Competitors have until 5:00 PM EDT (GMT/UTC -4) on Friday, September 14, 2007 to request a letter. Visas can take a significant amount of time to obtain in certain countries; therefore, for those competitors who need a letter, it is in their best interest to request one well before the deadline. The cost of obtaining a visa is the sole responsibility of the competitor. Other than providing the invitation letter, TopCoder will not assist competitors in the process of obtaining a travel visa. See more information about <a target="_blank" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=getVisa" alt="Get travel visas">travel visas</a>.</p>
                <p style="font-weight:bold;">Travel Details</p>
                <p>TopCoder will provide air travel arrangements for each competitor. The flight will be reserved by and paid for by TopCoder and will be for arrival on October 30, 2007 and departure on November 4, 2007.TopCoder will pay for each competitor's airfare up to $1,500, though we reserve the right to make exceptions to the maximum amount based on individual circumstances. Extended flights and/or hotel room nights requested by a competitor that result in additional costs will be the responsibility of the competitor.</p>
                <p>Ground transportation to and from the Orlando International Airport will be provided for each competitor by TopCoder via Disney Magical Express, as well as hotel accommodations and certain meals for each competitor. All other expenses are the responsibility of the competitor. TopCoder will not provide travel or lodging accommodations for guests of the competitor.</p>

                <p style="font-weight:bold;">Online portion of Championship Round</p>
                <p>During the online Championship round, each competitor will compete on the same set of components online. Three (3) component competitions will be open to only the finalists and any alternates. Finalists that do not provide a submission for a competition will receive the minimum possible score. The component competition will be run according to the standard TopCoder component competition rules, and will have a component prize independent from the CDDC. However, the appeals phase for each component will be done onsite.  Therefore, the competitors will not know the score of any component prior to the onsite round. Component winners will be required to complete their final fixes after the conclusion of the CDDC. If an alternate was in first or second place prior to the appeals phase and did not make it on site for the appeals phase they will be awarded the components prize money for the place they finished in.</p>
                <p style="font-weight:bold;">Onsite portion of Championship Round</p>
                <p>Each competitor will be given one hundred (100) points to spread across the three finals component competitions. The competition for each round will begin with each competitor choosing the points to allocate to the component. Each competitor may risk a maximum of sixty (60) points and minimum of ten (10) points on an individual component. The number of points awarded is calculated by dividing the wager by the placement standing and rounding down. For instance see the table below:</p>
                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="header">Placement</td> 
                            <td class="header">Points Wagered</td> 
                            <td class="header">Points Awarded</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value">1</td> 
                            <td class="value">40</td> 
                            <td class="value">40</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">2</td> 
                            <td class="value">40</td> 
                            <td class="value">20</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value">3</td> 
                            <td class="value">40</td> 
                            <td class="value">13</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">4</td> 
                            <td class="value">40</td> 
                            <td class="value">10</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value">5</td> 
                            <td class="value">40</td> 
                            <td class="value">8</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">6</td> 
                            <td class="value">40</td> 
                            <td class="value">6</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value">7</td> 
                            <td class="value">40</td> 
                            <td class="value">5</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">8</td> 
                            <td class="value">40</td> 
                            <td class="value">5</td> 
                        </tr> 
                    </tbody> 
                </table>

                <br />
                <p>The order of components used in the competition will be determined by TopCoder and each component to be reviewed will be revealed to the competitor at the start of the round. All final round components will be pre-reviewed prior to the onsite round. The competitor will have one (1) hour to appeal their scorecard.</p>
                <p>During the one hour appeal period, the review board will be actively answering the filed appeals and the adjustments to the scores will be made as they occur. After the appeals period has ended, the review board will respond to the unanswered appeals prior to the start of the next round. The winners are determined according to which competitor has the highest score for their component for that round. The points assigned to each component will not be revealed until the end of the competition. The competitors will not know how many points were wagered by the other competitors.</p>
                <p>The winner of the entire competition will be determined by who has accumulated the most points during the championship round.</p>
                <p><span style="font-weight:bold;">Championship Tiebreaker</span>: In the event of a tie in the Championship Round, the tie will be resolved as follows:</p>
                    <ol>

                        <li>The highest cumulative component score of the components used during the final round.</li>
                        <li>If a tie still remains, then by the highest cumulative component score of the lesser number of components used to develop the cumulative placement score during the online qualification rounds for the tied competitors.</li>
                        <li>If a tie still remains, then the prize money will be distributed equally among the tied competitors.</li>
                    </ol>
                
                <a name="prizes"></a>
                <h2>About the Prizes</h2>
                <p>All contestants who submit components that pass screening during at least one week of online competition will receive a prize. A maximum of $100,000 in cash prizes will be awarded during the CDDC ($60,000 will be awarded during Design Competition and $40,000 will be awarded during the Development Competition). Any and all applicable taxes on prizes are the sole responsibility of the competitor. Additionally each component winner will be paid component prize money.</p>

                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="title" colspan="3">Prizes</td> 
                        </tr> 
                        <tr> 
                            <td class="header">Competitor(s)</td> 
                            <td class="header">Design Prize</td> 
                            <td class="header">Development Prize</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value" style="font-weight:bold;">1st place finisher* in the <br />Championship Round</td> 
                            <td class="value" style="font-weight:bold;">$25,000</td> 
                            <td class="value" style="font-weight:bold;">$15,000</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">2nd place finisher* in the <br />Championship Round</td> 
                            <td class="value">$15,000</td>

                            <td class="value">$9,000</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">3rd place finisher* in the <br />Championship Round</td> 
                            <td class="value">$8,000</td>
                            <td class="value">$7,000</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">4th place finisher* in the <br />Championship Round</td> 
                            <td class="value">$4,000</td>

                            <td class="value">$3,000</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">5th place finisher* in the <br />Championship Round</td> 
                            <td class="value">$2,000</td>
                            <td class="value">$1,500</td>
                        </tr>
                        <tr class="dark"> 
                            <td class="value">6th place finisher* in the <br />Championship Round</td> 
                            <td class="value">$2,000</td>

                            <td class="value">$1,500</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">7th place finisher* in the <br />Championship Round</td> 
                            <td class="value">$2,000</td>
                            <td class="value">$1,500</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">8th place finisher* in the <br />Championship Round</td> 
                            <td class="value">$2,000</td>

                            <td class="value">$1,500</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Online participants who pass screening for at least one component</td> 
                            <td class="value">Limited edition 2007 TopCoder Collegiate Challenge t-shirt</td>
                            <td class="value">Limited edition 2007 TopCoder Collegiate Challenge t-shirt</td>

                        </tr>
                        <tr class="dark"> 
                            <td class="value" colspan="3">*Prize will be awarded after the conclusion of the Championship Round. Winner must be present at the onsite Championship announcement to receive prize.<br />
                              <br />

                            In addition to the prizes mentioned above, all onsite finalists will receive a one-day <a target="_blank" alt="Park Hopper option" target="_blank" href="<tc-webtag:linkTracking link='http://disneyworld.disney.go.com/wdw/tickets/ticketStore?categoryPass=RECOMMENDER&productPass=RECOMMENDER&country=USA' refer='TCCC07_whatToDo' />">Disney Park Hopper pass</a> to use at the event on Saturday, November 3, 2007.</td> 
                        </tr>
                    </tbody> 
                </table>
                <br />
                <p>In order for onsite competitors to receive their onsite cash prize, they must first complete all CDDC-related work for all online rounds and the Championship Round, including final fixes.</p>
                
                <a name="conditions"></a>
                <h2>Conditions of Participation</h2>

                <p>By participating in the CDDC and the Tournament, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters. Also, by participating in the CDDC and the Tournament, you consent to providing certain information to the tournament sponsors. Such information shall include the information contained in your TopCoder member profile, as well as your competition statistics.</p>
                <p><span class="bigRed">Competitors must not cheat. All ideas for code and/or challenge submitted must be the competitor's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions. TopCoder reserves the right, in its sole discretion, to remove any competitor from the CDDC and/or the Tournament whom it suspects has cheated.</span></p>
                <p>All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the CDDC and the Tournament are within the sole discretion of TopCoder and are final and binding in all respects.</p>
                <p>As a condition of participation in the CDDC and the Tournament, all information provided by you in your TopCoder member profile must be accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the CDDC and/or the Tournament. In order to be eligible to participate in the CDDC, you must have completed any and all registration forms required by TopCoder.</p>
                <p>Competitors who advance to the onsite Championship Round must complete the following items and submit them to TopCoder by 5:00 PM EDT on Friday, September 28, 2007:</p>
                    <ul>

                        <li>Confirmation of attendance/proof of travel documents - Please email <a target="_blank" href="mailto:jdamato@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a> to confirm your attendance onsite. If you require a passport and/or visa to visit the United States, you must show proof of your documents via a scanned copy of the necessary documents.</li>
                        <li>Please <a target="_blank" href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto">submit a photo</a>, if we do not have one on file for you.</li>
                        <li>Please ensure your most up-to-date information is listed in your TopCoder profile in the event we need to mail your plane tickets or contact you via telephone.</li>
                        <li>Competitor Questionnaire - the questions and responses may be published in the 2007 TopCoder Collegiate Challenge program</li>

                        <li>Travel form - provides TopCoder with the appropriate travel information for your trip to the onsite tournament rounds</li>
                        <li>Affidavit of Eligibility and Liability and Publicity Release - TopCoder must receive the original copy of a notarized affidavit unless a notarized affidavit is already on file with TopCoder. The document must be postmarked by Friday, September 28, 2007, and must be sent in such a manner that it will arrive at TopCoder no later than October 26, 2007.</li>
                            <ol>
                                <li>If TopCoder already has a notarized affidavit and a tax form on file for a contestant, that contestant may affirm the affidavit online.</li>
                            </ol>
                        <li>Applicable tax form (unless one is already on file with TopCoder)</li>
                        <li>Letter from your college/university on official stationary that states you are/were a full time student between July 23, 2007 and November 3, 2007 OR a photocopy of your International Student Identity Card (ISIC) that shows you are/were a full time student between the dates July 23, 2007 and November 3, 2007 If sending a letter, it must be written in English and signed by an official university staff member. If sending a photocopy of your ISIC, it must list the name of your college or university. If the card is not in English, you must provide a translation to English with the photocopy. Necessary documents must be sent directly to TopCoder, Inc., Attn: Jessie D'Amato Ford, 703 Hebron Avenue (now 95 Glastonbury Blvd), Glastonbury, CT, 06033, USA.</li>

                    </ul>
                <p>A competitors who fails to submit the above items on time will not advance to the onsite Championship round and will be replaced by  the competitor with the next highest cumulative placement points.</p>
                <p>All prizes (cash prizes and participatory prizes) will be sent within 60 days of the completion of the Championship Round. Unclaimed or undeliverable prizes will be forfeited. Competitors who do not submit the required information by the applicable deadlines forfeit their prizes.</p>
                <p>As a condition of winning and redeeming a cash prize, competitors will be required to submit a completed (i) Competitor Questionnaire, (ii) Affidavit of Eligibility and Liability and Publicity Release, (iii) IRS Form W-9 or W-8BEN, as appropriate if one is not already on file with TopCoder, and (iv) Travel Form. In completing the Affidavit of Eligibility and Liability and Publicity Release, a cash prize winner (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated, (c) verifies the accuracy of the competitor's demographic information in the TopCoder member database, (d) authorizes TopCoder to publicize the CDDC's results, (e) agrees to sign any applicable forms required by tax authorities, (f) licenses to TopCoder rights to all information submitted during the CDDC and the Tournament (including rights to source code and other executables), and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires competitors to complete the Form W-9 or W-8BEN for tax reporting purposes.</p>
                <p>By participating in the CDDC and the Tournament and redeeming a prize, a competitor releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in the CDDC and the Tournament, or participation in any CDDC or Tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.</p>
                <p>In addition, all prizewinners agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar events in the future, and to use the statements made by, or attributed to, the winners relating to TopCoder and any and all rights to said use, without further compensation. Furthermore, all prizewinners agree to promptly notify TopCoder if a third-party, including any CDDC or Tournament sponsor, contacts the prizewinner regarding employment opportunities and/or media interest as a result of the prizewinner's participation in the CDDC or the Tournament.</p>

                <p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in the CDDC and the Tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the competition process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the CDDC and/or the Tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort, or for any other reason.</p>
                
                <h2>Other</h2>
                <p>The CDDC and the Tournament are void in whole or in part where prohibited by law. A list of CDDC and Tournament winners by handles will be available on the web site at <a target="_blank" href="/tc">http://www.topcoder.com/tc</a>, and will be displayed for at least 3 months after the completion of the CDDC and the Tournament.</p>
                <p>The CDDC and the Tournament are brought to you by TopCoder, Inc. (<a target="_blank" href="/">http://www.topcoder.com/</a>) 703 Hebron Avenue (now 95 Glastonbury Blvd), Glastonbury, CT 06033.</p>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>