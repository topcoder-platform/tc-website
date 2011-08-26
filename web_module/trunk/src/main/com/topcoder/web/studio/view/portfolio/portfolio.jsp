<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>
    
    <!-- add js/css files for portfolio section styles and modal windows -->
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="studio_portfolio"/>
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
    
    <!-- add js scripts for portfolio section modal windows -->
    <script type="text/javascript" src="/js/portfolio/thickbox.js"></script>
    <!-------------------------------------------------------->
</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="../top.jsp">
                <jsp:param name="section" value="portfolio" />
            </jsp:include>
        <br />
    
        <!-- container -->
        <div id="container">
            <div id="wrapper">
    
            <!-- content -->

            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">
                    <!-- Begin Main Content -->
                    
                    <h1>Portfolio</h1>
                        <p>Browse through some of our highlighted work completed for our clients.</p>
                        <div class="clear"></div>
                            <div class="divide">
                                
                                <div class="floatLeft_2">
                                    <h2>Accenture</h2>
                                    <p>2 Contests Highlighted</p>
                                    <p>1 Mobile UI Wireframe Contest, 1 Mobile UI Contest</p>
                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=accenture">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=accenture"><img src="/i/portfolio/projects/accenture/thumbs/1.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                                <div class="floatLeft_2">
                                    <h2>PayPal X</h2>
                                    <p>2 Contests Highlighted</p>
                                    <p>1 Web Design contest, 1 Mobile UI Contest</p>
                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=paypalx">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=paypalx"><img src="/i/portfolio/projects/paypalx/thumbs/1.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                                <div class="floatLeft_2">
                                    <h2>DARPA CS-STEM Project</h2>
                                    <p>2 Contests Highlighted</p>
                                    <p>2 Application Front-End Design Contests</p>
                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=darpa">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=darpa"><img src="/i/portfolio/projects/darpa/thumbs/1.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                                <div class="floatLeft_2">
                                    <h2>Alcatel-Lucent</h2>
                                    <p>1 Contest Highlighted</p>
                                    <p>1 Web Design Contest</p>
                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=alcatel">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=alcatel"><img src="/i/portfolio/projects/alcatel/thumbs/1.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                                <div class="floatLeft_2">
                                    <h2>Argus</h2>
                                    <p>7 Contests Highlighted</p>
                                    <p>1 Storyboard Contest, 4 Flash Animation Contests, 2 Prototype Contests</p>
                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=argus">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=argus"><img src="/i/portfolio/projects/argus/previews/storyboard.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                                <div class="floatLeft_2">
                                    <h2>Blackbird .NET Application</h2>
                                    <p>4 Contests Highlighted</p>
                                    <p>1 Logo Contest, 1 Flash Contest, 1 Storyboard Contest, 1 Print Advertising Contest</p>
                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=blackbird">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=blackbird"><img src="/i/portfolio/projects/blackbird/thumbs/1.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                                <div class="floatLeft_2">
                                    <h2>ESPN Winning Formula Challenge</h2>
                                    <p>4 Contests Highlighted</p>
                                    <p>2 Storyboard Contests, 2 Banner Ad Contests</p>
                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=espnWinning">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=espnWinning"><img src="/i/portfolio/projects/espn-winning/thumbs/1.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                                <div class="floatLeft_2">
                                    <h2>GEICO</h2>
                                    <p>1 Contest Highlighted</p>
                                    <p>1 Storyboard/Landing Page Contest</p>
                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=geico">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=geico"><img src="/i/portfolio/projects/geico/thumbs/1.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                                <div class="floatLeft_2">
                                    <h2>LendingTree: Banner Ad Contest</h2>
                                    <p>2 Contests Highlighted</p>
                                    <p>2 Banner Ad Contests</p>
                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=ltclient">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=ltclient"><img src="/i/portfolio/projects/ltclient/thumbs/1.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                                <div class="floatLeft_2">
                                    <h2>RadioTAGr</h2>
                                    <p>1 Contest Highlighted</p>
                                    <p>1 Storyboard Contest (Additional Storyboard and iPhone build planned)</p>
                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=radiotagr">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=radiotagr"><img src="/i/portfolio/projects/radiotagr/thumbs/1.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                                <div class="floatLeft_2">
                                    <h2>Tongal</h2>
                                    <p>9 Contests Highlighted</p>
                                    <p>2 Logo Contests, 4 Storyboard Contest, 2 Prototype Contests, 1 Icon Contest</p>
                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=tongal">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=tongal"><img src="/i/portfolio/projects/tongal/previews/prototype.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                                <div class="floatLeft_2">
                                
                                    <h2>AOL News: Predict The President</h2>
                                    <p>2 Contests Highlighted</p>
                                    <p>1 Flash Contest, 1 yourminis Widget Build</p>
                                    <p><strong>Client Quote:</strong> "Thanks very much to the TopCoder Studio for getting the project completed in 5 weeks, the elections team has wanted to implement this for 5 years."</p>

                                    <p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=aolNews">View more details...</a></p>
                                </div>
                                <div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=aolNews"><img src="/i/portfolio/projects/aol-news/thumbs/1.png" width="150" height="150" /></a></div>
                    
                                <div class="clear hr"></div>
                                
                            </div>
                        <div class="clear"></div>
                        </div>
                        <div class="contentBottom"></div>
                    </div>
                </div>
            </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
