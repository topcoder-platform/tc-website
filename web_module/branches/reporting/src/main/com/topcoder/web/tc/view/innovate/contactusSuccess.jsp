<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
		
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Who is TopCoder?</title>

<link rel="stylesheet" type="text/css" media="screen" href="/css/innovate/screen.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/css/home/jquery.jcarousel.css" /> 	
<link rel="stylesheet" type="text/css" media="screen" href="/css/innovate/innovate.css" />

<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/home/screen-ie7.css.css" /><![endif]-->
<!--[if IE 6]><link rel="stylesheet" type="text/css" href="/css/innovate/screen-ie6.css" /><![endif]-->

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
<script src="/js/home/direct.js" type="text/javascript"></script>
<script src="/js/innovate/innovate.js" type="text/javascript"></script>
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
		$(this).parents("#nav lu li").children('a').removeClass("active-item");
	});
	
	
	jQuery(document).ready(function() {
    	jQuery('#news-carousel').jcarousel({
        	easing: 'swing'  
    	});
	});

});


</script>
</head>
<body>

	<div id="header">
		<div class="wrapper">
			
<!-- MASTHEAD AND LOGO -->
			<h1 class="tc-header"><a href="http://<%=ApplicationServer.SERVER_NAME%>/" title="TopCoder"><span>TopCoder Direct</span></a></h1>
			<h2 id="ready_engage"><span>Ready.. ENGAGE</span></h2>
			
<!-- MAIN NAVIGATION -->
			<div id="nav">
				<h3 class="hide">Main Navigation</h3>
				<ul>
					<li class="left"><a href="http://<%=ApplicationServer.SERVER_NAME%>/">TopCoder Home</a></li>
					<li class="on"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/">Engage</a>
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
			</div><!-- #navigation ends -->
			
			<!-- SUB NAVIGATION -->
			<div id="nav_support">
                <h3 class="hide">SUB Navigation</h3>
                <ul>
                    <li class="left"><a href="http://<%=ApplicationServer.SERVER_NAME%>/">TopCoder.com</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=index">About TopCoder</a></li>
                    <li><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=index">News</a></li>
                    <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/contact.jsp">Contact Us</a></li>
				</ul>
            </div><%-- #navigation ends --%>
			
		</div><!-- .wrapper ends -->
	</div><!-- #header ends -->

<!-- CONTENT BLOCKS -->
	<div id="content">
		<div class="wrapper">
		    <div id="engage">
		        <div id="engage-header">
		            <div class="engage-left">
                        <div id="engage-carousel" class="jcarousel-skin-engage">

                            <ul>
                            	<li><img width="612" height="163" src="/i/innovate/img_1.png" alt="Image 1" /></li>
                            	<li><img width="612" height="163" src="/i/innovate/img_2.png" alt="Image 2" /></li>
                                <li><img width="612" height="163" src="/i/innovate/img_3.png" alt="Image 3" /></li>
                                <li><img width="612" height="163" src="/i/innovate/img_4.png" alt="Image 4" /></li>
                                <li><img width="612" height="163" src="/i/innovate/img_5.png" alt="Image 5" /></li>
                           </ul>
                           
                           <div class="jcarousel-control">
                                <a id="btn1" href="#" class="btn-num"><span>1</span></a>
                                <a id="btn2" href="#" class="btn-num"><span>2</span></a>
                                <a id="btn3" href="#" class="btn-num"><span>3</span></a>
                                <a id="btn4" href="#" class="btn-num"><span>4</span></a>
                                <a id="btn5" href="#" class="btn-num"><span>5</span></a>
                            </div>
                            <div class="jcarousel-scroll">
                            	<form action="">
                                	<a href="#" id="engage-carousel-prev"></a><a href="#" id="engage-carousel-next"></a>
                                </form>
                           </div>
                     	</div><!-- End of #engage-carousel -->

		            </div>
		            <div class="engage-right">
		                <div id="org">
		                    <span id="logo1" class="org_logo"><img width="150" height="50" src="/i/innovate/logo_aol.png" alt="AOL" /></span>
		                    <span id="logo2" class="org_logo"><img width="150" height="50" src="/i/innovate/logo_espn.png" alt="ESPN" /></span>
		                    <span id="logo3" class="org_logo"><img width="150" height="50" src="/i/innovate/logo_ribbit.png" alt="RIBBIT" /></span>
		                    <span id="logo4" class="org_logo"><img width="150" height="50" src="/i/innovate/logo_snia.png" alt="SNIA" /></span>
							<span id="logo5" class="org_logo"><img width="150" height="40" src="/i/innovate/logo_lendingtree.png" alt="LENDING TREE" /></span>
							<span id="logo6" class="org_logo"><img width="150" height="40" src="/i/innovate/logo_lindenlab.png" alt="LINDEN LAB" /></span>
		                </div>
		                <p class="org_quote">See why the worlds most <br /> innovative organizations are turning <br /> to TopCoder for their Application <br /> and Creative Development.</p>
		            </div>
		        </div>
		        
		        <div id="engage-content">
		            <div class="engage-right">
						<div class="client-list"> <a href="http://www.topcoder.com/direct/blogs/?p=116"><img src="/i/innovate/espnfeatured.png" alt="Featured Client" width="255" height="65" border="0" /></a>
						
						<p class="news-link"><a href="http://www.topcoder.com/tc?module=Static&d1=pressroom&d2=pr_032509">TopCoder Named 2009 'Cool Vendor' for Application Development by Leading Analyst Firm</a></p>
						<p class="news-link"><a href="http://www.topcoder.com/direct/blogs/?p=206">Julian Birkinshaw of London Business School Interview with TopCoder &ndash; Exploring the Impact of Web 2.0 upon Management</a></p>
						<p class="news-link"><a href="http://www.topcoder.com/direct/blogs/?p=174">Crowdsourcing Guru Jeff Howe Interview with TopCoder &ndash; Crowdsourcing and Which Business Models Will Succeed</a></p>
		               
		               </div>
		            </div>
		            
		            <div class="engage-left">
		                <div id="engage-info">
		                    <p class="info-title">Thank you for your interest in TopCoder. We will be contacting you shortly.</p>
		                    <p style="width:500px;">For more information on TopCoder Direct, please <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/" title="Learn more about TopCoder Direct">click here</a> 
		                    or to learn more about TopCoder Studio, <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/" title="Learn more about Studio TopCoder">click here</a>.</p>
                            <p>The Team at TopCoder</p>
                        </div>
		            </div>
				 </div>
				 <br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
		    </div>
		
		</div><!-- .wrapper ends -->
	</div><!-- #content ends -->
	
    
    	
<!-- LINKS BLOCK -->
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
		</div><!-- .wrapper ends -->
	</div><!-- #links block ends -->

<%-- FOOTER BLOCK --%>
    <div id="footer">
        <div class="wrapper">
            <p id="footer_1800"><strong>1-866-TOPCODER or Service@TopCoder.com</strong></p>
            <p>TopCoder is the world's largest competitive software development community with over 190,000 developers representing over 200 countries.</p>
            <p>Copyright TopCoder, Inc. 2001-<script type="text/javascript">d=new Date();document.write(d.getFullYear());</script></p>
        </div><%-- .wrapper ends --%>
    </div><%-- #footer ends --%>


</body>
</html>