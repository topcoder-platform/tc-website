<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Studio :: Studio Cup</title>
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="studio_digitalrun"/>
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

The 2008 Studio Cup is six (6) months long, with points and prize pool money available for each month. The monthly schedule shown below includes competitions posted within the following date range: 
<br /><br />
July 1 - July 31, 2008
<br />August 1 - August 31, 2008
<br />September 1 - September 30, 2008
<br />October 1 - October 31, 2008
<br />November 1 - November 30, 2008
<br />December 1 - December 31, 2008
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
