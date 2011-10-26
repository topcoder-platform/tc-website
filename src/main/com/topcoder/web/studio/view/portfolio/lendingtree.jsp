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
                    
                    <h1>LendingTree: Banner Ad Contest</h1>
                        
                        <p>2 Contests Highlighted</p>
                        <p>2 Banner Ad Contests</p>
                        <div class="clear"></div>
                        
                        <div id="thumbs">
                            <ul>
                                <li><a href="/i/portfolio/projects/ltclient/round1/index.htm" title="LendingTree Promo Banner Ads"><img src="/i/portfolio/projects/ltclient/round1/i/4.png" width="150" height="150" /></a><br />
                                <div align="center">Banner Ads 1</div></li>
                                
                                <li><a href="/i/portfolio/projects/ltclient/round2/index.htm" title="LendingTree Promo Banner Ads Round 2"><img src="/i/portfolio/projects/ltclient/round2/i/3.png" width="150" height="150" /></a><br />
                                <div align="center">Banner Ads 2</div></li>
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
                                                <td>Banner Ad Contest</td>
                                                <td><a href="/i/portfolio/projects/ltclient/round1/index.htm" title="LendingTree Promo Banner Ads">LendingTree Promo Banner Ads</a></td>
                                                <td>5 Days</td>
                                                <td align="center">26</td>
                                                <td><a href="/i/portfolio/projects/ltclient/round1/index.htm" title="LendingTree Promo Banner Ads">Link</a></td>
                                            </tr>
                                            <tr>
                                                <td>Banner Ad Contest</td>
                                                <td><a href="/i/portfolio/projects/ltclient/round2/index.htm" title="LendingTree Promo Banner Ads Round 2">LendingTree Promo Banner Ads Round 2</a></td>
                                                <td>7 Days</td>
                                                <td align="center">93</td>
                                                <td><a href="/i/portfolio/projects/ltclient/round2/index.htm" title="LendingTree Promo Banner Ads Round 2">Link</a></td>
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
