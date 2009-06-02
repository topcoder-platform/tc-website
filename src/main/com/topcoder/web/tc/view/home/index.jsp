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

<link rel="stylesheet" type="text/css" media="screen" href="/css/home/screen.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/css/home/jquery.jcarousel.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/css/home/main-navigation.css" />

<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/home/screen-ie7.css" /><![endif]-->
<!--[if IE 6]><link rel="stylesheet" type="text/css" href="/css/home/screen-ie6.css" /><![endif]-->

<script src="/js/home/jquery-1.2.6.min.js" type="text/javascript"></script>
<script src="/js/home/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
			$(document).ready(function(){
				//Run the script to preload images from CSS
				$.preloadCssImages(); 
			});
	</script>
<script src="/js/home/jquery.hoverIntent.minified.js" type="text/javascript"></script>
<script src="/js/home/jquery.jcarousel.pack.js" type="text/javascript"></script>

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


    jQuery(document).ready(function() {
        jQuery('#news-carousel').jcarousel({
            scroll: 1,
            easing: 'swing',
            wrap: 'both'
        });
    });

	$("#tco09").hide();
	
		var randomnumber=Math.floor(Math.random()*2)
		if (randomnumber==0) {
			$("#tco09").show();
		} else if (randomnumber==1) {
			$("#tco09").show();
		}

	
    window.alert = function() {
    return;
};


});

    function openWin(url, name) {
        win = window.open(url, name, "menubar=no,status=no,scrollbars=yes,resizable=no,toolbar=no,width=650,height=650");
        win.location.href = url;
        win.focus();
    }
    window.name="main"; // required for whatistopcoder popup targeting
    //--%>

</script>
</head>

<body>

    <div id="header">
        <div class="wrapper">

<%-- MASTHEAD AND LOGO --%>
            <h1><a href="http://<%=ApplicationServer.SERVER_NAME%>/" title="TopCoder"><span>TopCoder Direct</span></a></h1>
            <h2 id="ready_engage"><span>Ready.. ENGAGE</span></h2>

<%-- MAIN NAVIGATION --%>
            <div id="nav">
                <h3 class="hide">Main Navigation</h3>
                <ul>
                    <li class="left on"><a href="http://<%=ApplicationServer.SERVER_NAME%>/">TopCoder Home</a></li>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">Engage</a>
                        <ul>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct/">TopCoder Direct</a></li>
                            <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/">Components</a></li>
                            <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/indexTCS.jsp">Software</a></li>
                            <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/platform-tools.jsp">Platform Tools</a></li>
                            <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/training.jsp">Training &amp; Mentoring</a></li>
                            <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/support.jsp">Support &amp; Maintenance</a></li>
                            <li class="last-li"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Us</a></li>
                        </ul>
                    </li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc">Compete</a>
                        <ul>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&amp;pt=23">Conceptualization</a></li>
                    	    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&amp;pt=6">Specification</a></li>
                    	    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&amp;pt=7">Architecture</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&amp;ph=112">Component Design</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&amp;ph=113">Component Development</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewAssemblyActiveContests">Assembly</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=ViewActiveContests">Marathon Matches</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/Bug+Races">Bug Races</a></li>
                            <li class="last-li"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">Studio Competitions</a></li>
                        </ul>
                    </li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/">Studio</a>
                        <ul>
                            <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">Active Contests</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct/">Launch a Contest</a></li>
                            <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums">Studio Forums</a></li>
                            <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/blog/">Studio Blog</a></li>
                            <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=MyStudioHome">My Studio</a></li>
                            <li class="last-li"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&amp;d1=contactUs">Contact Studio</a></li>
                        </ul>
                    </li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc">Community</a>
                        <ul>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">Join TopCoder</a></li>
                            <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome">My TopCoder</a></li>
                            <li><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">TopCoder Forums</a></li>
                            <li class="last-li"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums">Studio Forums</a></li>
                        </ul>
                    </li>
                </ul>
            </div><%-- #navigation ends --%>

            <%-- SUB NAVIGATION --%>
            <div id="nav_support">
                <h3 class="hide">SUB Navigation</h3>
                <ul>
                    <li class="left"><a href="http://<%=ApplicationServer.SERVER_NAME%>/">TopCoder.com</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=index">About TopCoder</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=index">News</a></li>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Us</a></li>


                    <% if ( !sessionInfo.isAnonymous() ) { %>
            		<li class="logged-in"><span class="welcome">Hello,&nbsp;</span> <tc-webtag:handle coderId='<%=sessionInfo.getUserId()%>' darkBG="true" /></li>
            		<li class="right"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Logout&nextpage=http://<%=ApplicationServer.SERVER_NAME%>">Logout</a></li>
        			<% } else {%>
                	<li class="right"><a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&amp;module=Login">Login</a></li>
            		<% } %>
                </ul>
            </div><%-- #navigation ends --%>
        </div>
      <%-- .wrapper ends --%>
    </div><%-- #header ends --%>

