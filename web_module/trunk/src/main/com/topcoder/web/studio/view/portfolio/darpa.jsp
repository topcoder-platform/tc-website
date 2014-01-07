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
                    
                    <h1>DARPA CS-STEM Project</h1>
                        
                        <p>2 Challenges Highlighted</p>
                        <p>2 Application Front-End Design Challenges</p>
                        
                        <p>"Shape Plotter" is a basic program-oriented game where a shape is given as a challenge problem and the objective is to recreate the given shape by writing instructions of language.</p>
                        <p> "Turn On the Light" is a Boolean expression game. The game introduces the user the formal language, how it works and its logic. It aims to teach the basics, in order to learn mathematics, programming and any science or engineering related subject.</p>
                        <div class="clear"></div>
                        
                        <div id="thumbs">
                            <ul>
                                <li><a href="/i/portfolio/projects/darpa/frontend/1.png" class="thickbox" title="Shape Plotter Game Interface"><img src="/i/portfolio/projects/darpa/thumbs/1.png" width="150" height="150" /></a><br />
                                <div align="center">Application Front-End</div></li>
                                
                                <li><a href="/i/portfolio/projects/darpa/frontend/2.png" class="thickbox" title="Shape Plotter Game Interface"><img src="/i/portfolio/projects/darpa/thumbs/2.png" width="150" height="150" /></a><br />
                                <div align="center">Application Front-End</div></li>
                                
                                <li><a href="/i/portfolio/projects/darpa/frontend/3.png" class="thickbox" title="Turn On the Light Game Interface"><img src="/i/portfolio/projects/darpa/thumbs/3.png" width="150" height="150" /></a><br />
                                <div align="center">Application Front-End</div></li>
                                
                                <li><a href="/i/portfolio/projects/darpa/frontend/4.png" class="thickbox" title="Turn On the Light Game Interface"><img src="/i/portfolio/projects/darpa/thumbs/4.png" width="150" height="150" /></a><br />
                                <div align="center">Application Front-End</div></li>
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
                                                <td>Application Front-End</td>
                                                <td><a href="http://studio.topcoder.com/?module=ViewContestResults&ct=30022566" title="Shape Plotter Game Interface" target="_blank">Shape Plotter Game Interface</a></td>
                                                <td>6 Days</td>
                                                <td align="center">13</td>
                                                <td>
                                                <a href="http://studio.topcoder.com/?module=DownloadSubmission&sbmid=108990" title="Shape Plotter Game Interface, 1" target="_blank">1</a>, <a href="http://studio.topcoder.com/?module=DownloadSubmission&sbmid=108990" title="Shape Plotter Game Interface, 2" target="_blank">2</a>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Application Front-End</td>
                                                <td><a href="http://studio.topcoder.com/?module=ViewContestResults&ct=30022562" title="Turn On the Light Game Interface" target="_blank">Turn On the Light Game Interface</a></td>
                                                <td>7 Days</td>
                                                <td align="center">16</td>
                                                <td>
                                                <a href="http://studio.topcoder.com/?module=DownloadSubmission&sbmid=108874" title="Turn On the Light Game Interface, 1" target="_blank">1</a>, <a href="http://studio.topcoder.com/?module=DownloadSubmission&sbmid=108869" title="Turn On the Light Game Interface, 2" target="_blank">2</a>
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
