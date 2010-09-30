<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Schedule of Onsite Events" area="overview" menu="onsite" subMenu="schedule"/>

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
                <span class="rightBottom"></span><!-- main content right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn">
			<div class="text">
			<h2 class="pageTitle">Schedule of Onsite Events*</h2><!-- page title -->                      
                        </div>
                        
                        <table cellpadding="0" cellspacing="0"><!-- Start table list -->
							<tr>
								<th class="first"><span class="left"></span>Monday, October 11, 2010</th><!-- table left top corner -->
                                <th>&nbsp;</th>
								<th class="last"><span class="right"></span></th><!-- table right top corner -->
							</tr>
							<tr>
                                <td>7:00 p.m. - 8:00 p.m.</td>
								<td colspan="2">Welcome Reception</td>
							</tr>
                            <tr>
                                <th>Tuesday, October 12, 2010</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>	
                            </tr>
                            <tr>
                                <td>7:30 a.m. - 9:00 a.m.</td>
								<td colspan="2">Breakfast</td>
							</tr>
                            <tr>
                                <td>8:30 a.m.</td>
								<td colspan="2">24 Hour Marathon Match Finals</td>
							</tr>
                            <tr>
                                <td>8:30 a.m. - 12:00 p.m </td>
								<td colspan="2">Studio Design Competition Semifinal 1</td>
							</tr>
                            <tr>
                                <td>12:00 p.m. - 1:30 p.m.</td>
								<td colspan="2">Lunch</td>
							</tr>
                            <tr>
                                <td>12:30 p.m. - 2:00 p.m.</td>
								<td colspan="2">Mod Dash Competition Final 1</td>
							</tr>
                            <tr>
                                <td>2:30 p.m. - 6:00 p.m.</td>
								<td colspan="2">Studio Design Competition Semifinal 2</td>
							</tr>
                            <tr>
                                <td>6:00 p.m. - 6:45 p.m.</td>
								<td colspan="2">Facebook Tech Talk</td>
							</tr>
                            <tr>
                                <td>6:00 p.m. - 7:00 p.m.</td>
								<td colspan="2">Dinner</td>
							</tr>
                            <tr>
                                <th>Wednesday, October 13, 2010	</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>	
                            </tr>
                            <tr>
                                <td>7:30 a.m. - 9:00 a.m.</td>
								<td colspan="2">Breakfast</td>
							</tr>
                           <tr>
                              <td>9:00 a.m. - 11:30 a.m.</td>
                              <td colspan="2">Algorithm Semifinal 1</td>
                          </tr>
                           <tr>
                                <td>9:30 a.m. - 11:00 a.m.</td>
								<td colspan="2">Mod Dash Competition Final 2</td>
							</tr>
                            <tr>
                                <td>12:00 p.m. - 1:30 p.m.</td>
								<td colspan="2">Lunch</td>
							</tr>
                           <tr>
                                <td>12:30 p.m. - 3:00 p.m.</td>
								<td colspan="2">Algorithm Semifinal 2</td>
							</tr>
                            <tr>
                                <td>1:30 p.m. - 5:00 p.m.</td>
								<td colspan="2">Studio Design Competition Final</td>
							</tr>
                            <tr>
                                <td>5:00 p.m. - 5:45 p.m.</td>
								<td colspan="2">Experimental Innovation with NASA with Dr. Karim Lakhani, Harvard Business School&nbsp;</td>
							</tr>
                            <tr>
                                <td>5:00 p.m. - 6:00 p.m.</td>
								<td colspan="2">Dinner</td>
							</tr>
                           <tr>
                                <td>6:00 p.m. - 8:30 p.m.</td>
								<td colspan="2">Algorithm Wild Card Round</td>
							</tr>
                            <tr>
                                <th>Thursday, October 14, 2010</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>	
                            </tr>
                            tr>
                                <td>7:30 a.m. - 9:00 a.m.</td>
								<td colspan="2">Breakfast</td>
							</tr>
                            <tr>
                                <td>9:30 a.m. - 11:00 a.m.</td>
								<td colspan="2">Mod Dash Competition Final 3</td>
							</tr>
                            <tr>
                                <td>12:00 p.m. - 1:30 p.m.</td>
								<td colspan="2">Lunch</td>
							</tr>
                            <tr>
                                <td>1:00p.m. - 3:30 p.m.</td>
								<td colspan="2">Algorithm Finals</td>
							</tr>
                            <tr>
                                <td>3:30 p.m. - 4:00 p.m.</td>
								<td colspan="2">Winner Announcements and Awards Ceremony</td>
							</tr>
                            <tr class="last">
                                <td>7:00 p.m. - 9:00 p.m.</td>
                                <td colspan="2">Closing Reception</td>
							</tr>
						</table>
                        
                        <div class="text">
			        <p>Please note all competition rounds here include 30 minute set up time.</p>   
							<p class="imp-note">All times are listed in Pacific Daylight Time or PDT UTC -7.</p>
                            <p class="imp-note">*Schedule subject to change with or without notice.</p>                
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
