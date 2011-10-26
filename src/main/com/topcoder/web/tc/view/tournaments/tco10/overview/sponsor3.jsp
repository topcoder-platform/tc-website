<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Sponsors" area="overview" menu="sponsors" subMenu="sponsor3"/>

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
							<h2 class="pageTitle">PayPal X Developer Network</h2><!-- page title -->
                            <p align="center"><img src="i/tournament/tco10/paypal-logo-white.png" alt="PayPal X Developer Network" /></p>
                          <p>TopCoder is proud to announce PayPal as a sponsor for 2010 TopCoder Open! PayPal has partnered with TopCoder to leverage the power of our community and competition platform to promote and develop their own developer network, <a href="<tc-webtag:linkTracking link='http://www.x.com/' refer='tco10' />">PayPal X.</a> In fact, PayPal is giving away an iPad to the TopCoder member who earns the most DR points on PayPal-related contests by TCO!&nbsp;<br />
                            <br />
                            Interested in learning even more? Check out <a href="<tc-webtag:linkTracking link='http://www.paypal-xinnovate.com/' refer='tco10' />">Innovate 2010</a> - the PayPal X Developer Conference. Taking place October 26-27, Innovate 2010 will have over:</p>
                            <ul class="textlist">
                            <li>50+ technical sessions</li>
                            <li>30+ demos with code samples (some provided by TopCoder members!)</li>
                            <li>2000 of your peers&nbsp;</li>
                            <li>Keynote addresses two seminal names in the technology industry &ndash; Tim O'Reilly and Mark Andressen!</li>
                            <li>Check for the TopCoder Session</li>
                            </ul><br />
                         <p> If you are interested in the present &ndash; and future &ndash; of payments, there's no better place to be!&nbsp;</p>
                          <p align="center"><a href="<tc-webtag:linkTracking link='http://topcoder.com/home/x/' refer='tco10' />"><img src="i/tournament/tco10/joinnow.png" alt="Join Now!" /></a></p>
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
