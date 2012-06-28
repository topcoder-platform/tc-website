<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Marathon Competition Rules" area="marathon" menu="rules"/>

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
			<h2 class="pageTitle">Marathon Competition Official Rules and Regulations</h2><!-- page title -->
                            <p>The 2010 TopCoder Open Marathon Competition ("Marathon Competition") will take place between March 29, 2010 and October 14, 2010.  The Marathon Competition will consist of three (3) Online Rounds, with up to twelve (12) of the highest scoring competitors winning a trip to the Tournament to compete in the onsite 24 hour Championship Round.</p>
                            <p>The Marathon Competition is part of the Tournament, and by participating in this Marathon Competition, you agree to these <tco10:marathonStaticPageLink page="rules">rules.</tco10:marathonStaticPageLink></p>

                            <h3 class="subTitle">Registration </h3><!-- sub title-->
                            <p>Competitors can register for the Tournament and be eligible to participate in the Marathon Competition between 9:00 UTC -4 on Monday, March 29, 2010, and 9:00 UTC -4 on Wednesday, May 19, 2010. Competitors do not need to register separately for the Marathon Competition. The Marathon Competition will take place between March 29, 2010 and October 14, 2010.  There is no limit to the number of Competitors who can participate for the Marathon Competition; however each Competitor may only participate using one handle.</p>

                            <h3 class="subTitle">Competition Round Structure</h3><!-- sub title-->
                            <p>Each Online and Onsite Round of the Marathon Competition consists of two phases: the Coding Phase and the System Testing Phase. (Note: The format for rounds of the Marathon Competition is similar to the format of TopCoder Marathon Matches. The rules in place for Marathon Matches as of March 29, 2010, as may be amended by these Rules, will apply to the Online and Onsite rounds of the Marathon Competition.)</p>
                            <p>The Coding Phase is a timed event where all Competitors are presented with the same problem statement. The criteria for scoring a Competitor's submission will be provided with the problem statement and may change from round to round. During each round of the Marathon Competition, each Competitor may submit one of two types of submissions: an Example Submission or a Full Submission. Each Example Submission is run against the example test cases listed in the problem statement and detailed feedback is provided to the Competitor. Each Full Submission is run against a more complete set of test cases which are not disclosed to the Competitor and the Competitor only receives a provisional score. For Online Round 1, the duration of the Coding Phase is four weeks. For Online Rounds 2 and 3 the duration of the Coding Phase is two weeks.</p>
                            <p>The System Testing Phase is applied to the most recent Full Submission for each Competitor. During system testing, each Full Submission is run against a large number of sample cases which are not disclosed to the Competitors, and is scored according to the criteria specified in the problem statement. Once the system tests are completed, Competitors are ranked according to their score on the system test cases. The score a Competitor's Full Submission receives is determined solely by the system testing.</p>

                            <h3 class="subTitle">Online Rounds</h3><!-- sub title-->
                            <p><span class="high">Automatic Berths -</span> The 50 members who register for the Tournament who have the highest marathon competition rating as of Tuesday, May 18, 2010 at 13:00 UTC -4 and who meet all of the following criteria will receive an automatic berth into Online Round 2:</p>
                            <ul class="textlist">
                                <li>Competed in a TopCoder marathon competition between January 1, 2010 and May 18, 2010</li>
                                <li>Competed in a total of at least three (3) TopCoder rated events as a member at any time</li>
                                <li>Register for the Tournament by Tuesday, May 18, 2010 at 13:00 UTC -4</li>
                                <li>Meet all other Marathon Competition and Tournament eligibility criteria</li>
                            </ul>
                            <p>If a Competitor does not participate in an Online Round to which the Competitor has advanced, the Competitor will be disqualified from advancing further in the Marathon Competition.</p>
                            <p>Competitors will be assigned a seed for Online Round 1 based on their Marathon rating prior to Online Round 1.</p>
                            <p>The schedule for the Online Rounds of the Marathon Competition is as follows:</p>
                        </div>
                        <table cellpadding="0" cellspacing="0"><!-- Start table list -->
							<tr>
								<th class="first"><span class="left"></span>Online Rounds</th><!-- table left top corner -->
                                <th>Start</th>
                                <th>End</th>
                                <th>Max # of Competitors</th>
                                <th># of Advancers</th>
                                <th class="last"><span class="right"></span></th><!-- table right top corner -->
							</tr>
                            <tr>
                                <td>Round 1</th>
                                <td>Wednesday, May 19, 2010 13:00 UTC -4</th>
                                <td>Wednesday, June 16, 2010 13:00 UTC -4</th>
                                <td>Unlimited</th>
                                <td colspan="2" class="number">250</th>
                            </tr>
                            <tr>
                                <td>Round 2</th>
                                <td>Wednesday, June 23, 2010 13:00 UTC -4</th>
                                <td>Wednesday, July 7, 2010 13:00 UTC -4</th>
                                <td>300 (including the 50 automatic berths)</th>
                                <td colspan="2">100</th>
                            </tr>
                            <tr class="last">
                                <td>Round 3</th>
                                <td>Wednesday, July 21, 2010 13:00 UTC -4</th>
                                <td>Wednesday, August 4, 2010 13:00 UTC -4</th>
                                <td>100</th>
                                <td colspan="2">12</th>
                            </tr>
                        </table>
                        <div class="text">
                            <p class="imp-note">All times listed in UTC -4</p>

                            <h3 class="subTitle">Advancing during Online Rounds</h3><!-- sub title-->
                            <p>After each Online Round, the specified number of highest scoring competitors who are registered for the Tournament will advance to the next Online Round. To advance, a Competitor must submit a Full Submission and achieve a score greater than zero. The structure of each Online Round is as follows:</p>

                            <h3 class="subTitle">Online Round 1</h3><!-- sub title-->
                            <p>All Competitors may compete, and up to 250 of the highest scoring Competitors and the 50 automatic berth Competitors will advance to Online Round 2.</p>

                            <h3 class="subTitle">Online Round 2</h3><!-- sub title-->
                            <p>Up to 250 Competitors from Online Round 1 and the 50 automatic birth Competitors will compete and up to 100 of the highest scoring Competitors will advance to Online Round 3.</p>

                            <h3 class="subTitle">Online Round 3</h3><!-- sub title-->
                            <p>Up to 100 Competitors from Online Round 2 will compete and up to 12 of the highest scoring competitors will advance to the onsite Championship Round ("Onsite Marathon Competitor").</p>
                            <p>NOTE: In the event of a tie for any advancing position during the Online Rounds, the tie will be resolved in the following manner:</p>
                            <ol class="textlist">
                                <li>The Competitor with the highest number of total points from the immediately preceding Online Round of the Marathon Competition (if both Competitors competed in such round) will advance.</li>
                                <li>If a tie still remains, the remaining tied Competitor with the highest number of points from the next previous Online Round (if both Competitors competed in such round) will advance.</li>
                                <li>If a tie still remains, the Competitor with the highest seed for the Marathon Competition prior to Online Round 1 will advance.</li>
                                <li>If a tie still remains, all remaining tied Competitors will advance.</li>
                            </ol>

                            <h3 class="subTitle">Championship Round</h3><!-- sub title-->
                            <p>The Championship Round will consist of a single round of competition lasting 24 hours. The winner of the Championship Round will be the Onsite Marathon Competitor with the highest point total during the Championship Round. In the event that Onsite Marathon Competitors are tied at the conclusion of the Championship Round, the tie will be resolved in the following manner:</p>
                            <ol class="textlist">
                                <li>The Onsite Marathon Competitor with the highest number of points acquired during Online Round 3 of the Marathon Competition will be placed higher.</li>
                                <li>If a tie remains, the remaining tied Onsite Marathon Competitor with the highest number of points acquired during Online Round 2 of the Marathon Competition will be placed higher.</li>
                                <li>If a tie remains, the remaining tied Onsite Marathon Competitor with the highest number of points acquired during Online Round 1 of the Marathon Competition (if both competed in such round) will be placed higher.</li>
                                <li>If a tie remains, the remaining tied Onsite Marathon Competitor with the highest Marathon Match rating at the conclusion of Online Round 3.</li>
                                <li>If a tie remains, then the prize money will be distributed equally among the remaining tied Onsite Marathon Competitors.</li>
                            </ol>

                            <h3 class="subTitle">About the Prizes</h3><!-- sub title-->
                            <p>The Marathon Competition will award T-shirts to the 100 Competitors who advance to Round 3. The Marathon Competition will award cash prizes up to $22,550 to the Onsite Marathon Competitors in accordance with the following table:</p>
                        </div>
                        <table cellpadding="0" cellspacing="0"><!-- Start table list -->
							<tr>
								<th class="first"><span class="left"></span>Competitor(s)</th><!-- table left top corner -->
                                <th>Prize</th>
                                <th class="last"><span class="right"></span></th><!-- table right top corner -->
							</tr>
							<tr>
                                <td>1st place finisher* -  Marathon Match Competition Champion</td>
                                <td colspan="2">$15,000</td>
							</tr>
                            <tr>
                                <td>2nd place finisher* in the Championship Round</td>
                                <td colspan="2">$5,000</td>
							</tr>
                            <tr>
                                <td>3rd place finisher* in the Championship Round</td>
                                <td colspan="2">$1,000</td>
							</tr>
                            <tr>
                                <td>4th place finisher* in the Championship Round</td>
                                <td colspan="2">$600</td>
							</tr>
                            <tr>
                                <td>5th place finisher* in the Championship Round</td>
                                <td colspan="2">$250</td>
							</tr>
                            <tr>
                                <td>6th-12th place finisher* in the Championship</td>
                                <td colspan="2">$100 each</td>
							</tr>
                            <tr class="last">
                                <td>100 Competitors who advance to Round 3</td>
                                <td colspan="2">Limited edition 2010 TopCoder Open t-shirt</td>
							</tr>
                        </table>
                        <div class="text">
                            <p class="imp-note">* Prize will be awarded at the conclusion of the Onsite Championship Round. Winner must be present at the onsite Championship announcement to receive prize.</p>
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
