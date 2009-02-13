<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    
    <!-- add js/css files for portfolio section styles and modal windows -->
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="studio_portfolio"/>
    </jsp:include>

    <!-- add js scripts for portfolio section modal windows -->
    <script type="text/javascript" src="/js/portfolio/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="/js/portfolio/thickbox.js"></script>
    <!-------------------------------------------------------->
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../top.jsp"/>
            <jsp:include page="../topNav.jsp">
                <jsp:param name="node" value="portfolio"/>
            </jsp:include>
        </div>
        
        <!-- container -->
        <div id="container">
            <!-- content -->

            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">
                    <!-- Begin Main Content -->
                    
					<h1>Portfolio</h1>
						<p>The following are examples of various project types and  lengths.</p>
						<div class="clear"></div>
							<div class="divide">
								
                       			<div class="floatLeft_2">
                       			
									<h2>AOL News: Predict The President</h2>
									<p>2 Contests beginning in June 2008 and ending in July 2008</p>
									<p>1 Flash Contest, 1 yourminis Widget Build</p>
									<p><strong>Client Quote:</strong> "Thanks very much to the TopCoder Studio for getting the project completed in 5 weeks, the elections team has wanted to implement this for 5 years."</p>

									<p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=aolNews">View more details...</a></p>
								</div>
                       			<div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=aolNews"><img src="/i/portfolio/projects/aol-news/thumbs/1.png" width="150" height="150" /></a></div>
                       
                       			<div class="clear hr"></div>
                       			
								<div class="floatLeft_2">
									<h2>Argus</h2>
									<p>7 Contests beginning in March 2008 and ending in April 2008</p>
									<p>1 Storyboard Contest, 4 Flash Animation Contests, 2 Prototype Contests</p>
									<p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=argus">View more details...</a></p>
								</div>
                       			<div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=argus"><img src="/i/portfolio/projects/argus/previews/storyboard.png" width="150" height="150" /></a></div>
                       
                       			<div class="clear hr"></div>
                       			
                       			<div class="floatLeft_2">
									<h2>Blackbird .NET Application</h2>
									<p>4 Contests beginning in July 2007 and ending in March 2008</p>
									<p>1 Logo Contest, 1 Flash Contest, 1 Storyboard Contest, 1 Print Advertising Contest</p>
									<p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=blackbird">View more details...</a></p>
								</div>
                       			<div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=blackbird"><img src="/i/portfolio/projects/blackbird/thumbs/1.png" width="150" height="150" /></a></div>
                       
                       			<div class="clear hr"></div>
                       			
                       			<div class="floatLeft_2">
									<h2>ESPN Winning Formula Challenge</h2>
									<p>4 Contests beginning in July 2008 and ending in August 2008</p>
									<p>2 Storyboard Contests, 2 Banner Ad Contests</p>
									<p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=espnWinning">View more details...</a></p>
								</div>
                       			<div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=espnWinning"><img src="/i/portfolio/projects/espn-winning/thumbs/1.png" width="150" height="150" /></a></div>
                       
                       			<div class="clear hr"></div>
                       			
                       			<div class="floatLeft_2">
									<h2>GEICO Landing Page</h2>
									<p>1 Contest in July 2008</p>
									<p>1 Storyboard/Landing Page Contest</p>
									<p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=geico">View more details...</a></p>
								</div>
                       			<div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=geico"><img src="/i/portfolio/projects/geico/thumbs/1.png" width="150" height="150" /></a></div>
                       
                       			<div class="clear hr"></div>
                       			
                       			<div class="floatLeft_2">
									<h2>Kids Savings Account</h2>
									<p>2 Contests beginning in May 2008 and ending in June 2008</p>
									<p>1 Storyboard Contest, 1 Prototype Contest</p>
									<p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=kidsSavings">View more details...</a></p>
								</div>
                       			<div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=kidsSavings"><img src="/i/portfolio/projects/kidsavings/thumbs/1.png" width="150" height="150" /></a></div>
                       
                       			<div class="clear hr"></div>
                       			
                       			<div class="floatLeft_2">
									<h2>LendingTree: Banner Ad Contest</h2>
									<p>2 Contests in May 2008</p>
									<p>2 Banner Ad Contests</p>
									<p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=lendingtree">View more details...</a></p>
								</div>
                       			<div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=lendingtree"><img src="/i/portfolio/projects/lendingtree/thumbs/1.png" width="150" height="150" /></a></div>
                       
                       			<div class="clear hr"></div>
                       			
                       			<div class="floatLeft_2">
									<h2>MindProtein.com</h2>
									<p>4 Contests starting in May 2008 and ending in July 2008</p>
									<p>1 Naming Contest, 1 Logo Contest, 1 Storyboard Contest, 1 Prototype Contest</p>
									<p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=mindprotein">View more details...</a></p>
								</div>
                       			<div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=mindprotein"><img src="/i/portfolio/projects/mindprotein/thumbs/1.png" width="150" height="150" /></a></div>
                       
                       			<div class="clear hr"></div>
                       			
                       			<div class="floatLeft_2">
									<h2>RadioTAGr</h2>
									<p>1 Contest in July 2008</p>
									<p>1 Storyboard Contest (Additional Storyboard and iPhone build planned)</p>
									<p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=radiotagr">View more details...</a></p>
								</div>
                       			<div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=radiotagr"><img src="/i/portfolio/projects/radiotagr/thumbs/1.png" width="150" height="150" /></a></div>
                       
                       			<div class="clear hr"></div>
                       			
								<div class="floatLeft_2">
									<h2>Tongal</h2>
									<p>9 Contests beginning in May 2008 and ending in August 2008</p>
									<p>2 Logo Contests, 4 Storyboard Contest, 2 Prototype Contests, 1 Icon Contest</p>
									<p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=tongal">View more details...</a></p>
								</div>
                       			<div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=tongal"><img src="/i/portfolio/projects/tongal/previews/prototype.png" width="150" height="150" /></a></div>
                       
                       			<div class="clear hr"></div>
                       			
                       			<div class="floatLeft_2">
									<h2>Truveo Summer Games Widget</h2>
									<p>3 Contests beginning in June 2008 and ending in July 2008</p>
									<p>1 Storyboard Contest, 1 Flash Contest, 1 yourminis Widget Build </p>
									<p><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=truveo">View more details...</a></p>
								</div>
                       			<div class="floatRight_2"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=portfolio&amp;d2=truveo"><img src="/i/portfolio/projects/truveo-summer/thumbs/2.png" width="150" height="150" /></a></div>
                       
                       			<div class="clear hr"></div>
                       			
							 </div>
						 <div class="clear"></div>
						</div>
						<div class="contentBottom"></div>
					</div>
				</div>
			</div>

        <jsp:include page="../foot.jsp"/>

    </div>
</body>
</html>