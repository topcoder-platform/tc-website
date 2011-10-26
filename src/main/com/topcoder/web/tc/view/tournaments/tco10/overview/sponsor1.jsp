<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Sponsors" area="overview" menu="sponsors" subMenu="sponsor1"/>

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
							<h2 class="pageTitle">Yandex</h2><!-- page title -->
                            <p><strong>Chat Session Transcripts: </strong><tco10:overviewStaticPageLink page="srm468">SRM 468</tco10:overviewStaticPageLink></p>
                                <img src="i/tournament/tco10/yandex_collage.png" alt="Yandex" />
        
                                <p>We are just like you. Nerdy, but cool. Except, we are Russian. We are Russia's largest and most popular internet portal and search engine. We can find answers to people's questions better than anyone else. At least, better than anyone who speaks Russian. That's why we have 62% of the search market in Russia and a workday audience of 15 million.
        
                                <p>We are at the frontier. We designed and implemented our own unique machine learning algorithm MatrixNet (what do you mean never heard of that?). We were the first to launch a vertical search engine. We broke the ground with our proprietary antispam technology, which was the first to be implemented in a mass online service with a million-strong audience. Our own fact extraction mechanism automatically aggregates news for web users. We were a pioneer in contextual advertising in Russia.
        
                                <p>We like what we do. And we are good at it. You too can be doing what you do best in one of our locations in Russia, Ukraine or sunny California! Want to be part of our breakthrough team? Give us a shout if you are fierce, friendly, obsessed with coding and interested in hands-on work experience in the company of the like-minded.
        
                                <p>Alternatively, if you are more into studying, we can offer you a two-year Master's-level course in automated indexing and information search technologies. <a href="http://www.topcoder.com/tc?module=LinkTracking&link=http://company.yandex.com/press_center/press_releases/2007/2007-07-25.xml">Read more about the program</a> and come learn with us.
        
                                <p>Have a look at <a href="http://www.topcoder.com/tc?module=LinkTracking&link=http://company.yandex.ru/job/vacancies/">who we are looking for</a> (this might be you). Or, at <a href="http://www.topcoder.com/tc?module=LinkTracking&link=http://company.yandex.ru/job/intern/">what you can be doing at Yandex</a> even if you are still at college or university. Or, talk to us on the <a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=534862" target="_blank">forum.</a>
                      			<p>Just let us know you exist.</p>
							<p align="center"><tco10:overviewStaticPageLink page="sponsor1Confirm"><img src="i/tournament/tco10/applynow.png" alt="Apply Now for Yandex!" /></tco10:overviewStaticPageLink></p>
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
