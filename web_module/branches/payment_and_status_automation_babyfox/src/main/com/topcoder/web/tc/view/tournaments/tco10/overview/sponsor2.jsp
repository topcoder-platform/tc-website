<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Sponsors" area="overview" menu="sponsors" subMenu="sponsor2"/>

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
							<h2 class="pageTitle">Facebook</h2><!-- page title -->
                                <p><strong>How many opportunities in your life do you get to change the way the world communicates?</strong></p>
                                <p><object width="640" height="385"><param name="movie" value="http://www.youtube.com/v/8tfaW5CaTtc&hl=en_US&fs=1&"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/8tfaW5CaTtc&hl=en_US&fs=1&" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="640" height="385"></embed></object></p>
                                <p><a href="<tc-webtag:linkTracking link='http://www.facebook.com/engineering' refer='tco10' />">Facebook</a> helps over 400+ million people around the world communicate and share more efficiently with their friends, family and coworkers. The site has been built on common open source software such as Linux, Apache, MySQL, and PHP, and over the past few years, Facebook has developed a number of <a href="<tc-webtag:linkTracking link='http://developers.facebook.com/opensource.php' refer='tco10' />">open source infrastructure technologies</a> to support the site's growth including <a href="<tc-webtag:linkTracking link='http://developers.facebook.com/hiphop-php/' refer='tco10' />">HipHop for PHP</a>, <a href="<tc-webtag:linkTracking link='http://incubator.apache.org/cassandra/' refer='tco10' />">Cassandra</a>, <a href="<tc-webtag:linkTracking link='http://wiki.apache.org/hadoop/Hive' refer='tco10' />">Hive</a>, <a href="<tc-webtag:linkTracking link='http://developers.facebook.com/scribe/' refer='tco10' />">Scribe</a>, and <a href="<tc-webtag:linkTracking link='http://incubator.apache.org/thrift/' refer='tco10' />">Thrift</a>. Facebook engineers actively contribute and participate in various open source projects, developing technologies that facilitate the sharing of information through the social graph.</p>
                                <p>At Facebook, we move fast. Our rapid development cycle is supported by tools that always keep us operating ahead of the curve. Our engineers are able to write code and have it running live on the site that same night, so you can see the impact you’re making in real-time.</p>
                                <p>We're hiring the smartest TopCoders for both full time and internship positions. Let us know you're interested. We'd love to meet you.</p>
                                <p align="center"><tco10:overviewStaticPageLink page="sponsor2Confirm"><img src="i/tournament/tco10/applynow.png" alt="Apply Now for Facebook!" /></tco10:overviewStaticPageLink></p>
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
