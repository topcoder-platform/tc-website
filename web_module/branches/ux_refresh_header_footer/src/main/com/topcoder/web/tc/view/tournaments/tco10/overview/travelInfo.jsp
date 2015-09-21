<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Travel Info" area="overview" menu="onsite" subMenu="travel"/>

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
<h2 class="pageTitle">Travel Information to the TCO</h2><!-- page title -->
                            <p>Want to attend the 2010 TopCoder Open? Here's some information to help you with your plans.</p>
                         
                            <h3 class="subTitle">Transportation</h3><!-- sub title-->
                            <p><span class="high">Air Travel</span><br />
                            Las Vegas is home to <a href="http://www.mccarran.com/" target="_blank">McCarran International Airport.</a> There are many flights into and out of this airport.</p>
                            <p><span class="high">Bus Travel</span><br />
                            You can get to Las Vegas by bus. There is a Greyhound Station in the city. <a href="http://www.greyhound.com/home/" target="_blank">See more information here</a>.
                        
                            <h3 class="subTitle">Hotels</h3><!-- sub title-->
                            <p>There are a plethora of hotels in Las Vegas that you can choose from. Here are a few that are affordable and in the vicinity of the 2010 TopCoder Open.</p>  
                            <p><span class="high">Mirage Hotel and Casino</span><br />
                            800-374-9000 | Room rates: $105*<br />
                            The event will take place at the Mirage* so it is the most convenient for attending the event. Rooms at the Mirage can be reserved with a TopCoder group rate. In order to receive the TopCoder group rate, please mention TopCoder upon calling. Alternatively, you can <a href="https://reservations.mgmmirage.com/bookingengine.aspx?host=group&amp;pid=160&amp;code=TOPCD10" target="_blank">book online here</a>.</p>
                            <p class="imp-note">*All finalists' rooms will be booked by TopCoder. If you are attending as a competitor, please do not book a room through this link.</p>
                            <p><span class="high">Treasure Island</span><br />
                            800-288-7206 | Room rate: $123*<br />
                            Treasure Island is next door to the Mirage. There is a tram connecting the two hotels. <a href="http://www.treasureisland.com/" target="_blank">Book online here</a> or call the number above.</p>
                            <p><span class="high">Harrah's</span><br />
                            800-HARRAHS (800-427-7247) | Room rate: $120*<br />
                            Harrah's is across the street from the Mirage and a quick walk. <a href="http://www.harrahslasvegas.com/casinos/harrahs-las-vegas/hotel-casino/property-home.shtml" target="_blank">Book online here</a> or call the number above.</p>
                           
                           <h3 class="subTitle">Additional Resources</h3><!-- sub title-->
                            <p>Take a look at this <a href="http://www.vegas.com/lounge/map.html" target="_blank">Las Vegas Strip map</a> for a more detailed list of hotels and proximity to the Mirage (number 16 on the map).
          <p><span class="high">Some good resources for you to utilize when booking travel:</span><br />
              <a href="http://www.lasvegas.com/" target="_blank">www.lasvegas.com</a><br />
              <a href="http://www.atozvegas.com/" target="_blank">www.atozvegas.com</a><br />
              <a href="http://www.vegas.com/" target="_blank">www.vegas.com</a><br />
                            <a href="http://www.visitlasvegas.com/" target="_blank">www.visitlasvegas.com</a></p>
                            <p class="imp-note">*Rate does not include taxes or fees and is subject to change at any time.</p>     
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
