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
            <!-- content -->

            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">
                    
                    
                    <!-- Back to Portfolio page -->
                    <div style="padding: 10px 0;"><a href="/?module=Static&amp;d1=portfolio&amp;d2=portfolio">Portfolio</a></div>
                    
                    <!-- Begin Main Content -->
                    
                    <h1>Appirio</h1>
                        <p>1 Challenge in October 2008</p>
                        <p>1 Application Front End Design Challenge</p>
                        <div class="clear"></div>
                        
                        <div id="thumbs">
                            <ul>
                                <li><a href="/i/portfolio/projects/appirio/index.html"  target="_blank" rel="thumbs" title="Appirio Quick Project - Convert Design to HTML/CSS"><img src="/i/portfolio/projects/appirio/thumbs/1.png" width="150" height="150" /></a><br />
                                <div align="center">Prototype Challenge</div></li>
                                
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
                                                <td>Application Front End Design Challenge</td>
                                                <td><a href="/i/portfolio/projects/appirio/index.html"   target="_blank" title="Appirio Quick Project - Convert Design to HTML/CSS">Appirio Quick Project - Convert Design to HTML/CSS</a></td>
                                                <td>2 Days</td>
                                                <td align="center">6</td>
                                                <td>
                                                <a href="/i/portfolio/projects/appirio/index.html"   target="_blank" rel="design1" title="Appirio Quick Project - Convert Design to HTML/CSS">1</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5"><a href="http://studio.topcoder.com/?module=ViewSubmissions&ct=1000250" target="_blank">View All Submissions</a></td>
                                            </tr>
                                        </table>
                                </div>
                              </div>
                              <div class="hidden">
                                  <!-- <a href="/i/portfolio/projects/appirio/2.jpg" class="thickbox" rel="thumbs" title="Appirio Quick Project - Convert Design to HTML/CSS"></a> -->
                         <div class="clear"></div>

            <!-- End Main Content -->
                  </div>
                    <div class="contentBottom"></div>
                    </div>
                </div>
            </div>
            </div>
        <jsp:include page="../foot.jsp"/>


</body>
</html>