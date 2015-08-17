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
				<h2>Media Advertising &amp; Entertainment</h2>
                <h3 class="highlight">Winning Entry will receive $15,000.00</h3>
				
					<h3>Overview</h3>
                    <p>The days of displaying a phone number on your site or ad banner are over. With Ribbit, instant point of sale, reservation, and audience interactivity are realized. Add Ribbit to your brand's campaign and turn clicks into phone calls and recorded messages. We're looking for the best Ribbit integration into a Media, Advertising or Entertainment site or application. </p>

					<p>Some examples of applications in this category might be:</p>
						<ul>
							<li>Ribbit in a gaming site or application, MMO, virtual world (call out to your friends in the real world).</li>
							<li>Ribbit enhancing marketing or branding effort, adding interactivity with voice, letting users spread the brand to mobile</li>
							<li>Call-enabling web advertising on entertainment, fan engagement with voicemail and call wall features.</li>
						</ul>
							
					<h3>Category Judging Criteria</h3>
							
					<p>To win this category you need to captivate an audience and add unprecedented interactive value. </p>
							
					<p>In addition to the overall judging criteria below, judges will assign points for:</p>
						<ul>
							<li>Enhancing audience participation within the application</li>
							<li>High degree of interactivity that pushes the rich internet technology envelope</li>
							<li>True integration of Web and Voice and/or Messaging technology</li>
						</ul>
						
					<h3>Overall Weighted Judging Criteria</h3>
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
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=media" class="active">Media, Advertising &amp; Entertainment</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=socialNetworking">Social Networking &amp; Communication</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=business">Business &amp; Productivity</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=carrier">Carrier, Network, or ISP Integration</a></li>
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
							<li>Most importantly, a link to the URL where the application can be viewed/downloaded</li>
						</ul>
					</div>
				</div>
		<p style="clear:both;"></p>
	</div>
</div>
<jsp:include page="tcFoot.jsp"/>

</body>
</html>