<%-- CONTENT BLOCKS --%>
    <div id="content">
        <div class="wrapper">

<%-- TOPCODER DIRECT BANNER --%>
            <div id="welcome-banner">
                <h2><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/"><strong>Engage!</strong> Plug into the <em>world's largest community</em> of competitive <em>software developers</em></a></h2>
            </div>
            <div id="contact-button">
            	<h2><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Let's Talk about how TopCoder can work for you! Contact us</a></h2>
            </div>
<%-- MAIN CONTENT --%>
            <div id="content-main">
            <div id="tco-banner">
            	<img src="/images/TCO09.jpg" width="902" height="121" border="0" usemap="#Map" />
					<map name="Map" id="Map">
					<area shape="rect" coords="597,76,653,112" href="http://www.topcoder.com/tco09/blog/" alt="TCO09 Blog" />
					<area shape="rect" coords="660,77,719,110" href="http://www.topcoder.com/tco09/blog/photos/" alt="TCO09 Photos" />
					<area shape="rect" coords="728,74,788,112" href="http://www.topcoder.com/tco09/blog/movies/" alt="TCO09 Movies" />
					<area shape="rect" coords="798,76,865,109" href="http://www.topcoder.com/tco09/blog/twitter/" alt="TCO09 Twitter" />
					<area shape="rect" coords="309,5,572,113" href="http://www.topcoder.com/tco09" alt="TCO09" /></map>
					</map>
				</div>
				<br />
                <div id="client-content">
                    <div id="client-box">
                         <div id="enterprise-solutions">
                            <h3><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/methodology.jsp">Enterprise Solutions</a></h3>
                            <h4>TopCoder Global Platform</h4>
                            <ul class="link-list">
                                <li class="first"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/platform-tools.jsp">Tools</a></li>
                                <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/training.jsp">Training</a></li>
                                <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/index.jsp">Components</a></li>
                                <li class="last"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/support.jsp">Support</a></li>
                            </ul>
                            <div class="button-container">
                                <a class="button" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/methodology.jsp">Learn More</a>
                            </div>
                        </div>
                        <div id="featured-client">
                            	<a href="http://<%=ApplicationServer.SERVER_NAME%>/direct/blogs/?p=116"><h3>Featured Client: ESPN</h3>
                            	
                                	<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/home/espnfeatured.png" alt="ESPN Winning Formula"/>
                                </a>
                            </div>
                        <div id="tc-direct">
                            <h3><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct/">TopCoder Direct</a></h3>
                            <h4>Launch your own design competition!</h4>
                            <ul class="link-list">
                                <li class="first"><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct">Web Sites</a></li>
                                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct">Logo Design</a></li>
                                <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct">Print Design</a></li>
                                <li class="last"><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct">Applications</a></li>
                            </ul>
                            <div class="button-container">
                                <a class="button" href="http://<%=ApplicationServer.SERVER_NAME%>/direct/">Launch Direct</a>
                            </div>
                        </div>
                    </div>
                    <div id="client-box-bottom"></div>
                    <div class="wide-ad-banner">
                       
                    </div>
                </div>
                <div id="member-content">
                    <div id="member-box">
                        <div id="member-area">
                            <div id="member-count">
                                <h4><span><tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/></span> members and growing!</h4>
                             </div>
                             <div id="member-buttons">
                                <a class="small-button" href="http://<%=ApplicationServer.SERVER_NAME%>/reg/"><span>Register</span></a>
                                <a class="small-button" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome"><span>My TopCoder</span></a>
                                <a class="small-button" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/"><span>Forums</span></a>
                            </div>
                        </div>
                        <div id="compete">
                            <h2>Compete against the <strong>best!</strong></h2>
                            <div id="compete-competitions">
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc"><img src="/images/home/competition-tc-thumbnail.png" alt="TC Competitions" /></a>
                                <h3><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc">Competitions</a></h3>
                                <p>Component Design, Component Development, Assembly, Bug Races, Marathon, Algorithm&hellip;</p>
                            </div>
                            <div id="compete-studio">
                                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/"><img src="/images/home/competition-studio-thumbnail.png" alt="TopCoder Studio" /></a>
                                <h3><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/">TopCoder Studio</a></h3>
                                <p>The creative side of TopCoder. Logos, posters, storyboards, prototypes&hellip;</p>
                            </div>
                            <div id="tco09"> <a href="http://www.topcoder.com/remix"><img src="/i/remix/remix-340.jpg" alt="REMIX Challenge" /></a></div>
                            <%-- <div id="tco09"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=sponsor1"><img src="/i/tournament/tco09/tco09-ieee-340x76.png" alt="IEEE-USA Sponsor of the TCO '09" /></a>
                            <%-- 	<div id="tco09"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MatchDetails&rd=13747"><img src="/i/tournament/tco09/srm_banner-nsa-home.jpg" alt="SRM 439 brought to you by NSA" /></a> --%>
                            <%--<a href="http://www.topcoder.com/tco09"><img src="/i/tco09/340x76_banner.jpg" alt="2009 TopCoder Open" /></a> --%>
                            <%--<a href="http://www.topcoder.com/tco09"><img src="/i/tournament/tco09/tco09-snia-340x76.png" alt="SNIA XAM Initiative" /></a> --%></div>
                        </div>
                    </div>
                    <div id="member-box-bottom"></div>
                </div>
            </div><%-- #content_main --%>

        </div><%-- .wrapper ends --%>
    </div><%-- #content ends --%>

