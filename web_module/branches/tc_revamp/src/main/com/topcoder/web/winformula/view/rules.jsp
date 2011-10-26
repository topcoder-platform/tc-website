<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Rules</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
            <h1>ESPN Winning Formula Marathon Match Competition</h1>
            
            <h2>Official Rules &amp; Regulations</h2>
            <p align="center">
                <a href="#about">About the Competition</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#conditions">Conditions of Participation</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#eligibility">Eligibility</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#schedule">Competition Schedule</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#scoring">Scoring</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#submission">Submission Requirements</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#prizes">Prizes</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#ownership">Ownership and Rights</a>
            </p>
            <p>NO PURCHASE NECESSARY TO ENTER OR WIN, VOID WHERE PROHIBITED. Registration and participation by developers in the ESPN Winning Formula Competition (the "Competition") constitutes agreement with these terms and conditions ("Rules" or "Terms and Conditions") between you and TopCoder, Inc. ("TopCoder").</p>
            
            <a name="about"></a>
            <h2>About the Competition</h2>
            <h3>Entering the Competition</h3>
            <p>This skill-based Competition is brought to you and sponsored by TopCoder, Inc.  This Competition is designed to encourage the development and use of certain technologies, and provides an opportunity for members of the TopCoder Community to create software that can predict future events based on past events.</p>
            <p>In order to participate in the ESPN Winning Formula Marathon Match Competition (the "Competition"), you must agree to be bound by these Official Rules & Regulations ("Rules") and to all decisions of TopCoder, which are final, binding and conclusive in all matters.  Participants must be registered members of TopCoder, and also register for the Competition.  Each TopCoder member who has registered for the Competition ("Competitor") will be given access to the problem statement for the Competition and the competition data ("Historical Data").</p>
            <p>Registration may occur at any time from 11:59 AM EDT on July 29, 2008 through 2:00PM EDT on Sept. 24, 2008.  The Competition will begin at 11:59 AM EDT on July 29, 2008 and will end at 12:01AM EST on Dec. 11, 2008.</p>
            
            <h3>Upon Entering a Marathon Match</h3>
            <p>All Competitors registered for the Competition will see a Submit option. Clicking the Submit link will take the Competitor to a page that will allow the Competitor to paste in a solution, select the proper language and either submit (for compilation and testing) or save your code. When the Submit button is selected, the code will be immediately compiled. Any compilation messages or errors will be shown in the Messages Area. If the compilation was successful, the submission will then be placed on a queue for automated testing ("Submission").  Competitors may submit multiple Submissions during a Submission Phase (but only once every 4 hours), however only the most recent Submission will be used to determine the Competitor's score for that phase.  If a Competitor has a pending submission on the testing queue it must finish testing before the Competitor may submit another submission.</p>
            <p>TopCoder reserves the right to limit the participation of any person in the Competition, amend or interpret these Rules and Regulations or official communications governing the Competition or cancel the Competition for any reason with prior notice. Notices for any such amendment, interpretation or cancellation will be deemed to have been given by posting on the TopCoder website and by virtue of a Competitor's continued participation in the Competition. A Competitor may terminate participation in the Competition upon written notice to TopCoder.</p>
            
            <h3>How to participate</h3>
            <ol class="howCompete">
                <li>Read the Competition specification document at <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/">this link</a></li>
                <li>Develop your Submission.</li>
                <li>Enter your Submission into the Competition using the functionality at <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/">this link</a></li>
                <li>Winners will be selected based on the judging criteria below. The winning Submissions will be announced (i) for the Mini Season Winners, upon the completion of the applicable time period, and (ii) for the highest aggregate score over Week Four through Week Fifteen, upon completion of Week Fifteen.</li>
            </ol>
            
            
            <a name="conditions"></a>
            <h2>Conditions of Participation</h2>
            <p>By participating in the Competition, you agree to be bound by these Rules and to all decisions of TopCoder, which are final, binding and conclusive in all matters.  As a condition of participating in this Competition and by submitting a Submission, each Competitor agrees to assign all rights in a Submission in exchange for a cash payment of $2,000, in accordance with the "Ownership and Rights" section of these Rules.  TopCoder may notify Competitor of such payment at any time during or after the Competition, but no later than 60 days following the completion of the Week Fifteen.</p>
            <p><span class="bigRed">Competitors must not cheat; all ideas for any code submitted must be solely the Competitor's.  Competitors must use their own independently developed code, and shall not copy or include code from any other party, including publicly available "open source" code that is or may be subject to licensing restrictions.</span></p>
            <p>At any time during the Competition, TopCoder may require a Competitor to submit a brief (less than 500 words) description of a Submission, including, but not limited to, the Competitor's strategy in developing the Submission, their methodology, and the functioning of the Submission ("Description").  If a Competitor cannot, will not or fails to provide the Description within 10 days of the request, then the Submission will be disqualified.</p>
            <p>The winning Competitor for Mini Season will be the Competitor with the highest cumulative score for across all games during that period.  The winning Competitor of the Competition will be the Competitor with the highest cumulative score from Week Four through Week Fifteen.  All decisions relating to the viability of Submissions, the ranking of Submissions and all other matters pertaining to the Competition are within the sole discretion of TopCoder or its designee and shall be final and binding in all respects.</p>
            <p>By participating in this Competition, a Competitor who wins a prize releases and agrees to hold harmless TopCoder, its affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers, employees, representatives and agents, from and against any and all liability for any loss, property damage or damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly, from or arising out of participation in this Competition, or participation in any Competition-related activity, or the receipt, use or misuse of a prize.</p>
            <p>TopCoder, in its sole discretion, reserves the right to disqualify any Competitor tampering with the entry process, the operation of the Web site, the Competition process, or is otherwise in violation of these Rules. TopCoder reserves the right to cancel, terminate or modify the Competition if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</p>
            
            
            <a name="eligibility"></a>
            <h2>Eligibility</h2>
            <p>The Competition is open to all members of the TopCoder website who are at least 18 years of age.  Competitors must be (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S., or (iv) a non-U.S. resident authorized to perform services as an independent contractor.</p>
            <p>A Competitor is not eligible for this Competition if he/she is a resident of the Quebec province of Canada, Iran, Cuba, North Korea, Sudan or Syria.  In addition, a Competitor is not eligible for this Competition if the Competitor is on the Specially Designated National list promulgated and amended, from time to time, by the United States Department of the Treasury.</p>
            <p>All Competitors must be registered members of TopCoder, and must have agreed to these Rules prior to and as a condition for registering for this Competition.</p>
            <p>Competitors must abide by the Terms of Use of TopCoder's website at <a href="http://<%=ApplicationServer.SERVER_NAME%>/">www.topcoder.com</a>.  Violation of the Terms of Use may result in disqualification from this Competition, and/or further consequences as determined in TopCoder's sole discretion.</p>
            <p>Current employees of TopCoder and the Competition sponsor and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this Competition and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the competition and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the Competition.</p>
            
            
            <a name="schedule"></a>
            <h2>Competition Schedule</h2>
            <p>The Competition consists of a series of four Mini Seasons.  During Mini Season One, Submissions will be scored to determine the Winners of Mini Season One, however Competitor's scores will not count towards the determination of the Winners of the overall Competition.</p>
            <p>During each Mini Season, Submissions will be scored to determine the Mini Season Winners.  Each Competitor's score for Mini Season Two, Three and Four will count toward the determination of the Winners of the overall Competition.</p>
            <p>Competitors will be allowed to modify their Submissions as desired during the Mini Season One Submission Period, the Mini Season Two Submission Period, the Mini Season Three Submission Period and the Mini Season Four Submission Period.  A Submission will count as a Competitor's final Submission unless and until modified as permitted under these Rules.  Modified Submissions are due by the end of the applicable Submission Period.  Competitors will not be allowed to further modify their Submission upon the conclusion of the Mini Season Four Submission Period (November 20, 2008 at 2:00 PM EDT).</p>
            <p>Prior to the beginning of the next Week, Competitors will be given access to a file containing the previous Week's data ("Weekly Data").</p>
            <p>The Schedule of the Competition is as follows:</p>
            <table width="75%" border="0" cellpadding="0" cellspacing="0" class="stat">
                <thead>
                    <tr>
                        <th class="alignCenter">Event</th>
                        <th class="alignCenter">Start Date/Time</th>
                        <th class="alignCenter">End Date/Time</th>
                    </tr>
                </thead>
                <tr class="light">
                    <td>Registration</td>
                    <td>July 29, 2008 at 11:59AM EDT</td>
                    <td>September 17, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="dark">
                    <td>Mini Season One Submission Period</td>
                    <td>August 12, 2008 at 11:59 AM EDT</td>
                    <td>August 27, 2008  at 12:01 AM EDT</td>
                </tr>
                <tr class="light">
                    <td>Mini Season One</td>
                    <td>August 28, 2008 at 12:01 AM EDT</td>
                    <td>September 18, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="dark">
                    <td>Week One</td>
                    <td>August 28, 2008 at 12:01 AM EDT</td>
                    <td>September 4, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="light">
                    <td>Week Two</td>
                    <td>September 4, 2008 at 12:01 AM EDT</td>
                    <td>September 11, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="dark">
                    <td>Week Three</td>
                    <td>September 11, 2008 at 12:01 AM EDT</td>
                    <td>September 18, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="light">
                    <td>Mini Season Two Submission Period</td>
                    <td>August 27, 2008, 2008 at 2:00 PM EDT</td>
                    <td>September 17, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="dark">
                    <td>Mini Season Two</td>
                    <td>September 18, 2008 at 12:01 AM EDT</td>
                    <td>October 16, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="light">
                    <td>Week Four</td>
                    <td>September 18, 2008 at 12:01 AM EDT</td>
                    <td>September 25, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="dark">
                    <td>Week Five</td>
                    <td>September 25, 2008 at 12:01 AM EDT</td>
                    <td>October 2, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="light">
                    <td>Week Six</td>
                    <td>October 2, 2008 at 12:01 AM EDT</td>
                    <td>October 9, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="dark">
                    <td>Week Seven</td>
                    <td>October 9, 2008 at 12:01 AM EDT</td>
                    <td>October 16, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="light">
                    <td>Mini Season Three Submission Period</td>
                    <td>September 17, 2008 at 2:00 PM EDT</td>
                    <td>October 15, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="dark">
                    <td>Mini Season Three</td>
                    <td>October 16, 2008 at 12:01 AM EDT</td>
                    <td>November 12, 2008 at 12:01 AM EST</td>
                </tr>
                <tr class="light">
                    <td>Week Eight</td>
                    <td>October 16, 2008 at 12:01 AM EDT</td>
                    <td>October 23, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="dark">
                    <td>Week Nine</td>
                    <td>October 23, 2008 at 12:01 AM EDT</td>
                    <td>October 30, 2008 at 12:01 AM EDT</td>
                </tr>
                <tr class="light">
                    <td>Week Ten</td>
                    <td>October 30, 2008 at 12:01 AM EDT</td>
                    <td>November 6, 2008 at 12:01 AM EST</td>
                </tr>
                <tr class="dark">
                    <td>Week Eleven</td>
                    <td>November 6, 2008 at 12:01 AM EST</td>
                    <td>November 13, 2008 at 12:01 AM EST</td>
                </tr>
                <tr class="light">
                    <td>Mini Season Four Submission Period</td>
                    <td>October 15, 2008 at 2:00 PM EDT</td>
                    <td>November 11, 2008 at 12:01 AM EST</td>
                </tr>
                <tr class="dark">
                    <td>Mini Season Four</td>
                    <td>November 12, 2008 at 12:01 AM EST</td>
                    <td>December 11, 2008 at 12:01 AM EST</td>
                </tr>
                <tr class="light">
                    <td>Week Twelve</td>
                    <td>November 13, 2008 at 12:01 AM EST</td>
                    <td>November 20, 2008 at 12:01 AM EST</td>
                </tr>
                <tr class="dark">
                    <td>Week Thirteen</td>
                    <td>November 20, 2008 at 12:01 AM EST</td>
                    <td>November 27, 2008 at 12:01 AM EST</td>
                </tr>
                <tr class="light">
                    <td>Week Fourteen</td>
                    <td>November 27, 2008 at 12:01 AM EST</td>
                    <td>December 4, 2008 at 12:01 AM EST</td>
                </tr>
                <tr class="dark">
                    <td>Week Fifteen</td>
                    <td>December 4, 2008 at 12:01 AM EST</td>
                    <td>December 11, 2008 at 12:01 AM EST</td>
                </tr>
            </table>
            <br />
            
            
            <a name="scoring"></a>
            <h2>Scoring</h2>
            <p>Each Submission shall be scored for each Mini Season and the overall Competition according to the following guidelines.</p>
            <p>Note:  Only games between Division I FBS (Football Bowl Subdivision) football teams will be used to determine the score of a Submission.</p>
            <p>Each game is allotted 100 scoring points ("Maximum").  Points will be deducted from Maximum to determine the score for that game.  Points will be deducted as follows:</p>
            <ul class="howCompete2">
                <li>Game Outcome:  If the Submission correctly predicts the outcome of the game, no points will be deducted from the Maximum.  If the Submission does not correctly predict the outcome of the game, 60 points are deducted from the Maximum.</li>
                <li>Margin:
                    <ul class="howCompete2">
                        <li>If a Submission correctly predicts the winning team and the margin of victory for the winning team, no points will be deducted from the Maximum.</li>
                        <li>If a Submission correctly predicts the outcome of the game, but fails to predict the margin of victory correctly, then points will be deducted from the Maximum for each game point by which the actual margin of victory differs from the Submission's predicted margin of victory in accordance with the following table:<br />
                            <table width="75%" border="0" cellpadding="0" cellspacing="0" class="stat">
                                <thead>
                                    <tr>
                                        <th class="alignCenter">Difference of<br />Actual Margin of Victory from<br />Predicted Margin <span style="text-decoration:underline;">of Victory</span></th>
                                        <th class="alignCenter">Points Deducted from <span style="text-decoration:underline;">Maximum</span></th>
                                    </tr>
                                </thead>
                                <tr class="light">
                                    <td class="alignCenter">0</td>
                                    <td class="alignCenter">0</td>
                                </tr>
                                <tr class="dark">
                                    <td class="alignCenter">1</td>
                                    <td class="alignCenter">2</td>
                                </tr>
                                <tr class="light">
                                    <td class="alignCenter">2</td>
                                    <td class="alignCenter">4</td>
                                </tr>
                                <tr class="dark">
                                    <td class="alignCenter">3</td>
                                    <td class="alignCenter">7</td>
                                </tr>
                                <tr class="light">
                                    <td class="alignCenter">4</td>
                                    <td class="alignCenter">10</td>
                                </tr>
                                <tr class="dark">
                                    <td class="alignCenter">5</td>
                                    <td class="alignCenter">13</td>
                                </tr>
                                <tr class="light">
                                    <td class="alignCenter">6</td>
                                    <td class="alignCenter">16</td>
                                </tr>
                                <tr class="dark">
                                    <td class="alignCenter">7</td>
                                    <td class="alignCenter">19</td>
                                </tr>
                                <tr class="light">
                                    <td class="alignCenter">8 or more</td>
                                    <td class="alignCenter">20</td>
                                </tr>
                            </table>
                        </li>
                        <li>If a Submission does not correctly predict the outcome of the game, then 20 points will be deducted from the Maximum.</li>
                    </ul>
                </li>
            </ul>
            <p>Under no circumstances will more than 20 points be deducted from the Maximum under this "Margin" scoring mechanic.</p>
            <ul class="howCompete2">
                <li>Score:  If a Submission correctly predicts each team's final score, then no points will be deducted from the Maximum.  If a Submission does not correctly predict each team's final score, then points will be deducted from the Maximum (on a per team basis) in accordance with the following chart:<br />
                    <table width="75%" border="0" cellpadding="0" cellspacing="0" class="stat">
                        <thead>
                            <tr>
                                <th class="alignCenter">Difference of Actual Team Score<br />from Predicted Team Score</th>
                                <th class="alignCenter">Points Deducted from <span style="text-decoration:underline;">Maximum</span></th>
                            </tr>
                        </thead>
                        <tr class="light">
                            <td class="alignCenter">0</td>
                            <td class="alignCenter">0</td>
                        </tr>
                        <tr class="dark">
                            <td class="alignCenter">1</td>
                            <td class="alignCenter">1</td>
                        </tr>
                        <tr class="light">
                            <td class="alignCenter">2</td>
                            <td class="alignCenter">2</td>
                        </tr>
                        <tr class="dark">
                            <td class="alignCenter">3</td>
                            <td class="alignCenter">3</td>
                        </tr>
                        <tr class="light">
                            <td class="alignCenter">4</td>
                            <td class="alignCenter">4</td>
                        </tr>
                        <tr class="dark">
                            <td class="alignCenter">5</td>
                            <td class="alignCenter">5</td>
                        </tr>
                        <tr class="light">
                            <td class="alignCenter">6</td>
                            <td class="alignCenter">6</td>
                        </tr>
                        <tr class="dark">
                            <td class="alignCenter">7</td>
                            <td class="alignCenter">7</td>
                        </tr>
                        <tr class="light">
                            <td class="alignCenter">8</td>
                            <td class="alignCenter">8</td>
                        </tr>
                        <tr class="dark">
                            <td class="alignCenter">9</td>
                            <td class="alignCenter">9</td>
                        </tr>
                        <tr class="light">
                            <td class="alignCenter">10 or more</td>
                            <td class="alignCenter">10</td>
                        </tr>
                    </table>
                </li>
            </ul>
            <p>Under no circumstances will more than 20 points be deducted from the Maximum under this "Score" scoring mechanic.</p>
            <p>If a game in not completed, regardless of the reason, no points will be counted toward a Submission's score.  The Week towards which a game is counted shall be determined by the date and time on which it ends.</p>
            <p>At the end of each Week of the Competition, the total points across all games will be added together and the Submissions will be ranked for that Week.  At the end of each Mini Season, the Submission with the highest total score for that time period Winner for that time period.</p>
            <p>At the end of each Week of the Season, the total points across Weeks Four through Fifteen will be added together and the Submissions will be ranked through that Week.  The winner of the Competition will be the Competitor with the highest total score for Weeks Four through Fifteen.</p>
            <p>Each week, TopCoder will announce and display the top 10 Competitors for the preceding Week, the applicable Mini Season and the top 10 Competitors of the overall Competition by handle.</p>
            
            
            <a name="submission"></a>
            <h2>Submission Requirements</h2>
            <p>A Submission may not contain excessive and/or unnecessary code, must meet TopCoder's coding standards, and must execute within the time periods described in the specifications.  All winning submissions will be reviewed and required to pass the competition review scorecard to verify compliance.</p>
            <p>In addition to any other requirements set forth in the Competition documents and/or problem statement, each Submission must not "hard code" weekly picks, must use the Historical Data and Weekly Data to determine the output, but must not be dependent on the particular identifiers in the data set provided.  For example, if the identifiers for the teams and/or players were changed, the Submission must still work in the same way and reach the same result.  Likewise, if the Historical Data and/or Weekly Data is changed, a change in the output would be expected commensurate with the statistical approach taken.</p>
            <p>In the event a Submission does not meet these requirements, such Submission will receive a total of 0 points for that Week of the Competition.</p>
            
            
            <a name="prizes"></a>
            <h2>Prizes</h2>
            <p>For each Mini Season of the Competition, the following Prizes will be awarded:</p>
            <ul class="howCompete2">
                <li>Highest Scoring Competitor:  $5,000</li>
                <li>Second Highest Scoring Competitor:  $2,500</li>
            </ul>
            <p>At the conclusion of Week Fifteen, the following Prizes will be awarded:</p>
            <ul class="howCompete2">
                <li>Highest Aggregate Score for Weeks Four through Fifteen:  $50,000</li>
                <li>Second Highest Aggregate Score for Weeks Four through Fifteen:  $10,000</li>
                <li>Third Highest Aggregate Score for Weeks Four through Fifteen:  $5,000</li>
                <li>Fourth Highest Aggregate Score for Weeks Four through Fifteen:  $3,000</li>
                <li>Fifth Highest Aggregate Score for Weeks Four through Fifteen:  $2,000</li>
            </ul>
            <p>In the event of a tie, the tie will be broken as follows:</p>
            <ol class="howCompete">
                <li>The Competitor with the highest number of points from the Game Outcomes scoring mechanic for the Mini Season or over the course of Week Four through Fifteen, as applicable, shall be declared the winner.</li>
                <li>In the event a tie still exists, the Competitor with the highest number of points (among the remaining tied Competitors) from the Margin scoring mechanic for the Mini Season or over the course of over the course of Week Four through Fifteen, as applicable, shall be declared the winner.</li>
                <li>In the event a tie still exists, the prize money will be split equally among the remaining tied Competitors.</li>
            </ol>
            <p>All Prizes are listed and shall be awarded in USD.</p>
            <p>All prizes will be awarded, provided a qualified number of Submissions are received. As a requirement of receiving a prize, a winning Competitor shall submit a brief (less than 500 words) description of the Submission, including, but not limited to, the Competitor's strategy in developing the Submission, their methodology, and the functioning of the Submission ("Description").  If a Competitor cannot or will not accept a prize, or fails to provide the Description within 10 days of notification, then the prize will be forfeited and may be awarded to the next highest scoring Submission.</p>
            <p>Unless otherwise provided herein, by participating in this Competition, a Competitor acknowledges and agrees that if his/her Submission is selected as a winner, the Competitor will receive a cash award only upon verification of all applicable eligibility requirements. All prize values are stated in US dollars. Cash prizes will be paid out by TopCoder (or its designee) in the US in US dollars no later than 60 days following prize notification. Taxes, if any, are the sole responsibility of the winner(s).</p>
            <p>Winning Competitors will be notified by e-mail; and may be required to sign and return an Affidavit of Eligibility/Liability/Publicity release, unless prohibited by law, within ten (10) days of date of prize notification.</p>
            <p>If a winning Competitor (i) does not reply to such notification or the notification is undeliverable, (ii) does not return the Affidavit of Eligibility/Liability/Publicity release completed and signed within ten (10) days of date of prize notification, (iii) does not submit the Description or (iv) is not otherwise in compliance with these Rules, the Competitor will be disqualified and forfeit any prize, and we may, at our discretion, select and notify another Competitor.</p>
            
            
            <a name="ownership"></a>
            <h2>Ownership and Rights</h2>
            <p>If you are compensated for your Submission, then you agree to irrevocably and unconditionally transfer and assign to TopCoder, its successors, and assigns, all right, title and interest you have, may have or acquire in, such Submission and any derivative works thereof submitted by you in the Competition, and you agree to execute and deliver such documents, certificates, assignments and other writings, and take such other actions as may be necessary or desirable to vest in TopCoder the ownership rights granted to TopCoder hereunder.  An assignment document, affidavit, and tax documentation will be required for payment.  All Submissions receiving compensation shall be considered confidential information of TopCoder and/or the Competition sponsor, and may not be distributed to any third party.</p>
            <p>If TopCoder does not compensate you for your Submission, then you retain any and all rights to ownership of such Submission; provided, however, that you grant a perpetual, royalty-free, irrevocable, non-exclusive license to TopCoder to use, reproduce and publish such Submissions or material in connection with the Competition.</p>
            <p>Nothing in these Rules shall be construed as granting you any right or license under any intellectual property right of TopCoder (including any rights TopCoder may have in any patents, copyrights, trademarks, service marks or any trade secrets) or in the TopCoder web site, by implication, estoppel or otherwise, except as expressly set forth herein.</p>
            
            
            <h2>Confidential Information</h2>
            <p>The Historical Data and the Weekly Data are confidential and proprietary, and can only be used for the purposes of this Competition.  You agree (i) to hold such information in confidence and to take all reasonable precautions to protect such confidential information (including, without limitation, all precautions you may employ with respect to your own confidential materials), (ii) not to divulge any such confidential information to any third person; and (iii) not to make any use whatsoever of such confidential information except as expressly authorized in these Rules.</p>
            
            
            <h2>Indemnification and Release</h2>
            <p>By submitting a Submission and/or otherwise participating in forum and newsgroup discussions on TopCoder's customer and developer forums, you agree to indemnify TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities and hold them harmless from any and all claims and expenses, including attorney's fees, arising from your use of TopCoder's website(s) and/or the materials gained from TopCoder's website(s) or directly from TopCoder, including any material (including third party material) that you post on TopCoder's website(s) or in any news forums and any services or products available through TopCoder's website(s). In addition, you hereby release TopCoder and any parent, subsidiary or affiliated entities, TopCoder's officers and employees, and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or unknown, suspected or unsuspected, disclosed or undisclosed, that you may have against them arising out of or in any way related to such disputes and/or to any services or products available at TopCoder's website(s). You hereby agree to waive all laws that may limit the efficacy of such releases.</p>
            
            
            <h2>DISCLAIMER</h2>
            <p>THE MATERIALS AND SERVICES ON TOPCODER'S WEBSITE(S) ARE PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED. TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. TOPCODER DOES NOT WARRANT THAT THE FUNCTIONS CONTAINED IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT TOPCODER'S WEBSITE(S) OR THE SERVER(S) THAT MAKES TOPCODER'S WEBSITE(S) AVAILABLE OR ANY ADVERTISED OR HYPERLINKED SITE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT TOPCODER'S WEBSITE(S), SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL BE ACCESSIBLE AT ALL TIMES. TOPCODER DOES NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS IN SERVICE WILL NOT AFFECT THE RESULTS OF ITS COMPETITIONS AND SOFTWARE DEVELOPMENT PROCESS, AND TOPCODER DISCLAIMS ANY RESPONSIBILITY FOR REDUCED PERFORMANCE OR INOPERABILTIY IN COMPETITIONS OR IN SOFTWARE DEVELOPMENT DUE TO SUCH PROBLEMS. TOPCODER DOES NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF ITS WEBSITE(S) WITH RESPECT TO CORRECTNESS, ACCURACY, RELIABILITY OR OTHERWISE. YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION. TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.</p>
            <p>Documents, graphics and other materials appearing at TopCoder's website(s) may include technical inaccuracies, typographical errors, and out-of-date information and use of such documents, graphics or other materials is at your own risk.</p>
            
            
            <h2>LIMITATION OF LIABILITY</h2>
            <p>TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES (INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING, BUT NOT LIMITED TO, DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN IF TOPCODER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE ITS WEBSITE(S), (ii) THE POSTING OF INFORMATION TO, OR THE RECEIPT OF INFORMATION FROM, ITS WEBSITE(S), (iii) THE DISCLOSURE OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iv) THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY OR (v) ANY OTHER MATTER RELATING TO TOPCODER.</p>
            
            
            <h2>Choice of Law and Forum</h2>
            <p>These Rules are governed by the laws of the State of Connecticut. You hereby agree to submit to the exclusive jurisdiction of the courts of the State of Connecticut. To the extent that applicable laws have mandatory application to these Rules or give you the right to bring action in any other courts, the above limitations may not apply to you. Use of TopCoder's website(s) and participation in the Competition is unauthorized in any jurisdiction that does not give full effect to all provisions of these Rules.</p>
            
            
            <h2>Severability and Enforceability</h2>
            <p>If any provision or portion of these Rules are held illegal, invalid, or unenforceable, in whole or in part, it shall be modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or enforceability of any other provisions or portions of these Rules.</p>
            
            
            <h2>Privacy</h2>
            <p>All information is collected in the United States, and the use of any personally identifiable information is subject to the terms of the TopCoder Privacy Statement located at:  <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=privacy">http://www.topcoder.com/tc?module=Static&amp;d1=about&amp;d2=privacy</a></p>
            
            
            <h2>Termination/Exclusion</h2>
            <p>TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with the Competition, and to take any other action it deems appropriate including but not limited to disqualification of a Submission or terminating or suspending a Competitor's use of <a href="http://<%=ApplicationServer.SERVER_NAME%>/">www.topcoder.com</a> and/or <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">www.topcodersoftware.com</a> for no reason or any reason whatsoever, including improper use of its website(s) or failure to comply with these Rules or the Terms of Use of TopCoder's websites, which are incorporated herein by reference.</p>
            <p>If for any reason this Competition is not capable of running as planned due to infection by computer virus, bugs, tampering, unauthorized intervention, fraud, technical failures, uploads of malicious files or viruses, or any other causes beyond the reasonable control of TopCoder which corrupt or affect the administration, security, fairness, integrity, or proper conduct of this Competition, TopCoder reserve the right at their sole discretion, to disqualify any entry or any individual who tampers with the entry or judging process, and to cancel, terminate, modify or suspend this Competition and select winners from all eligible, non-suspect entries received as of the date of termination. Releasees assume no responsibility for any error, omission, interruption, deletion, defect, delay in operation or transmission, communications line failure, theft or destruction or unauthorized access to, or alteration of, entries.</p>
            <p>CAUTION: ANY ATTEMPT TO DELIBERATELY DAMAGE ANY WEBSITE OR UNDERMINE THE LEGITIMATE OPERATION OF THIS COMPETITION IS A VIOLATION OF CRIMINAL AND CIVIL LAWS AND SHOULD SUCH AN ATTEMPT BE MADE, TOPCODER RESERVES THE RIGHT TO SEEK DAMAGES TO THE FULLEST EXTENT PERMITTED BY LAW.</p>
            
            
            <h2>Other</h2>
            <p>The Competition is void in whole or in part where prohibited by law.</p>
            <p>A list of winners by handles for the Competition will be available on the web site at <a href="http://<%=ApplicationServer.SERVER_NAME%>/">http://www.topcoder.com</a> displayed for at least 3 months after the end of the Competition.</p>
            <p>TopCoder may assign, novate or subcontract any or all of its rights and obligations under these Rules and Regulations at any time.</p>
            <p>This Competition is brought to you by TopCoder, Inc., 95 Glastonbury Boulevard, Glastonbury, CT 06033</p>
            <p>If you have any questions regarding these Rules, contact us at <a href="mailto:service@topcodersoftware.com">service@topcodersoftware.com</a>.</p>

        <%-- Main Content --%>
        </div>
        <%-- End Container --%>
        </div>
  
  <div id="footer">
  <%-- Footer --%>
  </div>
        
<%-- End Wrapper --%>        
</div>
</body>
</html>
