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
				<h2>Social Networking &amp; Communication</h2>
				<h3 class="highlight">Winning Entry will receive $15,000.00</h3>
				
					<h3>Overview</h3>
					
                    <p><em>Social Networking</em> - Sure, you chat, text message, dm and 'poke' your friends all day long. But what if you could call them with one click from your favorite social networking site? Building killer communications apps for millions of users is now possible using the Ribbit Voice Platform. We're looking for the best Ribbit integration into a Social Networking site. Leverage the platform to build a widget that puts social networking users in touch with each other like never before.</p> 

					<p><em>Communications</em> - Ribbit is the world's first "programmable phone company" and it's completely at your disposal. For the first time ever, Flex and Flash developers can create rich communications solutions and even virtual phone networks. Phones no longer have to work, look or act like phones, and the days of locked down, "one size fits all" features, services and interfaces are over. This category should use our platform to show why Ribbit "Is not your father's phone company."</p>

					<p>Some examples of applications in this category might be:</p>
						<ul>
							<li>Ribbit for Facebook app, call-enabling Facebook's phonebook page</li>
							<li>Ribbit for MySpace, adding a simple phone or widget to user's page</li>
							<li>A mashup adding Ribbit to a web app like Yahoo! local, Yelp, where the phone number becomes Ribbit-enabled</li>
							<li>Adding ribbit shout features to web apps so users can send voicemails to each other.</li>
						</ul>
	
					<h3>Category Judging Criteria</h3>
						
					<p>Give us a Web 3.0 preview with the best example of connecting people via Open Telephony.</p>
						
					<p>In addition to the overall judging criteria below, judges will assign points for:</p>
						<ul>
							<li>Overall improvement in how people connect with each other</li>
							<li>Capability of reaching an incredibly large audience (through deployment on a popular platform)</li>
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
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=socialNetworking" class="active">Social Networking &amp; Communication</a></li>
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