<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.aolicq.Constants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>
</head>

<body>

 
<jsp:include page="topNav.jsp">
	<jsp:param name="active_page" value="learnMore"/>
</jsp:include>

 <!-- Body Starts Here -->	    

<div id="wrapper">
<jsp:include page="aolicqTop.jsp"/>
      <%-- Front Page Body Content --%>  
        <div id="left-content">
			<div class="secondary-body" id="learn-more">
				<h2>Carrier, Network, or ISP Integration</h2>
				<h3 class="highlight">Winning Entry will receive $15,000.00</h3>
					<h3>Overview</h3>

            		<p>Ribbit has brought together the new world of the internet with the legacy worlds of telephony and carriers by building "carrier grade" technology and infrastructure and opening it up to web developers. As a result, traditional communication companies around the world are turning to the Ribbit Platform to create the next generation of applications that their customers are looking for.</p> 

        			<p>Some examples of applications in this category might be:</p>
					<ul>
						<li>Visual Voicemail (Mobile and Landline) applications built into various user portals</li>
						<li>Integration of Flash-based phones with inbound and outbound calling features into different Web Pages</li>
						<li>A mash-up of a soft-phone into a commercial web site</li>
						<li>Innovative use of VTT (Voice-to-Text) and notification services within a UC application</li>
					</ul>
	
				<h3>Category Judging Criteria</h3>
				
				<p>Show us the most innovative integration to an existing cable, carrier, mobile network, or ISP. </p>
				
				<p>In addition to the overall judging criteria below, judges will assign points for:</p>
					<ul>
						<li>Utility of the application/service to the end user</li>
						<li>Improvement in User Productivity</li>
						<li>True integration of Web and Voice technology</li>
					</ul>
				
				<h3>Overall Weighted Judging Criteria </h3>
					<ul>
						<li>Innovation - 40%</li>
						<li>Usage of the Ribbit API/Rich Application Deployment - 20%</li>
						<li>Overall User Value/Usability - 20% </li>
					<li>Potential Audience Reached and Impacted - 20%</li>
				</ul>		
			</div>
			</div>    
			<div id="right-sidebar">
				<div id="blog-posts-sidebar">
					<h3 id="sub-requirements">Contest Categories</h3>
					<ul id="requirements">
						<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=media">Media, Advertising &amp; Entertainment</a></li>
						<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=socialNetworking">Social Networking &amp; Communication</a></li>
						<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=business">Business &amp; Productivity</a></li>
						<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=carrier" class="active">Carrier, Network, or ISP Integration</a></li>
						<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=wildcard">Wildcard</a></li>
					</ul>
				</div>
				
				<div id="blog-posts-sidebar">
					<h3 id="sub-requirements">Submission Requirements</h3>
				
					<ul id="requirements">
						<li>Your TopCoder handle name</li>
						<li>Your unique Ribbit Developer ID</li>
						<li>The Ribbit AppID (assigned when you create a project for the contest) </li>
						<li>A title and brief overview of the application to be used as an online description</li>
						<li>The Killer App Category to which you are submitting</li>
						<li>An image file (jpg, or png) containing a screengrab or graphic representation of your application (no larger than 300x300 pixels).</li>
						<li>Most importantly, a link to the URL where the application or prototype can be viewed/downloaded, or wireframes/drawings/video simulations (25MB limit) that fully illustrate the core functionality and UI.</li>
					</ul>
				</div>
		</div>
		<p style="clear:both;"></p>
	</div>
</div>
<jsp:include page="tcFoot.jsp"/>

</body>
</html>