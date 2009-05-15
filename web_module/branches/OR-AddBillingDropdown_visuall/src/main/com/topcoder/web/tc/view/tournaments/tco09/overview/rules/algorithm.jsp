<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows specific rules for specification track.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Tournament Overview</title>

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- External CSS -->
<link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" media="screen" href="css/screen-ie6.css" />
<![endif]-->

<!-- External JavaScripts -->
<script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
<script type="text/javascript" src="/js/arena.js"></script> 
<style type="text/css">
<!--
.style2 {color: #FF0000}
-->
</style>
</head>

<body id="page">

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                
                    <jsp:include page="../../header.jsp"/>
                    
                    <jsp:include page="../../mainNav.jsp" >
                        <jsp:param name="mainTab" value="overview"/>
                    </jsp:include>
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">

                                    <jsp:include page="../topArea.jsp"/>
                                
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="rules"/>
                                            </jsp:include>

                                            <jsp:include page="../../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="rules"/>
                                                <jsp:param name="tertiaryTab" value="algorithm"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Algorithm Competition Official Rules and Regulations</h2>
                                                                    <p>The 2009 TopCoder Open Algorithm Competition ("Algorithm Competition") will take place between February 11 and June 4, 2009. The Algorithm Competition will consist of three (3) online qualification rounds, five (5) online elimination rounds, with up to eighteen (18) of the highest scoring competitors winning a trip to the Tournament to compete in the onsite Semifinal Round and/or Championship Rounds of the Algorithm Competition.</p>                                                     
                                                                    <p>The Algorithm Competition is part of the Tournament, and by participating in this Algorithm Competition, you agree to these Rules.</p>
                                                                    <p>Residents of Iran are eligible to compete and advance to the onsite rounds of the Algorithm Competition. However, residents of Iran are not eligible to receive any prizes except for those awarded to competitors participating in the Onsite Semifinal and/or Championship Rounds of the Algorithm Competition.</p>                                                     
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Registration</h3>
                                                                                <p>Registration is open for the Algorithm Competition until Wednesday, March 4, 2009 at 11:00 a.m. EST.  In order to compete in Qualification Rounds 1 or 2, individuals must be registered for the tournament at least 24 hours prior to the start of that Qualification Round.  There is no limit to the number of Competitors who can participate in the Algorithm Competition; however each Competitor may only participate using one handle.</p>
                                                              </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Algorithm Competition Round Structure</h3>
                                                                                <p>Each Online and Onsite Round of the Algorithm Competition (including the Qualification Rounds) consists of three phases: Coding Phase, Challenge Phase, and System Testing Phase. (Note: The format of these competition rounds is similar to the format of TopCoder Single Round Matches. The rules in place for Single Round Matches as of February 11, 2009 will also apply to the online and onsite rounds of the Algorithm Competition, with the exception of the Unused Code Rule during the onsite rounds.)</p>
                                                                                <p>The Coding Phase is a timed phase in which all Competitors are presented with the same three questions representing three levels of complexity and three levels of potential points. Points are awarded for each problem upon submission of a solution that successfully compiles. Points are calculated on the total time elapsed from the time the Competitor opened the problem until the time the Competitor's successfully compiling submission was submitted. During the Online Rounds, the Coding Phase will last 75 minutes. During the Onsite Rounds, the Coding Phase will last 85 minutes.</p>                                                     
                                                                                <p>The Challenge Phase is a timed phase wherein each Competitor has the opportunity to challenge the functionality of any other Competitors' submission. If successful, the challenge will result in (i) the challenged Competitor losing any points awarded for the challenged submission, and (ii) a 50-point bonus for the challenging Competitor. If unsuccessful, the challenging competitor's point total in that round of the Competition will be reduced by 25 points. During the Online Rounds, the Challenge Phase will last 15 minutes. During the Onsite Rounds, the Challenge Phase will last 10 minutes.</p>
                                                                                <p>The System Testing Phase applies to all submissions that have not already been successfully challenged. If the TopCoder System Test finds a flawed submission, the Competitor who submitted that submission will lose all of the points that were originally awarded for that submission. The System Testing Phase consists of applying a set of inputs to a submission. If the output from a Competitor's submission is not correct, the submission is considered flawed and loses all points awarded. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</p>                                                     
                                                                            <h3 class="subtitle">Qualification Rounds</h3>
                                                                                <p><strong>Automatic Berths -</strong> The 150 members who register for the Tournament by February 23 at 9:00 a.m. EST who have the highest algorithm competition rating as of Monday, February 23, 2009 and who meet all of the following criteria will receive an automatic berth into Online Round 1:</p>
                                                                                    <ul>
                                                                                        <li>Competed in a TopCoder algorithm competition between December 1, 2008 and February 24, 2009 </li>
                                                                                        <li>Competed in a total of at least three (3) TopCoder rated events as a member at any time</li>
                                                                                        <li>Register for the Tournament by February 23, 2009 at 9:00 a.m.</li>
                                                                                        <li>Meet all other Algorithm Competition and Tournament eligibility criteria</li>
                                                                                    </ul>
                                                                                <p>Competitors receiving an Automatic Berth in Online Round 1 are not permitted to compete in any Qualification Round.</p>                                                     
                                                                                <p><strong>Qualification Spots - </strong>All Competitors who do not receive an automatic berth and who meet all of the Algorithm Competition and Tournament eligibility criteria can compete for one of the remaining 1,650 qualification spots in the Algorithm Competition. Three (3) Online Qualification Rounds will be held and the highest scoring 550 Competitors from each Qualification Round will advance to Online Round 1. Competitors who have already qualified for the Algorithm Competition may not compete in future Qualification Rounds.</p>
                                                                                <p>The schedule and details of the Qualification Rounds are as follows:</p> 
                                                                                <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <th class="first">&nbsp;</th>
                                                                                        <th>Online Rounds</th>
                                                                                      <th>Time</th>
                                                                                        <th nowrap="nowrap">Max # of Competitors</th>
                                                                                      <th nowrap="nowrap">Max # of Advancers</th>
                                                                                      <th class="last">&nbsp;</th>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Round 1</td>
                                                                                        <td class="first last alignText">Tuesday, <br />
                                                                                          February 24, 2009<br />
                                                                                           <strong>Register:</strong> <br />
                                                                                          4:00 a.m. - 6:55 a.m.<br />
                                                                                      <strong>START:</strong> 7:00 a.m.*</td>
                                                                                      <td class="first last alignText">All members who have not <br />
                                                                                        automatically qualified - <br />
                                                                                        limited to the first 1,650 <br />
                                                                                        Competitors who enter the arena</td>
                                                                                        <td class="first last alignText">550</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Round 2</td>
                                                                                        <td class="first last alignText">Saturday, <br />
                                                                                          February 28, 2009<br />
                                                                                           <strong>Register:</strong> <br />
                                                                                          9:00 a.m. - 11:55 a.m.<br />
                                                                                      <strong>START:</strong> 12:00 p.m.*</td>
                                                                                        <td class="first last alignText">All members who have not <br />
                                                                                          previously qualified - <br />
                                                                                          limited to the first 1,650 <br />
                                                                                        Competitors who enter the arena</td>
                                                                                        <td class="first last alignText">550</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Round 3</td>
                                                                                        <td class="first last alignText">Wednesday, <br />
                                                                                          March 4, 2009<br />
                                                                                           <strong>Register:</strong> <br />
                                                                                          6:00 p.m. - 8:55 p.m.<br />
                                                                                      <strong>START:</strong> 9:00 p.m.*</td>
                                                                                        <td class="first last alignText">All members who have not <br />
                                                                                          previously qualified -<br /> 
                                                                                          limited to the first 1,650<br />
                                                                                          Competitors who enter the arena</td>
                                                                                        <td class="first last alignText">550</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                  </tr>
                                                                                </table>
                                                                                <p><em>*All times are in Eastern Standard Time (UTC/GMT -5). In the event that a round may not be held at the designated time for any reason, the round will be held the following day at the same time.</em></p>
                                                                                                <p>The format for each Qualification Round will be the same as algorithm competitions held outside the Tournament and are outlined in the Algorithm Competition Round Structure section. In order to be eligible to advance to Online Round 1, a Competitor must finish the Qualification Round with a point total greater than zero. At the conclusion of their qualification attempt, Competitors will be rated based on their performance against other Competitors in the same Qualification Round. Competitors will be assigned seeds for the Online Rounds of the Algorithm Competition based on their Algorithm rating after the Qualification Rounds.</p>
                                                                                                <p>In the event of a tie for any advancing position during a Qualification Round, the tie will be resolved in the following manner:</p>
                                                                                <ol>
                                                                                  <li>The Competitor with the higher algorithm competition rating prior to the Qualification Round will advance. </li>
                                                                                                        <li>If a tie still remains, all remaining tied Competitors will advance to Online Round 1.</li>
                                                                                </ol>
                                                                            <h3 class="subtitle">Online Elimination Rounds</h3>
                                                                                <p>Competitors in each online round must enter the TopCoder Competition Arena no later than five (5) minutes prior to the start of such round. If a Competitor does not participate, for any reason, in an online round to which he/she has advanced, the Competitor will be disqualified from advancing to the next round of the Algorithm Competition.</p>
                                                                                <p>Competitors will be randomly assigned to competition rooms. Each competition room will have a maximum of 25 Competitors. The total number of rooms in each round is reached by dividing the # competitors in the round by 25 (rounded up).</p>                                                     
                                                                                <p>The dates and times of the online rounds of the Algorithm Competition are as follows:</p>
                                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                        <tr>
                                                                                            <th class="first">&nbsp;</th>
                                                                                            <th>Online Elimination Rounds</th>
                                                                                            <th>Time</th>
                                                                                            <th># of Participants</th>
                                                                                            <th># of Advancers</th>
                                                                                            <th class="last">&nbsp;</th>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="first">&nbsp;</td>
                                                                                            <td class="first last alignText">Round 1</td>
                                                                                            <td class="first last alignText">Saturday, March 7, 2009<br />
                                                                                               <strong>Register:</strong> 9:00 a.m. - 11:55 a.m.<br />
                                                                                               <strong>START:</strong> 12:00 p.m.*</td>
                                                                                            <td class="first last alignText">Up to 1,800</td>
                                                                                            <td class="first last alignText">720</td>
                                                                                            <td class="last">&nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="first">&nbsp;</td>
                                                                                            <td class="first last alignText">Round 2</td>
                                                                                            <td class="first last alignText">Saturday, March 14, 2009<br />
                                                                                               <strong>Register:</strong> 9:00 a.m. - 11:55 a.m.<br />
                                                                                               <strong>START:</strong> 12:00 p.m.**</td>
                                                                                            <td class="first last alignText">720</td>
                                                                                            <td class="first last alignText">300</td>
                                                                                            <td class="last">&nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="first">&nbsp;</td>
                                                                                            <td class="first last alignText">Round 3</td>
                                                                                        <td class="first last alignText">Saturday, March 21, 2009<br />
                                                                                               <strong>Register:</strong> 9:00 a.m. - 11:55 a.m.<br />
                                                                                           <strong>START:</strong> 12:00 p.m.**</td>
                                                                                            <td class="first last alignText">300</td>
                                                                                            <td class="first last alignText">120</td>
                                                                                            <td class="last">&nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="first">&nbsp;</td>
                                                                                            <td class="first last alignText">Round 4</td>
                                                                                        <td class="first last alignText">Saturday, March 28, 2009<br />
                                                                                               <strong>Register: </strong>9:00 a.m. - 11:55 a.m.<br />
                                                                                           <strong>START:</strong> 12:00 p.m.**</td>
                                                                                            <td class="first last alignText">120</td>
                                                                                            <td class="first last alignText">45</td>
                                                                                            <td class="last">&nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="first">&nbsp;</td>
                                                                                            <td class="first last alignText">Round 5</td>
                                                                                        <td class="first last alignText">Saturday, April 4, 2009<br />
                                                                                               <strong>Register:</strong> 9:00 a.m. - 11:55 a.m.<br />
                                                                                           <strong>START:</strong> 12:00 p.m.**</td>
                                                                                            <td class="first last alignText">45</td>
                                                                                            <td class="first last alignText">18</td>
                                                                                            <td class="last">&nbsp;</td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <p><em>*Times listed in Eastern Standard Time (UTC/GMT -5).<br />
                                                                                        **Times listed in Eastern Daylight Time (UTC/GMT -4).<br /></em></p>
                                                                                    <p>In the event that a round must be cancelled for any reason, the round will start the following day at the same time.</p>
                                                                            <h3 class="subtitle">Scoring and Advancing during Online Rounds</h3>
                                                                                <p>After each Online Round, as set forth below, a number of the highest scoring competitors from all rooms will advance to the next online round. To determine a Competitor's score during the Online Rounds, the total point values from all three phases of the round are added for each Competitor. The Competitors are then ranked in order of score, with the highest scoring Competitors advancing to the next round.  To be eligible to advance to the next round of the Algorithm Competition, the Competitor must finish each round of the Algorithm Competition with a point total greater than zero. </p>
                                                                                <p>The structure of the online rounds is as follows:</p>
                                                                                <p><strong>Online Round 1</strong><br />Up to 1,800 Competitors will compete, with up to 720 of the highest scoring Competitors across all rooms advancing to Online Round 2.</p>
                                                                                <p><strong>Online Round 2</strong><br />Up to 720 Competitors will compete, with up to 300 of the highest scoring Competitors across all rooms advancing to Online Round 3.</p>
                                                                                <p><strong>Online Round 3</strong><br />Up to 300 Competitors will compete, with up to 120 of the highest scoring Competitors across all rooms advancing to Online Round 4.</p>
                                                                                <p><strong>Online Round 4</strong><br />Up to 120 Competitors will compete, with up to 45 of the highest scoring Competitors across all rooms advancing to Online Round 5.</p>
                                                                                <p><strong>Online Round 5</strong><br />Up to 45 Competitors will compete, with up to 18 of the highest scoring Competitors across all rooms advancing to the Onsite Semifinal Round of the Competition ("Onsite Algorithm Competitor")</p>
                                                                                <p>NOTE: In the event of a tie for any advancing position during an Online Round, the tie will be resolved in the following manner:</p>
                                                                                    <ol>
                                                                                        <li>The Competitor with the highest aggregate total of points from all rounds of the Algorithm Competition in which all of the tied Competitors were presented with the same set of problems will advance </li>
                                                                                        <li>If a tie still remains, then the remaining tied Competitor with the highest seed prior to the Algorithm Competition will advance.</li>
                                                                                        <li>If a tie still remains, all remaining tied Competitors will advance to the next round. </li>
                                                                                    </ol>
                                                                            <h3 class="subtitle">Onsite Rounds</h3>
                                                                                <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <th valign="top" class="first">&nbsp;</th>
                                                                                        <th>Round</th>
                                                                                        <th>Date and Time (Pacific Daylight Time)</th>
                                                                                        <th class="last">&nbsp;</th>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Semifinal</td>
                                                                                        <td class="first last alignText">Wednesday, June 3 at 2:30 p.m.&nbsp; at The Mirage, Las Vegas</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Championship</td>
                                                                                        <td class="first last alignText">Thursday, June 4, 12:30 p.m.&nbsp; at The Mirage, Las Vegas</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                </table>
                                                                                <br /><br />
                                                                            <h3 class="subtitle">The Semifinal and Championship Rounds</h3>
                                                                                <p>The Semifinal Round will be a single round with up to eighteen (18) Onsite Algorithm Competitors.  Up to 8 of the highest scoring Onsite Algorithm Competitors during the Semifinal Round will advance to the Championship Round.    To be eligible to advance to the Championship Round, the Onsite Algorithm Competitor must finish the Semifinal Round with a point total greater than zero.</p>
                                                                                <p>The Championship Round will be a single round with up to eight (8) Onsite Algorithm Competitors. Final placement in the Championship Round is determined by comparing the total points of each Onsite Algorithm Competitor during the Championship Round. The winner of the Algorithm Competition will be the Onsite Algorithm Competitor with the highest point total during the Championship Round.</p>
                                                                                <p>In the event of a tie in the Semifinal and/or Championship Round, the tie will be resolved in the following manner (in order):</p>
                                                                                    <ol>
                                                                                        <li>The Onsite Algorithm Competitor with the highest aggregate total of points from all rounds of the Algorithm Competition will place higher.</li>
                                                                                        <li>If a tie still remains, then the remaining tied Onsite Algorithm Competitor with the highest algorithm competition rating following Online Round 5 will place higher.</li>
                                                                                        <li>If a tie still remains in the Semifinal, then all tied Onsite Algorithm Competitors will advance to the Championship Round.</li>
                                                                                        <li>If a tie still remains in the Championship Round, then the prize money will be distributed equally among the remaining tied Onsite Algorithm Competitors.</li>
                                                                                    </ol>
                                                                            <h3 class="subtitle">About the Prizes</h3>
                                                                                <p>The Algorithm Competition will award T-shirts to up to 120 Competitors who participated in Online Round 4.  The Algorithm Competition will award up to $15,000 in cash prizes to the Onsite Algorithm Competitors in accordance with the following table:</p>
                                                                                <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <th valign="top" class="first">&nbsp;</th>
                                                                                        <th>Competitor(s)</th>
                                                                                        <th>Prize</th>
                                                                                        <th class="last">&nbsp;</th>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">1st place finisher* - Algorithm Competition Champion</td>
                                                                                        <td class="first last alignText">$10,000</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">2nd place finisher* in the Championship Round</td>
                                                                                        <td class="first last alignText">$1,600</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">3rd place finisher* in the Championship Round</td>
                                                                                        <td class="first last alignText">$800</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">4th place finisher* in the Championship Round</td>
                                                                                        <td class="first last alignText">$600</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">5th place finisher* in the Championship Round</td>
                                                                                        <td class="first last alignText">$400</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">6th - 8th place finishers* in the Championship Round</td>
                                                                                        <td class="first last alignText">$200 each</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">9th - 18th place finishers* in the Semifinal Round</td>
                                                                                        <td class="first last alignText">$100 each</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Up to 120 Competitors who participate in Online Round 4</td>
                                                                                        <td class="first last alignText">Limited edition 2009 TopCoder Open t-shirt</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                </table>
                                                                                <p><em>* Prize will be awarded at the conclusion of the Championship Round. Winner must be present at the onsite Awards Presentation to receive prize.</em></p>
                                                                </p></div>
                                                            </div>
                                                        </div>
                                                    </div><!-- End #mainContentInner -->
                                                </div><!-- End #mainContent -->                                                 
                                                
                                                <jsp:include page="../../sponsors.jsp"/>
                                                
                                            </div><!-- End .bottomAreaContent -->
                                        
                                        </div></div>
                                    </div><!-- End .bottomArea -->
                                    
                                </div><!-- End #contentInnerInner -->
                            
                            </div><!-- End #contentInner -->
                            
                            <div class="contentBottomLeft"><div class="contentBottomRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                    </div><!-- End #content -->
                
                </div><!-- End #wrapperContentInner -->
                
            </div>
        </div><!-- End #wrapperInner -->
    </div><!-- End #wrapper -->

<jsp:include page="../../footer.jsp"/>
</body>
</html>
