<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Studio Competition" area="studio" menu="schedule"/>

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
			<h2 class="pageTitle">Studio Design Competition Schedule</h2><!-- page title -->
                            <p>Registration for the 2010 TopCoder Open Studio Design Competition Starts on Monday, March 29, 2010 at 9:00 UTC -4 and will close on Friday, July 30, 2010 at 9:00 UTC -4.  </p>
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
                                <td>Tuesday, <br />October 12, 2010 <br />8:30 UTC -7</td>
                                <td colspan="2">Tuesday, <br />October 12, 2010 <br />12:00 UTC -7</td>
							</tr>
                            <tr>
                                <td>Semifinal Round 2</td>
                                <td nowrap="nowrap">Tuesday, <br />
                                October 12, 2010<br />
                                14:30 UTC -7</td>
                                <td colspan="2">Tuesday,<br /> 
                              October 12, 2010<br />18:00 UTC -7</td>
							</tr>
                            <tr class="last">
                                <td nowrap="nowrap">Championship Round</td>
                                <td>Wednesday, <br />October 13, 2010 <br />
                                1:30 UTC -7</td>
                                <td colspan="2">Wednesday, <br />October 13, 2010 <br />
                                17:00 UTC -7</td>
							</tr>
                        </table>
                        
                         <table cellpadding="0" cellspacing="0"><!-- Start table list -->
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
                             <p class="note">In the event that a round must be cancelled for any reason, the round will Start the following day at the same time.</p>
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
