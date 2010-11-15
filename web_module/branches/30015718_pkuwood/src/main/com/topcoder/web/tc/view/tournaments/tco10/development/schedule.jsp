<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Development Competition Schedule" area="development" menu="schedule"/>

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
			<h2 class="pageTitle">Schedule</h2><!-- page title -->
                            <p>Competitors can register for the Tournament and be eligible for the Development Competition between 9:00 UTC -4 on March 29, 2010 and 9:00 UTC -4 on July 30, 2010.  The Development Competition will take place between March 29, 2010 and July 30, 2010. Only Tournament-eligible design competitions in which registration has closed during the Development Competition Period shall be included in determining points for the Development Competition.</p>
                        </div>
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
