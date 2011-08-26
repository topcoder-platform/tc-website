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
                    
                    <h1>Argus</h1>
                        
                        <p>7 Contests Highlighted</p>
                        <p>1 Storyboard Contest, 4 Flash Animation Contests, 2 Prototype Contests</p>
                        <div class="clear"></div>
                        
                        <div id="thumbs">
                            <ul>
                                <li><a href="/i/portfolio/projects/argus/thumbs/1.png" class="thickbox" rel="thumbs" title="Argus User Interface Storyboard Design"><img src="/i/portfolio/projects/argus/previews/storyboard.png" width="150" height="150" /></a><br />
                                <div align="center">Storyboard Contest</div></li>
                                <li><a href="/i/portfolio/projects/argus/flash2/1/map.html" title="Argus VP Chart Interaction/Animation Phase II"><img src="/i/portfolio/projects/argus/previews/flash.png" width="150" height="150" /></a>
                                <div align="center">Flash Contest</div></li>
                                <li><a href="/i/portfolio/projects/argus/prototype/customer/index.html" title="Argus VP Prototype Contest Phase 2"><img src="/i/portfolio/projects/argus/previews/prototype.png" width="150" height="150" /></a>
                                <div align="center">Prototype Contest</div></li>
                                <li><a href="/i/portfolio/projects/argus/flash3/1/s.html" title="Argus VP Chart Interaction/Animation Phase III"><img src="/i/portfolio/projects/argus/previews/flash2.png" width="150" height="150" /></a>
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
                                                <td><a href="/i/portfolio/projects/argus/storyboards/1.png" class="thickbox" title="Argus User Interface Storyboard Design">Argus User Interface Storyboard Design</a></td>
                                                <td>5 Days</td>
                                                <td align="center">10</td>
                                                <td>
                                                <a href="/i/portfolio/projects/argus/storyboards/1.png" class="thickbox" rel="story1" title="Argus User Interface Storyboard Design">1</a>
                                                <a href="/i/portfolio/projects/argus/storyboards/2.png" class="thickbox" rel="story1" title="Argus User Interface Storyboard Design">2</a>
                                                <a href="/i/portfolio/projects/argus/storyboards/3.png" class="thickbox" rel="story1" title="Argus User Interface Storyboard Design">3</a>
                                                <a href="/i/portfolio/projects/argus/storyboards/4.png" class="thickbox" rel="story1" title="Argus User Interface Storyboard Design">4</a>
                                                <a href="/i/portfolio/projects/argus/storyboards/5.png" class="thickbox" rel="story1" title="Argus User Interface Storyboard Design">5</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Flash Contest:</td>
                                                <td><a href="/i/portfolio/projects/argus/flash1/1/chart02.html" title="Argus VP Chart Interaction/Animation Contest" target="_blank">Argus VP Chart Interaction/Animation Contest</a></td>
                                                <td>3 Days</td>
                                                <td align="center">9</td>
                                                <td>
                                                <a href="/i/portfolio/projects/argus/flash1/1/chart02.html" title="Argus VP Chart Interaction/Animation Contest" target="_blank">1</a>
                                                <a href="/i/portfolio/projects/argus/flash1/2/submission1.html" title="Argus VP Chart Interaction/Animation Contest" target="_blank">2</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Prototype Contest:</td>
                                                <td><a href="/i/portfolio/projects/argus/prototype/login.html" title="Argus VP Prototype Contest Phase I" target="_blank">Argus VP Prototype Contest Phase I</a></td>
                                                <td>7 Days</td>
                                                <td align="center">3</td>
                                                <td>
                                                <a href="/i/portfolio/projects/argus/prototype/login.html" title="Argus VP Prototype Contest Phase I" target="_blank">1</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Flash Contest:</td>
                                                <td><a href="/i/portfolio/projects/argus/flash1b/1/submission1.html" title="Argus VP Map Interaction/Animation Contest">Argus VP Map Interaction/Animation Contest</a></td>
                                                <td>7 Days</td>
                                                <td align="center">6</td>
                                                <td>
                                                <a href="/i/portfolio/projects/argus/flash1b/1/submission1.html" title="Argus VP Map Interaction/Animation Contest" target="_blank">1</a>
                                                <a href="/i/portfolio/projects/argus/flash1b/2/chart02.html" title="Argus VP Map Interaction/Animation Contest" target="_blank">2</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Prototype Contest 2:</td>
                                                <td><a href="/i/portfolio/projects/argus/prototype/customer/index.html" title="Argus VP Prototype Contest Phase 2" target="_blank">Argus VP Prototype Contest Phase II</a></td>
                                                <td>7 Days</td>
                                                <td align="center">1</td>
                                                <td>
                                                <a href="/i/portfolio/projects/argus/prototype/customer/index.html" title="Argus VP Prototype Contest Phase 2" target="_blank">1</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Flash Contest 2:</td>
                                                <td><a href="/i/portfolio/projects/argus/flash2/1/map.html" title="Argus VP Chart Interaction/Animation Phase II" target="_blank">Argus VP Chart Interaction/Animation Phase II</a></td>
                                                <td>7 Days</td>
                                                <td align="center">3</td>
                                                <td>
                                                <a href="/i/portfolio/projects/argus/flash2/1/map.html" title="Argus VP Chart Interaction/Animation Phase II" target="_blank">1</a>
                                                <a href="/i/portfolio/projects/argus/flash2/2/argus_map.html" title="Argus VP Chart Interaction/Animation Phase II" target="_blank">2</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Flash Contest 3:</td>
                                                <td><a href="/i/portfolio/projects/argus/flash3/1/s.html" title="Argus VP Chart Interaction/Animation Phase III">Argus VP Chart Interaction/Animation Phase III</a></td>
                                                <td>7 Days</td>
                                                <td align="center">2</td>
                                                <td>
                                                <a href="/i/portfolio/projects/argus/flash3/1/s.html" title="Argus VP Chart Interaction/Animation Phase III">1</a>
                                                <a href="/i/portfolio/projects/argus/flash3/2/Argus%20Chart%20Interaction.html" title="Argus VP Chart Interaction/Animation Phase III">2</a>
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
