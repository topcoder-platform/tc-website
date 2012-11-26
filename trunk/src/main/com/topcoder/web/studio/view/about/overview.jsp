<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    
    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages(); 
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

    $(document).ready(function(){
    
    
        $("#nav ul li").hoverIntent(function(){
            $(this).children("ul").slideDown("fast");
        }, function() {
            $(this).children("ul").slideUp("fast");
        });
        
        $("#nav ul ul li").hover(function() {
            $(this).parents("#nav ul li").children('a').addClass("active-item");
        }, function() {
            $(this).parents("#nav ul li").children('a').removeClass("active-item");
        });
    
    
    });
    </script>
</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="../top.jsp">
                <jsp:param name="section" value="howitworks" />
            </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <div id="wrapper">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <h1>About TopCoder</h1>

                    <p>TopCoder is fast becoming the major league for programming competitions. TopCoder brings members together once a week to compete online
                    &#40;Single Round Match&#41; and twice a year both online and on location &#40;Tournaments&#41;.</p>

                    <h2>Why Online Competitions</h2>
                    Competitions provide an understanding of a person's capabilities through a demonstration of skill. What was lacking in the world of programming
                    competitions was a format that offered immediate and objective scoring. The solution was the creation of a "Single Round Match".</p>

                    <p>In addition to regular Single Round Matches, TopCoder holds two major multiple-round, elimination tournaments each year.  These tournaments span many weeks and include significant prize purses along three independent tracks of competition: algorithm, component design, and component development.</p>

                    <h2>How Members Benefit</h2>

                    <ul>
                        <li><a href="/tc?module=Static&d1=about&d2=whyjoin"><strong>Competition</strong></a><br />
                        Each Single Round Match offers a fun, time-based, and challenging set of problems that put a developer's skills to the test. This, coupled
                        with Divisions,</a> offer a more level
                        field of competition for newer members in order to build ratings and move into potential
                        <a href="/tc?module=Static&d1=tournaments&d2=home">Tournament</a> opportunities.</li><br />

                        <li><a href="/tc?module=ViewActiveContests&ph=112"><strong>Design</strong></a> and <a href="/tc?module=ViewActiveContests&ph=113"><strong>Development</strong></a><br />
                        Rated TopCoder members are eligible to participate in TopCoder Component Development. Members submit design and development solutions
                        for these challenging and potentially lucrative projects. Winning solutions are rewarded with cash payouts and royalties. For every
                        commercial sale, TopCoder will pay the members who designed and developed the component a percentage of the sale. </li><br />

                    </ul>

                    <h2>How Companies Benefit</h2>

                    <ul>
                        <li><a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=tces_home"><strong>Employment Services</strong></a><br />
                        The market for developers is either feast or famine. Regardless of how many developers there are or how many are available,
                        the issue remains the same&#151;how to determine which candidate is best suited to the needs of your organization. While
                        certification has offered some credibility, competitions that test a developer's skills in real-world challenges goes much
                        further to differentiating one candidate from another.</li>

                        <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/index.jsp"><strong>Software</strong></a><br />
                        The best way to drive down the cost of software development is through re-use. The <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/components/index.jsp">Component Catalog</a>
                        is a tool for increasing re-use and developer productivity within an organization. The component catalog continues to grow on a weekly basis as component
                        requirements are generated through requests from catalog customers, research from TopCoder Product Managers and from application development.</li>

                        <li><a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=spon_prog&d3=index"><strong>Sponsorship</strong></a><br />
                        Reaching the developer community is a difficult task at best. Marketing budgets are limited and with the advent of the Internet,
                        the expectation for measuring results has only grown. TopCoder offers companies a means of targeting this desired community
                        through the targeted sponsorship of Single Round Matches
                        and <a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=spon_prog&d3=tourny_index">Tournaments.</a></li>
                    </ul>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
