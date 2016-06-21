<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Tournament Overview" area="overview" menu="patron"/>

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
							<h2 class="pageTitle">NSA - Where Intelligence Goes to Work</h2>
							<p>The National Security Agency (NSA) is a world leader in the protection and exploitation of intelligence. We gather and analyze foreign signals intelligence to produce vital information for U.S. policymakers and warfighters. And we protect American intelligence from the ever-listening ears of our adversaries, giving our Nation a decisive edge.
							<p>At the Nation’s top cryptologic organization, you can work with the best and the brightest, using your intelligence to solve some of the Nation’s most difficult challenges. Your solutions can play a major role in shaping the course of world history. </p>
                            <p>NSA has exciting career opportunities available in Computer/Electrical Engineering, Computer Science, Information Assurance, Mathematics, Foreign Language, Intelligence Analysis, Cryptanalysis, Signals Analysis, Business, and more. You’ll enjoy an incredible benefits package, competitive pay, and the satisfaction of making the world a safer place.</p>
                            <p>For more information about the career opportunities available at NSA and to apply online, hit the "Apply Now" button. U.S. citizenship is required.</p>
							<p align="center"><tco10:overviewStaticPageLink page="patronConfirm"><img src="i/tournament/tco10/applynow.png" alt="Apply Now for NSA!" /></tco10:overviewStaticPageLink></p>
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