<%-- NEWS --%>
    <div id="news">
        <div class="wrapper">
            <h2>News and Announcements</h2>
            <ul id="news-carousel" class="tc-news">
				<li>
					<div class="news-image">
						<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=pr_103008"><img src="/images/home/news-carousel/tcdirect.png" alt="TopCoder Direct" /></a>
					</div>
					<div class="news-text">
						<p><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=pr_103008">TopCoder Direct Platform Opens Access to 170,000 Member Community of Software Designers, Developers &amp; Creative Artists</a></p>
					</div>
				</li>
				<li>
					<div class="news-image">
						<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102308"><img src="/images/home/news-carousel/fast50.png" alt="Deloitte Technology Fast 50" /></a>
					</div>
					<div class="news-text">
						<p><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=pr_102308">TopCoder Ranked Number 11 in Deloitte's Technology Fast 50 Program for New York, New Jersey and Connecticut</a></p>
					</div>
				</li>
				<li>
					<div class="news-image">
						<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=pr_100608"><img src="/images/home/news-carousel/sd-bestpractices.png" alt="Software Development Best Practices TopCoder Challenge" /></a>
					</div>
					<div class="news-text">
						<p><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=pr_100608">TopCoder Joins Lineups for SD Best Practices and Software Business 2008 Conferences October 28-31</a></p>
					</div>
				</li>
				<li>
					<div class="news-image">
						<a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=LinkTracking&amp;link=http://industry.bnet.com/technology/1000470/aol-finds-topcoder-tops/&amp;refer=homepage"><img src="/images/home/news-carousel/bnet.png" alt="BNET" /></a>
					</div>
					<div class="news-text">
						<p><a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=LinkTracking&amp;link=http://industry.bnet.com/technology/1000470/aol-finds-topcoder-tops/&amp;refer=homepage">AOL Finds TopCoder Tops</a></p>
						<p class="news-description">AOL technical director Nic Perez talks about his experience as a TopCoder client for a number of major projects over the last three years.</p>
					</div>
				</li>
				<li>
					<div class="news-image">
						<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=LinkTracking&amp;link=http://www.pcworld.com/businesscenter/article/152324/topcoder_eyeing_smb_market.html&amp;refer=homepage"><img src="/images/home/news-carousel/pcworld.png" alt="PCWorld" /></a>
					</div>
					<div class="news-text">
						<p><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=LinkTracking&amp;link=http://www.pcworld.com/businesscenter/article/152324/topcoder_eyeing_smb_market.html&amp;refer=homepage">TopCoder Eyeing SMB Market</a></p>
						<p class="news-description">TopCoder is turning its sights on the SMB market with a new portal called TopCoder Direct that will come out of beta at the end of October.</p>
					</div>
				</li>
				<li>
					<div class="news-image">
						<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=LinkTracking&amp;link=http://www.cio.com/article/449523/Cool_Programmer_Challenge_Football_Algorithm_&amp;refer=homepage"><img src="/images/home/news-carousel/cio.png" alt="CIO" /></a>
					</div>
					<div class="news-text">
						<p><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=LinkTracking&amp;link=http://www.cio.com/article/449523/Cool_Programmer_Challenge_Football_Algorithm_&amp;refer=homepage">Cool Programmer Challenge: Football Algorithm = $50,000</a></p>
						<p class="news-description">ESPN plans to use the algorithm for prognostication, on-air prediction and pregame previews.</p>
					</div>
				</li>
			</ul>
        </div><%-- .wrapper ends --%>
    </div><%-- #news ends --%>



