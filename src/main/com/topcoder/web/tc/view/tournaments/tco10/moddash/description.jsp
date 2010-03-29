<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Mod Dash Competition" area="moddash" menu="description"/>

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
			<h2 class="pageTitle">Welcome to the Mod Dash&trade; Competition!</h2><!-- page title -->
				<p>The Mod Dash Competition will run online from  March 29 - July 30, 2010 for competitors to accumulate points leading up to the Onsite Finals, being held at the Mirage Hotel in Las Vegas, Nevada, USA from October 11 - 14, 2010. The top ten scorers will win this fabulous trip to Las Vegas to compete for cash prizes and bragging rights!</p>
				<h3 class="subTitle">How does it work?</h3><!-- sub title-->
				<p>Project teams, clients and members are able to log bugs they find and changes they need in software developed and supported by TopCoder.  As often as we can, we will communicate these modifications to our member community.  Issues that are open to the community will be posted on the Active Mod Dash page - simply an RSS feed of issues that are logged into Jira - our issue tracking system.  By clicking on an issue you will be taken to a details page where you will find more information including relevant source code, documentation and examples of how to reproduce the issue.</p>
				<p>The submissions will be reviewed and tested by the TopCoder project team that posted the Mod Dash and/or member reviewers. Submissions will be reviewed in the order they are received. The first submission that successfully solves the issue and includes all updates to documentation and test cases will be declared the winner and awarded the stated prize amount as well as points toward the TCO. The top eight (8) point earners during the competition timeframe will earn a spot in the finals to compete in Las Vegas, Nevada October  11-14, 2010.</p>
                            <p>TopCoder will decide (at TopCoder's sole discretion) whether a submission successfully solves an issue. TopCoder may at any time (and at TopCoder's sole discretion) withdraw any bug posting, or engage its own or another developer to fix any bug.</p>
                            <p><a href="http://www.topcoder.com/wiki/display/tc/How+to+Compete+in+Bug+Races">Learn more here.</a></p>                           
                            <h3 class="subTitle">The Competition Details</h3><!-- sub title--></strong>
                            <p>When is the competition? <tco10:moddashStaticPageLink page="schedule">See the schedule.</tco10:moddashStaticPageLink><br />
                                It is important for you to read the <tco10:overviewStaticPageLink page="rules">official rules and regulations</tco10:overviewStaticPageLink> for important details. Also, you must read through the specific rules for the <tco10:moddashStaticPageLink page="rules">Mod Dash Competition.</tco10:moddashStaticPageLink><br />
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
