<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Design Competition" area="design" menu="description"/>

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
			<h2 class="pageTitle">Welcome to the TCO10 Design Competition!</h2><!-- page title -->
                            <p>The Design Competition includes the following tracks:  Architecture, Component Design, Conceptualization, Specification, and Testing Scenarios. Competitors will have from March 29 - July 30, 2010 to compete and accumulate points leading up to the Finals, being held at the Mirage Hotel in Las Vegas, Nevada, USA from October 11 - 14, 2010. The top fifteen scorers including the Champion will win this fabulous trip to Las Vegas!</p>

                            <h3 class="subTitle">How Does it Work?</h3><!-- sub title-->
                            <p>First you must be a registered TopCoder member.  <a href="http://www.topcoder.com/reg">Register for TopCoder here</a>.  Next you must register for the 2010 TopCoder Open <a href="http://www.topcoder.com/tco10?module=ViewUnifiedRegistration">here.</a>  You may register for the tournament up until July 30, 2010 at 9:00 UTC -4.</p>
                            <p><a href="http://www.topcoder.com/wiki/display/tc/How+to+Compete+in+Architecture+Competitions">Learn how to compete in Architecture competitions here.</a></p>
                            <p><a href="http://www.topcoder.com/wiki/display/tc/How+to+Compete+in+Component+Design+Competitions">Learn how to compete in Component Design competitions here.</a></p>
                            <p><a href="http://www.topcoder.com/wiki/display/tc/How+to+Compete+in+Testing+Competitions">Learn how to compete in Testing Scenarios competitions here.</a></p>
                            <p><a href="http://www.topcoder.com/wiki/display/tc/Software+Conceptualization+How-To">Learn how to compete in Conceptualization competitions here.</a></p> 
                            <p><a href="http://www.topcoder.com/wiki/display/tc/Software+Specification+How+To">Learn how to compete in Specification competitions here.</a></p> 



                            <h3 class="subTitle">The Competition Details</h3><!-- sub title-->
                            <p>When is the competition? <tco10:designStaticPageLink page="schedule">See the schedule.</tco10:designStaticPageLink><br />
                                It is important for you to read the <tco10:overviewStaticPageLink page="rules">official rules and regulations</tco10:overviewStaticPageLink> for important details. Also, you must read through the specific rules for the <tco10:designStaticPageLink page="rules">Design Competition.</tco10:designStaticPageLink><br />
                                The competition is free and you must be a member who is 18 years or older, as well as meet all eligibility criteria, in order to participate.</p>

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
