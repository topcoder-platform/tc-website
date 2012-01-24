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
                    
                    <h1>MindProtein.com</h1>
                        
                        <p>4 Contests starting in May 2008 and ending in July 2008</p>
                        <p>1 Naming Contest, 1 Logo Contest, 1 Storyboard Contest, 1 Prototype Contest</p>
                        <div class="clear"></div>
                        
                        <div id="thumbs">
                            <ul>
                                <li><a href="/i/portfolio/projects/mindprotein/logo/1.png" class="thickbox" rel="thumbs" title="MindProtein.com"><img src="/i/portfolio/projects/mindprotein/thumbs/1.png" width="150" height="150" /></a><br />
                                <div align="center">Logo Contest</div></li>
                                
                                <li><a href="/i/portfolio/projects/mindprotein/storyboard/1.png" class="thickbox" rel="thumbs" title="MindProtein.com"><img src="/i/portfolio/projects/mindprotein/thumbs/2.png" width="150" height="150" /></a><br />
                                <div align="center">Storyboard Contest</div></li>
                                
                                <li><a href="/i/portfolio/projects/mindprotein/prototype/1/homepage.html" title="MindProtein.com"><img src="/i/portfolio/projects/mindprotein/thumbs/3.png" width="150" height="150" /></a><br />
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
                                                <td>Company Naming Contest</td>
                                                <td>FBU Name Contest</td>
                                                <td>4 Days</td>
                                                <td align="center">28</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Logo Contest</td>
                                                <td><a href="/i/portfolio/projects/mindprotein/logo/1.png" class="thickbox" title="MindProtein.com">MindProtein.com Logo Contest</a></td>
                                                <td>6 Days</td>
                                                <td align="center">49</td>
                                                <td>
                                                <a href="/i/portfolio/projects/mindprotein/logo/1.png" class="thickbox" rel="story1" title="MindProtein.com">1</a>
                                                <a href="/i/portfolio/projects/mindprotein/logo/2.png" class="thickbox" rel="story1" title="MindProtein.com">2</a>
                                                <a href="/i/portfolio/projects/mindprotein/logo/3.png" class="thickbox" rel="story1" title="MindProtein.com">3</a>
                                                <a href="/i/portfolio/projects/mindprotein/logo/4.png" class="thickbox" rel="story1" title="MindProtein.com">4</a>
                                                <a href="/i/portfolio/projects/mindprotein/logo/5.png" class="thickbox" rel="story1" title="MindProtein.com">5</a>
                                                <a href="/i/portfolio/projects/mindprotein/logo/6.png" class="thickbox" rel="story1" title="MindProtein.com">6</a>
                                                <a href="/i/portfolio/projects/mindprotein/logo/7.png" class="thickbox" rel="story1" title="MindProtein.com">7</a>
                                                <a href="/i/portfolio/projects/mindprotein/logo/8.png" class="thickbox" rel="story1" title="MindProtein.com">8</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Storyboard Contest</td>
                                                <td><a href="/i/portfolio/projects/mindprotein/prototype/1/homepage.html" title="MindProtein.com">MindProtein.com Homepage</a></td>
                                                <td>3 Days</td>
                                                <td align="center">19</td>
                                                <td>
                                                <a href="/i/portfolio/projects/mindprotein/storyboard/1.png" class="thickbox" rel="story2" title="MindProtein.com">1</a>
                                                <a href="/i/portfolio/projects/mindprotein/storyboard/2.png" class="thickbox" rel="story2" title="MindProtein.com">2</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Prototype Contest</td>
                                                <td><a href="/i/portfolio/projects/mindprotein/prototype/1/homepage.html" title="MindProtein.com" target="_blank">MindProtein.com Prototype</a></td>
                                                <td>3 Days</td>
                                                <td align="center">4</td>
                                                <td><a href="/i/portfolio/projects/mindprotein/prototype/1/homepage.html" title="MindProtein.com" target="_blank">1</a></td>
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
