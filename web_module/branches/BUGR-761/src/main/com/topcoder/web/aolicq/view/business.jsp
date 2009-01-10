<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.aolicq.Constants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Ribbit - $100,000 Killer App Challenge :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq" />
    </jsp:include>
</head>

<body>

 
<jsp:include page="topNav.jsp">
	<jsp:param name="active_page" value="learnMore" />
</jsp:include>

 <!-- Body Starts Here -->	    

<div id="wrapper">
<jsp:include page="aolicqTop.jsp" />
      <%-- Front Page Body Content --%>  
        <div id="left-content">
			<div class="secondary-body" id="learn-more">
				<h2>Business &amp; Productivity</h2>
				<h3 class="highlight">Winning Entry will receive $15,000.00</h3>
					<h3>Overview</h3>
                    <p>We've come to expect that phones are phones, and computers are computers. Until now, voice has been forced to sit outside of the application. Ribbit lets you bring voice and other rich communication features directly into an applications &ldquo;workflow&rdquo; &ndash; enabling developers to integrate the true power and potential of these new features. The solution should use Ribbit to increase the applications inherent value as a business or productivity tool.</p> 


                    <p>Some examples of applications in this category might be:</p>
                    <ul>
                   		<li>Ribbit for Salesforce, where voice and messaging enhance CRM</li>
				   		<li>Point of sale initiation, &lsquo;operators are standing by&rsquo;</li>
						<li>Appointment scheduling application, where admins can call next day&rsquo;s appointments.</li>
                    </ul>
	
					<h3>Category Judging Criteria</h3>
					
					<p>Push business apps even further by bringing voice and rich communication features into the application workflow. </p>
				   
					<p>In addition to the overall judging criteria below, judges will assign points for:</p>
						<ul>
							<li>Integration of Ribbit to enhance existing application features/purpose</li>
							<li>Overall improvement in user productivity</li>
							<li>True integration of Web and Voice and/or Messaging technology</li>
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
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=business" class="active">Business &amp; Productivity</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=carrier">Carrier, Network, or ISP Integration</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=wildcard">Wildcard</a></li>
						</ul>
					</div>
					
					<div id="blog-posts-sidebar">
						<h3 id="sub-requirements">Submission Requirements</h3>
						
						<ul id="requirements">
							<li>Your TopCoder handle name</li>
							<li>Your unique Ribbit Developer ID</li>
							<li>The Ribbit AppID (assigned when you create a project for the contest)</li>
							<li>A title and brief overview of the application to be used as an online description</li>
							<li>The Killer App Category to which you are submitting</li>
							<li>An image file (jpg, or png) containing a screengrab or graphic representation of your application (no larger than 300x300 pixels).</li>
						   <li>Most importantly, a link to the URL where the application can be viewed/downloaded</li>
						</ul>
					</div>
				</div>
			<p style="clear:both;"></p>
		</div>
	</div>
<jsp:include page="tcFoot.jsp" />

</body>
</html>