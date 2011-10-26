<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows specific rules for marathon track.
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
                                                <jsp:param name="tertiaryTab" value="marathon"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Marathon Competition Official Rules and Regulations</h2>
                                                                    <p>The 2009 TopCoder Open Marathon Competition (&quot;Marathon Competition&quot;) will take place between February 11, 2009 and June 4, 2009.&nbsp; The Marathon Competition will consist of three (3) Online Rounds, with up to ten (10) of the highest scoring competitors winning a trip to the Tournament to compete in the onsite Championship Round. </p>
                                                                    <p>The Marathon Competition is part of the Tournament, and by participating in this Marathon Competition, you agree to these Rules.</p>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Registration</h3>
                                                                                <p>Competitors can register for the Tournament and be eligible to participate in the Marathon Competition between 9:00 a.m. EST on Wednesday, February 11, 2009, and 9:00 a.m. EST on Wednesday, February 25, 2009. Competitors do not need to register separately for the Marathon Competition. The Marathon Competition will take place between February 25, 2009 and June 4, 2009.&nbsp; There is no limit to the number of Competitors who can participate for the Marathon Competition; however each Competitor may only participate using one handle.</p>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Competition Round Structure</h3>
                                                                                <p>Each Online and Onsite Round of the Marathon Competition consists of two phases: the Coding Phase and the System Testing Phase. (Note: The format for rounds of the Marathon Competition is similar to the format of TopCoder Marathon Matches. The rules in place for Marathon Matches as of February 11, 2009, as may be amended by these Rules, will apply to the Online and Onsite rounds of the Marathon Competition.)</p>
                                                                                <p>The Coding Phase is a timed event where all Competitors are presented with the same problem statement. The criteria for scoring a Competitor's submission will be provided with the problem statement and may change from round to round. During each round of the Marathon Competition, each Competitor may submit one of two types of submissions: an Example Submission or a Full Submission. Each Example Submission is run against the example test cases listed in the problem statement and detailed feedback is provided to the Competitor. Each Full Submission is run against a more complete set of test cases which are not disclosed to the Competitor and the Competitor only receives a provisional score. For Online Rounds 1 and 2, the duration of the Coding Phase is one week. For Online Round 3, the duration of the Coding Phase is two weeks.</p>
                                                                                <p>The System Testing Phase is applied to the most recent Full Submission for each Competitor. During system testing, each Full Submission is run against a large number of sample cases which are not disclosed to the Competitors, and is scored according to the criteria specified in the problem statement. Once the system tests are completed, Competitors are ranked according to their score on the system test cases. The score a Competitor's Full Submission receives is determined solely by the system testing.<strong></strong></p>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Online Rounds</h3>
                                                                                <p><strong>Automatic Berths</strong> - The 50 members who register for the Tournament who have the highest marathon competition rating as of Tuesday, February 24, 2009 and who meet all of the following criteria will receive an automatic berth into Online Round 2:</p>
                                                                                <ul>
                                                                                  <li>Competed in a TopCoder marathon competition between December 1, 2008 and February 24, 2009 </li>
                                                                                  <li>Competed in a total of at least three (3) TopCoder rated events as a member at any time</li>
                                                                                  <li>Register for the Tournament by Tuesday, February 24, 2009 at 9:00 a.m. EST</li>
                                                                                  <li>Meet all other Marathon Competition and Tournament eligibility criteria </li>
                                                                                </ul>
                                                                                <p>If a Competitor does not participate in an Online Round to which the Competitor has advanced, the Competitor will be disqualified from advancing further in the Marathon Competition.</p>
                                                                          <p>Competitors will be assigned a seed for Online Round 1 based on their Marathon rating prior to Online Round 1.</p>
                                                                                <p>The schedule for the Online Rounds of the Marathon Competition is as follows:</p>
                                                                                <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <th class="first">&nbsp;</th>
                                                                                        <th>Online Rounds</th>
                                                                                        <th>Start</th>
                                                                                        <th>End</th>
                                                                                        <th>Max # of Competitors</th>
                                                                                        <th># of Advancers</th>
                                                                                        <th class="last">&nbsp;</th>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Round 1</td>
                                                                                        <td class="first last alignText">Wednesday,<br /> February 25, 2009<br />12:00 p.m.*</td>
                                                                                        <td class="first last alignText">Wednesday,<br /> March 4, 2009<br />
                                                                                          12:00 p.m.*</td>
                                                                                        <td class="first last alignText">Unlimited</td>
                                                                                        <td class="first last alignText">250</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                  </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Round 2</td>
                                                                                        <td class="first last alignText">Wednesday,<br />                                                                             
                                                                                         March 11, 2009<br />
                                                                                           12:00 p.m.**</td>
                                                                                        <td class="first last alignText">Wednesday,<br /> 
                                                                                        March18, 2009<br />
                                                                                          12:00 p.m.**</td>
                                                                                        <td class="first last alignText">300</td>
                                                                                        <td class="first last alignText">100</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                  </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">Round 3</td>
                                                                                        <td class="first last alignText">Wednesday,<br /> 
                                                                                        March 25, 2009<br />
                                                                                        12:00 p.m.**</td>
                                                                                        <td class="first last alignText">Wednesday,<br /> 
                                                                                        April 8, 2009<br />
                                                                                          12:00 p.m.**</td>
                                                                                        <td class="first last alignText">100</td>
                                                                                        <td class="first last alignText">10</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                  </tr>
                                                                                </table>
                                                                                <p><em>*Times listed in Eastern Standard Time (UTC/GMT -5).<br />
                                                                                    **Times listed in Eastern Daylight Time (UTC/GMT -4).<br />
                                                                                    </em></p>
                                                                                </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Advancing during Online Rounds</h3>
                                                                                <p>After each Online Round, the specified number of highest scoring competitors who are registered for the TCO will advance to the next Online Round. To advance, a Competitor must submit a Full Submission and achieve a score greater than zero. The structure of each Online Round is as follows:</p>
                                                                      <p><strong>Online Round 1</strong><br />
                                                                                All Competitors who have registered for the Marathon Competition may compete, and up to 250 of the highest scoring Competitors and the 50 automatic berth winners will advance to Online Round 2.</p>
                                                                                <p><strong>Online Round 2</strong><br />Up to 300 Competitors from Online Round 1 will compete and up to 100 of the highest scoring Competitors will advance to Online Round 3.</p>
                                                                                <p><strong>Online Round 3</strong><br />Up to 100 Competitors from Online Round 2 will compete and up to 10 of the highest scoring competitors will advance to the onsite Championship Round ("Onsite Marathon Competitor").</p>
                                                                                <p>NOTE: In the event of a tie for any advancing position during the Online Rounds, the tie will be resolved in the following manner:</p>
                                                                                    <ol>
                                                                                        <li>The Competitor with the highest number of total points from the immediately preceding Online Round of the Marathon Competition will advance. </li>
                                                                                        <li>If a tie still remains, the remaining tied Competitor with the highest number of points from the next previous Online Round will advance. </li>
                                                                                        <li>If a tie still remains, the Competitor with the highest seed for the Marathon Competition prior to Online Round 1 will advance. </li>
                                                                                        <li>If a tie still remains, all remaining tied Competitors will advance. </li>
                                                                                    </ol>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Championship Round</h3>
                                                                                <p>The Championship Round will consist of a single round. The winner of the Championship Round will be the Onsite Marathon Competitor with the highest point total during the Championship Round. In the event that Onsite Marathon Competitors are tied at the conclusion of the Championship Round, the tie will be resolved in the following manner:</p>
                                                                                    <ol>
                                                                                        <li>The Onsite Marathon Competitor with the highest number of points acquired during Online Round 3 of the Marathon Competition will be placed higher. </li>
                                                                                        <li>If a tie remains, the remaining tied Onsite Marathon Competitor with the highest number of points acquired during Online Round 2 of the Marathon Competition will be placed higher. </li>
                                                                                        <li>If a tie remains, the remaining tied Onsite Marathon Competitor with the highest number of points acquired during Online Round 1 of the Marathon Competition will be placed higher. </li>
                                                                                        <li>If a tie remains, the remaining tied Onsite Marathon Competitor with the highest Marathon Match rating at the conclusion of Online Round 3. </li>
                                                                                        <li>If a tie remains, then the prize money will be distributed equally among the remaining tied Onsite Marathon Competitors. </li>
                                                                                    </ol>
                                                                        </div>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">About the Prizes</h3>
                                                                                <p>The Marathon Competition will award T-shirts to the 50 highest scoring competitors from Round 3. The Marathon Competition will award cash prizes up to $15,000 to the Onsite Marathon Competitors in accordance with the following table:</p>
                                                                  <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <th valign="top" class="first">&nbsp;</th>
                                                                                        <th>Competitor(s)</th>
                                                                                        <th>Prize</th>
                                                                                        <th class="last">&nbsp;</th>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">1st place finisher* - Marathon Match Competition Champion</td>
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
                                                                                      <td class="first last alignText">5th place finisher* in the Championship Round </td>
                                                                                      <td class="first last alignText">$500</td>
                                                                                      <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                      <td class="first">&nbsp;</td>
                                                                                      <td class="first last alignText">6th - 10th place finishers* in the Championship </td>
                                                                                      <td class="first last alignText">$300 each</td>
                                                                                      <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                    
                                                                                    <tr>
                                                                                        <td class="first">&nbsp;</td>
                                                                                        <td class="first last alignText">50 highest scoring competitors from Round 3</td>
                                                                                      <td class="first last alignText">Limited edition 2009 TopCoder Open t-shirt</td>
                                                                                        <td class="last">&nbsp;</td>
                                                                                    </tr>
                                                                                </table></div>
                                                                                <p><em>* Prize will be awarded at the conclusion of the Championship Round. Winner must be present at the onsite Championship announcement to receive prize.</em></p>
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
