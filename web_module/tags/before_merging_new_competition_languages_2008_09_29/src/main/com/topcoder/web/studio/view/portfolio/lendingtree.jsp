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
                    
                    
                    <!-- Back to Portfolio page -->
                    <div style="padding: 10px 0;"><a href="/?module=Static&amp;d1=portfolio&amp;d2=portfolio">Portfolio</a></div>
                    
                    <!-- Begin Main Content -->
                    
					<h1>LendingTree: Banner Ad Contest</h1>
						
						<p>2 Contests in May 2008</p>
						<p>2 Banner Ad Contests</p>
						<div class="clear"></div>
						
						<div id="thumbs">
							<ul>
								<li><a href="/i/portfolio/projects/lendingtree/round1/index.htm" title="LendingTree Promo Banner Ads" target="_blank"><img src="/i/portfolio/projects/lendingtree/round1/i/4.png" width="150" height="150" /></a><br />
								<div align="center">Banner Ads 1</div></li>
								
								<li><a href="/i/portfolio/projects/lendingtree/round2/index.htm" title="LendingTree Promo Banner Ads Round 2" target="_blank"><img src="/i/portfolio/projects/lendingtree/round2/i/3.png" width="150" height="150" /></a><br />
								<div align="center">Banner Ads 2</div></li>
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
												<td>Banner Ad Contest</td>
												<td><a href="/i/portfolio/projects/lendingtree/round1/index.htm" title="LendingTree Promo Banner Ads" target="_blank">LendingTree Promo Banner Ads</a></td>
												<td>5 Days</td>
												<td align="center">26</td>
												<td><a href="/i/portfolio/projects/lendingtree/round1/index.htm" title="LendingTree Promo Banner Ads" target="_blank">Link</a></td>
											</tr>
											<tr>
												<td>Banner Ad Contest</td>
												<td><a href="/i/portfolio/projects/lendingtree/round2/index.htm" title="LendingTree Promo Banner Ads Round 2" target="_blank">LendingTree Promo Banner Ads Round 2</a></td>
												<td>7 Days</td>
												<td align="center">93</td>
												<td><a href="/i/portfolio/projects/lendingtree/round2/index.htm" title="LendingTree Promo Banner Ads Round 2" target="_blank">Link</a></td>
											</tr>
											
										
										</table>
								</div>
                     		 </div>
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