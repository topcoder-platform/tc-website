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
                    
                    <h1>Tongal</h1>
                        
                        <p>9 Contests Highlighted</p>
                        <p>2 Logo Contests, 4 Storyboard Contest, 2 Prototype Contests, 1 Icon Contest</p>
                        <div class="clear"></div>
                        
                        <div id="thumbs">
                            <ul>
                                <li><a href="/i/portfolio/projects/tongal/thumbs/1.png" class="thickbox" rel="thumbs" title="Logo Design for Entertainment Startup Company"><img src="/i/portfolio/projects/tongal/previews/logo.png" width="150" height="150" /></a>
                                <div align="center">Logo Contest</div></li>
                                <li><a href="/i/portfolio/projects/tongal/thumbs/2.png" class="thickbox" rel="thumbs" title="Tongal Application Storyboard"><img src="/i/portfolio/projects/tongal/previews/storyboard.png" width="150" height="150" /></a>
                                <div align="center">Storyboard Contest</div></li>
                                <li><a href="/i/portfolio/projects/tongal/thumbs/3.png" class="thickbox" rel="thumbs" title="Tongal Application Icons"><img src="/i/portfolio/projects/tongal/previews/icons.png" width="150" height="150" /></a>
                                <div align="center">Icon Contest</div></li>
                                <li><a href="/i/portfolio/projects/tongal/prototype/index.html" target="_blank"><img src="/i/portfolio/projects/tongal/previews/prototype.png" width="150" height="150" /></a>
                                <div align="center">Prototype Contest</div></li>
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
                                            <td>Logo Contest</td>
                                            <td><a href="/i/portfolio/projects/tongal/logo/i/1.png" class="thickbox" title="Logo Design for Entertainment Startup Company">Logo Design for Entertainment Startup Company, Tongal</a></td>
                                            <td>5 Days</td>
                                            <td align="center">48</td>
                                            <td>
                                            <a href="/i/portfolio/projects/tongal/logo/i/1.png" class="thickbox" rel="logo" title="Logo Design for Entertainment Startup Company">1</a>
                                            <a href="/i/portfolio/projects/tongal/logo/i/2.png" class="thickbox" rel="logo" title="Logo Design for Entertainment Startup Company">2</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Logo Revision Contest</td>
                                            <td><a href="/i/portfolio/projects/tongal/logo2/i/1.png" class="thickbox" title="Tongal Logo Revision Contest">Tongal Logo Revision Contest</a></td>
                                            <td>6 Days</td>
                                            <td align="center">6</td>
                                            <td>
                                            <a href="/i/portfolio/projects/tongal/logo2/i/1.png" class="thickbox" rel="rev" title="Tongal Logo Revision Contest">1</a>
                                            <a href="/i/portfolio/projects/tongal/logo2/i/2.png" class="thickbox" rel="rev" title="Tongal Logo Revision Contest">2</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Storyboard Contest</td>
                                            <td><a href="/i/portfolio/projects/tongal/storyboards/i/1.png" class="thickbox" title="Tongal Landing Pages Storyboard">Tongal Landing Pages Storyboard</a></td>
                                            <td>5 Days</td>
                                            <td align="center">12</td>
                                            <td>
                                            <a href="/i/portfolio/projects/tongal/storyboards/i/1.png" class="thickbox" rel="story1" title="Tongal Landing Pages Storyboard">1</a>
                                            <a href="/i/portfolio/projects/tongal/storyboards/i/2.png" class="thickbox" rel="story1" title="Tongal Landing Pages Storyboard">2</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Storyboard Contest</td>
                                            <td><a href="/i/portfolio/projects/tongal/storyboards2/i/1.png" class="thickbox" title="Tongal Landing Pages Storyboard - Round 2">Tongal Landing Pages Storyboard - Round 2</a></td>
                                            <td>4 Days</td>
                                            <td align="center">6</td>
                                            <td>
                                            <a href="/i/portfolio/projects/tongal/storyboards2/i/1.png" class="thickbox" rel="story2" title="Tongal Landing Pages Storyboard - Round 2">1</a>
                                            <a href="/i/portfolio/projects/tongal/storyboards2/i/2.png" class="thickbox" rel="story2" title="Tongal Landing Pages Storyboard - Round 2">2</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Prototype Contest</td>
                                            <td><a href="/i/portfolio/projects/tongal/prototype1/index.html" target="_blank">Tongal Landing Pages Prototype</a></td>
                                            <td>4 Days</td>
                                            <td align="center">7</td>
                                            <td>
                                            <a href="/i/portfolio/projects/tongal/prototype1/index.html" target="_blank">1</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Storyboard Contest</td>
                                            <td><a href="/i/portfolio/projects/tongal/storyboards3/i/1.png" class="thickbox" title="Tongal Application Storyboard">Tongal Application Storyboard</a></td>
                                            <td>6 Days</td>
                                            <td align="center">1</td>
                                            <td>
                                            <a href="/i/portfolio/projects/tongal/storyboards3/i/1.png" class="thickbox" rel="story3" title="Tongal Application Storyboard">1</a> <small>(7 Screens)</small>
                                            <div class="hidden"><a href="/i/portfolio/projects/tongal/storyboards3/i/2.png" class="thickbox" rel="story3" title="Tongal Application Storyboard">2</a>
                                            <a href="/i/portfolio/projects/tongal/storyboards3/i/3.png" class="thickbox" rel="story3" title="Tongal Application Storyboard">3</a>
                                            <a href="/i/portfolio/projects/tongal/storyboards3/i/4.png" class="thickbox" rel="story3" title="Tongal Application Storyboard">4</a>
                                            <a href="/i/portfolio/projects/tongal/storyboards3/i/5.png" class="thickbox" rel="story3" title="Tongal Application Storyboard">5</a>
                                            <a href="/i/portfolio/projects/tongal/storyboards3/i/6.png" class="thickbox" rel="story3" title="Tongal Application Storyboard">6</a>
                                            <a href="/i/portfolio/projects/tongal/storyboards3/i/7.png" class="thickbox" rel="story3" title="Tongal Application Storyboard">7</a></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Prototype Contest</td>
                                            <td><a href="/i/portfolio/projects/tongal/prototype/index.html" target="_blank">Tongal Application Prototype</a></td>
                                            <td>7 Days</td>
                                            <td align="center">2</td>
                                            <td>
                                            <a href="/i/portfolio/projects/tongal/prototype/index.html" target="_blank">1</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Icon Contest</td>
                                            <td><a href="/i/portfolio/projects/tongal/icons/i/1.png" class="thickbox" title="Tongal Application Icons">Tongal Application Icons</a></td>
                                            <td>4 Days</td>
                                            <td align="center">3</td>
                                            <td>
                                            <a href="/i/portfolio/projects/tongal/icons/i/1.png" class="thickbox" rel="icons" title="Tongal Application Icons">1</a>
                                            <a href="/i/portfolio/projects/tongal/icons/i/2.png" class="thickbox" rel="icons" title="Tongal Application Icons">2</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Storyboard Contest</td>
                                            <td><a href="/i/portfolio/projects/tongal/storyboards4/1.png" class="thickbox"title="Tongal Prize and Relationship Tree Storyboard">Tongal Prize and Relationship Tree Storyboard</a></td>
                                            <td>4 Days</td>
                                            <td align="center">4</td>
                                            <td>
                                            <a href="/i/portfolio/projects/tongal/storyboards4/1.png" class="thickbox" rel="tree" title="Tongal Prize and Relationship Tree Storyboard">1</a>
                                            <a href="/i/portfolio/projects/tongal/storyboards4/2.png" class="thickbox" rel="tree" title="Tongal Prize and Relationship Tree Storyboard">2</a>
                                            <a href="/i/portfolio/projects/tongal/storyboards4/3.png" class="thickbox" rel="tree" title="Tongal Prize and Relationship Tree Storyboard">3</a>
                                            <a href="/i/portfolio/projects/tongal/storyboards4/4.png" class="thickbox" rel="tree" title="Tongal Prize and Relationship Tree Storyboard">4</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5"><a href="/i/portfolio/projects/tongal/prototype/index.html" target="_blank">Completed HTML Prototype</a></td>
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
