<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Algorithm Competition" area="algorithm" menu="description"/>

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
                        <h2 class="pageTitle">Welcome to the Algorithm Competition!</h2><!-- page title -->
                             <p>The Algorithm Competition, as part of the TopCoder Open, is a timed contest where all contestants compete online and are given the same problems to solve under the same time constraints. The competition is available in four programming languages: Java, C#, C++, and VB.NET.  Competitors will be competing in rounds from May 1 - August 7, 2010 that will lead up to the Finals, being held at the Mirage Hotel in Las Vegas, Nevada, USA from October 11 - 14, 2010. The top 24 competitors will win this fabulous trip to Las Vegas to compete for cash prizes and bragging rights!</p>
                             <p>Each online and onsite round of competition (including the Qualification Rounds) consists of three phases: Coding Phase, Challenge Phase, and System Testing Phase. (Note: The format of these competition rounds is similar to the format of TopCoder Single Round Matches.)</p>
                                                       
                             <h3 class="subTitle">How does it work?</h3><!-- sub title-->
                             <p>The <strong>Coding Phase</strong> is a timed event where all contestants are presented with the same three questions representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time the problem was opened until the time it was submitted. During the online rounds, the Coding Phase will last 75 minutes. During the onsite rounds, the Coding Phase will last 85 minutes.</p>
                             <p>The <strong>Challenge Phase</strong> is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the defendant and a 50-point reward for the challenger. Unsuccessful challengers will incur a point reduction of 25 points as a penalty, applied against their total score in that round of competition. During the online rounds, the Challenge Phase will last 15 minutes. During the onsite rounds, the Challenge Phase will last 10 minutes.</p>
                             <p>The <strong>System Testing Phase</strong> is applied to all submitted code that has not already been successfully challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code submission to be correct. If the output from a coder's submission does not match the expected output, the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing Phase.</p>
                             <p><a href="http://www.topcoder.com/wiki/display/tc/How+To+Compete+in+Algorithm+Competitions">Learn more here.</a></p>
                                                        
                             <h3 class="subTitle">The Competition Details</h3><!-- sub title-->
                             <p>When is the competition? <tco10:algorithmStaticPageLink page="schedule">See the schedule.</tco10:algorithmStaticPageLink><br />
                                It is important for you to read the <tco10:overviewStaticPageLink page="rules">official rules and regulations</tco10:overviewStaticPageLink>
                                 for important details. Also, you must read through the specific rules for the 
                                <tco10:algorithmStaticPageLink page="rules">Alogrithm Competition.</tco10:algorithmStaticPageLink><br />
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
