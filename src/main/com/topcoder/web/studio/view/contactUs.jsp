<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio : Contact Us</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
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
			<jsp:include page="top.jsp">
            <jsp:param name="section" value="contact" />
        </jsp:include>
        <br/>
        <!-- container -->
            <div id="container">
         	    	<div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">
    
                        <h1>Contact Us</h1>

                        <div align="left" style="margin-bottom:20px;">
                            <table cellpadding="10" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td align="left" colspan="2">
                                            <strong>Corporate Address</strong><br />
                                            TopCoder, Inc.<br />
                                            95 Glastonbury Blvd<br />
                                            Glastonbury, CT 06033 U.S.A.<br />
                                            tel: 860.633.5540<br />
                                            fax: 860.657.4276
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td align="left">
                                            <strong>Member Support </strong><br />
                                            Email:
                                            <a href="mailto:studioadmin@topcoder.com?subject=TopCoder%20Studio%20General%20Questions">studioadmin@topcoder.com</a>
                                        </td>
                                        </tr>
                                    
                                    <tr>
                                        <td align="left">
                                            <strong>Sales</strong><br />
                                            Email: <a href="mailto:studiosales@topcoder.com">studiosales@topcoder.com</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>

    </div>
</body>
</html>
