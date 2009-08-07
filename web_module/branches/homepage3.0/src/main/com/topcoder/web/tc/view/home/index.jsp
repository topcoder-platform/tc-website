<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.BaseServlet, com.topcoder.web.common.SessionInfo" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>


<!-- External CSS -->
<link rel="stylesheet" href="css/main.css" media="all" type="text/css" />
<link rel="stylesheet" href="css/jquery.jcarousel.css" media="all" type="text/css" />

<!--[if IE 6]>
<link rel="stylesheet" type="text/css" media="screen" href="css/main-ie6.css" />
<![endif]-->

<!-- External JavaScript -->
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="js/scripts.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		// Setup the carousel functionalities
		
		setHoverClickFunctions = function(carousel){
			
			carousel.setup();
			carousel.options.auto = 5;
			
			$('#mycarousel LI').bind('mouseover', function(){
				carousel.stopAuto();
			});

			$('#mycarousel LI').bind('mouseout', function(){
				carousel.startAuto(5);
			});
			
			$(carousel.buttonNext).bind('click',function(){
				carousel.next();
			});
			
			$(carousel.buttonPrev).bind('click',function(){
				carousel.prev();
			});

		}
		
		$('#mycarousel').jcarousel({
			start: 1,
			scroll: 1,
			wrap: "both",
			initCallback: setHoverClickFunctions
		});
	

	});
</script>

</head>

<body>

	<div id="wrapper">
		
		<div class="wrapperContent">
		
			<div class="wrapperLeft"><div class="wrapperRight"><div class="wrapperBottom">
				<div class="wrapperTopLeft"><div class="wrapperTopRight">
					<div class="wrapperBottomLeft"><div class="wrapperBottomRight">
						
						<div id="mainContent">
							
							<div id="header">
							
								<a href="#" title="TopCoder" class="logo" onclick="test();"><img src="i/TopCoder_logo.png" alt="TopCoder" /></a>
								
								<h2 class="topTitle"><span class="hide">What could you accomplish  with a staff of</span><span class="questionMark"><tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/></span></h2>
								
							  	<div id="popupLinks"></div><!-- End #popupLinks -->
								<div id="popup"></div><!-- End #popup -->
								
								<h2 class="bottomTitle"><span class="hide">Our clients are finding out every day</span></h2>
							
							</div>
							
							<div class="contentTop">
								<div class="contentLeft">
									
									<a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" class="getStarted"></a>
								
								</div><!-- End .leftArea -->
								<div class="description">
									
									<h2>We've been "crowdsourcing" <br />since before there was a name for it.</h2>
									
									<p>
										Find out what customers ranging from small businesses to Fortune <br />500's have known since 2001. TopCoder's global community and unique model of competition-based development delivers higher quality results, faster and less expensively than has ever been previously possible.
									</p>
									
									
								
								</div><!-- End .description -->
							</div><!-- End .getStarted -->
							
							<div class="contentTop contentBg2">
								<div class="contentLeft">
									
									<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc" class="competeNow"></a>
								
								</div><!-- End .leftArea -->
								<div class="description">
									
									<h2>Designers and Developers</h2>
									
									<p>
										At this moment, there are <strong>75</strong> active competitions with<br />
<strong>$50,000</strong> in total prizes. Get your piece of the pie.
									</p>
									
									
								
								</div><!-- End .description -->
							</div><!-- End .getStarted -->
							
							<div class="carouselContainer" style="position: relative;">
								<div class="carouselBorderLeft"></div>
								
								<div class="carouselBorderRight"></div>
								
								<ul id="mycarousel" class="jcarousel-skin-topCoder">
									<li>
										<div class="carouselLeft">
											<a href="#" class="topCoderDirect"></a>
										</div>
										<div class="carouselRight">
											<p>
												TopCoder Direct Platform Opens Access to 170,000 Member Community of Software Designers, <br />Developers &amp; Creative Artists
											</p>
										</div>
									</li>
									<li>
										<div class="carouselLeft">
											<a href="#" class="placeholder"></a>
										</div>
										<div class="carouselRight">
											<p>
												Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquam velit sed dolor convallis molestie. Pellentesque ac nisl at tortor laoreet bibendum.
											</p>
										</div>
									</li>
									<li>
										<div class="carouselLeft">
											<a href="#" class="placeholder"></a>
										</div>
										<div class="carouselRight">
											<p>
												3- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquam velit sed dolor convallis molestie. Pellentesque ac nisl at tortor laoreet bibendum.
											</p>
										</div>
									</li>
									<li>
										<div class="carouselLeft">
											<a href="#" class="placeholder"></a>
										</div>
										<div class="carouselRight">
											<p>
												4- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquam velit sed dolor convallis molestie. Pellentesque ac nisl at tortor laoreet bibendum.
											</p>
										</div>
									</li>
									<li>
										<div class="carouselLeft">
											<a href="#" class="placeholder"></a>
										</div>
										<div class="carouselRight">
											<p>
												5- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquam velit sed dolor convallis molestie. Pellentesque ac nisl at tortor laoreet bibendum.
											</p>
										</div>
									</li>
								</ul>
							</div><!-- End .carouselContainer -->
							
							<div id="footer">
								<h2>1-866-TOPCODER OR <a href="mailto:answers@topcoder.com">ANSWERS@TOPCODER.COM</a></h2>
								<p>TopCoder is the world's largest competitive software development community with 212,587 developers representing over 200 countries.</p>
								<p>Copyright ©2001-2009, TopCoder, Inc. All rights reserved</p>
							</div><!-- End #footer -->
							
						</div><!-- End #mainContent -->
					
					</div></div>
				</div></div>
			</div></div></div>
		
		</div><!-- End .wrappeerContent -->
	
	</div><!-- End #wrapper -->


<%-- Google Analytics --%>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-6340959-1");
pageTracker._trackPageview();
</script>

</body>
</html>