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
                    
                    <h1>Truveo Summer Games Widget</h1>
                        
                        <p>3 Contests beginning in June 2008 and ending in July 2008</p>
                        <p>1 Storyboard Contest, 1 Flash Contest, 1 yourminis Widget Build</p>
                        <div class="clear"></div>
                        
                        <div id="thumbs">
                            <ul>
                                <li><a href="/i/portfolio/projects/truveo-summer/storyboards/1.png" class="thickbox" rel="thumbs" title="Video Flash Widget Storyboard"><img src="/i/portfolio/projects/truveo-summer/thumbs/1.png" width="150" height="150" /></a><br />
                                <div align="center">Storyboard Contest</div></li>
                                
                                <li><a href="/i/portfolio/projects/truveo-summer/flash/1/SummerGameVideoWidget.html" title="Summer Games Widget Flash Conversion" target="_blank"><img src="/i/portfolio/projects/truveo-summer/thumbs/2.png" width="150" height="150" /></a><br />
                                <div align="center">Flash Contest</div></li>
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
                                                <td><a href="/i/portfolio/projects/truveo-summer/storyboards/1.png" class="thickbox" title="Video Flash Widget Storyboard">Video Flash Widget Storyboard</a></td>
                                                <td>6 Days</td>
                                                <td align="center">14</td>
                                                <td>
                                                <a href="/i/portfolio/projects/truveo-summer/storyboards/1.png" class="thickbox" rel="story1" title="Video Flash Widget Storyboard">1</a>
                                                <a href="/i/portfolio/projects/truveo-summer/storyboards/2.png" class="thickbox" rel="story1" title="Video Flash Widget Storyboard">2</a>
                                                <a href="/i/portfolio/projects/truveo-summer/storyboards/3.png" class="thickbox" rel="story1" title="Video Flash Widget Storyboard">3</a>
                                                <a href="/i/portfolio/projects/truveo-summer/storyboards/4.png" class="thickbox" rel="story1" title="Video Flash Widget Storyboard">4</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Flash Contest</td>
                                                <td><a href="/i/portfolio/projects/truveo-summer/flash/1/SummerGameVideoWidget.html" title="Summer Games Widget Flash Conversion" target="_blank">Summer Games Widget Flash Conversion</a></td>
                                                <td>5 Days</td>
                                                <td align="center">10</td>
                                                <td>
                                                <a href="/i/portfolio/projects/truveo-summer/flash/1/SummerGameVideoWidget.html" title="Summer Games Widget Flash Conversion" target="_blank">1</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>yourminis Widget Contest</td>
                                                <td>Video Flash Widget Storyboard</td>
                                                <td>5 Days</td>
                                                <td align="center">2</td>
                                                <td>
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
