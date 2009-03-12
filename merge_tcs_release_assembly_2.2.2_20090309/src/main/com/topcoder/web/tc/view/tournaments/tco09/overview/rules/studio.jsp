<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows specific rules for studio track.
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
                                                <jsp:param name="tertiaryTab" value="studio"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Studio Design Competition Official Rules and Regulations</h2>
                                                                    <p>The 2009 TopCoder Open Studio Design Competition will take place between February 11 and June 4, 2009 ("Studio Competition"). The Studio Competition will consist of eight (8) weeks of online qualifying competitions, with up to ten (10) of the highest scoring Competitors winning a trip to the Tournament to compete in the Onsite Championship.</p>
                                                                    <p>The Studio Competition is part of the Tournament, and by participating in this Studio Competition, you agree to these Rules.</p>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Schedule</h3>
                                                                                <p>Competitors can register for the Tournament and be eligible to participate in the Studio Competition between 9:00 a.m. EST on February 11, 2009 and 9:00 a.m. EST on March 19, 2009.  Competitors do not need to register separately for the Studio Competition. The Online Competitions will take place between February 11, 2009 and April 8, 2009 ("Studio Competition Period").  </p>
                                                                                <p>During the Studio Competition Period, Competitors who have registered for the Tournament and who participate in Tournament-eligible Studio competitions on the TopCoder Studio website, will receive points as outlined in these Rules.  A Competitor's submission will not be scored separately for the Studio Competition.  Only Tournament-eligible Studio contests in which registration has closed during the Studio Competition Period shall be included in determining points for the Studio Competition.</p>
                                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                        <tr>
                                                                                            <th class="first">&nbsp;</th>
                                                                                            <th>Online Rounds</th>
                                                                                            <th>Start</th>
                                                                                            <th>End</th>
                                                                                            <th class="last">&nbsp;</th>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="first">&nbsp;</td>
                                                                                            <td class="first last alignText">Online Competition</td>
                                                                                            <td class="first last alignText">Wednesday, February 11, 2009<br />
                                                                                          9:00 a.m.*</td>
                                                                                          <td class="first last alignText">Wednesday, April 8, 2009<br />
                                                                                          11:59 p.m.</td>
                                                                                          <td class="last">&nbsp;</td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <br /><br />
                                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                        <tr>
                                                                                            <th class="first">&nbsp;</th>
                                                                                            <th>Onsite Rounds</th>
                                                                                            <th>Start</th>
                                                                                            <th>End</th>
                                                                                            <th class="last">&nbsp;</th>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="first">&nbsp;</td>
                                                                                            <td class="first last alignText">Round 1</td>
                                                                                            <td class="first last alignText">Tuesday, June 2, 2009<br />12:30 p.m.**</td>
                                                                                            <td class="first last alignText">Tuesday, June 2, 2009<br />5:00 p.m.**</td>
                                                                                            <td class="last">&nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="first">&nbsp;</td>
                                                                                            <td class="first last alignText">Round 2</td>
                                                                                            <td class="first last alignText">Wednesday, June 3, 2009<br />8:30 a.m.**</td>
                                                                                            <td class="first last alignText">Wednesday, June 3, 2009<br />1:00 p.m.**</td>
                                                                                            <td class="last">&nbsp;</td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <p><em>*Times listed in Eastern Standard Time (UTC/GMT -5).<br />
                                                                                        **Times listed in Pacific Daylight Time (UTC/GMT -7).
                                                                                        </em></p>
                                                                                    <p>In the event that an Onsite Round may not be held at the designated time for any reason, the round will be begin the following day at the same time and will continue for the same duration.</p>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Competition Scoring</h3>
                                                                                <p>Scoring in the Studio Competition is determined based on the final placement for a Competitor's submission in a Tournament-eligible Studio competition in accordance with the rules of such competition.  A Studio competition is Tournament-eligible if the competition is identified as being included as part of the Tournament.  All submissions will proceed through Studio screening policies. Submissions that fail screening will not be eligible for placement points in the Studio Competition.  Only Competitors who are registered for the Tournament will be considered in determining place and placement points. Placement scoring is as follows:</p>
                                                                                    <ul>
                                                                                    	<li>Highest Scoring Registered Competitor - 17 Points </li>
                                                                                    	<li>Second Highest Scoring Registered Competitor - 15 Points </li>
                                                                                    	<li>Third Highest Scoring Registered Competitor - 13 points </li>
                                                                                    	<li>Fourth Highest Scoring Registered Competitor - 10 Points </li>
                                                                                    	<li>Fifth Highest Scoring Registered Competitor - 7 Points </li>
                                                                                    </ul>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Advancement</h3>
                                                                                <p>Upon the completion of all Tournament-eligible Studio contests, all of the individual placement scores that a Competitor receives during the Studio Competition Period will be added for a cumulative placement score.  Up to ten (10) Competitors with the highest cumulative placement score during the Online Period will advance to the Onsite Championship ("Onsite Studio Competitors").</p>
                                                                                <p>In the event of a tie, the tie will be resolved in the following manner:</p>
                                                                                    <ol>
                                                                                        <li>The Competitor who has the most higher-placed submissions in Tournament-eligible Studio contests. </li>
                                                                                        <li>If a tie still remains, then the remaining tied Competitors will participate in a Rapid Design Competition (as described below) and the winner shall advance. </li>
                                                                                        <li>If a tie still remains, then all remaining tied Competitors will advance. </li>
                                                                                    </ol>
                                                                                <p><strong>Example:</strong><br />
                                                                                    Competitor #1 submits work in 7 Tournament-eligible contests and earned the following placement scores:<br />
                                                                                    - Contest #1 - placement 2; placement score 15<br />
                                                                                    - Contest #2 - placement 6; placement score 0<br />
                                                                                    - Contest #3 - placement 3; placement score 13<br />
                                                                                    - Contest #4 - placement 1; placement score 17<br />
                                                                                    - Contest #5 - placement 2; placement score 15<br />
                                                                                    - Contest #6 - placement 7; placement score 0<br />
                                                                                    - Contest #7 - placement 5; placement score 7<br />
                                                                                    Competitor #1's cumulative placement score is 67 (15 + 0 + 13 + 17 + 15 + 0 + 7 = 67)</p>
                                                                                    <p>Competitor #2 submits work in 5 Tournament-eligible contests and earned the following placement scores:<br />
                                                                                    - Contest #1 - placement 2; placement score 15<br />
                                                                                    - Contest #2 - placement 4; placement score 10<br />
                                                                                    - Contest #3 - placement 5; placement score 7<br />
                                                                                    - Contest #4 - placement 2; placement score 15<br />
                                                                                    - Contest #5 - placement 4; placement score 10<br />
                                                                                    - Contest #6 - placement 4; placement score 10<br />
                                                                                    Competitor #2's cumulative placement score is 67 (15 + 10 + 7 + 15 + 10 + 10 = 67)</p>
                                                                                    <p>In order to break the tie, each the Competitor's placements will be compared to determine who has more higher-placed submissions in Tournament-eligible contests.</p>
                                                                                    <p>Competitor #1: Number of 1st Places = 1<br />
                                                                                    Competitor #2: Number of 1st Places = 0<br />
                                                                                    In this example, Competitor #1 would advance.</p>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">RAPID DESIGN TIEBREAKER (if necessary)</h3>
                                                                                <p>The Rapid Design Competition will consist of designing a mock (graphical representation) of a fictitious web site's main page. The tied Competitors will be allowed to submit only one design for the Rapid Design Competition. The Competitor's submission must pass the standard Studio screening process. All submissions that pass screening will be presented to the TopCoder Studio members for an online vote to determine the winner of the Rapid Design Contest. The winner of the Rapid Design Contest will advance to the Onsite Championship. THE RESULTS OF THE VOTE AND CHOICE OF THE WINNER ARE FINAL.</p>
                                                                                <p>The schedule for the Rapid Design Contest is as follows:<br />
                                                                                    Rapid Design Contest Spec Doc posted and Submission Phase begins: 12:00 p.m. EDT (UTC/GMT -4) April 17, 2009<br />
                                                                                    Submission Phase ends: 12:00 p.m. EDT (UTC/GMT -4), April 20, 2009<br />
                                                                                    Voting Phase: April 20 - April 22, 2009<br />
                                                                                    Winner Announced: April 22, 2009</p>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Onsite Championship Rounds</h3>
                                                                                <p>During each Onsite Championship Round, each Onsite Studio Competitor will be presented with the same design challenge. Onsite Studio Competitors will receive competition documentation (ex: Contest Specification Document) fifteen (15) minutes before each Round begins. Each Onsite Championship Round will last four (4) hours.</p>
                                                                                <p>Onsite Studio Competitors must use the workstation provided by TopCoder. This workstation will include a PC and the following:</p>
                                                                                    <ul>
                                                                                        <li>Windows XP </li>
                                                                                        <li>Adobe&reg; Creative Suite&reg; 3 Design Premium</li>
                                                                                        <li>The open-source graphic programs GIMP and InkScape</li>
                                                                                        <li>7-Zip</li>
                                                                                        <li>A sketchpad, pencils and pencil sharpener </li>
                                                                                        <li>Limited Internet access to TopCoder Studio, colorblender.com and a stock art website (at TopCoder's discretion).</li>
                                                                                    </ul>
                                                                                <p>Onsite Studio Competitors may bring the following:</p>
                                                                                    <ul>
                                                                                        <li>Their own keyboard </li>
                                                                                        <li>Up to two (2) design reference books, such as color guides, typography references, etc. However, template books (or books containing any template ideas) may NOT be used.</li>
                                                                                        <li>Electronic translator</li>
                                                                                        <li>Music player and headphones </li>
                                                                                    </ul>
                                                                                <p>Onsite Studio Competitors may access their workstations thirty (30) minutes before the beginning of each Onsite Round, during which time they may configure the workspace and programs.  Design work of any kind (including sketching) is prohibited prior to the start of each Onsite Round.</p>
                                                                                <p>Onsite Studio Competitors may not bring or use any other materials (including flash disks, magazines, or sketches). Keyboards and reference materials must be given to TopCoder for review and evaluation at least one (1) hour before each Onsite Round begins. The keyboards and books may be disqualified from use for any reason or no reason at TopCoder's sole discretion.</p>
                                                                                <p>TopCoder reserves the right, at any point in the Onsite Rounds, to confiscate any materials an Onsite Studio Competitor has at their workstation that TopCoder deems inappropriate for any reason or no reason. TopCoder reserves the right to allow or refuse an Onsite Studio Competitor a limited extension of time (no more than 10 minutes) to upload their submission due to technical difficulties during an Onsite Round.</p>
                                                                                <p>The winner of the Studio Competition will be the Onsite Studio Competitor with the highest weighted aggregate placement score from both Onsite Rounds (rounding down to three (3) decimal places). Placement scores and the weights for each Onsite Round are:</p>
                                                                                    <ul>
                                                                                        <li>Round 1: Weight for Final Score = 60% </li>
                                                                                        <li>Round 2: Weight for Final Score = 40%</li>
                                                                                    </ul>
                                                                                <p>Placement Scoring for each Onsite Round:</p>
                                                                                    <ul>
                                                                                        <li>1st Place - 17 points </li>
                                                                                        <li>2nd Place - 15 points </li>
                                                                                        <li>3rd Place - 13 points</li>
                                                                                        <li>4th Place - 11 points </li>
                                                                                        <li>5th Place - 9 points</li>
                                                                                        <li>6th Place - 7 points</li>
                                                                                        <li>7th Place - 5 points </li>
                                                                                        <li>8th Place - 3 points</li>
                                                                                        <li>9th Place - 1 point</li>
                                                                                        <li>10th Place - 0 points </li>
                                                                                    </ul>
                                                                                <p>In the event of a tie, the Onsite Studio Competitor who has the highest-placed submission from Onsite Round 1 will be the winner.</p>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">About the Prizes</h3>
                                                                                <p>The Studio Competition will award up to $28,000 in cash prizes. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.</p>
                                                                                <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <th valign="top" class="first">&nbsp;</th>
                                                                                        <th>Competitor(s)</th>
                                                                                        <th>Prize</th>
                                                                                        <th class="last">&nbsp;</th>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">1st place finisher* in the Studio Competition</td>
                                                                                        <td class="first last alignText">$15,000</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">2nd place finisher* in the Studio Competition</td>
                                                                                        <td class="first last alignText">$5,000</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">3rd place finisher* in the Studio Competition</td>
                                                                                        <td class="first last alignText">$2,000</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">4th place finisher* in the Studio Competition</td>
                                                                                        <td class="first last alignText">$1,250</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">5th place finisher* in the Studio Competition</td>
                                                                                        <td class="first last alignText">$1,000 each</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">6th-10th place finishers* in the Studio Competition</td>
                                                                                        <td class="first last alignText">$750 each</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Up to the first 50 Competitors with the highest amount of points (minimum of 10 placement points)</td>
                                                                                        <td class="first last alignText">Limited edition 2009 TopCoder Open t-shirt</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                </table>
              
                                                                                <p><em>* Prize will be awarded after the conclusion of the Championship Round. Winner must be present at the onsite Awards presentation to receive prize. </em></p>
                                                                                <p>Prior to Competitors receiving their cash prize, they must complete all work for all underlying assembly competitions and Tournament and Assembly Competition-related work, such as final fixes.</p>
                                                                        </div>
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
