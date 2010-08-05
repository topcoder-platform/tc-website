<%--
  - Author: TCSDEVELOPER
  - Version: 1.0
  - Copyright (C) 2010 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the home page.
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
--%>
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
    //SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute("sessionInfo");
    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>
	</title>
	<!-- Meta Tags -->
	<meta http-equiv="Content-Type" content="text/html; charset=us-ascii" />
	
	<!-- External CSS -->
	<link href="./css/home/homepage.css" rel="stylesheet" type="text/css" />
	<!--[if IE 6]>
	<link rel="stylesheet" type="text/css" media="screen" href="./css/home/homepage-ie6.css" />
	<![endif]-->
	
	<!-- External javascript -->
	<script type="text/javascript" src="./js/home/jquery-1.4.2.min.js">
	</script>
	<script type="text/javascript" src="./js/home/jquery.selectbox-0.5.js">
	</script>
	<script type="text/javascript" src="./js/home/initSlider.js">
	</script>
</head>
<body>
<!-- out Lay -->
<div id="outLay">
	<!-- main Content -->
	<div id="mainContent">
		<!-- header -->
		<div id="header">
			<!-- logo -->
			<div id="logo">
				<a href="javascript:;">
				<span class="hide">TOPCODER</span>
				</a>
			</div>
			<!-- main nav -->
			<ul id="mainNav">
				<li id="competeTopcoder">
				<div class="tip hide">
					<div class="tipContent">
						<p>
							Compete in graphic design competitions
						</p>
					</div>
					<span class="tipArrow"></span>
				</div>
				<a href="http://www.studio.topocder.com/">Design</a>
				</li>
				<li id="competeStudio">
				<div class="tip hide">
					<div class="tipContent">
						<p>
							Compete in software competitions
						</p>
					</div>
					<span class="tipArrow"></span>
				</div>
				<a href="http://www.topcoder.com/tc">Develop</a>
				</li>
				<li id="build">
				<div class="tip hide">
					<div class="tipContent">
						<p>
							Top<strong>Coder</strong> in the news
						</p>
					</div>
					<span class="tipArrow"></span>
				</div>
				<a href="http://topcoder.com/home/pressroom/">Press Room</a>
				</li>
				<li id="contactUs">
				<div class="tip hide">
					<div class="tipContent">
						<p>
							Let us know how we can help!
						</p>
					</div>
					<span class="tipArrow"></span>
				</div>
				<a href="http://topcoder.com/home/help-form/">Help</a>
				</li>
				<li id="aboutUs">
				<div class="tip hide">
					<div class="tipContent">
						<p>
							Drop us a line, we'd love to hear from you!
						</p>
					</div>
					<span class="tipArrow"></span>
				</div>
				<a href="http://topcoder.com/home/lets-talk/">Contact Us</a>
				</li>
			</ul>
			<!-- end mainNav -->
		</div>
		<!-- end #header -->
		<!-- content -->
		<div id="content">
			<div class="content_top">
				<div class="content_bottom">
					<div class="content_inner">
						<!-- title text -->
						<div class="titleText">
							<p class="info">
								The world's largest competitive software development community.
							</p>
							<h1 class="community">
								The Top<span class="red">Coder</span> Community is 
								<span class="red">
									<tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/>
								</span> 
								strong.
							</h1>
						</div>
						<!-- end .titleText -->
						<!-- map -->
						<div class="map">
							<div class="mapInner">
								<!-- intro -->
								<div class="intro">
									<div class="introsub">
										<p>
											<span class="large">What is TopCoder?</span>
											<br />
											<br />
											 TopCoder is Innovation.<br />
											<br />
											 TopCoder is revolutionizing the software design and development process by tapping in to our unlimited global workforce to work for you.<br />
											<br />
										</p>
										<!-- NOTE: Option values must be on one line to render properly -->
										<select name="c_select" class="dropdownList">
											<option value="1">What can we help you do today? </option>
											<option value="<tc-webtag:linkTracking link='http://topcoder.com/home/community' refer='/' />">Learn about TopCoder </option>
											<option value="<tc-webtag:linkTracking link='http://topcoder.com/home/community' refer='/' />">Build my own community </option>
											<option value="<tc-webtag:linkTracking link='http://topcoder.com/home/community' refer='/' />">Extend my internal resources with TopCoder </option>
											<option value="<tc-webtag:linkTracking link='http://topcoder.com/home/community' refer='/' />">Build a website, phone app, web presence </option>
											<option value="<tc-webtag:linkTracking link='http://topcoder.com/home/community' refer='/' />">Analyze my data to see what it's telling me </option>
											<option value="<tc-webtag:linkTracking link='http://topcoder.com/home/community' refer='/' />">See what else TopCoder has to offer me </option>
										</select>
									</div>
									<!-- get start -->
									<div class="getStartButton">
										<a href="javascript:;">
										<span class="hide">Get Started</span>
										</a>
									</div>
									<!-- end .getStartButton -->
								</div>
								<!-- end .intro -->
							</div>
						</div>
						<!-- end .map -->
						<!-- the bottom scroll -->
						<div class="bottomScrollDiv">
							<div class="bottomScroll_inner">
								<div id="wrap">
									<div id="slide">
										<div id="p1">
											<a href="javascript:;">
											<img src="./i/home/client_logo_bestbuy.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Directed Innovation</dd>
											</dl>
											<p>
												Not all of the good ideas are found internally &bull; BestBuy leveraged the innovation of the community to 'Remix' portions of their site. 
											</p>
										</div>
										<div id="p2">
											<a href="javascript:;">
											<img src="./i/home/client_logo_lendingtree.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Factory</dd>
											</dl>
											<p>
												Access to thousands of members at the ready &bull; Website design, development, support and ongoing enhancements of key products.
											</p>
										</div>
										<div id="p3">
											<a href="javascript:;">
											<img src="./i/home/client_logo_facebook.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Sponsorship</dd>
											</dl>
											<p>
												Growth, branding, on-site participation at the TopCoder Open in Las Vegas, and access to the TopCoder community.
											</p>
										</div>
										<div id="p4">
											<a href="javascript:;">
											<img src="./i/home/client_logo_verisign.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Factory, Sponsorship</dd>
											</dl>
											<p>
												Extension to internal team capability to handle increased development bandwidth.  Multi-year sponsor of TopCoder Open.	
											</p>
										</div>
										<div id="p5">
											<a href="javascript:;">
											<img src="./i/home/client_logo_espn.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Factory and Directed Innovation</dd>
											</dl>
											<p>
												 Website Development &bull; Game Development &bull;  ERP Development &bull;  Winning Formula Challenge to create predictive sports.
											</p>
										</div>
										<div id="p6">
											<a href="javascript:;">
											<img src="./i/home/client_logo_disney.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Factory</dd>
											</dl>
											<p>
												 Game Development &bull;  Your Take! Graphics Design Competitions to find and identify the next generation of graphics artists.	
											</p>
										</div>
										<div id="p7">
											<a href="javascript:;">
											<img src="./i/home/client_logo_yandex.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Sponsorship</dd>
											</dl>
											<p>
												Global branding as a 2010 TopCoder Open Sponsor.
											</p>
										</div>
										<div id="p8">
											<a href="javascript:;">
											<img src="./i/home/client_logo_nsa.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Tournament-Patron</dd>
											</dl>
											<p>
												Original Patron of the TopCoder Open and avid Patron of TopCoder Marathon Matches.	
											</p>
										</div>
										<div id="p9">
											<a href="javascript:;">
											<img src="./i/home/client_logo_youdao.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Private Label Sponsor</dd>
											</dl>
											<p>
												Identification of talent in over 17,000 registrants from China based software tournament.
											</p>
										</div>
										<div id="p10">
											<a href="javascript:;">
											<img src="./i/home/client_logo_britishtel.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Directed Innovation / Sponsorship</dd>
											</dl>
											<p>
												Directed innovation challenges for their Connected Services Sandbox and Ribbit &bull;  Sponsor of TopCoder Open in Las Vegas.
											</p>
										</div>
										<div id="p11">
											<a href="javascript:;">
											<img src="./i/home/client_logo_ubs.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Software Factory / Sponsorship</dd>
											</dl>
											<p>
												Leverage the global talent base for complex data mining and reporting &bull; Sponsorship of TopCoder Open in Las Vegas.
											</p>
										</div>
										<div id="p12">
											<a href="javascript:;">
											<img src="./i/home/client_logo_ieee.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Sponsorship</dd>
											</dl>
											<p>
												 Brand awareness and education for the TopCoder Community.
											</p>
										</div>
										<div id="p13">
											<a href="javascript:;">
											<img src="./i/home/client_logo_salkins.gif" width="371" height="107" alt="" />
											</a>
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Software Factory</dd>
											</dl>
											<p>
												Improve the sharing and analysis of genetic research through software products built by the TopCoder community.
											</p>
										</div>
									</div>
									<span id="previous">
									<a href="javascript:;" class="hide">Previous</a>
									</span><span id="next">
									<a href="javascript:;">Next</a>
									</span>
									<div id="buttons">
										<a id="b1" href="javascript:;" class="hover" name="b1">
										<span class="hide">1</span>
										</a>
										<a id="b2" href="javascript:;" name="b2">
										<span class="hide">2</span>
										</a>
										<a id="b3" href="javascript:;" name="b3">
										<span class="hide">3</span>
										</a>
										<a id="b4" href="javascript:;" name="b4">
										<span class="hide">4</span>
										</a>
										<a id="b5" href="javascript:;" name="b5">
										<span class="hide">5</span>
										</a>
										<a id="b6" href="javascript:;" name="b6">
										<span class="hide">6</span>
										</a>
										<a id="b7" href="javascript:;" name="b7">
										<span class="hide">7</span>
										</a>
										<a id="b8" href="javascript:;" name="b8">
										<span class="hide">8</span>
										</a>
										<a id="b9" href="javascript:;" name="b9">
										<span class="hide">9</span>
										</a>
										<a id="b10" href="javascript:;" name="b10">
										<span class="hide">10</span>
										</a>
										<a id="b11" href="javascript:;" name="b11">
										<span class="hide">11</span>
										</a>
										<a id="b12" href="javascript:;" name="b12">
										<span class="hide">12</span>
										</a>
										<a id="b13" href="javascript:;" name="b13">
										<span class="hide">13</span>
										</a>
									</div>
								</div>
							</div>
						</div>
						<!-- end the bottom scroll -->
					</div>
					<!-- end inner -->
				</div>
				<!-- end bottom -->
			</div>
			<!-- end top -->
		</div>
		<!-- end #content -->
		<!-- footer -->
		<div id="footer">
			<div class="footer_inner">
				<p>
					TopCoder is the world's largest competitive software development community with
					<tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/>
					developers representing over 200 countries.
				</p>
				<p>
					<strong>Copyright &copy;2001-2010, TopCoder, Inc. All rights reserved</strong>
				</p>
			</div>
		</div>
		<!-- end #footer -->
	</div>
	<!-- end #mainContent -->
</div>
<!-- end #outlay -->
</body>
</html>
