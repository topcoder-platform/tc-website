<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Algorithm Competition Schedule" area="algorithm" menu="schedule"/>

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
                  
                     <h2 class="pageTitle">Algorithm Competition Schedule</h2><!-- page title -->
                            <h3 class="subTitle">Registration</h3><!-- sub title-->
                            <p>Registration for the 2010 TopCoder Open Algorithm Competition will open at 9:00 UTC -4 on March 29, 2010 and will close at 9:00 UTC -4 on Sunday, May 23, 2010.</p>
                        </div>
                        <table cellpadding="0" cellspacing="0"><!-- start table list -->
							<tr>
								<th class="first"><span class="left"></span>Online Qualification  Rounds</th><!-- table left top corner -->
                                <th>Time</th>
                                <th>Max # of Competitors</th>
								<th>Max # of Advancers</th>
                                <th class="last"><span class="right"></span></th><!-- table right top corner -->
							</tr>
							<tr>
                                <td class="round">Round 1</td>
                                <td class="time">Saturday, <br />May 1,2010<br /><span class="high">Register:</span> <br />9:00 - 11:55 UTC -4<br /><span class="high">Start:</span> <br />
                                <a href="http://timeanddate.com/worldclock/fixedtime.html?month=5&amp;day=1&amp;year=2010&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">12:00 UTC -4</a></td>
                                <td>All members who have not previously qualififed - limited to the first 2,000 Competitors who register in the Arena</td>
                                <td colspan="2" class="number">600</td>
							</tr>
                            <tr>
                                <td>Round 2</td>
                                <td>Wednesday, <br />May 12, 2010<br /><span class="high">Register:</span> <br />4:00 - 6:55 UTC -4<br /><span class="high">Start:</span> <br />
                                <a href="http://timeanddate.com/worldclock/fixedtime.html?month=5&amp;day=12&amp;year=2010&amp;hour=7&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">7:00 UTC -4</a></td>
                                <td>All members who have not previously qualififed - limited to the first 2,000 Competitors who register in the Arena</td>
                                <td colspan="2">600</td>
							</tr>
                            <tr class="last">
                                <td>Round 3</td>
                                <td>Monday, <br />May 24, 2010<br /><span class="high">Register:</span> <br />18:00 - 20:55  UTC -4<br /><span class="high">Start:</span> <br />
                                <a href="http://timeanddate.com/worldclock/fixedtime.html?month=5&amp;day=24&amp;year=2010&amp;hour=21&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">21:00 UTC -4</a></td>
                                <td>All members who have not previously qualififed - limited to the first 2,000 Competitors who register in the Arena<br />
                              <br />
                              <strong><em>Please note that in order to register for this qualification round you will need to have <a href="http://www.topcoder.com/tco10?module=ViewUnifiedRegistration" target="_blank">registered for the TCO</a> at least 24 hours prior to the start of this round.</em></strong></td>
                                <td colspan="2">600</td>
							</tr>
                        </table>
                        <table cellpadding="0" cellspacing="0"><!-- start table list -->
							<tr>
								<th class="first"><span class="left"></span>Online Elimination Rounds</th><!-- table left top corner -->
                                <th>Time</th>
                                <th># of Participants</th>
								<th># of Advancers</th>
                                <th class="last"><span class="right"></span></th><!-- table right top corner -->
							</tr>
							<tr>
                                <td class="round">Round 1</td>
                                <td class="time">Saturday, <br />June 19, 2010<br /><span class="high">Register:</span> <br />9:00 - 11:55 UTC -4<br /><span class="high">Start:</span> <br />
                                <a href="http://timeanddate.com/worldclock/fixedtime.html?month=6&amp;day=19&amp;year=2010&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">12:00 UTC -4</a></td>
                                <td>Up to 2,000</td>
                                <td colspan="2" class="number">850</td>
							</tr>
                            <tr>
                                <td>Round 2</td>
                                <td>Saturday, <br />June 26, 2010<br /><span class="high">Register:</span> <br />9:00 - 11:55 UTC -4<br /><span class="high">Start:</span> <br />
                                <a href="http://timeanddate.com/worldclock/fixedtime.html?month=6&amp;day=26&amp;year=2010&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">12:00 UTC -4</a></td>
                                <td>850</td>
                                <td colspan="2">350</td>
							</tr>
                            <tr>
                                <td>Round 3</td>
                                <td>Saturday, <br />July 10, 2010<br /><span class="high">Register:</span> <br />9:00 - 11:55 UTC -4<br /><span class="high">Start:</span><br />
                                <a href="http://timeanddate.com/worldclock/fixedtime.html?month=7&amp;day=10&amp;year=2010&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">12:00 UTC -4</a></td>
                                <td>350</td>
                                <td colspan="2">150</td>
                            </tr>
                            <tr>
                                <td>Round 4</td>
                                <td>Saturday, <br />July 24, 2010<br /><span class="high">Register:</span><br />9:00 - 11:55 UTC -4<br /><span class="high">Start:</span> <br />
                                <a href="http://timeanddate.com/worldclock/fixedtime.html?month=7&amp;day=24&amp;year=2010&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">12:00 UTC -4</a></td>
                                <td>150</td>
                                <td colspan="2">60</td>
                            </tr>
                            <tr class="last">
                                <td>Round 5</td>
                                <td>Saturday,<br /> August 7, 2010<br /><span class="high">Register:</span><br />9:00 - 11:55 UTC -4<br /><span class="high">Start:</span><br />
                                <a href="http://timeanddate.com/worldclock/fixedtime.html?month=8&amp;day=7&amp;year=2010&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">12:00 UTC -4</a></td>
                                <td>60</td>
                                <td colspan="2">24</td>
                            </tr>
                        </table>

                        <table cellpadding="0" cellspacing="0"><!-- start table list -->
							<tr>
								<th class="first"><span class="left"></span>Onsite Final Rounds</th><!-- table left top corner -->
								<th>Date and Time</th>
                                <th class="last"><span class="right"></span></th><!-- table right top corner -->
							</tr>
							<tr>
                                <td>Semifinal 1</td>
                                <td colspan="2"><a href="http://timeanddate.com/worldclock/fixedtime.html?month=10&amp;day=13&amp;year=2010&amp;hour=9&amp;min=0&amp;sec=0&amp;p1=127" target="_blank">Wednesday, October 13 at 9:00 UTC - 7</a></td>
							</tr>
                            <tr>
                                <td>Semifinal 2</td>
                                <td colspan="2"><a href="http://timeanddate.com/worldclock/fixedtime.html?month=10&amp;day=13&amp;year=2010&amp;hour=12&amp;min=30&amp;sec=0&amp;p1=127" target="_blank">Wednesday, October 13 at 12:30 UTC -7</a></td>
							</tr>
                            <tr>
                                <td>Wildcard Round</td>
                                <td colspan="2"><a href="http://timeanddate.com/worldclock/fixedtime.html?month=10&amp;day=13&amp;year=2010&amp;hour=17&amp;min=30&amp;sec=0&amp;p1=127" target="_blank">Wednesday, October 13 at 18:00 UTC -7</a></td>
							</tr>
                            <tr class="last">
                                <td>Championship</td>
                                <td colspan="2"><a href="http://timeanddate.com/worldclock/fixedtime.html?month=10&amp;day=14&amp;year=2010&amp;hour=13&amp;min=30&amp;sec=0&amp;p1=127" target="_blank">Thursday, October 14 at 13:00 UTC -7</a></td>
							</tr>
                         </table>

                         <table cellpadding="0" cellspacing="0"><!-- start table list -->
							<tr>
								<th class="first" colspan="2"><span class="left"></span>Important Dates</th><!-- table left top corner -->
                                <th class="last"><span class="right"></span></th><!-- table right top corner -->

							</tr>
							<tr>
                                <td>Last Day to Request a Visa Invitation Letter</td>
                                <td colspan="2"><a href="http://timeanddate.com/worldclock/fixedtime.html?month=7&amp;day=30&amp;year=2010&amp;hour=17&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">Friday, July 30, 2010 at 17:00 UTC -4</a></td>
							</tr>
                            <tr class="last">
                                <td>Finalist Documents Due</td>
                                <td colspan="2"><a href="http://timeanddate.com/worldclock/fixedtime.html?month=8&amp;day=23&amp;year=2010&amp;hour=21&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">Monday, August 23, 2010 at 17:00 UTC -4</a></td>
							</tr>
                        </table>

                        <div class="text">
                             <p class="imp-note">All times are listed in Eastern Daylight Time (EDT UTC -4) or Pacific Daylight Time (PDT UTC -7).</p>
                             <p class="note">In the event that a round must be cancelled for any reason, the round will start the following day at the same time.</p>
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
