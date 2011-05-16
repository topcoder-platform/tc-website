<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio :: Studio Cup</title>
    
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="studio_digitalrun"/>
    </jsp:include>
    
    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages(); 
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
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
</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="../../top.jsp">
                <jsp:param name="section" value="cup" />
            </jsp:include>
        <br />
        <!-- container -->
            <div id="container">
                <div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                    <jsp:include page="nav.jsp" >
                        <jsp:param name="tabLev1" value="design"/>
                        <jsp:param name="tabLev2" value="prizes"/>
                    </jsp:include>
                    
                    <p>
                        <strong>Awards</strong>
                    </p>
                    
                    Each month, competitors will accumulate placement points according to the points table. In addition to the competition award earnings, the top five (5) finishers will win large awards and the top 1/2 of the point-getters in each month will receive a smaller award. A total of 50% of the total Studio Cup payment pool will be awarded in bonuses each month and will be distributed as follows: 
                    <br /><br />
                    <strong>Top Five Monthly Payments</strong><br />
                    <strong>1st</strong> - 50%<br />
                    <strong>2nd</strong> - 25%<br />
                    <strong>3rd</strong> - 13%<br />
                    <strong>4th</strong> - 8%<br />
                    <strong>5th</strong> - 4%
                    <br /><br />
                    If there is a tie for a position among the top 5 finishers, the tie will be resolved in the following manner (in order): 
                    <ol>
                    <li>The competitor who has the most higher-placed submissions in the month.</li>
                    <li>If a tie still remains, then the tied competitors will share equally the award money at hand.</li>
                    </ol>
                    <strong>Top Half Monthly Payments</strong><br />
                    The remaining 50% of the Studio Cup payment pool will be distributed among the top &#189; of point-getters (all competitors tied for the last spot will be included) and will be allocated based on the value of each placement point. 
                    <br /><br />
                    <%--
                    <strong>For example:</strong><br />
                    A total of 120 designers accumulate placement points during the Stage. We will sum the total number of placement points accumulated by the top 60 designers and divide $100,000 by that number to find the dollar per placement point bonus that is available to those 60 designers. If the total placement points of those 60 designers are 5,000, then each point is worth $20 ($100,000/5,000 = $20 per placement point). Each of the top 60 designers, including the top 5, will receive $20 for each placement point they earned during the Stage. In addition, the top 5 point-getters in each Stage will receive the Top Five Stage prizes outlined above.
                    <br /><br />
                    --%>
                    <!--As an added prize, the top point-getter of each month starting in January, 2009 and ending in August, 2009 will win a trip to the 2010 TCO finals to be recognized at the Awards Ceremony. 
                    <br /><br />-->
                    Digital Run payments will be paid at the end of each month within 60 days of announcing the Top Five and Top Half money winners.
                  <br /><br />

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../../foot.jsp"/>


</body>
</html>
