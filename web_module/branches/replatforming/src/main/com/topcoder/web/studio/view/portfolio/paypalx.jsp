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
                    
                    <h1>PayPal X</h1>
                        
                        <p>2 Contests Highlighted</p>
                        <p>1 Web Design contest, 1 Mobile UI Contest</p>
                        
                        <p>The web site minisite design gives information about the PayPal X contest including updated news, contests, submissions, and forums. The mobile UI design for iPhone and Android apps was created for the PayPal X Innovate 2010 Developer Conference.</p>
                        <div class="clear"></div>
                        
                        <div id="thumbs">
                            <ul>
                                <li><a href="/i/portfolio/projects/paypalx/webdesign/1.png" class="thickbox" title="PayPal X Storyboard"><img src="/i/portfolio/projects/paypalx/thumbs/1.png" width="150" height="150" /></a><br />
                                <div align="center">Web Design</div></li>
                                
                                <li><a href="/i/portfolio/projects/paypalx/webdesign/2.png" class="thickbox" title="PayPal X Storyboard"><img src="/i/portfolio/projects/paypalx/thumbs/2.png" width="150" height="150" /></a><br />
                                <div align="center">Web Design</div></li>
                                
                                <li><a href="/i/portfolio/projects/paypalx/mobiledesign/1.png" class="thickbox" title="PayPal X Developer Conference App Design"><img src="/i/portfolio/projects/paypalx/thumbs/3.png" width="150" height="150" /></a><br />
                                <div align="center">Mobile UI Design</div></li>
                                
                                <li><a href="/i/portfolio/projects/paypalx/mobiledesign/2.png" class="thickbox" title="PayPal X Developer Conference App Design"><img src="/i/portfolio/projects/paypalx/thumbs/4.png" width="150" height="150" /></a><br />
                                <div align="center">Mobile UI Design</div></li>
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
                                                <td>Web Design</td>
                                                <td><a href="http://studio.topcoder.com/?module=ViewContestResults&ct=1001698&sbmid=26827&pn=1&ps=12" title="PayPal X Storyboard" target="_blank">PayPal X Storyboard</a></td>
                                                <td>11 Days</td>
                                                <td align="center">24</td>
                                                <td>
                                                <a href="http://studio.topcoder.com/?module=ViewContestResults&ct=1001698&sbmid=26827&pn=1&ps=12" title="PayPal X Storyboard, 1" target="_blank">1</a>, <a href="http://studio.topcoder.com/?module=ViewContestResults&ct=1001698&sbmid=26836&pn=1&ps=12" title="PayPal X Storyboard, 2" target="_blank">2</a>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Mobile UI Design</td>
                                                <td><a href="http://studio.topcoder.com/?module=ViewContestResults&ct=1001864&sbmid=28546&pn=1&ps=12" title="PayPal X Developer Conference App Design" target="_blank">PayPal X Developer Conference App Design</a></td>
                                                <td>7 Days</td>
                                                <td align="center">12</td>
                                                <td>
                                                <a href="http://studio.topcoder.com/?module=ViewContestResults&ct=1001864&sbmid=28546&pn=1&ps=12" title="PayPal X Developer Conference App Design, 1" target="_blank">1</a>, <a href="http://studio.topcoder.com/?module=ViewContestResults&ct=1001864&sbmid=28533&pn=1&ps=12" title="PayPal X Developer Conference App Design, 2" target="_blank">2</a>
                                                </td>
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
