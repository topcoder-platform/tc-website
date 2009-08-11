<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.BaseServlet, com.topcoder.web.common.SessionInfo" %>
<%@ page import="com.topcoder.web.tc.controller.request.Home" %>
<%@ page import="com.topcoder.web.tc.controller.request.HomeHelper" %>
<%@ page import="com.topcoder.web.tc.model.ActiveContestsSummary" %>
<%@ page import="java.util.Map" %>
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
<link rel="stylesheet" href="./css/home/main.css" media="all" type="text/css" />
<link rel="stylesheet" href="./css/home/jquery.jcarousel.css" media="all" type="text/css" />

<!--[if IE 6]>
<link rel="stylesheet" type="text/css" media="screen" href="css/main-ie6.css" />
<![endif]-->

<!-- External JavaScript -->
<script type="text/javascript" src="./js/home/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="./js/home/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="./js/home/jquery.timers.js"></script>
<script type="text/javascript" src="./js/home/scripts.js"></script>

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

<%
    // get active contests summary for totals
    Map<String, ActiveContestsSummary> activeContests = HomeHelper.getActiveContests();
    int activeCount = 0;
    double activeTotal = 0;
    for (Map.Entry<String, ActiveContestsSummary> e : activeContests .entrySet()) {
         if (e.getKey() != Home.MM && e.getKey() != Home.DR) {
             activeCount += e.getValue().getContestCount();
             activeTotal += e.getValue().getPrizeTotal();
         }
    }
%>
</head>

<body>
	
	<div id="wrapper">
		
		<div class="wrapperContent">
		
			<div class="wrapperLeft"><div class="wrapperRight"><div class="wrapperBottom">
				<div class="wrapperTopLeft"><div class="wrapperTopRight">
					<div class="wrapperBottomLeft"><div class="wrapperBottomRight">
						
						<div id="mainContent">
							
							<div id="header">
							
								<a href="#" title="TopCoder" class="logo"><img src="./i/home/TopCoder_logo.png" alt="TopCoder" /></a>
								
								<h2 class="mainTitle"><span>What could you accomplish with a team of</span><strong> <tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/>?</strong></h2>
								
								<!-- We will use the XML file to populate this area by people links -->
							  	<div id="popupLinks"></div>
								
								<!-- We will use the XML file to populate this area by popup messages -->
								<div id="popup"></div>
								
								<h2 class="title2"><span class="hide">Our clients are finding out every day</span></h2>
							
							</div><!-- End #header -->
							
							<div class="clientArea">
								<div class="buttonArea">
									
									<a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" class="getStarted"></a>
								
								</div><!-- End .leftArea -->
								<div class="description">
									
									<h2>We've been "crowdsourcing"<br />since before there was a name for it.</h2>
									<p>Find out what customers ranging from small businesses to Fortune 500's have known since 2001. TopCoder's global community and unique model of competition-based development delivers higher quality results, faster and less expensively than has ever been previously possible.</p>
									
									
								</div><!-- End .description -->
							</div><!-- End .getStarted -->
							
							<div class="clientArea contentBg2">
								<div class="competeText">
									<div class="action">Compete on TopCoder and get your piece of the pie!</div>
									At this moment, there are <strong><%=activeCount%></strong> active competitions with <strong>$<tc-webtag:format object="<%=activeTotal%>" format="#,##0"/></strong> in total prizes.
								</div>
								<div class="buttonArea2">	
                                    <div class="studio">
                                        <a href="http://studio.topcoder.com" class="designNow"></a>
                                        <p>Ready for a creative challenge?</p>
                                    </div>
                                    <div class="dev">
                                        <a href="http://www.topcoder.com/tc" class="developNow"></a>
                                        <p>Think you can handle the development?</p>
                                    </div>
                                    
                                    

								</div><!-- End .leftArea -->
								
							</div><!-- End .getStarted -->
							
							<div class="carouselContainer">
							
								<!-- Vertical lines behind the carousel buttons -->
								<div class="carouselBorderLeft"></div>
								
								<div class="carouselBorderRight"></div>
								
									<ul id="mycarousel" class="jcarousel-skin-topCoder">
											<li>
													<div class="carouselImage">
															<!-- To add a new image replace the class name with background-image=url(path-of-your-image)-->
															<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=pr_103008"><img src="http://www.topcoder.com/images/home/news-carousel/tcdirect.png" alt="TopCoder Direct" /></a>
													</div>
													<div class="carouselContent">
															<p>TopCoder Direct Platform Opens Access to <tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/> Member Community of Software Designers, <br />Developers &amp; Creative Artists</p>
													</div>
											</li>
											<li>
													<div class="carouselImage">
															<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102308"><img src="http://www.topcoder.com/images/home/news-carousel/fast50.png" alt="Deloitte Technology Fast 50" /></a>
													</div>
													<div class="carouselContent">
															<p><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102308">TopCoder Ranked Number 11 in Deloitte's Technology Fast 50 Program for New York, New Jersey and Connecticut</a> </p>
													</div>
											</li>
											<li>
													<div class="carouselImage">
															<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=pr_100608"><img src="http://www.topcoder.com/images/home/news-carousel/sd-bestpractices.png" alt="Software Development Best Practices TopCoder Challenge" /></a>
													</div>
													<div class="carouselContent">
															<p><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=pr_100608">TopCoder Joins Lineups for SD Best Practices and Software Business 2008 Conferences October 28-31</a></p>
													</div>
											</li>
											<li>
													<div class="carouselImage">
															<a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=LinkTracking&amp;link=http://industry.bnet.com/technology/1000470/aol-finds-topcoder-tops/&amp;refer=homepage"><img src="http://www.topcoder.com/images/home/news-carousel/bnet.png" alt="BNET" /></a>
													</div>
													<div class="carouselContent">
															<p><a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=LinkTracking&amp;link=http://industry.bnet.com/technology/1000470/aol-finds-topcoder-tops/&amp;refer=homepage">AOL Finds TopCoder Tops</a></p>
					AOL technical director Nic Perez talks about his experience as a TopCoder client for a number of major projects over the last three years.
													</div>
											</li>
											<li>
													<div class="carouselImage">
															<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=LinkTracking&amp;link=http://www.pcworld.com/businesscenter/article/152324/topcoder_eyeing_smb_market.html&amp;refer=homepage"><img src="http://www.topcoder.com/images/home/news-carousel/pcworld.png" alt="PCWorld" /></a>
													</div>
													<div class="carouselContent">
															<p><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=LinkTracking&amp;link=http://www.pcworld.com/businesscenter/article/152324/topcoder_eyeing_smb_market.html&amp;refer=homepage">TopCoder Eyeing SMB Market</a></p>
					TopCoder is turning its sights on the SMB market with a new portal called TopCoder Direct that will come out of beta at the end of October.
													</div>
											</li>
									</ul>
							</div><!-- End .carouselContainer -->

							
							<div id="footer">
								<h2>1-866-TOPCODER OR <a href="mailto:answers@topcoder.com">ANSWERS@TOPCODER.COM</a></h2>
								<p>TopCoder is the world's largest competitive software development community with <tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/> developers representing over 200 countries.</p>
								<p>Copyright ©2001-2009, TopCoder, Inc. All rights reserved</p>

								<br>
								<p><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Us</a> | <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=index">About TopCoder</a> | <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">Register</a></p>

							</div><!-- End #footer -->
							
						</div><!-- End #mainContent -->
					
					</div></div>
				</div></div>
			</div></div></div>
		
		</div><!-- End .wrappeerContent -->
	
	</div><!-- End #wrapper -->

</body>
</html>