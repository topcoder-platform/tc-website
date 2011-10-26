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
    <jsp:param name="tabLev2" value="overview"/>
</jsp:include>

<p>
    <strong>Overview</strong>
</p>

Each contest posted in TopCoder Studio will carry a total point value. Placement points will be awarded based on the number of submissions that pass screening and receive a cash award, as follows:
<br /><br />
<a class="bcLink" name="point_table"></a>
<div align="center">
<table cellpadding="0" cellspacing="0" class="drStat" width="400">
<thead>
    <tr>
        <th class="title" colspan="8">Percentage of Placement Points</th>
    </tr>
   <tr>
      <th>&#160;</th>
      <th colspan="7"># of Submissions (Passed and Awarded)</th>
   </tr>
   <tr>
      <th class="c">Place</th>
      <th class="r">1</th>
      <th class="r">2</th>
      <th class="r">3</th>
      <th class="r">4</th>
      <th class="r">5</th>
   </tr>
</thead>
<tbody>
   <tr class="odd">
      <td class="c">1st</td>
      <td class="r">100%</td>
      <td class="r">70%</td>
      <td class="r">65%</td>
      <td class="r">60%</td>
      <td class="r">56%</td>
   </tr>
   <tr class="even">
      <td class="c">2nd</td>
      <td class="r">&#160;</td>
      <td class="r">30%</td>
      <td class="r">25%</td>
      <td class="r">22%</td>
      <td class="r">20%</td>
   </tr>
   <tr class="odd">
      <td class="c">3rd</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">10%</td>
      <td class="r">10%</td>
      <td class="r">10%</td>
   </tr>
   <tr class="even">
      <td class="c">4th</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">8%</td>
      <td class="r">8%</td>
   </tr>
   <tr class="odd">
      <td class="c">5th</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">&#160;</td>
      <td class="r">6%</td>
   </tr>
</tbody>
</table>
<!--<img src="i/digital_run/wireframe_sc_banner.png" />-->

</div>
<br /><br />
If more than five (5) submissions are ranked, the competitors who place in 6th position or below will not receive any placement points. 
<br /><br />
Up to 100% of placement points may be deducted for bugs or late final fixes. 20% of placement point will be deducted for every (24) hours a final fix is late. On a case-by-case basis, as determined by TopCoder Studio staff, additional placement points may be deducted for issues found in submissions, including (but not limited to) cheating or use of copyrighted materials, within 30 days of completion.
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