<%-- LINKS BLOCK --%>
    <div id="links">
        <div class="wrapper">
            <div class="col">
                <h4>Customer Service</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Support</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=privacy">Privacy Policy</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=terms">Terms &amp; Conditions</a></li>
                </ul>
            </div>

            <div class="col">
                <h4>About TopCoder</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Us</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=mediaRequestForm">Public Relations</a></li>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/rss.jsp">RSS Feeds</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=index">Press Room</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=jobs">Working at TopCoder</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=terms">Legal Information</a></li>
                </ul>

            </div>

            <div class="col">
                <h4>Platform Tools</h4>
                <ul><li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/Upcoming+Contests">Pipeline</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/TopCoder+UML+Tool">UML Tool</a></li>
                    <li><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&amp;categoryID=22">TopCoder Forums</a></li>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/index.jsp">Component Catalog</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/">TopCoder Wiki</a></li>
                </ul>
          	</div>

            <div class="col">
                <h4>TopCoder Community</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc">TopCoder Community Home</a></li>
                    <li><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/">TopCoder Forums</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums">Studio Forums</a></li>
                </ul>

                <h4>TopCoder Blogs</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/direct/blogs/">TopCoder Direct</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/blog/">Studio TopCoder</a></li>
                </ul>
            </div>

            <div class="col">
                <h4>My Account</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">TopCoder Registration</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome">Manage Profile</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/dr">TopCoder Digital Run</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=home">Studio Cup</a></li>
                </ul>
            </div>

            <div class="col">
                <h4>Powered by TopCoder</h4>
                <ul>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">TopCoder Direct</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/">TopCoder.com</a></li>
                    <li><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/">Studio TopCoder</a></li>
                </ul>
            </div>

        </div><%-- .wrapper ends --%>
    </div><%-- #links block ends --%>

<%-- FOOTER BLOCK --%>
    <div id="footer">
        <div class="wrapper">
            <p id="footer_1800"><strong>1-866-TOPCODER or Service@TopCoder.com</strong></p>
            <p>TopCoder is the world's largest competitive software development community with <tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/> developers representing over 200 countries.</p>
            <p>Copyright &copy;2001-2009, TopCoder, Inc. All rights reserved.</p>
        </div><%-- .wrapper ends --%>
    </div><%-- #footer ends --%>

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