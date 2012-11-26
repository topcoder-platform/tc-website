<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Design Competition Rules" area="design" menu="rules"/>

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
			<h2 class="pageTitle">Design Official Rules and Regulations</h2><!-- page title -->
                            <p>The 2010 TopCoder Open Design Competition ("Design Competition") will take place between March 29 and July 30, 2010. The Design Competition will include the following tracks of competition:  Architecture, Component Design, Conceptualization, Specification, and Testing Scenarios.  The Design Competition will consist of online qualifying competitions, with up to fifteen (15) of the highest scoring Competitors from the Design Competition winning a trip to the Tournament.
			The Design Competition is part of the Tournament, and by participating in the competition, you agree to these <tco10:designStaticPageLink page="rules">rules.</tco10:designStaticPageLink></p>

                            <h3 class="subTitle">Schedule</h3><!-- sub title-->
                            <p>Competitors can register for the Tournament and be eligible for the Design Competition between 9:00 UTC -4 on March 29, 2010 and 9:00 UTC -4 on July 30, 2010.  The Design Competition will take place between March 29, 2010 and July 30, 2010 ("Design Competition Period"). </p>
                            <p>During the Design Competition Period, Competitors who have registered for the Design Competition and who participate in Tournament-eligible design competitions (as applicable) on the TopCoder website, will receive points as outlined in these Rules.  A Competitor's submission will not be scored separately for the Design Competition.  Only Tournament-eligible design competitions in which registration has closed during the Design Competition Period shall be included in determining points for the Design Competition.</p>

                            <h3 class="subTitle">Competition Scoring</h3><!-- sub title-->
                            <p>Scoring in the Design Competition is determined based on the final placement for a Competitor's submission in a Tournament-eligible design competition (as applicable) in accordance with the rules of such competition.  A design competition is Tournament-eligible if the competition is identified as being included as part of the Tournament.  Only Competitors who are registered for the Tournament will be considered in determining place and placement points. Placement scoring mirrors the Digital Run placement scoring, and is as follows (where Placement Points for a contest equal the number of DR points that contest offers).  (Scores will be rounded to two decimal places.)</p>

                            <h3 class="subTitle">Percentage of Placement Points</h3><!-- sub title-->
                            <p># of Submissions that Pass Review:</p>
                        </div>

                        <table cellpadding="0" cellspacing="0"><!-- Start table list -->
							<tr>
								<th class="first"><span class="left"></span>Place</th><!-- table left top corner -->
                                <th>1</th>
                                <th>2</th>
                                <th>3</th>
                                <th>4</th>
                                <th>5</th>
                                <th class="last"><span class="right"></span></th><!-- table right top corner -->
							</tr>
							<tr>
                                <td>1st</td>
                                <td>100%</td>
                                <td>70%</td>
                                <td>65%</td>
                                <td>60%</td>
                                <td colspan="2">56%</td>
							</tr>
                            <tr>
                                <td>2nd</td>
                                <td>&nbsp;</td>
                                <td>30%</td>
                                <td>25%</td>
                                <td>22%</td>
                                <td colspan="2">20%</td>
							</tr>
                            <tr>
                                <td>3rd</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>10%</td>
                                <td>10%</td>
                                <td colspan="2">10%</td>
							</tr>
                            <tr>
                                <td>4th</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>8%</td>
                                <td colspan="2">8%</td>
							</tr>
                            <tr class="last">
                                <td>5th</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td colspan="2">6%</td>
							</tr>
                        </table>

                        <div class="text">
                            <p class="note">If more than five (5) submissions pass review, the competitors who place in 6th position or below will not receive any placement points.</p>

                            <h3 class="subTitle">Penalties</h3><!-- sub title-->
                            <p>All final fixes will be completed according to the applicable schedule. On a case-by-case basis, as determined by TopCoder staff, placement points may be deducted for failing to complete final fixes on time. </p>

                            <h3 class="subTitle">Placement/Advancement</h3><!-- sub title-->
                            <p>Up to fifteen (15) Competitors with the highest cumulative placement score in the Design Competition in Tournament-eligible competitions will be invited to attend the onsite awards ceremony at the Tournament.</p>
                            <p>In the event of a tie, the tie will be resolved in the following manner: </p>
                            <ol class="textlist">
                                <li>The tied competitor with the highest number of first place submissions will receive a higher placement in the Design Competition.</li>
                                <li>If a tie still remains, then the remaining tied competitor with the highest number of second place submissions will receive a higher placement in the Design Competition.</li>
                                <li>If a tie still remains, then the remaining tied competitor with the highest number of third place submissions will receive a higher placement in the Design Competition. </li>
                                <li>If a tie still remains, then the remaining tied competitor with the highest number of fourth place submissions will receive a higher placement in the Design Competition. </li>
                                <li>If a tie still remains, then all remaining tied competitors will receive the same placement.</li>
                            </ol>

                      <h3 class="subTitle">About the Prizes</h3><!-- sub title-->
                            <p>The Design Competition will award up to $30,250. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.</p>
                        </div>

                        <table cellpadding="0" cellspacing="0"><!-- Start table list -->
							<tr>
								<th class="first"><span class="left"></span>Competitor(s)</th><!-- table left top corner -->
                                <th>Prize</th>
                                <th class="last"><span class="right"></span></th><!-- table right top corner -->
							</tr>
							<tr>
                                <td>1st place finisher*</td>
                                <td colspan="2">$20,000</td>
							</tr>
                            <tr>
                                <td>2nd place finisher*</td>
                                <td colspan="2">$5,000</td>
							</tr>
                            <tr>
                                <td>3rd place finisher*</td>
                                <td colspan="2">$1,500</td>
							</tr>
                            <tr>
                                <td>4th place finisher*</td>
                                <td colspan="2">$1,000 each</td>
							</tr>
                            <tr>
                                <td>5th-15th place finisher*</td>
                                <td colspan="2">$250 each</td>
							</tr>
                            <tr class="last">
                                <td>Up to the first 50 Competitors with the highest amount of points (minimum of 15 placement points)</td>
                                <td colspan="2">Limited edition 2010 TopCoder Open t-shirt</td>
							</tr>
                        </table>
                        <div class="text">
                            <p class="imp-note">* Prize will be awarded during the onsite Awards Presentation at the Tournament. The winner must be present at the onsite Awards Presentation to receive prize.</p>
                            <p class="note">Prior to Competitors receiving their cash prize, they must complete all work for all underlying design competitions and Tournament and Design Competition-related work, such as final fixes.</p>
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
