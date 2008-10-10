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
                    
					<h1>AOL News: Predict The President</h1>
						
						<p>2 Contests beginning in June 2008 and ending in July 2008</p>
						<p>1 Flash Contest, 1 yourminis Widget Build</p>
						
						<p>You control the electoral map for the 2008 elections. Click on a state to make your prediction or start with from one of the many views.</p>
						<p>The flash uses csv and xml data and also allows the user to save their settings.</p>
						<p><strong>Client Quote:</strong> "Thanks very much to the TopCoder Studio for getting the project completed in 5 weeks, the elections team has wanted to implement this for 5 years."</p>
						<div class="clear"></div>
						
						<div id="thumbs">
							<ul>
								<li><a href="/i/portfolio/projects/aol-news/flash/1/AOL08PreGame.html" title="Predict The President Flash Contest" target="_blank"><img src="/i/portfolio/projects/aol-news/thumbs/1.png" width="150" height="150" /></a><br />
								<div align="center">Flash Contest</div></li>
								
								<li><a href="/i/portfolio/projects/aol-news/screenshot/1.png" class="thickbox" title="Predict The President yourminis Widget"><img src="/i/portfolio/projects/aol-news/thumbs/2.png" width="150" height="150" /></a><br />
								<div align="center">yourminis Contest</div></li>
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
												<td>Flash Contest</td>
												<td><a href="/i/portfolio/projects/aol-news/flash/1/AOL08PreGame.html" title="Predict The President Flash Contest" target="_blank">Predict The President Flash Contest</a></td>
												<td>7 Days</td>
												<td align="center">4</td>
												<td>
												<a href="/i/portfolio/projects/aol-news/flash/1/AOL08PreGame.html" title="Predict The President Flash Contest" target="_blank">Link</a>
												</td>
											</tr>
											
											<tr>
												<td>yourminis Widget Contest</td>
												<td><a href="http://www.yourminis.com/minis/yourminis/AOL/mini:PredictthePresident" title="Predict The President Flash Contest" target="_blank">Predict The President Widget Build</a></td>
												<td>7 Days</td>
												<td align="center">5</td>
												<td>
												<a href="http://www.yourminis.com/minis/yourminis/AOL/mini:PredictthePresident" title="Predict The President Flash Contest" target="_blank">yourminis site link</a>

												</td>
											</tr>
											<tr>
												<td colspan="5" align="center">
													<script type='text/javascript' src='http://ct.yourminis.com/scripts/ymswfobject.js'></script><div id='sandboxdiv'>loading...</div><script type='text/javascript'>var so = new ymSWFObject('http://www.yourminis.com/Dir/GetContainer.api?uri=yourminis/AOL/mini:PredictthePresident', 'sandbox', '400', '474','statshostname=stats.yourminis.com&width=400&hostname=www.yourminis.com&uri=yourminis/AOL/mini%3APredictthePresident&height=474&swfhost=ct.yourminis.com&','9.0.17');so.addParam('wmode', 'transparent');so.addParam('allowScriptAccess','always');so.useExpressInstall('http://ct.yourminis.com/swfs/expressinstall.swf');so.write('sandboxdiv');</script></td>
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