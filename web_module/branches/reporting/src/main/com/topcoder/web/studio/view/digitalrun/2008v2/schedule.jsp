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
    <jsp:param name="tabLev2" value="schedule"/>
</jsp:include>

<p>
    <strong>Schedule</strong>
</p>

Points and payment pool money are available for each month of the year. The monthly schedule shown below includes competitions posted within the following date range:
<br /><br />

January 1 - January 31
<br />February 1 - February 28
<br />March 1 - March 31
<br />April 1 - April 30
<br />May 1 - May 31
<br />June 1 - June 30
<br />July 1 - July 31
<br />August 1 - August 31
<br />September 1 - September 30
<br />October 1 - October 31
<br />November 1 - November 30
<br />December 1 - December 31
<br /><br />

In addition, a special 3-month Wireframe tournament is happening in 2011.
<br /><br />
April 1 - June 30, 2011
<br /><br />
During each of these months, a single winner will be chosen based on how many points they accumulated during wireframe contests. One winner from each month will win an all-expenses paid trip to TCO11! See <a href="http://community.topcoder.com/tco11">here</a> for more details. 
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
