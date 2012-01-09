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
                    
                    <h1>Accenture</h1>
                        
                        <p>2 Contests Highlighted</p>
                        <p>1 Mobile UI Wireframe Contest, 1 Mobile UI Contest</p>
                        
                        <p>This ultra-fast project required taking an existing Accenture iPad application and creating wireframes for an iPhone app. The Mobile UI contest used the wireframes and the existing iPad app to create the iPhone app UI. </p>
                        <div class="clear"></div>
                        
                        <div id="thumbs">
                            <ul>
                                <li><a href="/i/portfolio/projects/accenture/mobileui/1.png" class="thickbox" title="Accenture iPhone Event App Skin Storyboard"><img src="/i/portfolio/projects/accenture/thumbs/1.png" width="150" height="150" /></a><br />
                                <div align="center">Mobile UI Design</div></li>
                                
                                <li><a href="/i/portfolio/projects/accenture/mobileui/2.png" class="thickbox" title="Accenture iPhone Event App Skin Storyboard"><img src="/i/portfolio/projects/accenture/thumbs/2.png" width="150" height="150" /></a><br />
                                <div align="center">Mobile UI Design</div></li>
                                
                                <li><a href="/i/portfolio/projects/accenture/wireframes/1.png" class="thickbox" title="Accenture Signature Event iPhone app Wireframes"><img src="/i/portfolio/projects/accenture/thumbs/3.png" width="150" height="150" /></a><br />
                                <div align="center">Wireframes</div></li>
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
                                                <td>Mobile UI Design</td>
                                                <td><a href="http://studio.topcoder.com/?module=ViewContestResults&ct=30022643" title="Accenture iPhone Event App Skin Storyboard" target="_blank">Accenture iPhone Event App Skin Storyboard</a></td>
                                                <td>3 Days</td>
                                                <td align="center">13</td>
                                                <td>
                                                <a href="http://studio.topcoder.com/?module=DownloadSubmission&sbmid=109970" title="Accenture iPhone Event App Skin Storyboard, 1" target="_blank">1</a>, <a href="http://studio.topcoder.com/?module=DownloadSubmission&sbmid=109968" title="Accenture iPhone Event App Skin Storyboard, 2" target="_blank">2</a>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Wireframes</td>
                                                <td><a href="http://studio.topcoder.com/?module=ViewContestResults&ct=30022620" title="Accenture Signature Event iPhone app Wireframes" target="_blank">Accenture Signature Event iPhone app Wireframes</a></td>
                                                <td>6 Days</td>
                                                <td align="center">18</td>
                                                <td>
                                                <a href="http://studio.topcoder.com/?module=DownloadSubmission&sbmid=109631" title="Accenture Signature Event iPhone app Wireframes" target="_blank">Download</a>

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
