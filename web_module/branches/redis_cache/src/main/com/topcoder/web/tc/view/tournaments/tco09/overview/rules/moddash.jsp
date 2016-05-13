<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows specific rules for moddash track.
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
                                                <jsp:param name="tertiaryTab" value="moddash"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Mod Dash Competition Official Rules and Regulations</h2>
                                                                    <p>The 2009 TopCoder Open Mod Dash will take place between February 11 and June 4, 2009 (&quot;Mod Competition&quot;). The Mod Competition will consist of eight (8) weeks of online qualifying competitions, with up to eight (8) of the highest scoring Competitors after the online rounds winning a trip to the Tournament to compete in the Onsite Championship Rounds. </p>
                                                                    <p>The Mod Competition is part of the Tournament, and by participating in this Mod Competition, you agree to these Rules.<strong></strong></p>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Schedule</h3>
                                                                                <p>Competitors can register for the Tournament and be eligible to participate in the Mod Competition between 9:00 a.m. EST on February 11, 2009 and 9:00 a.m. EST on March 19, 2009.&nbsp; Competitors do not need to register separately for the Mod Competition. The Mod Competition will take place between February 11, 2009 and April 17, 2009 (&quot;Mod Competition Period&quot;).&nbsp; </p>
                                                                                <p>During the Mod Competition Period, Competitors who have registered for the Tournament and who participate in Tournament-eligible Mod Dash competitions on the TopCoder website, will receive points as outlined in the rules for each competition.&nbsp; A Competitor's submission will not be scored separately for the Mod Competition.&nbsp; Only Tournament-eligible Mod Dash competitions in which registration has closed during the Mod Competition Period shall be included in determining points for the Mod Competition.</p>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Competition Scoring</h3>
                                                                                <p>Scoring in the Mod Competition is determined based on the amount of points earned in a Tournament-eligible Mod Dash competition in accordance with the rules of such competition.&nbsp; A Mod Dash competition is Tournament-eligible if the competition is identified as being included as part of the Tournament.&nbsp; Only Competitors who are registered for the Tournament will earn points towards the Mod Competition.</p>
                                                                                <p>Upon the completion of all Tournament-eligible Mod Dash competitions during the Mod Competition Period, the individual scores that a Competitor receives during the Mod Competition Period will be added for a cumulative score.&nbsp; Up to eight (8) Competitors with the highest cumulative score greater than zero will advance to the Onsite Championship Round (&quot;Onsite Mod Competitors&quot;).</p>
                                                                                <p>In the event of a tie to determine which Competitor(s) advances to the Onsite Championship Rounds, the tie will be resolved in the following manner:</p>
                                                                                    <ol>
                                                                                        <li>The Competitor who competed in the highest number of Tournament-eligible Mod Dash competitions will advance.</li>
                                                                                        <li>If a tie remains, the Competitor who achieved the tied score first chronologically will advance.</li>
                                                                                    </ol>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Onsite Championship Rounds</h3>
                                                                                <br /><br />
                                                                                <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <th class="first">&nbsp;</th>
                                                                                        <th>Onsite Championship Rounds</th>
                                                                                        <th>Date</th>
                                                                                        <th>Time (Pacific Daylight Time)</th>
                                                                                        <th class="last">&nbsp;</th>
                                                                                    </tr>
                                                                                    <tr>
                                                                                      <td class="first">&nbsp;</td>
                                                                                      <td class="first last alignText">Championship Round 1</td>
                                                                                       <td class="first last alignText">Tuesday, June 2, 2009</td>
                                                                                       <td class="first last alignText">10:30 a.m. - 12:00 p.m.</td>
                                                                                      <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Championship Round 2</td>
                                                                                         <td class="first last alignText">Wednesday, June 3, 2009</td>
                                                                                        <td class="first last alignText">10:30 a.m. - 12:00 p.m.</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Championship Round 3</td>
                                                                                        <td class="first last alignText">Thursday, June 4, 2009</td>
                                                                                        <td class="first last alignText">9:30 a.m. - 11:00 a.m.</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                </table>
                                                                                <p>During each round of the Onsite Championship , Onsite Mod Competitors will be presented with series of problems and/or tasks for the Onsite Mod Competitor to perform, including bug fixes, enhancements, test case generation, etc. All Onsite Mod Competitors will compete on the same task in parallel, and the first Onsite Mod Competitor to successfully complete the task will win the points for that task.&nbsp; All Onsite Mod Competitors will then move on to compete on the next task.&nbsp; This process will continue until there are no more tasks, or the Round ends.&nbsp; A general description of the technology, complexity and application profile for each Championship Round will be posted on the TopCoder website and/or distributed to the Onsite Mod Competitors prior to the start of each Championship Round.</p>
                                                                                <p>In the event of a tie during the Onsite Championship, the Onsite Mod Competitor who achieves their score during the Onsite Championship Rounds in the lowest cumulative time will be ranked higher.&nbsp; To determine the cumulative time, only the time elapsed in completing each task during a round in which the Onsite Mod Competitor won points will be considered.</p>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">About the Prizes</h3>
                                                                                <p>The Mod Competition will award up to $12,900 in cash prizes to the Onsite Mod Competitors in accordance with the following table:</p>
                                                                                <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <th valign="top" class="first">&nbsp;</th>
                                                                                        <th>Competitor(s)</th>
                                                                                        <th>Prize</th>
                                                                                        <th class="last">&nbsp;</th>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">1st place finisher* in the Championship Rounds</td>
                                                                                        <td class="first last alignText">$10,000</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">2nd place finisher* in the Championship Rounds</td>
                                                                                        <td class="first last alignText">$1,200</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">3rd place finisher* in the Championship Rounds</td>
                                                                                        <td class="first last alignText">$800</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">4th place finisher* in the Championship Rounds</td>
                                                                                        <td class="first last alignText">$500</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">5th-8th place finishers* in the Championship Rounds</td>
                                                                                        <td class="first last alignText">$400 each</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Up to the first 50 Competitors with the highest amount of points (minimum of 15 placement points)</td>
                                                                                        <td class="first last alignText">Limited edition 2009 TopCoder Open t-shirt</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                </table>
              
                                                                                <p><em>* Prize will be awarded after the conclusion of the Championship Round. Except for the award of t-shirts, the winner must be present at the onsite Awards Presentation to receive prize.</em></p>
                                                                                <p>Prior to Onsite Mod Competitors receiving their cash prize, they must complete all work for all underlying Mod Dash competitions and Tournament and Mod Competition-related work.</p>
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
