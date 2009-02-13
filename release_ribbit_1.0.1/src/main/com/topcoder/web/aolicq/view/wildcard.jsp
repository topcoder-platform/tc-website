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
				<h2>Wildcard</h2>
				<h3 class="highlight">Winning Entry will receive $15,000.00</h3>
					<h3>Overview</h3>
                    <p>Ribbit adds functionality to the web that many never thought possible. The computer is not the only device out there. We see Ribbit changing the way devices and interfaces allow us to communicate with each other, with key services and other systems. We&rsquo;re looking for a prototype or well developed concept that shows how Ribbit&rsquo;s service will improve the usability of any device or interface.</p> 

                    <p>For the first time, you have at your disposal a fully programmable phone company. Think of all the devices you use on a daily basis. If those were hooked into the phone network, what could you do? Could you call your spouse on his/her way home from work from the fridge if you're low on milk? Could you check your voicemail from the airplane? Could you call your friends before buying tickets at a kiosk?</p>
	
    				<h3>Category Judging Criteria</h3>
        
        			<p>We're looking for the most cutting edge use of Ribbit in an advanced device. Although we're not expecting a full app here, you can really blow us away by seriously developing your concept with industrial wireframes, drawings, and video simulations. Show us how you imagine Ribbit will change the way we communicate, beyond the computer and phone, and we'll show you $15,000! </p>
      
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
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=carrier">Carrier, Network, or ISP Integration</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=wildcard" class="active">Wildcard</a></li>
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