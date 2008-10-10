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
                    
					<h1>GEICO Landing Page</h1>
						<p>1 Contest July 2008</p>
						<p>1 Storyboard/Landing Page Contest</p>
						<div class="clear"></div>
						
						<div id="thumbs">
							<ul>
								<li><a href="/i/portfolio/projects/geico/storyboards/1.jpg" class="thickbox" rel="thumbs" title="Geico Landing Page Contest"><img src="/i/portfolio/projects/geico/thumbs/1.png" width="150" height="150" /></a><br />
								<div align="center">Storyboard Contest</div></li>
								
							</ul>
						</div>
						
						<div class="clear"></div>
							<div class="divide">
								<div class="data">
										<table border="0" cellpadding="0" cellspacing="1">
											<tr>
												<th>Contest Type</th>
												<th>Contest Name</th>
												<th>Duration</th>
												<th>Subs</th>
												<th>Client Selection</th>
											</tr>
											<tr>
												<td>Storyboard Contest</td>
												<td><a href="/i/portfolio/projects/geico/storyboards/1.jpg" class="thickbox" title="Geico Landing Page Contest">Geico Landing Page Contest</a></td>
												<td>3 Days</td>
												<td align="center">40</td>
												<td>
												<a href="/i/portfolio/projects/geico/storyboards/1.jpg" class="thickbox" rel="story1" title="Geico Landing Page Contest">1</a>
												<a href="/i/portfolio/projects/geico/storyboards/1a.jpg" class="thickbox" rel="story1" title="Geico Landing Page Contest">2</a>
												<a href="/i/portfolio/projects/geico/storyboards/2.jpg" class="thickbox" rel="story1" title="Geico Landing Page Contest">3</a>
												<a href="/i/portfolio/projects/geico/storyboards/3.jpg" class="thickbox" rel="story1" title="Geico Landing Page Contest">4</a>
												<a href="/i/portfolio/projects/geico/storyboards/4.jpg" class="thickbox" rel="story1" title="Geico Landing Page Contest">5</a>
												<a href="/i/portfolio/projects/geico/storyboards/5.jpg" class="thickbox" rel="story1" title="Geico Landing Page Contest">6</a>
												<a href="/i/portfolio/projects/geico/storyboards/6.jpg" class="thickbox" rel="story1" title="Geico Landing Page Contest">7</a>
												</td>
											</tr>
											<tr>
												<td colspan="5"><a href="http://studio.topcoder.com/?module=ViewSubmissions&ct=2305" target="_blank">View All Submissions</a></td>
											</tr>
										</table>
								</div>
                     		 </div>
                     		 <div class="hidden">
                     		 	<a href="/i/portfolio/projects/geico/storyboards/1a.jpg" class="thickbox" rel="thumbs" title="Geico Landing Page Contest"></a>
                     		 	<a href="/i/portfolio/projects/geico/storyboards/2.jpg" class="thickbox" rel="thumbs" title="Geico Landing Page Contest"></a>
                     		 	<a href="/i/portfolio/projects/geico/storyboards/3.jpg" class="thickbox" rel="thumbs" title="Geico Landing Page Contest"></a>
                     		 	<a href="/i/portfolio/projects/geico/storyboards/4.jpg" class="thickbox" rel="thumbs" title="Geico Landing Page Contest"></a>
                     		 	<a href="/i/portfolio/projects/geico/storyboards/5.jpg" class="thickbox" rel="thumbs" title="Geico Landing Page Contest"></a>
                     		 	<a href="/i/portfolio/projects/geico/storyboards/6.jpg" class="thickbox" rel="thumbs" title="Geico Landing Page Contest"></a></div>
						 <div class="clear"></div>

            <!-- End Main Content -->
                  </div>
                    <div class="contentBottom"></div>
					</div>
				</div>
			</div>

        <jsp:include page="../foot.jsp"/>

    </div>
</body>
</html>