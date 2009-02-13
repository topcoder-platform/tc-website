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
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="rules"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Algorithm Competition Official Rules and Regulations</span></h1>
                <p>

                    <a href="#eligibility">Eligibility</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#registration">Registration</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#qualification">Qualification Round</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#structure">Round Structure</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#prizes">Prizes</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#conditions">Conditions of Participation</a>
                </p>
                <p><span class="bigRed">No purchase necessary to enter or win. Void where prohibited.</span></p>
                </p>
                
                <h2>Overview of the Tournament</h2>

                <p>The 2007 TopCoder Collegiate Challenge ("Tournament") Algorithm Competition ("Algorithm Competition") will take place between July 23 and November 2, 2007. It will consist of three (3) online qualification rounds, four (4) online elimination rounds and three (3) onsite final rounds: the Semifinal, Wildcard and Championship rounds. The prize purse for the Algorithm Competition is $100,000 in cash. Up to 450 competitors will win a cash prize and up to 1,800 competitors will receive a participatory prize for competing in Online Round 1. The top 48 competitors in the online rounds will advance to the onsite Semifinal and Championship rounds held at the Contemporary Resort at Walt Disney World in Orlando, Florida, USA, on October 31 - November 2, 2007.</p>
                
                <a name="eligibility"></a>

                <h2>Eligibility</h2>
                <p>TopCoder members meeting the following criteria are eligible to compete in the Algorithm Competition:</p>
                    <ul>
                        <li>Must be at least 18 years of age (as of August 18, 2007); AND</li>

                        <li>Must currently be eligible for participation in TopCoder competition (i.e., not suspended from TopCoder).</li>
                        <li>Must be matriculated full-time at an accredited college or university at some point between July 23, 2007 and November 3, 2007.</li>

                    </ul>
                <p>The TopCoder Collegiate Challenge is void in the Quebec province of Canada and where prohibited by applicable law. Residents of Cuba, Iran, Iraq, North Korea, Sudan, or Syria are ineligible to receive cash prizes and are ineligible to attend the onsite semi-final round of competition as competitors.</p>
                <p>Employees of TopCoder, Inc. and of all Tournament sponsors, regardless of commitment date as sponsor, including any companies involved in the production (including prize suppliers), implementation and distribution of the Tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the Tournament and members of their immediate families (parent, child, sibling, and spouse of each) and/or persons living in the same household as such persons, are ineligible to participate in the Tournament. If a competitor's employer signs on as an official sponsor of the Tournament after July 23, 2007, then that competitor will be removed from further participation in the tournament. TopCoder members who are performing internships for any Tournament sponsor between July 23 and November 2, 2007 are also ineligible to participate.</p>
                <p>Those members who are eligible to compete in any of the four Tournament competitions will be permitted to participate in any/all of them online. However, in the event a member becomes a finalist in more than one competition and the onsite competition times overlap, the member must choose only one competition in which to participate as a finalist by September 28, 2007.</p>

                <p>In the event that a competitor is disqualified from any round, no other competitors will be added in his/her place. The only exception to this is advancement to the onsite rounds.</p>
                
                <a name="registration"></a>
                <h2>Registration</h2>

                <p>Registration for the 2007 TopCoder Collegiate Challenge Algorithm Competition will open at 9:00 AM EDT on Monday, July 23, 2007, and will close at 5:00 PM EDT on Thursday, August 16, 2007. Competitors must register separately for the Algorithm Competition in order to compete. There is no limit to the number of registrants for the Algorithm Competition, however each competitor may only register once.</p>
                
                <a name="qualification"></a>
                <h2>Qualification Rounds</h2>

                <p><span style="font-weight:bold;">Automatic Berths</span> - The top 150 rated collegiate competitors as of Thursday, August 16, 2007 who have met all of the following criteria will receive an automatic berth into Online Round 1:</p>
                    <ol>
                        <li>Competed in a TopCoder Algorithm rated event between May 16 and August 16, 2007; and</li>

                        <li>Competed in a total of at least three (3) TopCoder rated events; and</li>
                        <li>Registered for the Algorithm Competition; and</li>

                        <li>Met all other Algorithm Competition and Tournament eligibility criteria.</li>
                    </ol>
                <p><span style="font-weight:bold;">Qualification Spots</span> - All competitors who do not receive an automatic berth and who meet all of the Algorithm Competition and Tournament eligibility criteria can compete for one of the remaining 1,650 qualification spots in the Algorithm Competition. Three (3) Qualification Rounds will be held and the top 550 scorers from each Qualification Round will win a spot in Online Round 1. Please note that the top 150 rated competitors who receive an automatic berth into Online Round 1 will not be allowed to compete in any of the Qualification Rounds.  Those competitors who have already qualified for the tournament may not compete in future Qualification Rounds.</p>
                <p>The schedule and details of the Qualification Rounds are as follows:</p>

                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="title" colspan="4">Qualification Rounds</td> 
                        </tr> 
                        <tr> 
                            <td class="header">Round</td> 
                            <td class="header">Date and Time*</td> 
                            <td class="header">Maximum<br /># of Participants</td> 
                            <td class="header">Maximum<br /># of Advancers</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Qualification Round 1</td> 
                            <td class="value">Saturday, August 18<br />Register: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
                            <td class="value">All members who have not previously qualified - <br>
                            limited to the first 1,350 participants to register</td> 
                            <td class="value">550</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">Qualification Round 2</td> 
                            <td class="value">Tuesday, August 21<br />Register: 4:00 AM - 6:55 AM<br />START: 7:00 AM</td> 
                            <td class="value">All members who have not previously qualified - <br>
                            limited to the first 1,350 participants to register</td> 
                            <td class="value">550</td>

                        </tr> 
                        <tr class="light"> 
                            <td class="value">Qualification Round 3</td> 
                            <td class="value">Thursday, August 23<br />Register: 6:00 PM - 8:55 PM<br />START: 9:00 PM</td> 
                            <td class="value">All members who have not previously qualified - <br>
                            limited to the first 1,350 participants to register</td> 
                            <td class="value">550</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value" colspan="4">*All times are Eastern Daylight Time (UTC/GMT -4). In the event that a round must be cancelled for any reason, the round will be held the following day at the same time.</td> 
                        </tr> 
                    </tbody> 
                </table>

                <br />
                <p>The format for each Qualification Round will be the same as all other Algorithm Competition rounds, and is outlined in the Competition Round Structure section.</p>
                <p>Competitors will be rated at the conclusion of their qualification attempt based on their performance against other competitors in the same round. All qualifying competitors will be assigned seeds for the Algorithm Competition based on their Algorithm rating following the Qualification Rounds.</p>
                <p>In the event of a tie for any advancing position during the Qualification Round, the tie will be resolved in the following manner:</p>
                    <ol>
                        <li>By reference to the competitors' ratings (higher is better) prior to the Qualification Round.</li>

                        <li>If a tie still remains, all tied competitors will advance to Online Round 1.</li>

                    </ol>

                <a name="structure"></a>
                <h2>Online Elimination Rounds</h2>
                <p>Competitors in each online round must register for the round in the TopCoder Competition Arena no later than five (5) minutes prior to the start of the round. All start times will be communicated as Eastern Daylight Time (UTC/GMT -4), so contestants in different time zones must adjust accordingly. If a competitor does not participate, for any reason, in an online round he/she has advanced to, it will be treated as an automatic loss in that round of competition.</p>
                <p>During tournament registration, competitors will indicate their preference regarding the section of Online Round 1 in which they wish to compete, should they advance. TopCoder will attempt to fill the sections for Online Round 1 based on indicated preference.  In the event that all indicated preferences cannot be accommodated, the preferences of competitors who registered for the tournament earlier will be given preference.</p>

                <p>All competitors in a specific section will be assigned to rooms based on 'dartboard seeding' (completely random). Each room will have a maximum of 25 competitors. The number of rooms in each round is (maximum # competitors in the round)/25.</p>

                <p>The dates and times of the online rounds of competition are as follows:</p>
                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="title" colspan="4">Online Rounds</td> 
                        </tr> 
                        <tr> 
                            <td class="header">Round</td> 
                            <td class="header">Date and Time*</td> 
                        <tr class="light"> 
                            <td class="value">Online Round 1 - Section A</td> 
                            <td class="value">Tuesday, August 28<br />Register: 6:00 - 8:55 PM<br />START: 9:00 PM</td> 
                            <td class="value">Up to 600</td> 
                            <td class="value">300</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">Online Round 1 - Section B</td> 
                            <td class="value">Thursday, August 30<br />Register: 4:00 - 6:55 AM<br />START: 7:00 AM</td> 
                            <td class="value">Up to 600</td> 
                            <td class="value">300</td>

                        </tr> 
                        <tr class="light"> 
                            <td class="value">Online Round 1 - Section C</td> 
                            <td class="value">Saturday, September 1<br />Register: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
                            <td class="value">Up to 600</td> 
                            <td class="value">300</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">Online Round 2</td> 
                            <td class="value">Saturday, September 8<br />Register: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
                            <td class="value">900</td> 
                            <td class="value">300</td>

                        </tr> 
                        <tr class="light"> 
                            <td class="value">Online Round 3</td> 
                            <td class="value">Saturday, September 15<br />Register: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
                            <td class="value">300</td> 
                            <td class="value">150</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">Online Round 4</td> 
                            <td class="value">Saturday, September 22<br />Register: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
                            <td class="value">150</td> 
                            <td class="value">48</td>

                        </tr> 
                        <tr class="light"> 
                            <td class="value" colspan="4">* NOTE: All times are Eastern Daylight Time (UTC/GMT -4). In the event that a round must be cancelled for any reason, the round will be held the following day at the same time.<br />
                            ** If less than 1,800 competitors qualify to compete in Online Round 1, the maximum number of competitors that will be assigned into any section will be (Total Number of Qualifiers / 3), rounded up.</td> 
                        </tr> 
                    </tbody> 
                </table>
                <br />
                
                <h2>Scoring and Advancing during Online Rounds</h2>

                <p>After each section of competition in the Online Rounds, the highest scoring competitors from all rooms in the section will advance to the next online round. Competitor advancement in all rounds is determined by comparing the total point values from all three phases of the round for each competitor. In order to advance, a competitor must finish each round with a positive (i.e., greater than zero) point total. The structure of the online rounds is as follows:</p>

                <h3>Online Round 1</h3>
                <p>Up to 600 competitors will compete in each section and up to 300 will advance from each section. The highest 300 scoring competitors across all rooms in each section will advance to Online Round 2.</p>
                <h3>Online Round 2</h3>
                <p>Up to 900 competitors will compete and up to 300 will advance. The highest 300 scoring competitors across all rooms will advance to Online Round 3.</p>
                <h3>Online Round 3</h3>

                <p>Up to 300 competitors will compete and up to 150 will advance. The highest 150 scoring competitors across all rooms will advance to Online Round 4.</p>

                <h3>Online Round 4</h3>
                <p>Up to 150 competitors will compete and up to 48 will advance. The highest 48 scoring competitors across all rooms will advance to the field of Semifinalists.</p>
                <p><span style="font-weight:bold;">NOTE</span>: In the event of a tie for any advancing position during the online rounds, the tie will be resolved in the following manner:</p>
                    <ol>
                        <li>By reference to the total points acquired during the rounds of the Algorithm Competition in which all of the tied competitors were presented with the same set of problems (excluding the Qualification Round).  The highest score(s) advances.</li>

                        <li>If a tie still remains, then by the competitor's seed for the Algorithm Competition.</li>

                        <li>If a tie still remains, all tied competitors will advance to the next round.</li>
                    </ol>
                    
                <h2>Competition Round Structure</h2>
                <p>Each online and onsite round of competition (including the Qualification Rounds) consists of three phases: Coding Phase, Challenge Phase, and System Testing Phase. (Note: The format of these competition rounds is similar to the format of TopCoder Single Round Matches. The rules in place for Single Round Matches as of August 18, 2007 will also apply to the online and onsite rounds of the Tournament, with the exception of the Unused Code Rule during the onsite rounds.)</p>
                <p><span style="font-weight:bold;">The Coding Phase</span> is a timed event in which all competitors are presented with the same three questions representing three levels of complexity and three levels of potential points. Points for a problem are awarded upon submission of any solution that successfully compiles.  Points are calculated on the total time elapsed from the time the problem was opened until the time it was submitted. During the online rounds, the Coding Phase will last 75 minutes. During the onsite rounds, the Coding Phase will last 85 minutes.</p>

                <p><span style="font-weight:bold;">The Challenge Phase</span> is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in the challenged competitor losing any points awarded for the challenged submission, and a 50-point reward for the challenging competitor. Unsuccessful challenges will reduce the challenging competitor's point total in that round of competition by 25 points. During the online rounds, the Challenge Phase will last 15 minutes. During the onsite round, the Challenge Phase will last 10 minutes.</p>

                <p><span style="font-weight:bold;">The System Testing Phase</span> is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The test will consist of applying a set of inputs and expecting that the output from the code submission will be correct. If the output from a competitor's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</p>
                
                <h2>Onsite Semifinal and Championship Rounds</h2>
                <h3>Important Information</h3>

                <p style="font-weight:bold;">Travel Confirmation</p>
                <p>The forty-eight (48) competitors who advance from Online Round 4 will travel to Orlando on Tuesday, October 30, 2007 to compete in the Semifinal rounds of the Tournament, held on Wednesday, October 31 and Thursday, November 1, 2007.  All onsite competitors must arrive at the Contemporary Resort no later than 2:00 PM EDT on Tuesday, October 30, 2007.</p>

                <p>All competitors must confirm their attendance at the onsite event no later than 5:00 PM EDT (UTC/GMT -4) on Friday, September 28, 2007, and must have acquired any necessary travel visas and know for certain that they can travel to the United States.  If a competitor is required to travel from outside the United States, it is necessary for the competitor to show proof of a visa and/or passport by 5:00 PM EDT (UTC/GMT -4) on Friday, September 28, 2007. Competitors may email a copy of their documents to <a target="_blank" href="mailto:jford@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a>. Competitors who fail to meet this requirement will be replaced as an onsite finalist.</p>
                <p style="font-weight:bold;">Visa Assistance</p>
                <p>At the end of Online Round 1, TopCoder will issue visa invitation letters upon the request of international competitors who may require such a letter. All competitors who advance to Online Round 1 will receive a visa invitation letter request form. Competitors have until 5:00 PM EDT (GMT/UTC -4) on Friday, September 14, 2007 to request a letter. Visas can take a significant amount of time to obtain in certain countries.  It is in the best interest of competitors who need such a letter to request one well before the deadline. The cost of obtaining a visa is the sole responsibility of the competitor. Outside of issuing an invitation letter upon request, TopCoder will not assist competitors in the process of obtaining a travel visa. See more information about <a target="_blank" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=getVisa" alt="Get travel visas">travel visas</a>.</p>

                <p style="font-weight:bold;">Travel Details</p>
                <p>TopCoder will provide air travel arrangements for each competitor. The flight will be reserved and paid for by TopCoder and will be for arrival on October 30, 2007 and departure on November 4, 2007.TopCoder will pay for each competitor's airfare up to $1,500, though we reserve the right to make exceptions to the maximum amount based on individual circumstances. Extended flights and/or hotel room nights requested by a competitor that result in additional costs will be the responsibility of the competitor.</p>

                <p>Ground transportation to and from the Orlando International Airport will be provided for each competitor by TopCoder via Disney Magical Express, and hotel accommodations and certain meals will be provided for each competitor as well. All other expenses are the responsibility of the competitor. TopCoder will not provide travel or lodging accommodations for guests of the competitor.</p>
                <p style="font-weight:bold;">Room Assignment</p>
                <p>TopCoder will determine the room assignments for the Semifinal rooms prior to the start of each Semifinal round, in the following manner:<br />
                All competitors will be arranged by their tournament seed. Starting with the highest seeded competitor and proceeding in order, a competitor will be assigned to room 1, then room 2, then room 3, then room 3 again, then room 2, then room 1. This pattern will continue (1,2,3,3,2,1) until all competitors are assigned to a room.</p>

                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="title" colspan="2">Onsite Rounds</td> 
                        </tr> 
                        <tr> 
                            <td class="header">Round of Competition</td> 
                            <td class="header">Date and Time (Eastern Daylight Time)</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Semifinal Room 1</td> 
                            <td class="value">Wednesday, October 31, 8:30 AM</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">Semifinal Room 2</td> 
                            <td class="value">Wednesday, October 31, 2:00 PM</td>

                        </tr> 
                        <tr class="light"> 
                            <td class="value">Semifinal Room 3</td> 
                            <td class="value">Thursday, November 1, 8:30 AM</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">Wildcard Round</td> 
                            <td class="value">Thursday, November 1, 2:00 PM</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Championship Round</td> 
                            <td class="value">Friday, November 2, 1:30 PM</td>

                        </tr>
                    </tbody> 
                </table>
                <br />
                <p><span style="font-weight:bold;">The Semifinal Round</span> will consist of three (3) rooms of sixteen (16) competitors. The two (2) highest scoring competitors in each room will advance to the Championship Round. The next four (4) highest scoring competitors in each room will participate in one (1) Wildcard Round. The two (2) highest scoring competitors of the Wildcard Round will also advance to the Championship Round.</p>
                <p><span style="font-weight:bold;">The Championship Round</span> will be a single round of eight (8) competitors. Placement in the Championship Round is determined by comparing the total points of each competitor. The winner of the Championship Round will be the competitor with the highest point total for the round. In the event of a tie in the Semifinal, Wildcard and/or Championship Rounds, the tie will be resolved in the following manner (in order):</p>

                    <ol>
                        <li>Total points acquired by a competitor (higher is better) during Online Rounds 2, 3 and 4 of the 2007 TopCoder Collegiate Challenge.</li>
                        <li>If a tie still remains, then by competitor rating (higher is better) following Online Round 4.</li>
                        <li>If a tie still remains in the Semifinal or Wildcard Rounds, then all tied competitors will advance to the Championship Round.</li>
                        <li>If a tie still remains in the Championship Round, then the prize money will be distributed equally among the tied competitors.</li>
                    </ol>

                    
                <a name="prizes"></a>

                <h2>About the Prizes</h2>
                <p>The Algorithm Competition will award prizes to up to 1,800 competitors and $100,000 in cash prizes. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner. Prizes will be distributed as follows:</p>
                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="title" colspan="2">Prizes</td> 
                        </tr> 
                        <tr> 
                            <td class="header">Competitor(s)</td> 
                            <td class="header">Prize</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value" style="font-weight:bold;">1st place finisher* - Algorithm Competition Champion</td> 
                            <td class="value" style="font-weight:bold;">$25,000</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">2nd place finisher* in the Championship Round</td> 
                            <td class="value">$10,000</td>

                        </tr> 
                        <tr class="light"> 
                            <td class="value">3rd place finisher* in the Championship Round</td> 
                            <td class="value">$5,000</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">4th place finisher* in the Championship Round</td> 
                            <td class="value">$2,500</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">5th - 8th place finishers* in the Championship Round</td> 
                            <td class="value">$1,000 each</td>

                        </tr>
                        <tr class="dark"> 
                            <td class="value">9th - 48th place finishers* in the Semifinal Rounds</td> 
                            <td class="value">$400 each</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Up to 48 advancers from Online Round 4</td> 
                            <td class="value">A TopCoder-branded 1GB USB Drive</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">Up to 150 advancers from Online Round 3 <br />to Online Round 4</td> 
                            <td class="value">$100 each &amp; a TopCoder-branded Hat</td>

                        </tr> 
                        <tr class="light"> 
                            <td class="value">Up to 300 advancers from Online Round 2 <br />to Online Round 3</td> 
                            <td class="value">$75 each & a TopCoder-branded Water Bottle</td>
                        </tr>
                        <tr class="dark"> 
                            <td class="value">Up to 900 advancers from Online Round 1 <br />to Online Round 2</td> 
                            <td class="value">A TopCoder-branded stress ball</td>

                        </tr> 
                        <tr class="light"> 
                            <td class="value">Up to 1,800 competitors who compete <br />in Online Round 1</td> 
                            <td class="value">Limited edition 2007 TopCoder Collegiate Challenge t-shirt</td>

                        </tr> 
                        <tr class="dark"> 
                            <td class="value" colspan="2">* Prize will be awarded at the conclusion of the Championship Round. Winner must be present at the onsite Championship announcement to receive prize.<br />
                              <br />
                            In addition to the prizes mentioned above, all onsite finalists will receive a one-day <a target="_blank" alt="Park Hopper option" target="_blank" href="<tc-webtag:linkTracking link='http://disneyworld.disney.go.com/wdw/tickets/ticketStore?categoryPass=RECOMMENDER&productPass=RECOMMENDER&country=USA' refer='TCCC07_whatToDo' />">Disney Park Hopper pass</a> to use at the event on Saturday, November 3, 2007.</td> 
                        </tr>

                    </tbody> 
                </table>
                <br />
                
                <a name="conditions"></a>
                <h2>Conditions of Participation</h2>

                <p>By participating in the Algorithm Competition, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters. Also, by participating in the Algorithm Competition, you consent to providing certain information to the tournament sponsors. Such information shall include the information contained in your TopCoder member profile, as well as your competition statistics.</p>
                <p><span class="bigRed">Contestants must not cheat. All ideas for code and/or challenges submitted must be the contestant's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions. TopCoder reserves the right, in its sole discretion, to remove any competitor from participating in the Algorithm Competition whom it suspects has cheated.</span></p>

                <p>If a competitor is eliminated for cheating after he/she is confirmed as a finalist and a flight is already purchased for the onsite finals, that competitor will be responsible for reimbursing TopCoder the cost of the airfare. TopCoder reserves the right to withhold any cash prizes owed until the amount of the plane ticket is paid.</p>
                <p>All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the tournament shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>
                <p>Competitors who win prizes will be notified via e-mail within 10 days of the completion of each round that they have won a prize. Competitors who win cash prizes from Online Rounds 2 and 3 must complete the following documents within 60 days of the date of the online round during which a cash prize was awarded:</p>
                    <ul>

                        <li>Affidavit of Eligibility and Liability and Publicity Release (must be notarized unless a notarized affidavit is already on file with TopCoder); and</li>
                        <li>Applicable tax form (unless one is already on file with TopCoder).</li>

                    </ul>
                <p style="font-weight:bold;">Finalist (Online Round 4 Advancer) Information</p>
                <p>All competitors who advance to the onsite tournament rounds must complete the following items and submit them to TopCoder by 5:00 PM EDT on Friday, September 28, 2007:</p>
                    <ul>
                        <li>Confirmation of attendance/proof of travel documents - Please email <a target="_blank" href="mailto:jford@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a> to confirm your attendance onsite. If you require a passport and/or visa to visit the United States, you must show proof of your documents via a scanned copy of the necessary documents.</li>

                        <li>Please <a target="_blank" href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto">submit a photo</a>, if you have not already done so.</li>
                        <li>Please ensure your most up-to-date information is listed in your TopCoder profile in the event we need to mail your plane tickets or contact you via telephone.</li>
                        <li>Competitor Questionnaire - the questions and responses may be published in the 2007 TopCoder Collegiate Challenge program</li>
                        <li>Travel form - provides TopCoder with the appropriate travel information for your trip to the onsite tournament rounds</li>
                        <li>Affidavit of Eligibility and Liability and Publicity Release - TopCoder must receive the original copy of a notarized affidavit unless a notarized affidavit is already on file with TopCoder. The document must be postmarked by September 28, 2007, and must be sent in such a manner that it will arrive at TopCoder no later than October 26, 2007.</li>

                            <ol>
                                <li>If TopCoder already has a notarized affidavit and a tax form on file for a contestant, that contestant may affirm the affidavit online.</li>
                            </ol>
                        <li>Applicable tax form (unless one is already on file with TopCoder)</li>
                        <li>Letter from your college/university on official stationary that states you are/were a full time student between July 23, 2007 and November 3, 2007 OR a photocopy of your International Student Identity Card (ISIC) that shows you are/were a full time student between the dates July 23, 2007 and November 3, 2007. If sending a letter, it must be written in English and signed by an official university staff member. If sending a photocopy of your ISIC, it must list the name of your college or university. If the card is not in English, you must provide a translation to English with the photocopy. Necessary documents must be sent directly to TopCoder, Inc., Attn: Jessie D'Amato Ford, 703 Hebron Avenue (now 95 Glastonbury Blvd), Glastonbury, CT, 06033, USA.</li>
                    </ul>
                <p>Failure to submit the above items on time will result in a forfeiture of rights as an onsite competitor. In that case, the next highest scoring competitor from Online Round 4 will advance.</p>

                <p>All prizes (cash prizes and participatory prizes) will be sent within 60 days of the Championship Round, unless otherwise provided herein. Unclaimed or undeliverable prizes will be forfeited. Competitors who do not submit the required information listed above by the applicable deadlines forfeit their prizes.</p>
                <p>As a condition of participation in the tournament, all information provided by you in your TopCoder member profile must be accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the Algorithm Competition. In order to be eligible to participate in the Algorithm Competition, you must have completed any and all registration forms required by TopCoder.</p>
                <p>As a condition of winning and redeeming a cash prize, certain competitors will be required to submit a completed 
                (i) Competitor Questionnaire, (ii) Affidavit of Eligibility and Liability and Publicity Release, (iii) IRS Form W-9 or W-8BEN, as appropriate if one is 
                not already on file with TopCoder, and (iv) Travel Release. In completing the Affidavit of Eligibility and Liability and Publicity Release, a competitor 
                who wins a cash prize (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated; that the idea for the code and/or 
                challenge submitted is his/hers alone, (c) verifies the accuracy of the demographic information submitted to, and contained in, the TopCoder member 
                database, (d) authorizes TopCoder to publicize the Algorithm Competition's results, (e) agrees to sign any applicable forms required by tax authorities, 
                (f) licenses to TopCoder rights to all information submitted during the Algorithm Competition (including rights to source code and other executables), 
                and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires competitors to complete the Form W-9 or W-8BEN for tax reporting 
                purposes. If prize notification is returned as undeliverable, or if the competitor who wins a cash prize fails to return the Questionnaire, Affidavit, W-9 
                or W-8BEN, or travel release, as specified, the competitor who wins the cash prize will be disqualified and the prize money will be forfeited. Providing 
                false information in the registration process or in the required forms described in this paragraph will result in a forfeiture of a cash prize.</p>
                <p>By participating in the Algorithm Competition and redeeming a prize, a winning competitor releases and agrees to hold harmless TopCoder, its affiliates, 
                subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives 
                and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due 
                in whole or in part, directly or indirectly, from or arising out of participation in the Algorithm Competition and the Tournament, or participation in any 
                Algorithm Competition or Tournament-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated 
                with, and makes no warranties with regard to, any prize given.</p>
                <p>In addition, all competitors receiving a prize agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the 
                agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar future events, and to 
                use the statements made by, or attributed to, the competitor relating to TopCoder and any and all rights to said use, without further compensation. 
                Furthermore, all competitors winning prizes agree to promptly notify TopCoder if a third-party, including Tournament sponsors, contacts the prizewinner 
                regarding employment opportunities and/or media interest as a result of the competitor's participation in the Algorithm Competition or the Tournament.</p>
                <p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in the Algorithm Competition or the Tournament, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the Algorithm Competition process, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the Algorithm Competition and Tournament if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort, or for any other reason.</p>

                
                <h2>Other</h2>
                <p>The Algorithm Competition and the Tournament are void in whole or in part where prohibited by law.</p>
                <p>A list of winning competitors by handle will be available on the web site at <a target="_blank" href="/tc">http://www.topcoder.com/tc</a>, and will be displayed for at least 3 months after the end of the Algorithm Competition.</p>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>