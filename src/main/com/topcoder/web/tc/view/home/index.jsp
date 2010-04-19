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

<!-- External JavaScript -->
<script type="text/javascript" src="./js/home/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="./js/home/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="./js/home/jquery.timers.js"></script>
<script type="text/javascript" src="./js/home/scripts.js"></script>


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
							
								<a href="#" title="TopCoder" class="logo"><img src="./i/home/topcoder_logo.jpg" alt="TopCoder" /></a>
								
								<h2 class="mainTitle"><span>What could you accomplish with a team of</span><strong> <tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/>?</strong></h2>
								
								<!-- We will use the XML file to populate this area by people links -->
							  	<div id="popupLinks"></div>
								
								<!-- We will use the XML file to populate this area by popup messages -->
								<div id="popup"></div>
								
								<h2 class="title2"><span class="hide">Our clients are finding out every day</span></h2>
							
							</div><!-- End #header -->
							
							<div class="clientArea">
								<div class="buttonArea">
									
									<a href="home" class="getStarted"></a>
								
								</div><!-- End .leftArea -->
								<div class="description">
									
									<h2>We've been "crowdsourcing"<br />since before there was a name for it.</h2>
									<p>Find out what customers ranging from small businesses to Fortune 500's have known since 2001. TopCoder's global community and unique model of competition-based development delivers higher quality results, faster and less expensively than has ever been previously possible.</p>
									
									
								</div><!-- End .description -->
							</div><!-- End .getStarted -->
							
							<div class="clientArea contentBg2">
								<div class="competeText">
									<div class="action">Compete on TopCoder</div>
									At this moment, there are <strong><%=activeCount%></strong> active competitions with <strong>$<tc-webtag:format object="<%=activeTotal%>" format="#,##0"/></strong> in total prizes.
								</div>
								<div class="buttonArea2">	
                                    <div class="studio">
                                        <a href="http://studio.topcoder.com" class="designNow"></a>
                                        <p>Ready for a creative challenge?</p>
                                    </div>
                                    <div class="dev">
                                        <a href="http://www.topcoder.com/tc" class="developNow"></a>
                                        <p>Compete in Coding &amp; Software Contests.</p>
                                    </div>
                                    
                                    

								</div><!-- End .leftArea -->
								
							</div><!-- End .getStarted -->
							
							
							<div id="footer"> 
                           			<p>TopCoder is the world's largest competitive software development community with <tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/> developers representing over 200 countries.<br /> 
									Copyright ©2001-2010, TopCoder, Inc. All rights reserved</p> 
 
                                    <p><a href="http://topcoder.com/home/contact-us/">Contact Us</a> | <a href="http://topcoder.com/home/what-is-topcoder/">About TopCoder</a> | <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">Register</a></p> 
 
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
