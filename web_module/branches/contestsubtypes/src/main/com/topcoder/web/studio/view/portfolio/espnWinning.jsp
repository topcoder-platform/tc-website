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
                    
                    <h1>ESPN Winning Formula Challenge</h1>
                        
                        <p>4 Contests Highlighted</p>
                        <p>2 Storyboard Contests, 2 Banner Ad Contests</p>
                        <div class="clear"></div>
                        
                        <div id="thumbs">
                            <ul>
                                <li><a href="/i/portfolio/projects/espn-winning/storyboard/1.png" class="thickbox" rel="thumbs" title="ESPN Winning Formula Challenge"><img src="/i/portfolio/projects/espn-winning/thumbs/1.png" width="150" height="150" /></a><br />
                                <div align="center">Storyboard Contest</div></li>
                                
                                <li><a href="/i/portfolio/projects/espn-winning/storyboard3/1.png" class="thickbox" rel="thumbs" title="ESPN Winning Formula Challenge"><img src="/i/portfolio/projects/espn-winning/thumbs/2.png" width="150" height="150" /></a><br />
                                <div align="center">Banner Ad Contest</div></li>
                            </ul>
                        </div>
                        
                        <div class="clear"></div>
                            <div class="divide">
                                <div class="data">
                                        <table border="0" cellpadding="0" cellspacing="1">
                                            <tr>
                                                <th>Contest Type</th>
                                                <th>Contest Name</th>
                                                <th>Duration</th>
                                                <th>Subs</th>
                                                <th>Client Selection</th>
                                            </tr>
                                            <tr>
                                                <td>Storyboard Contest</td>
                                                <td><a href="/i/portfolio/projects/espn-winning/storyboard/1.png" class="thickbox" title="ESPN Winning Formula Challenge">ESPN Winning Formula Challenge - Storyboard Contest</a></td>
                                                <td>3 Days</td>
                                                <td align="center">16</td>
                                                <td>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard/1.png" class="thickbox" rel="story1" title="ESPN Winning Formula Challenge">1</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard/2.png" class="thickbox" rel="story1" title="ESPN Winning Formula Challenge">2</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard/3.png" class="thickbox" rel="story1" title="ESPN Winning Formula Challenge">3</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard/4.png" class="thickbox" rel="story1" title="ESPN Winning Formula Challenge">4</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard/5.png" class="thickbox" rel="story1" title="ESPN Winning Formula Challenge">5</a>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Storyboard Contest</td>
                                                <td><a href="/i/portfolio/projects/espn-winning/storyboard2/1.png" class="thickbox" title="ESPN Winning Formula Challenge">ESPN Winning Formula Storyboard Contest - Round 2</a></td>
                                                <td>3 Days</td>
                                                <td align="center">9</td>
                                                <td>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard2/1.png" class="thickbox" rel="story2" title="ESPN Winning Formula Challenge">1</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard2/2.png" class="thickbox" rel="story2" title="ESPN Winning Formula Challenge">2</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard2/3.png" class="thickbox" rel="story2" title="ESPN Winning Formula Challenge">3</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard2/4.png" class="thickbox" rel="story2" title="ESPN Winning Formula Challenge">4</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard2/5.png" class="thickbox" rel="story2" title="ESPN Winning Formula Challenge">5</a>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Banner Ad Contest</td>
                                                <td><a href="/i/portfolio/projects/espn-winning/storyboard3/1.png" class="thickbox" title="ESPN Winning Formula Challenge">Promo Banners for ESPN Winning Formula Challenge</a></td>
                                                <td>3 Days</td>
                                                <td align="center">17</td>
                                                <td>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard3/1.png" class="thickbox" rel="story3" title="ESPN Winning Formula Challenge">1</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard3/2.png" class="thickbox" rel="story3" title="ESPN Winning Formula Challenge">2</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard3/3.png" class="thickbox" rel="story3" title="ESPN Winning Formula Challenge">3</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard3/4.png" class="thickbox" rel="story3" title="ESPN Winning Formula Challenge">4</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard3/5.png" class="thickbox" rel="story3" title="ESPN Winning Formula Challenge">5</a>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Banner Ad Contest</td>
                                                <td><a href="/i/portfolio/projects/espn-winning/storyboard4/1.png" class="thickbox" title="ESPN Winning Formula Challenge">ESPN Winning Formula Challenge Banner Ads Part 2</a></td>
                                                <td>1 Day</td>
                                                <td align="center">13</td>
                                                <td>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard4/1.png" class="thickbox" rel="story4" title="ESPN Winning Formula Challenge">1</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard4/2.png" class="thickbox" rel="story4" title="ESPN Winning Formula Challenge">2</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard4/3.png" class="thickbox" rel="story4" title="ESPN Winning Formula Challenge">3</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard4/4.png" class="thickbox" rel="story4" title="ESPN Winning Formula Challenge">4</a>
                                                <a href="/i/portfolio/projects/espn-winning/storyboard4/5.png" class="thickbox" rel="story4" title="ESPN Winning Formula Challenge">5</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5"><a href="http://winningformula.espn.com/" target="_blank">Winning Formula Contest Link</a></td>
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
