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
    <jsp:param name="tabLev1" value="<%=EventType.MARATHON_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="rules"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        <h2>Marathon Competition Official Rules and Regulations</h2>
        
        <p>
            <a href="#eligibility">Eligibility</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#registration">Registration</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#structure">Round Structure</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#prizes">Prizes</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#conditions">Conditions of Participation</a>
        </p>
        <p><span class="bigRed">No purchase necessary to enter or win. Void where prohibited.</span></p>
        
        <div class="sub_content">
            <h3>Overview of the Tournament</h3>
            <p>The 2008 TopCoder Open Marathon Match Competition ("Competition") will take place between January 14, 2008 and May 15, 2008 and is part of the 2008 TopCoder Open ("Tournament"). It will consist of three (3) online elimination rounds and one (1) onsite final round. The prize purse of the Competition is $25,000.  Up to twelve (12) competitors will win a cash prize, and up to 100 competitors will win a participatory prize for competing in online round 3. The top 12 competitors, as determined by the online rounds, will advance to the onsite Championship round at the Mirage Hotel and Casino in Las Vegas, Nevada, USA on May 12, 2008.</p>
            
            <a name="eligibility"></a>
            <h3>Eligibility</h3>
            <p>TopCoder members meeting the following criteria are eligible to compete in the Competition:</p>
            <ul>
                <li>Must be at least 18 years of age (as of January 30, 2008); AND</li>
                <li>Must currently be eligible for participation in TopCoder competitions (i.e., not suspended from TopCoder).</li>
            </ul>
            <p>The Tournament and the Competition are void in the Quebec province of Canada and where prohibited by applicable law. Residents of Cuba, Iran, North Korea, Sudan, or Syria are ineligible to receive prizes and are ineligible to attend the onsite round of the Competition as competitors.</p>
            <p>Employees of TopCoder, Inc. and of all Tournament and Competition sponsors, regardless of commitment date as sponsor, including any companies involved in the production (including prize suppliers), implementation and distribution of the Tournament and/or Competition and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the Tournament and/or Competition and members of the immediate families (parent, child, sibling, and spouse of each) and/or persons living in the same household as such persons, are ineligible to participate in the Tournament and the Competition.</p>
            <p>If a competitor's employer signs on as a sponsor of the Tournament and/or the Competition after January 14, 2008, then that competitor will be removed from further participation in the Tournament and Competition. TopCoder members who are performing internships for any Tournament and/or Competition sponsor between January 14, 2008 and May 15, 2008 are also ineligible to participate.</p>
            <p>Those members who are eligible to compete in any of the four (4) Tournament competitions will be permitted to participate in any/all of them online. However, in the event a competitor becomes a finalist in more than one competition and the onsite competition times overlap, the competitor must choose one competition in which to participate as a finalist by March 26, 2008.</p>
            <p>In the event that a competitor is disqualified from any round, no other competitors will be added in his/her place.  Except as may otherwise be set forth herein, the only exception to this is advancement to the Championship Round.  In such a case, the competitor will be replaced with the competitor with the next highest score for Online Round 3.</p>
            
            <a name="registration"></a>
            <h3>Registration</h3>
            <p>Registration for the Competition will open at 9:00 AM EST on Monday, January 14, 2008, and will close at 5:00 PM EST on Tuesday, January 29, 2008. In order to be eligible to compete in the Competition, competitors must register separately for the Competition. There is no limit to the number of registrants for the Competition, however each competitor may only register once.</p>
            
            <a name="structure"></a>
            <h3>Online Elimination Rounds</h3>
            <p>Competitors must register for each round separately on the TopCoder web site. All start times will be communicated as Eastern Standard Time (UTC/GMT -5). If a competitor does not participate, for any reason, in an online round to which he/she has advanced, it will be treated as an automatic loss in that round of competition.</p>
            <p>Competitors will be assigned a seed for the Competition based on their Marathon rating prior to Online Round 1.</p>
            <p>The dates and times of the online rounds of the Competition are as follows:</p>
            <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                <tr>
                    <th>Round of Competition</th>
                    <th>Start Date and Time</th>
                    <th>End Date and Time</th>
                    <th>Maximum # of Competitors</th>
                    <th>Advancers</th>
                </tr>
                <tr class="dark">
                    <td>Online Round 1</td>
                    <td>Wednesday,<br />January 30<br />Noon*</td>
                    <td>Wednesday,<br />February 6<br />Noon*</td>
                    <td>Unlimited</td>
                    <td>300</td>
                </tr>
                <tr class="light">
                    <td>Online Round 2</td>
                    <td>Wednesday,<br />February 13<br />Noon*</td>
                    <td>Wednesday,<br />February 20<br />Noon*</td>
                    <td>300</td>
                    <td>100</td>
                </tr>
                <tr class="dark">
                    <td>Online Round 3</td>
                    <td>Wednesday,<br />February 27<br />Noon*</td>
                    <td>Wednesday,<br />March 12<br />Noon**</td>
                    <td>100</td>
                    <td>12</td>
                </tr>
                <tr class="light">
                    <td colspan="5">*Time listed in Eastern Standard Time (UTC/GMT -5). In the event that a round may not be held at the designated time for any reason, the round will start the following day at the same time.<br />**Time listed in Eastern Daylight Time (UTC/GMT -4).</td>
                </tr>
            </table>
            <br />
            
            <h3>Scoring and Advancing during Online Rounds</h3>
            <p>After each online round, the highest scoring competitors will advance to the next online round. Advancement to the next round is determined by comparing the total points from all system testing for each competitor. To advance, a competitor must submit a Full Submission. The structure of each online round is as follows:</p>
            <h4>Online Round 1</h4>
            <p>All eligible competitors who have registered for the Competition may compete, and up to the 300 highest scoring will advance to Online Round 2.</p>
            <h4>Online Round 2</h4>
            <p>Up to 300 competitors will compete and up to the 100 highest scoring competitors will advance to Online Round 3.</p>
            <h4>Online Round 3</h4>
            <p>Up to 100 competitors will compete and up to the 12 highest scoring competitors will advance to the onsite finals.</p>
            <p>NOTE: In the event of a tie for any advancing position during the Online Rounds, the tie will be resolved in the following manner:</p>
            <ol>
                <li>The competitor with the highest number of total points from the immediately preceding Online Round of the Competition will advance.</li>
                <li>If a tie still remains, the competitor with the highest number of points from the next previous Online Round will advance. This step will repeat until the tie is broken or until there are no more previous rounds.</li>
                <li>If a tie still remains, the competitor with the highest seed for the Competition will advance.</li>
                <li>If a tie still remains, all competitors who remain tied will advance.</li>
            </ol>
            
            <h3>Competition Round Structure</h3>
            <p>The format of these competition rounds is similar to standard TopCoder Marathon Matches held outside the Tournament.  The rules in place for such competitions as of January 30, 2008, as may be amended by these rules or the rules for the Tournament, will apply to the online and onsite rounds of the Competition.</p>
            <p>Each online and onsite round of competition consists of two phases: the Coding Phase and the System Testing Phase.</p>
            <p>The Coding Phase is a timed event where all competitors are presented with the same problem statement. The criteria for scoring will be provided in the problem statement and may change from round to round. During each round of the Competition, each competitor may submit one of two types of submissions: an Example Submission or a Full Submission. Each Example Submission is run against the example test cases listed in the problem statement and detailed feedback is provided to the competitor. Each Full Submission is run against a more complete set of test cases which are unknown to the competitor and the competitor only receives a provisional score. For Online Rounds 1 and 2, the duration of the Coding Phase is one week. For Online Round 3, the duration of the Coding Phase is two weeks.</p>
            <p>The System Testing Phase is applied to the most recent Full Submission for each competitor. During system testing, each Full Submission is run against a large number of sample cases unknown to the competitors, and is scored according to the criteria specified in the problem statement. Once the system tests are completed, competitors will be ranked according to their score on the system test cases. The score a competitor's Full Submission receives is determined solely by the system testing.</p>
            
            <h3>Onsite Championship Round</h3>
            <h4>Important Confirmation</h4>
            <p>The twelve (12) competitors who advance from Online Round 3 will travel to the Mirage Hotel and Casino in Las Vegas, Nevada, USA, to compete in the Championship round of the Competition on Monday, May 12, 2008. All onsite competitors must arrive at the Mirage no later than 5:00 PM PDT on Sunday, May 11, 2008.</p>
            <p>All competitors must confirm their attendance at the onsite Championship no later than 5:00 PM EDT (UTC/GMT -4) on Wednesday, March 26, 2008, and must have acquired any necessary travel visas and know for certain that they can travel to the United States. If a competitor is required to travel from outside the United States, it is necessary for the competitor to show proof of a visa and/or passport by 5:00 PM EDT (UTC/GMT -4) on Wednesday, March 26, 2008. Competitors may email a copy of their documents to <a href="mailto:jdamato@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a>. Competitors who fail to meet this requirement will be replaced as an onsite finalist.</p>
            <h4>Visa Assistance</h4>
            <p>At the end of Online Round 1, TopCoder will issue visa invitation letters to competitors advancing to Online Round 2 upon the request of international competitors who may require such a letter. All competitors who advance beyond Online Round 1 will receive a visa invitation letter request form. Competitors have until 5:00 PM EDT (GMT/UTC -4) on Wednesday, March 12, 2008 to request a letter. As soon as a competitor fills out the form in its entirety and returns it to TopCoder, the visa letter will be mailed.  Competitors have until 5:00 PM EDT (GMT/UTC -4) on Wednesday, March 12, 2008, to request a letter.  Visas can take a significant amount of time to obtain in certain countries. It is in the best interest of competitors who need such a letter to request one well before the deadline. The cost of obtaining a visa is the sole responsibility of the competitor. See more information about <a target="_blank" href="/wiki/display/tc/Getting+your+Visa+and+Getting+it+Early">travel visas</a>.</p>
            <h4>Travel Details</h4>
            <p>TopCoder will provide air travel arrangements for each competitor. The flight will be reserved by and paid for by TopCoder and will be for arrival on May 11, 2008 and departure on May 15, 16 or 17, 2008, whichever is most cost-effective. At TopCoder's sole discretion, TopCoder will pay for each competitor's airfare up to $1,500, but reserves the right to make exceptions to the maximum amount based on individual circumstances. If a competitor wishes to take a flight other than the one provided by TopCoder and/or wishes to stay at a hotel other than the one provided by TopCoder, or wishes to stay additional nights at the Mirage or another hotel, the competitor shall be responsible for the entire cost of such deviation from the accommodations and travel arrangements provided by TopCoder.  In addition, competitor agrees to reimburse TopCoder for any costs, penalties, fins or fees incurred by TopCoder as a result of such deviation.</p>
            <p>Ground transportation to and from McCarran International Airport will be provided for each competitor by TopCoder, as well as hotel accommodations and certain meals for each competitor. All other expenses are the responsibility of the competitor. TopCoder will not provide travel or lodging accommodations for any guests of a competitor.</p>
            <h4>Championship Round</h4>
            <p>The Championship Round will consist of a maximum of 12 competitors and will be a single round. The winner of the Championship Round will be the competitor with the highest point total for the Championship round. In the event that two or more competitors are tied at the end of the Championship Round, the tie will be resolved in the following manner:</p>
            <ol>
                <li>The competitor with the highest number of points acquired during Online Round 3 of the Competition.</li>
                <li>If a tie remains, the competitor with the highest number of points acquired during Online Round 2 of the Competition.</li>
                <li>If a tie remains, the competitor with the highest number of points acquired during Online Round 1 of the Competition.</li>
                <li>If a tie remains, the competitor with the highest Marathon Match rating at the conclusion of Online Round 3.</li>
                <li>If a tie remains, then the prize money will be distributed equally among the competitors who are still tied.</li>
            </ol>
            
            <a name="prizes"></a>
            <h3>About the Prizes</h3>
            <p>Prizes will be awarded to a maximum of 200 competitors in the Competition who participate in Online Round 3. Cash prizes up to $25,000 will be awarded at the onsite Championship Round. Any and all applicable taxes on prizes are the sole responsibility of the competitors. Prizes will be distributed as follows:</p>
            <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                <tr>
                    <th colspan="2">Prizes</th>
                </tr>
                <tr>
                    <th>Competitor(s)</th>
                    <th>Prize</th>
                </tr>
                <tr class="dark">
                    <td>1st place finisher* - Marathon Match Competition Champion</td>
                    <td>$10,000</td>
                </tr>
                <tr class="light">
                    <td>2nd place finisher* in the Championship Round</td>
                    <td>$5,000</td>
                </tr>
                <tr class="dark">
                    <td>3rd place finisher* in the Championship Round</td>
                    <td>$3,000</td>
                </tr>
                <tr class="light">
                    <td>4th place finisher* in the Championship Round</td>
                    <td>$2,000</td>
                </tr>
                <tr class="dark">
                    <td>5th - 12th place finishers* in the Championship Round</td>
                    <td>$625 each</td>
                </tr>
                <tr class="light">
                    <td>Up to 100 competitors who compete in Online Round 3</td>
                    <td>Limited edition 2008 TopCoder Open t-shirt</td>
                </tr>
                <tr class="dark">
                    <td colspan="2">* Prize will be awarded at the conclusion of the Championship Round. Winner must be present at the onsite Championship announcement to receive prize.</td>
                </tr>
            </table>
            <br />
            
            <a name="conditions"></a>
            <h3>Conditions of Participation</h3>
            <p>By participating in the Tournament and the Competition, you agree to be bound by these rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters. By participating in the Tournament and the Competition, you consent to provide certain information to the Tournament sponsors.  Such information shall include the information contained in your TopCoder member profile, as well as your Competition statistics.</p>
            <p><span class="bigRed">Competitors must not cheat. All ideas for code and/or challenge submitted must be the competitor's alone. TopCoder uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another competitor, submitting code that was not fully authored by you, and using resources, software, etc. that are not allowed in TopCoder competitions, the Competition or the Tournament. TopCoder reserves the right, in its sole discretion, to remove any competitor from the Tournament and/or the Competition who it suspects of cheating.</span></p>
            <p>If a competitor is eliminated for cheating after he/she is confirmed as a finalist and travel accommodations have already been made for the competitor by TopCoder for the onsite finals, that competitor will be responsible for reimbursing TopCoder for the cost of such accommodations. TopCoder reserves the right to withhold any future cash prizes won by the competitor until the cost of such accommodations has been fully reimbursed.</p>
            <p>All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining to the Tournament or the Competition are within the sole discretion of TopCoder or its designee and are final and binding in all respects.</p>
            
            <h3>Championship Round Competitor Information</h3>
            <p>All competitors who advance to the onsite Championship Round must complete the following items and submit them to TopCoder by 5:00 PM EDT on Wednesday, March 26, 2008:</p>
            <ul>
                <li>Confirmation of attendance/proof of travel documents - Please email <a href="mailto:jdamato@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a> to confirm your attendance onsite. If you require a passport and/or visa to visit the United States, you must show proof of your documents via a scanned copy of the necessary documents.</li>
                <li>Please <a href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto">submit a photo</a>, if you have not already done so.</li>
                <li>Please ensure your most up-to-date information is listed in your TopCoder profile in the event we need to mail your plane tickets or contact you via telephone.</li>
                <li>Competitor Questionnaire - the questions and responses may be published in the 2008 TopCoder Open program.</li>
                <li>Travel form - provides TopCoder with the appropriate travel information for your trip to the onsite tournament rounds.</li>
                <li>Affidavit of Eligibility and Liability and Publicity Release - TopCoder must receive the original copy of a notarized affidavit unless a notarized affidavit is already on file with TopCoder. The document must be postmarked by Wednesday, March 26, 2008, and must be sent in such a manner that it will arrive at TopCoder no later than April 26, 2008.</li>
                <li>If TopCoder already has a notarized affidavit and a tax form on file, that competitor may affirm such document online.</li>
            </ul>
            <p>A competitor who fails to submit the above items on time will not advance to the onsite round and will be replaced by the competitor with the next highest score after Online Round 3.</p>
            <p>Except as otherwise provided in these rules, all prizes will be sent within 60 days of the completion of the Championship Round. Prizes which remain unclaimed or undeliverable after a period of six (6) months will be forfeited. Competitors who do not submit the required information listed above by the applicable deadlines forfeit their prizes.</p>
            <p>As a condition of participation in the Tournament and the Competition, all information provided by you in your TopCoder member profile must be accurate and up-to-date. TopCoder may require you to complete an additional registration form to register for the Tournament and/or the Competition. In order to be eligible to participate in the Tournament and the Competition, a competitor must have completed any and all registration forms required by TopCoder.</p>
            <p>As a condition of winning and redeeming a cash prize, certain competitors will be required to submit a completed (i) Competitor Questionnaire, (ii) Affidavit of Eligibility and Liability and Publicity Release, (iii) IRS Form W-9 or W-8BEN, as appropriate if one is not already on file with TopCoder, and (iv) Travel Form. In completing the Affidavit of Eligibility and Liability and Publicity Release, a competitor who wins a cash prize (a) confirms his/her eligibility, (b) represents and warrants that he/she has not cheated, (c) verifies the accuracy of the information in the TopCoder member database, (d) authorizes TopCoder to publicize the results of the Competition, (e) agrees to sign any applicable forms required by tax authorities, (f) licenses all rights to information submitted during the Competition (including rights to source code and other executables) to TopCoder, and (g) releases TopCoder from liability arising out of any prize won.</p>
            <p>TopCoder requires competitors to complete the Form W-9 or W-8BEN for tax reporting purposes.  A Competitor will be disqualified for providing false information in the registration process or in any required form.</p>
            <p>By participating in the Tournament and the Competition and redeeming a prize, a competitor releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, advertising and promotion agencies, sponsors, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in the Tournament and/or the Competition, or participation in any Tournament or Competition-related activity, or the receipt, use or misuse of a prize. TopCoder specifically disclaims all liability associated with, and makes no warranties with regard to, any prize given.</p>
            <p>In addition, all competitors who win a prize agree to cooperate with TopCoder's publicity efforts, without further compensation. This includes the agreement to use their name, handle, address (city and state) and likeness for publicity purposes, where legal, for this or similar events in the future, and to use the statements made by, or attributed to, the competitors relating to TopCoder and any and all rights to said use, without further compensation. Furthermore, all competitors agree to promptly notify TopCoder if a third-party, including any Tournament and/or Competition sponsor, contacts the competitor regarding employment opportunities and/or media interest as a result of the competitor's participation in the Tournament and/or the Competition.</p>
            <p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in the Tournament and/or the Competition, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site, or the Competition, or otherwise being in violation of the rules. TopCoder reserves the right to cancel, terminate or modify the Tournament and/or the Competition if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort, or for any other reason.</p>
            
            <h3>Other</h3>
            <p>The Tournament and the Competition is void in whole or in part where prohibited by law.</p>
            <p>A list of winners in the Competition by handle will be available on the web site at <a href="/tc">http://www.topcoder.com/tc</a>, and will be displayed for at least 3 months after the completion of the Competition.</p>
            <p>The Tournament and Competition are brought to you by TopCoder, Inc. (<a href="/">http://www.topcoder.com/</a>) 95 Glastonbury Boulevard, Glastonbury, CT 06033.</p>

            
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
