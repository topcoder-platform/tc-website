<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Studio Competition" area="studio" menu="description"/>

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
			<h2 class="pageTitle">Welcome to the Studio Design Competition!</h2><!-- page title -->
                            <p>The Studio Design Competition (SDC) is a place for competitors to put their graphic and web design talent to the test. Designers will have from March 29 - July 30, 2010 to compete and accumulate points leading up to the Finals, being held at the Mirage Hotel in Las Vegas, Nevada, USA from October 11 - 14, 2010. Fourteen of the most creative competitors will win this fabulous trip to Las Vegas to compete for cash prizes and bragging rights!</p>

                            <h3 class="subTitle">What is TopCoder Studio?</h3><!-- sub title-->
                            <p>Studio challenges top creative talent from around the world to present their best concepts to clients searching for new design solutions.</p>

                            <h3 class="subTitle">Clients have multiple designs to choose from. Designers have multiple ways to win.</h3><!-- sub title-->
                            <p>Our clients hold competitions where designers compete for cash prizes, along with placement points that accumulate for the opportunity to win larger cash awards in our monthly tournament called the Studio Cup and the annual TCO tournament.</p>
                            <p>By tapping into a pool of creative people with multiple specialties, our clients benefit from new approaches and innovative concepts from a global community. Our competitors are here not just to win prizes, but to learn new skills, consult with peers, and earn the chance to be called one of the best designers in the world.</p>
                            <h3 class="subTitle">How does it work?</h3><!-- sub title-->
                            <p>The competition process ignites creativity in both the client and the Studio members. </p>
                            <ol class="textlist">
                                <li>Contest holders specify the goals, requirements and scope of the design project. </li>
                                <li> The competition is posted and Studio members submit their designs. </li>
                                <li> The client then evaluates the submissions and chooses a winner (or multiple winners). </li>
                                <li>The design is transferred to the client and the winners receive prizes and placement points for ongoing tournaments.</li>
                            </ol>
                            <p>Clients engage the Studio community for design work ranging from icon creation to full application user interface design. Common competitions include  logos, web design, banners, print design, and application UI design.</p>
                            <p>Why should you become a member of Studio? <a href="http://topcoder.com/home/studio/why-join-studio/">Find out!</a><br />
                            <a href="http://topcoder.com/home/studio/what-is-studio/">Learn more about how TopCoder Studio works.</a></p>

                            <h3 class="subTitle">The Competition Details</h3><!-- sub title-->
                            <p>When is the competition? <tco10:studioStaticPageLink page="schedule">See the schedule.</tco10:studioStaticPageLink><br />
                                It is important for you to read the <tco10:overviewStaticPageLink page="rules">official rules and regulations</tco10:overviewStaticPageLink> for important details. Also, you must read through the specific rules for the <tco10:studioStaticPageLink page="rules">Studio Competition.</tco10:studioStaticPageLink><br />
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
