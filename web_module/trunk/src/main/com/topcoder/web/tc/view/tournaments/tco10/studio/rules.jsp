<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Studio Competition Rules" area="studio" menu="rules"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
</head>

<body>

<div id="wrapper" class="homepage singlePage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn">
                    <div class="text">
			<h2 class="pageTitle">Studio Design Competition Official Rules and Regulations</h2><!-- page title -->
                            <p>The 2010 TopCoder Open Studio Design Competition will take place between March 29 and October 14, 2010 ("Studio Design Competition"). The Studio Design Competition will consist of online qualifying competitions, with up to fourteen (14) of the highest scoring Competitors winning a trip to the Tournament to compete in the Onsite Championship.</p>
                            <p>The Studio Design Competition is part of the Tournament, and by participating in this Studio Design Competition, you agree to these <tco10:studioStaticPageLink page="rules">rules.</tco10:studioStaticPageLink></p>

                            <h3 class="subTitle">Schedule</h3><!-- sub title-->
                            <p>Competitors can register for the Tournament and be eligible to participate in the Studio Design Competition between 9:00 UTC -4 on March 29, 2010 and 9:00 UTC -4 on July 30, 2010. Competitors do not need to register separately for the Studio Design Competition. The Online Competitions will take place between March 29, 2010 and July 30, 2010 ("Studio Design Competition Period").</p>
                            <p>During the Studio Design Competition Period, Competitors who have registered for the Tournament and who participate in Tournament-eligible Studio competitions on the TopCoder Studio website, will receive points as outlined in these Rules. A Competitor's submission will not be scored separately for the Studio Design Competition. Only Tournament-eligible Studio contests in which registration has closed during the Studio Design Competition Period shall be included in determining points for the Studio Design Competition.</p>
                        </div>
                        <table cellpadding="0" cellspacing="0"><!-- Start table list -->
							<tr>
								<th class="first"><span class="left"></span>Online Rounds</th><!-- table left top corner -->
                                <th>Start</th>
                                <th>End</th>
								<th class="last"><span class="right"></span></th><!-- table right top corner -->
							</tr>
							<tr class="last">
                                <td>Online Competition</td>
                                <td>Monday, March 29, 2010 9:00 UTC -4</td>
                                <td colspan="2">Friday, July 30, 2010 9:00 UTC -4</td>
							</tr>
                        </table>
                         <table cellpadding="0" cellspacing="0"><!-- Start table list -->

                            <tr>
								<th class="first"><span class="left"></span>Onsite Rounds</th><!-- table left top corner -->
                                <th>Start</th>
                                <th>End</th>
								<th class="last"><span class="right"></span></th><!-- table right top corner -->
							</tr>
                            <tr>
                                <td>Semifinal Round 1</td>
                                <td>Tuesday, October 12, 2010 8:30 UTC -7</td>
                                <td colspan="2">Tuesday, October 12, 2010 12:00 UTC -7</td>
							</tr>
                            <tr>
                                <td>Semifinal Round 2</td>
                                <td>Tuesday, October 12, 14:30 UTC -7</td>
                                <td colspan="2">Tuesday, October 12, 18:00 UTC -7</td>
							</tr>
                            <tr class="last">
                                <td>Championship Round</td>
                                <td>Wednesday, October 13, 2010 1:30 UTC -7</td>
                                <td colspan="2">Wednesday, October 13, 2010 17:00 UTC -7</td>
							</tr>
                        </table>
                        <div class="text">
                            <p class="imp-note">Times listed in UTC -7.</p>
                            <p class="note">In the event that an Onsite Round may not be held at the designated time for any reason, the round will be begin the following day at the same time and will continue for the same duration.</p>

                            <h3 class="subTitle">Competition Scoring</h3><!-- sub title-->
                            <p>Scoring in the Studio Design Competition is determined based on the final placement for a Competitor's submission in a Tournament-eligible Studio competition on the <a href="http://studio.topcoder.com">TopCoder Studio website</a> in accordance with the rules of such competition. A Studio competition is Tournament-eligible if the competition is identified as being included as part of the Tournament. All submissions will proceed through Studio screening policies. Submissions that fail screening will not be eligible for placement points in the Studio Design Competition. Only Competitors who are registered for the Tournament will be considered in determining place and placement points. Placement scoring is as follows:</p>
                            <ul class="textlist">
                                <li>Highest Scoring Registered Competitor - 11 Points</li>
                                <li>Second Highest  Scoring Registered Competitor - 9 Points</li>
                                <li>Third Highest  Scoring Registered Competitor - 7 points</li>
                                <li>Fourth Highest  Scoring Registered Competitor - 4 Points</li>
                                <li>Fifth Highest  Scoring Registered Competitor - 1 Point</li>
                            </ul>

                            <h3 class="subTitle">Advancement</h3><!-- sub title-->
                            <p>Upon the completion of all Tournament-eligible Studio contests, all of the individual placement scores that a Competitor receives during the Studio Design Competition Period will be added for a cumulative placement score. Up to fourteen (14) Competitors with the highest cumulative placement score during the Online Period will advance to the Onsite Championship ("Onsite Studio Competitors").</p>
                            <p>In the event of a tie, the tie will be resolved in the following manner:</p>
                            <ol class="textlist">
                                <li>The tied Competitor who has the most 1st place submissions in Tournament-eligible Studio contests shall advance.</li>
                                <li>If a tie still remains, then the remaining tied Competitor who has the most 2nd place submissions in Tournament-eligible Studio contests shall advance.</li>
                                <li>If a tie still remains, then all remaining tied Competitors will advance.</li>
                            </ol>
                            <p><span class="high">Example</span><br />
                            In order to break the tie, each of the tied Competitor's placements will be compared to determine who has more 1st place submissions in Tournament-eligible contests.</p>
                            <p>Competitor #1: Number of 1st Places = 12<br />
                            Competitor #2: Number of 1st Places = 10<br />
                            In this example, Competitor #1 would advance.</p>
                            <p>If a tie still exists after comparing the number of first place wins for each competitor (if both competitors have the same number of first place wins), the competitor with the highest number of second place wins will advance. For example:</p>
                            <p>Competitor #1: 1st Place Wins = 12, 2nd Place Wins = 10<br />
                            Competitor #2: 1st Place Wins = 12, 2nd Place Wins = 7<br />
                            In this example, Competitor #1 would advance.</p>

                            <h3 class="subTitle">Onsite Rounds</h3><!-- sub title-->
                            <p>The Semifinal and Championship Rounds</p>
                            <p>There will be two Semifinal Rounds to determine who will advance to the Championship Round.</p>
                            <p>Each Semifinal Round will be a single round with up to seven (7) Onsite Studio Competitors. Up to four (4) of the highest placing Onsite Studio Competitors during each Semifinal Round will advance to the Championship Round. </p>
                            <p>The Championship Round will be a single round with up to eight (8) Onsite Studio Competitors.  The Competitors who have advanced to the Championship Round will be announced during lunch on Wednesday, October 13, 2010. </p>
                            <p>The winner of the Studio Design Competition will be the Onsite Studio Competitor with the highest placement from the Championship Round. Only the placements from the Championship Round will be used for placement.</p>
                            <p>In the event of client or sponsor selection of Semifinal Round placements, the client/sponsor will choose the top three placements and TopCoder staff will choose a wildcard fourth place winner from each Semifinal Round to advance to the Championship Round.</p>
                            <p>During each Onsite Round, each Onsite Studio Competitor will be presented with the same design challenge. Onsite Studio Competitors will receive competition documentation (ex: Contest Specification Document) fifteen (15) minutes before each Round begins. Each Onsite Round will last three (3) hours.</p>
                            <p>Onsite Studio Competitors must use the workstation provided by TopCoder. This workstation will include a PC and the following:</p>
                            <ul class="textlist">
                                <li>Windows XP</li>
                                <li>Adobe&reg; Creative Suite&reg; 3 Design Premium</li>
                                <li>The open-source graphic programs GIMP and InkScape</li>
                                <li>7-Zip</li>
                                <li>A sketchpad, pencils and pencil sharpener</li>
                                <li>Limited Internet access to TopCoder Studio, colorblender.com and a stock art website (at TopCoder's discretion).</li>
                            </ul>
                            <p>Onsite Studio Competitors may bring the following:</p>
                            <ul class="textlist">
                                <li>Their own keyboard</li>
                                <li>Up to two (2) design reference books, such as color guides, typography references, etc. However, template books (or books containing any template ideas) may NOT be used.</li>
                                <li>Electronic translator</li>
                                <li>Music player and headphones</li>
                            </ul>
                            <p>Onsite Studio Competitors may access their workstations thirty (30) minutes before the beginning of each Onsite Round, during which time they may configure the workspace and programs. <strong>Design work of any kind (including sketching) is prohibited prior to the Start of each Onsite Round.</strong></p>
                            <p>Onsite Studio Competitors may not bring or use any other materials (including flash disks, magazines, or sketches). Keyboards and reference materials must be given to TopCoder for review and evaluation at least one (1) hour before each Onsite Round begins. The keyboards and books may be disqualified from use for any reason or no reason at TopCoder's sole discretion.</p>
                            <p>TopCoder reserves the right, at any point in the Onsite Rounds, to confiscate any materials an Onsite Studio Competitor has at their workstation that TopCoder deems inappropriate for any reason or no reason. TopCoder reserves the right to allow or refuse an Onsite Studio Competitor a limited extension of time (no more than 10 minutes) to upload their submission due to technical difficulties during an Onsite Round.</p>

                            <h3 class="subTitle">About the Prizes</h3><!-- sub title-->
                            <p>The Studio Competition will award up to $30,000 in cash prizes. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.</p>
                        </div>

                        <table cellpadding="0" cellspacing="0"><!-- Start table list -->
							<tr>
								<th class="first"><span class="left"></span>Competitor(s)</th><!-- table left top corner -->
								<th class="last">Prize</th>
                                <th class="last"><span class="right"></span></th><!-- table right top corner -->
							</tr>
							<tr>
                                <td>1st place finisher* in the Studio Competition</td>
                                <td colspan="2">$20,000</td>
							</tr>
                            <tr>
                                <td>2nd place finisher* in the Studio Competition</td>
                                <td colspan="2">$5,000</td>
							</tr>
                            <tr>
                                <td>3rd place finisher* in the Studio Competition</td>
                                <td colspan="2">$1,500</td>
							</tr>
                            <tr>
                                <td>4th place finisher* in the Studio Competition</td>
                                <td colspan="2">$1,000</td>
							</tr>
                            <tr>
                                <td>5th - 14th place finisher* in the Studio Competition</td>
                                <td colspan="2">$250 each</td>
							</tr>
                            <tr class="last">
                                <td>Up to the first 50 Competitors with the highest amount of points (minimum of 10 placement points)</td>
                                <td colspan="2">Limited edition 2010 TopCoder Open t-shirt</td>
							</tr>
                        </table>
                        <div class="text">
                            <p class="note">* Prize will be awarded after the conclusion of the Championship Round. Winner must be present at the onsite Awards presentation to receive prize.</p>
                        </div>
                  
                </div>

                <jsp:include page="../includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
