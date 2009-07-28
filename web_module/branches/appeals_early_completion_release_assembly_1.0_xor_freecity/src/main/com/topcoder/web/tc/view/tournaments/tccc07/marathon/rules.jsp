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
        <jsp:param name="tabLev1" value="<%=EventType.MARATHON_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="rules"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Marathon Match Competition Official Rules and Regulations</span></h1>
                <p>

                    <a href="#eligibility">Eligibility</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#registration">Registration</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#structure">Round Structure</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#prizes">Prizes</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href="#conditions">Conditions of Participation</a>

                </p>
                <p><span class="bigRed">No purchase necessary to enter or win. Void where prohibited.</span></p>
                </p>
                
                <h2>Overview of the Tournament</h2>
                <p>The 2007 TopCoder Collegiate Challenge ("Tournament") Marathon Match Competition ("Competition") will take place between July 23 and November 2, 2007. It will consist of three (3) online elimination rounds and one (1) onsite final round. The total of the cash prizes for the Competition is $30,000. A maximum of 8 competitors will win a cash prize, and a maximum of 300 competitors will win a participatory prize for competing in the second online round. The top 8 competitors, as determined by the online rounds, will advance to the onsite Championship round at the Contemporary Resort at Walt Disney World in Orlando, Florida, USA on October 31, 2007.</p>
                
                <a name="eligibility"></a>
                <h2>Eligibility</h2>

                <p>TopCoder members meeting the following criteria are eligible to compete in the Competition:</p>
                    <ul>
                        <li>Must be at least 18 years of age (as of August 8, 2007); AND</li>
                        <li>Must currently be eligible for participation in TopCoder competitions (i.e., not suspended from TopCoder).</li>
                        <li>Must be matriculated full-time at an accredited college or university at some point between July 23, 2007 and November 3, 2007.</li>
                    </ul>

                <p>TopCoder members who are 18 years of age or older as of August 8, 2007 are eligible to win cash prizes, unless otherwise prohibited. The Tournament and the Competition are void in the Quebec province of Canada and where prohibited by applicable law. Residents of Cuba, Iran, Iraq, North Korea, Sudan, or Syria are ineligible to receive cash prizes and are ineligible to attend the onsite final round of competition as competitors.</p>

                <p>Employees of TopCoder, Inc. and of all Tournament and Competition sponsors, regardless of commitment date as sponsor, including any companies involved in the production (including prize suppliers), implementation and distribution of the Tournament and/or Competition and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the Tournament and/or Competition and members of the immediate families (parent, child, sibling, and spouse of each) and/or persons living in the same household as such persons, are ineligible to participate in the Tournament and/or the Competition. If a competitor's employer signs on as a sponsor of the Tournament and/or the Competition after July 23, 2007, then that competitor will be removed from further participation in the Tournament and Competition. TopCoder members who are performing internships for any Tournament and/or Competition sponsor between July 23, 2007 and November 2, 2007 are also ineligible to participate.</p>
                <p>Competitors who are eligible to compete in more than one of the Tournament competitions will be permitted to participate in any/all of them online. However, in the event a competitor becomes a finalist in more than one competition and the onsite competition times overlap, the competitor must choose one competition to participate in by September 28, 2007.</p>
                <p>In the event that a competitor is disqualified from any online elimination round, the Competitor will not be replaced. In the event that a competitor is disqualified from the onsite round, the competitor will be replaced with the next highest ranking eligible competitor.</p>
                
                <a name="registration"></a>
                <h2>Registration</h2>

                <p>Registration for the Competition will open at 9:00 AM EDT on Monday, July 23, 2007, and will close at 5:00 PM EDT on Tuesday, August 7, 2007. In order to compete in the Competition, competitors must register separately for the Competition. There is no limit to the number of competitors in the Competition, but each competitor may only register once.</p>

                
                <a name="structure"></a>
                <h2>Online Elimination Rounds</h2>
                <p>Competitors must register for each round separately on the TopCoder web site. All start times will be communicated as Eastern Daylight Time (UTC/GMT -4). If a competitor does not participate, for any reason, in an online round to which he/she has advanced, it will be treated as an automatic loss in that round of competition.</p>
                <p>Competitors will be assigned a seed for the Competition based on their rating prior to the first online round.</p>
                <p>The dates and times of the online rounds of the Competition are as follows:</p>

                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="header">Round of Competition</td> 
                            <td class="header">Start Date and Time*</td> 
                            <td class="header">End Date and Time*</td> 
                            <td class="header">Maximum #<br />of Competitors</td> 
                            <td class="header">Advancers</td>

                        </tr> 
                        <tr class="light"> 
                            <td class="value">Online Round 1</td> 
                            <td class="value">Wednesday, August 8 Noon</td> 
                            <td class="value">Wednesday, August 15 Noon</td> 
                            <td class="value">Unlimited</td> 
                            <td class="value">300</td>

                        </tr> 
                        <tr class="dark"> 
                            <td class="value">Online Round 2</td> 
                            <td class="value">Wednesday, August 22 Noon</td> 
                            <td class="value">Wednesday, August 29 Noon</td> 
                            <td class="value">300</td>

                            <td class="value">100</td>
                        </tr> 
                        <tr class="light"> 
                            <td class="value">Online Round 3</td> 
                            <td class="value">Wednesday, September 5 Noon</td> 
                            <td class="value">Wednesday, September 19 Noon</td> 
                            <td class="value">100</td>

                            <td class="value">8</td>

                        </tr> 
                        <tr class="dark"> 
                            <td class="value" colspan="5">*Time listed in Eastern Daylight Time (UTC/GMT -4). In the event that a round must be cancelled for any reason, the round will start the following day at the same time.</td> 
                        </tr>
                    </tbody> 
                </table>
                <br />
                
                <h2>Scoring and Advancing during Online Rounds</h2>

                <p>After each online round, the highest scoring competitors will advance to the next online round. Advancement to the next round is determined by comparing the total points from all system testing for each competitor. To advance, a competitor must submit a full submission, as defined herein. The structure of each of the online rounds is as follows:</p>

                <h3>Online Round 1</h3>
                <p>All eligible registered competitors may compete, and a maximum of 300 competitors will advance to Online Round 2.</p>
                <h3>Online Round 2</h3>
                <p>A maximum of 100 competitors will advance to Online Round 3.</p>
                <h3>Online Round 3</h3>

                <p>A maximum of 8 competitors will advance to the onsite finals.</p>

                <p>NOTE: Ties between competitors for the right to advance to the next online round will be resolved in the following manner:</p>
                    <ol>
                        <li>By reference to the total points acquired during the previous round of the Competition.</li>
                        <li>If a tie still remains, by reference to the total points acquired during the next previous online round, if any. This step will repeat until the tie is broken or the until there are no more previous rounds.</li>
                        <li>If a tie still remains, then by reference to the seed assigned to the competitors for the Competition.</li>

                        <li>If a tie still remains, all tied competitors will advance.</li>

                    </ol>
                    
                <h2>Competition Round Structure</h2>
                <p>Each online and onsite round of competition consists of two phases: the Coding Phase and the System Testing Phase. (Note: The format of these competition rounds is similar to standard TopCoder Marathon Matches, and the rules in place for such competitions as of August 8, 2007 will apply to the online and onsite rounds of the Competition.)</p>
                <p>The Coding Phase is a timed event where all competitors are presented with the same question. The criteria for scoring will be provided in the problem statement, and may change from round to round. During each round of the Competition, each competitor may submit one of two types of submissions: an example submission or a full submission. Each example submission is run against the example test cases listed in the problem statement, and detailed feedback is provided to the competitor. Each full submission is run against a more complete set of test cases which are unknown to the competitor, and the competitor only receives a provisional score. For Online Rounds 1 and 2, the duration of the Coding Phase is one week. For Online Round 3, the duration of the Coding Phase is two weeks. </p>
                <p>The System Testing Phase is applied to the most recent full submission for each competitor. During system testing, each submission is run against a large number of sample cases unknown to the competitors, and is scored according to the criteria specified in the problem statement. Once the system tests are completed, competitors will be ranked according to their score on the system test cases. Whether a competitor advances to the next round is determined solely by reference to the score the competitor receives during the System Testing Phase.</p>

                
                <h2>Onsite Championship Round</h2>

                <h3>Important Information</h3>
                <p style="font-weight:bold;">Travel Confirmation</p>
                <p>The eight (8) competitors who advance from Online Round 3 will travel to Orlando, Florida to compete in the Championship round of the Competition on Wednesday, October 31, 2007. All onsite competitors must arrive at the Contemporary Resort no later than 2:00 PM EDT on Tuesday, October 30, 2007.</p>
                <p>All competitors must confirm their attendance at the onsite Championship no later than 5:00 PM EDT (UTC/GMT -4) on Friday, September 28, 2007, and must have acquired any necessary travel visas and know for certain that they can travel to the United States.  If a competitor is required to travel from outside the United States, it is necessary for the competitor to show proof of a visa and/or passport by 5:00 PM EDT (UTC/GMT -4) on Friday, September 28, 2007. Competitors may email a copy of their documents to <a target="_blank" href="mailto:jford@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a>. Competitors who fail to meet this requirement will be replaced as an onsite finalist.</p>
                <p style="font-weight:bold;">Visa Assistance</p>

                <p>At the end of Online Round 1, TopCoder will issue visa invitation letters upon the request of international competitors who may require such a letter. All competitors who advance beyond Online Round 1 will receive a visa invitation letter request form. Competitors have until 5:00 PM EDT (GMT/UTC -4) on Friday, September 14, 2007 to request a letter. Visas can take a significant amount of time to obtain in certain countries.  It is in the best interest of those competitors who need such a letter to request one well before the deadline. The cost of obtaining a visa is the sole responsibility of the competitor. Outside of issuing an invitation letter upon request, TopCoder will not assist competitors in the process of obtaining a travel visa. See more information about <a target="_blank" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=getVisa" alt="Get travel visas">travel visas</a>.</p>

                <p style="font-weight:bold;">Travel Details</p>
                <p>TopCoder will provide air travel arrangements for each competitor. The flight will be reserved by and paid for by TopCoder and will be for arrival on October 30, 2007 and departure on November 4, 2007. TopCoder will pay for each competitor's airfare up to $1,500, though we reserve the right to make exceptions to the maximum amount based on individual circumstances. Extended flights and/or hotel room nights requested by a competitor that result in additional costs will be the responsibility of the competitor.</p>
                <p>Ground transportation to and from the Orlando International Airport will be provided for each competitor by TopCoder via Disney Magical Express, as well as hotel accommodations and certain meals for each competitor. All other expenses are the responsibility of the competitor. TopCoder will not provide travel or lodging accommodations for guests of the competitor.</p>
                <p style="font-weight:bold;">Championship Round</p>

                <p>The Championship Round will consist of a maximum of 8 competitors and will be a single round.  The winner of the Championship Round will be the competitor with the highest point total for the Championship round. In the event that two or more competitors are tied at the end of the Championship Round, the tie will be resolved as follows:</p>
                    <ol>

                        <li>By reference to the total points acquired during Online Round 3 of the Competition.</li>
                        <li>If a tie remains, by reference to the total points acquired during Online Round 2 of the Competition.</li>
                        <li>If a tie remains, by reference to the total points acquired during Online Round 1 of the Competition.</li>
                        <li>If a tie remains, by reference to the highest rating following Online Round 3.</li>
                        <li>If a tie remains, then the prize money will be distributed equally among the competitors who are still tied.</li>

                    </ol>
                
                <a name="prizes"></a>
                <h2>About the Prizes</h2>
                <p>Prizes will be awarded to a maximum of 300 competitors in the Competition who advance to online round #2. At the onsite Championship round, cash prizes of a maximum of $30,000 will be awarded. Any and all applicable taxes on prizes are the sole responsibility of the competitors. Prizes will be distributed as follows:</p>

                <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                    <tbody> 
                        <tr> 
                            <td class="title" colspan="3">Prizes</td> 
                        </tr> 
                        <tr> 
                            <td class="header">Competitor(s)</td> 
                            <td class="header">Prize</td> 
                        </tr> 
                        <tr class="light"> 
                            <td class="value" style="font-weight:bold;">1st place finisher* - <br />Marathon Match Competition Champion</td> 
                            <td class="value" style="font-weight:bold;">$15,000</td> 
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">2nd place finisher* in the <br />Championship Round</td> 
                            <td class="value">$7,200</td>

                        </tr> 
                        <tr class="light"> 
                            <td class="value">3rd place finisher* in the <br />Championship Round</td> 
                            <td class="value">$3,600</td>
                        </tr> 
                        <tr class="dark"> 
                            <td class="value">4th place finisher* in the <br />Championship Round</td> 
                            <td class="value">$1,800</td>

                        </tr> 
                        <tr class="light"> 
                            <td class="value">5th - 8th place finishers* in the <br />Championship Round</td> 
                            <td class="value">$600 each</td>

                        </tr>
                        <tr class="dark"> 
                            <td class="value">Up to 300 competitors who compete in <br />
                            Online Round 2</td> 
                            <td class="value">Limited edition 2007 TopCoder Collegiate Challenge t-shirt</td>

                        </tr>
                        <tr class="light"> 
                            <td class="value" colspan="2">* Prize will be awarded at the conclusion of the Championship Round. Winner must be present at the onsite Championship announcement to receive prize.<br />
                            In addition to the prizes mentioned above, all onsite finalists will receive a one-day <a target="_blank" alt="Park Hopper option" target="_blank" href="<tc-webtag:linkTracking link='http://disneyworld.disney.go.com/wdw/tickets/ticketStore?categoryPass=RECOMMENDER&productPass=RECOMMENDER&country=USA' refer='TCCC07_whatToDo' />">Disney Park Hopper pass</a> to use at the event on Saturday, November 3, 2007.</td> 
                        </tr>

                    </tbody> 
                </table>
                <br />
                
                <a name="conditions"></a>

                <h2>Conditions of Participation</h2>
                <p>By participating in the Tournament and the Competition, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.  By participating in the Tournament and the Competition, you consent to provide certain information to the tournament sponsors, including the information contained in your TopCoder member profile and your Competition statistics.</p>
                <p><span class="bigRed">Competitors must not cheat. All ideas for code and/or challenge submitted must be the competitor's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions. TopCoder reserves the right, in its sole discretion, to remove any competitor from the Tournament and/or the Competition who it suspects has cheated.</span></p>
                <p>If a competitor is removed for cheating after a flight has been purchased for such competitor to attend and compete in the onsite Championship, the competitor shall reimburse TopCoder for the cost of the airfare. TopCoder reserves the right to withhold any future cash prizes won by the competitor until the amount of the plane ticket is paid off.</p>

                <p>All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the Tournament or the Competition are within the sole discretion of TopCoder and are final and binding in all respects.</p>
                
                <h2>Championship Round Competitor Information</h2>

                <p>All competitors who advance to the onsite Championship must complete the following items and submit them to TopCoder by 5:00 PM EDT on Friday, September 28, 2007:</p>
                    <ul>
                        <li>Confirmation of attendance/proof of travel documents - Please email <a target="_blank" href="mailto:jford@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a> to confirm your attendance onsite. If you require a passport and/or visa to visit the United States, you must show proof of your documents via a scanned copy of the necessary documents.</li>

                        <li>Please <a target="_blank" href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto">submit a photo</a>, if you have not already done so.</li>

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
                <p>A competitor forfeits his/her advancement to the Championship round, and will be replaced, if he/she fails to submit the above items by the associated deadlines.</p>

                <p>All prizes will be mailed within 60 days of the completion of the onsite Championship. Unclaimed or undeliverable prizes are forfeited. Competitors who do not submit the required information listed above by the applicable deadlines forfeit their prizes.</p>

                <p>As a condition of participation in the Tournament and the Competition, all information provided by you in your TopCoder member profile must be accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the Tournament and/or the Competition. In order to be eligible to participate in the Tournament and the Competition, a competitor must have completed any and all registration forms required by TopCoder.</p>
                <p>As a condition of winning and redeeming a cash prize, certain competitors will be required to submit a completed (i) Competitor Questionnaire, (ii) Affidavit of Eligibility and Liability and Publicity Release, (iii) IRS Form W-9 or W-8BEN, as appropriate if one is not already on file with TopCoder, and (iv) Travel Form. In completing the Affidavit of Eligibility and Liability and Publicity Release, a competitor who wins a cash prize (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated, (c) verifies the accuracy of the information in the TopCoder member database, (d) authorizes TopCoder to publicize the results of the Competition, (e) agrees to sign any applicable forms required by tax authorities, (f) licenses all rights to information submitted during the Competition (including rights to source code and other executables) to TopCoder, and (g) releases TopCoder from liability arising out of any prize won. TopCoder requires competitors to complete the Form W-9 or W-8BEN for tax reporting purposes. If a prize notification is returned as undeliverable, or if the competitor who wins a cash prize fails to return the Questionnaire, Affidavit, W-9 or W-8BEN, or Travel Form, the competitor forfeits any prize money won. A Competitor will be disqualified for providing false information in the registration process or in any required form.</p>
                <p>By participating in the Tournament and the Competition and redeeming a prize, a competitor releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in the Tournament and/or the Competition, or participation in any Tournament or Competition-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.</p>
                <p>In addition, all competitors who win a prize agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar events in the future, and to use the statements made by, or attributed to, the competitors relating to TopCoder and any and all rights to said use, without further compensation. Furthermore, all competitors agree to promptly notify TopCoder if a third-party, including any Tournament and/or Competition sponsors, contacts the competitor regarding employment opportunities and/or media interest as a result of the competitor's participation in the Tournament and/or the Competition.</p>
                <p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in the Tournament and/or the Competition, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the Competition, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the Tournament and/or the Competition if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort, or for any other reason.</p>

                
                <h2>Other</h2>

                <p>The Tournament and the Competition is void in whole or in part where prohibited by law.<br />A list of winners in the Competition by handle will be available on the web site at <a target="_blank" href="/tc">http://www.topcoder.com/tc</a>, and will be displayed for at least 3 months after the completion of the Competition.</p>
                <p>The Tournament and Competition are brought to you by TopCoder, Inc. (<a target="_blank" href="/">http://www.topcoder.com/</a>) 703 Hebron Avenue (now 95 Glastonbury Blvd), Glastonbury, CT 06033.</p>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>