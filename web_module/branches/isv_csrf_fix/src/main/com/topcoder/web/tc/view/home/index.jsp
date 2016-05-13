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
    String handle = null;
    if (sessionInfo != null)
    {
        handle = sessionInfo.getHandle();
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>TopCoder,Inc.</title> 
	<!-- Meta Tags -->
	<meta http-equiv="Content-Type" content="text/html; charset=us-ascii" />
	<meta http-equiv="Refresh" content="0; URL=http://www.topcoder.com/">
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
	<script type="text/javascript" src="./js/home/jquery.jfeed.pack.js">
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
				<a href="http://studio.topcoder.com/">Design</a>
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
				<li id="tcblog">
				<div class="tip hide">
					<div class="tipContent">
						<p>
							Top<strong>Coder</strong> Blog, News, and Updates
						</p>
					</div>
					<span class="tipArrow"></span>
				</div>
				<a href="http://www.topcoder.com/aboutus/news/">Press Room</a>
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
				<a href="http://www.topcoder.com/help">Help</a>
				</li>
				<li id="aboutUs">
				<div class="tip hide">
					<div class="tipContent">
						<p>
							Drop us a line!
						</p>
					</div>
					<span class="tipArrow"></span>
				</div>
				<a href="http://www.topcoder.com/aboutus/contact-us/">Contact Us</a>
				</li>
                <li id="blog">
                <div class="tip hide">
                        <div class="tipContent">
                                <p>
                                        Read about virtualization!
                                </p>
                        </div>
                        <span class="tipArrow"></span>
                </div>
                <a href="http://info.topcoder.com/blog">Blog</a>
                </li>
				<li id="register">
				<div class="tip hide">
					<div class="tipContent">
						<p>
							Register with TopCoder
						</p>
					</div>
					<span class="tipArrow"></span>
				</div>
				<div style="margin-top:-42px; padding-right:0"><a href="http://www.topcoder.com/reg2"><img src="./i/home/register.png" alt="Register with TopCoder" /></a></div>
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
								The world's largest competitive software development community
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
											 TopCoder is revolutionizing the software design and development process by tapping in to our unlimited global community to work for you.<br />
											<br />
										</p>
										<!-- NOTE: Option values must be on one line to render properly -->
										<select name="c_select" class="dropdownList">
											<option value="1">What can we help you do today? </option>
											<option value="<tc-webtag:linkTracking link='http://www.topcoder.com/' refer='About' />">Learn about TopCoder </option>
											<option value="<tc-webtag:linkTracking link='http://www.topcoder.com/' refer='Community' />">Build my own community </option>
											<option value="<tc-webtag:linkTracking link='http://www.topcoder.com/' refer='Resources' />">Extend my internal resources with TopCoder </option>
											<option value="<tc-webtag:linkTracking link='http://www.topcoder.com/' refer='Apps' />">Build a website, phone app, web presence </option>
											<option value="<tc-webtag:linkTracking link='http://www.topcoder.com/' refer='Data' />">Analyze my data to see what it's telling me </option>
											<option value="<tc-webtag:linkTracking link='http://www.topcoder.com/' refer='Offer' />">See what else TopCoder has to offer </option>
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
						<!-- RSS Feed -->
						<div id="rss">
							<div class="topNews">Top News:</div>
							<div id="loading"><img src="/i/home/loading.gif" alt="Loading RSS Feed..." /></div>
							<div class="scrollWrap">
								<ul id="rssContent" style="width: 700px;">
								</ul>
							</div>
							<div class="scrollNav">
								<a class="movePrev" href="javascript:;"><span class="hide">Previous</span></a>
								<a class="moveNext" href="javascript:;"><span class="hide">Next</span></a>
							</div>

							<div class="icon">
								<a href="http://topcoder.com/home/blog/category/top-news/feed/"><span class="hide">RSS Feed</span></a>
							</div>
						</div>
						<!-- end rss feed -->
						<!-- the bottom scroll -->
						<div class="bottomScrollDiv" style="clear: both;">
							<div class="bottomScroll_inner">
								<div id="wrap">
									<div id="slide">
										<div id="p1">
											<img src="./i/home/client_logo_paypal.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Software Factory / Directed Innovation</dd>
											</dl>
											<p>
												PayPal X challenges powered by TopCoder is a community focused on competing with PayPal X technologies for all sorts of cool projects - from building new apps, to working on SDKS, even working on mobile libraries and products!  
											</p>
										</div>
										<div id="p2">
											<img src="./i/home/client_logo_alcatel.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Software Factory / Directed Innovation</dd>
											</dl>
											<p>
                                                Assist internal engineering teams to build various APIs to expose capabilities within PayPalX's core products.  Provide open innovation challenges to use and display the capabilities of those APIs.
         									</p>
										</div>
										<div id="p3">
											<img src="./i/home/client_logo_bestbuy.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Directed Innovation</dd>
											</dl>
											<p>
												Not all of the good ideas are found internally &bull; BestBuy leveraged the innovation of the community to 'Remix' portions of their site. 
											</p>
										</div>
										<div id="p4">
											<img src="./i/home/client_logo_lendingtree.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Software Factory</dd>
											</dl>
											<p>
												Access to thousands of members at the ready &bull; Website design, development, support and ongoing enhancements of key products.
											</p>
										</div>
										<div id="p5">
											<img src="./i/home/client_logo_facebook.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Sponsorship</dd>
											</dl>
											<p>
												Growth, branding, on-site participation at the TopCoder Open in Las Vegas, and access to the TopCoder community.
											</p>
										</div>
										<div id="p6">
											<img src="./i/home/client_logo_verisign.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Software Factory / Sponsorship</dd>
											</dl>
											<p>
												Extension to internal team capability to handle increased development bandwidth.  Multi-year sponsor of TopCoder Open.	
											</p>
										</div>
										<div id="p7">
											<img src="./i/home/client_logo_espn.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Software Factory / Sponsorship</dd>
											</dl>
											<p>
												 Website Development &bull; Game Development &bull;  ERP Development &bull;  Winning Formula Challenge to create predictive sports.
											</p>
										</div>
										<div id="p8">
											<img src="./i/home/client_logo_disney.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Software Factory</dd>
											</dl>
											<p>
												 Game Development &bull;  Your Take! Graphics Design Competitions to find and identify the next generation of graphics artists.	
											</p>
										</div>
										<div id="p9">
											<img src="./i/home/client_logo_yandex.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Sponsorship</dd>
											</dl>
											<p>
												Global branding as a 2010 TopCoder Open Sponsor.
											</p>
										</div>
										<div id="p10">
											<img src="./i/home/client_logo_nsa.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Tournament-Patron</dd>
											</dl>
											<p>
												Original Patron of the TopCoder Open and avid Patron of TopCoder Marathon Matches.	
											</p>
										</div>
										<div id="p11">
											<img src="./i/home/client_logo_youdao.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Private Label Sponsor</dd>
											</dl>
											<p>
												Identification of talent in over 17,000 registrants from China based software tournament.
											</p>
										</div>
										<div id="p12">
											<img src="./i/home/client_logo_britishtel.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Directed Innovation / Sponsorship</dd>
											</dl>
											<p>
												Directed innovation challenges for their Connected Services Sandbox and Ribbit &bull;  Sponsor of TopCoder Open in Las Vegas.
											</p>
										</div>
										<div id="p13">
											<img src="./i/home/client_logo_ubs.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Virtual Software Factory / Sponsorship</dd>
											</dl>
											<p>
												Leverage the global talent base for complex data mining and reporting &bull; Sponsorship of TopCoder Open in Las Vegas.
											</p>
										</div>
										<div id="p14">
											<img src="./i/home/client_logo_ieee.gif" width="371" height="107" alt="" />
											<dl>
												<dt>Platforms:</dt>
												<dd>Sponsorship</dd>
											</dl>
											<p>
												 Brand awareness and education for the TopCoder Community.
											</p>
										</div>
										<div id="p15">
											<img src="./i/home/client_logo_salkins.gif" width="371" height="107" alt="" />
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
										<a id="b14" href="javascript:;" name="b14">
										<span class="hide">14</span>
										</a>
										<a id="b15" href="javascript:;" name="b14">
										<span class="hide">15</span>
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
					developers representing more than 200 countries.
				</p>
				<p>
					<strong>Copyright TopCoder, Inc. 2001-<script type="text/javascript">d=new Date();document.write(d.getFullYear());</script></strong>
				</p>
			</div>
		</div>
		<!-- end #footer -->
	</div>
	<!-- end #mainContent -->
</div>
<!-- end #outlay -->

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-6340959-1']);
  _gaq.push(['_setDomainName', '.topcoder.com']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>
</html>
