<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Marathon Competition" area="marathon" menu="description"/>

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
			<h2 class="pageTitle">Welcome to the Marathon Competition!</h2><!-- page title -->
                            <p>As part of the 2010 TopCoder Open, the Marathon Competition provides a more flexible format with an extended timeline that offers different types of problems than what can be offered in the Algorithm Competition. Competitors may submit code in the following languages: Java, C++, C#, VB.NET and Python.</p>
                            <p>Competitors will be competing in online rounds from May 19 - July 21, 2010 that will lead up to the Finals, being held at the Mirage Hotel in Las Vegas, Nevada, USA from October 11 - 14, 2010. The top twelve competitors will win this fabulous trip to Las Vegas to compete for cash prizes and bragging rights!</p>

                            <h3 class="subTitle">How does it work?</h3><!-- sub title-->
                            <p>Every eligible participant that registers for the competition will be able to open the problem statement at the same time. Unlike traditional algorithm competitions, the system is not necessarily testing for correctness. In the Marathon Competition, the scoring mechanism may be different for each problem. A description of the scoring mechanism will be provided in the problem statement. Competitors will have to understand the scoring mechanism in order to effectively compete.</p>
                            <p>Clicking the Submit link will take you to a page that will allow you to paste in a solution, select the proper language and either submit (for compilation and testing) or save your code. When the Submit button is selected, the code will be immediately compiled. Any compilation messages or higherrors will be shown in the Messages Area. If the compilation was successful, the submission will then be placed on a queue for automated testing. Example test cases will not be tested. When your submission has been processed, you will receive an email indicating such and your place in the standings will be adjusted accordingly.</p>
                            <p>Clicking the Test Examples button will immediately compile and place your submission on a queue for automated testing of just the example test cases. Detailed feedback will be made available when the tests are complete, including processing time, score, and any output from the program. Competitors may submit test examples once every 30 minutes. The competitor's rank and overall score will not be updated.</p>
                            <p>Competitors are encouraged to improve solutions and resubmit throughout the submission phase. The most recent submission is the one that will always count towards the standings.</p>
                            <p><a href="http://www.topcoder.com/wiki/display/tc/How+To+Compete+in+Marathon+Match+Events">Learn more here.</a></p>

                            <h3 class="subTitle">System Testing</h3><!-- sub title-->
                            <p>Once time is up for submitting, each submission will be run against a larger set of test cases and be issued a final score. This final score will determine the rankings of the match and the advancers of the round.</p>

                            <h3 class="subTitle">The Competition Details</h3><!-- sub title-->
                            <p>When is the competition? See the <tco10:marathonStaticPageLink page="schedule">schedule.</tco10:marathonStaticPageLink><br />
                                It is important for you to read the <tco10:overviewStaticPageLink page="rules">official rules and regulations</tco10:overviewStaticPageLink> for important details. Also, you must read through the specific rules for the <tco10:marathonStaticPageLink page="rules">Marathon Competition.</tco10:marathonStaticPageLink><br />
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
