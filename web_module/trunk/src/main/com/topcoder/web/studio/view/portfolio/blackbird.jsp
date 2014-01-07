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
    
    <script src="js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
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
    <script type="text/javascript" src="js/portfolio/thickbox.js"></script>
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
                    
                    
                    <!-- Back to Portfolio page -->
                    <div style="padding: 10px 0;"><a href="/?module=Static&amp;d1=portfolio&amp;d2=portfolio">Portfolio</a></div>
                    
                    <!-- Begin Main Content -->
                    
                    <h1>Blackbird</h1>
                        
                        <p>4 Challenges Highlighted</p>
                        <p>1 Logo Challenge, 1 Flash Challenge, 1 Storyboard Challenge, 1 Print Advertising Challenge</p>
                        <div class="clear"></div>
                        
                        <div id="thumbs">
                            <ul>
                                <li><a href="/i/portfolio/projects/blackbird/logo/1.png" class="thickbox" rel="thumbs" title="Blackbird Logo &amp; Splash Screen"><img src="/i/portfolio/projects/blackbird/thumbs/1.png" width="150" height="150" /></a><br />
                                <div align="center">Logo Challenge</div></li>
                                
                                <li><a href="/i/portfolio/projects/blackbird/flash/blackbird_splash.html" title="Blackbird Splash Screen Animation Challenge" target="_blank"><img src="/i/portfolio/projects/blackbird/thumbs/3.png" width="150" height="150" /></a><br />
                                <div align="center">Flash Challenge</div></li>
                                
                                
                            </ul>
                        </div>
                        
                        <div class="clear"></div>
                            <div class="divide">
                                <div class="data">
                                        <table border="0" cellpadding="0" cellspacing="1">
                                            <tr>
                                                <th>Challenge Type</th>
                                                <th>Challenge Name</th>
                                                <th>Duration</th>
                                                <th>Subs</th>
                                                <th>Client Selection</th>
                                            </tr>
                                            <tr>
                                                <td>Logo Challenge</td>
                                                <td><a href="/i/portfolio/projects/blackbird/logo/1.png" class="thickbox" title="Blackbird Logo &amp; Splash Screen">Blackbird Logo &amp; Splash Screen</a></td>
                                                <td>7 Days</td>
                                                <td align="center">163</td>
                                                <td>
                                                <a href="/i/portfolio/projects/blackbird/logo/1.png" class="thickbox" rel="story1" title="Blackbird Logo &amp; Splash Screen">1</a>
                                                <a href="/i/portfolio/projects/blackbird/logo/2.png" class="thickbox" rel="story1" title="Blackbird Logo &amp; Splash Screen">2</a>
                                                <a href="/i/portfolio/projects/blackbird/logo/3.png" class="thickbox" rel="story1" title="Blackbird Logo &amp; Splash Screen">3</a>
                                                <a href="/i/portfolio/projects/blackbird/logo/4.png" class="thickbox" rel="story1" title="Blackbird Logo &amp; Splash Screen">4</a>
                                                <a href="/i/portfolio/projects/blackbird/logo/5.png" class="thickbox" rel="story1" title="Blackbird Logo &amp; Splash Screen">5</a>
                                                <a href="/i/portfolio/projects/blackbird/logo/6.png" class="thickbox" rel="story1" title="Blackbird Logo &amp; Splash Screen">6</a>
                                                <a href="/i/portfolio/projects/blackbird/logo/7.png" class="thickbox" rel="story1" title="Blackbird Logo &amp; Splash Screen">7</a>
                                                <a href="/i/portfolio/projects/blackbird/logo/8.png" class="thickbox" rel="story1" title="Blackbird Logo &amp; Splash Screen">8</a>
                                                <a href="/i/portfolio/projects/blackbird/logo/9.png" class="thickbox" rel="story1" title="Blackbird Logo &amp; Splash Screen">9</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Flash Challenge</td>
                                                <td><a href="/i/portfolio/projects/blackbird/flash/blackbird_splash.html" title="Blackbird Splash Screen Animation Challenge" target="_blank">Blackbird Splash Screen Animation Challenge</a></td>
                                                <td>11 Days</td>
                                                <td align="center">16</td>
                                                <td>
                                                <a href="/i/portfolio/projects/blackbird/flash/blackbird_splash.html" title="Blackbird Splash Screen Animation Challenge" target="_blank">1</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Storyboard Challenge</td>
                                                <td>Blackbird .NET Application Storyboard Design</td>
                                                <td>14 Days</td>
                                                <td align="center">5</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>Print Challenge</td>
                                                <td>Blackbird Display Board Design Challenge</td>
                                                <td>7 Days</td>
                                                <td align="center">12</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                </div>
                              </div>
                         <div class="clear"></div>

            <!-- End Main Content -->
                  </div>
                    <div class="contentBottom"></div>
                    </div>
                </div>
            </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
