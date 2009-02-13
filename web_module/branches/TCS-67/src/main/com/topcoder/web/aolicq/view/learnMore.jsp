<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.aolicq.Constants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge - Learn More :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>
</head>

<body>

 
<jsp:include page="topNav.jsp">
	<jsp:param name="active_page" value="learnMore"/>
</jsp:include>

 <%--  Body Starts Here --%>  	    

<div id="wrapper">
<jsp:include page="aolicqTop.jsp"/>
      <%-- Front Page Body Content --%>  
        <div id="left-content">
			<div class="secondary-body" id="learn-more">
				<h2 class="learn-more">How to Compete</h2>
				
				<h3 class="highlight">Announcing the $100,000 Ribbit Killer App Challenge!</h3>
					
					<p>Ribbit was created with the understanding that the next generation of great communication solutions would be created, not by us, and not by a traditional phone company&mdash;but by you, the Flash and Flex Developers. The Ribbit Voice Platform gives you, the most creative developers in the world, the ability to add rich communication features into your Flash and Flex projects by giving you direct access to the world's first global, programmable phone company. We're challenging you to help build the next generation phone company&mdash;by creating the next Ribbit Killer Application.</p>
					
				<h3>Everybody Wins!</h3>
					
					<p>You win no matter what. These are your inventions, your applications. We don't own them, you do. Even if you are not selected as an official contest winner, you're free to bring your solutions to your customers or marketplace and directly profit from your creativity.</p>
					
				<h3>What Can I Build?</h3>
					
					<p>Anything you want! We will be awarding grand prizes in the following categories:</p>
						<ul>
							<li><span class="category">Media, Advertising and Entertainment</span> - To win this category you need to captivate an audience and add unprecedented interactive value. <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=media">(Category Details)</a></li>
							<li><span class="category">Social Networking and Communication</span> - Give us a Web 3.0 preview with the best example of connecting people via open telephony. <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=socialNetworking">(Category Details)</a></li>
							<li><span class="category">Business and Productivity</span> - Push business applications even further by bringing voice and rich communication features into the application workflow. <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=business">(Category Details)</a></li>
							<li><span class="category">Carrier and Network Integration</span> - Show us the most innovative integration to an existing cable, carrier or mobile network. <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=carrier">(Category Details)</a></li>
							<li><span class="category">Wildcard</span> - Blow us away by improving the usability of any device or interface (from vending machines to ticket kiosks). <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=wildcard">(Category Details)</a></li>
						</ul>
					
					<h3>How to Compete</h3>
						<p>Be sure to read the <b><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=rules">full contest rules</a></b>.</p>
					
					<h3>How to Register</h3>
						<div id="register-steps">
							<p>Participation in the Ribbit Killer App Challenge is completely FREE! Just follow the simple steps below and you'll be on your way to possibly claiming some of our $100,000 in prize money! Here's a quick overview:</p>
							<ol>
								<li><strong>Register for a developer id at <a href="http://developer.ribbit.com/register">ribbit.com.</a></strong></li>
								<li class="two"><strong><a href="https://www.topcoder.com/reg/?module=Main&amp;rt=2">Sign up</a> to become a Topcoder member </strong><br />
								The Killer App Challenge is run using TopCoder's patented competition engine and administered by TopCoder's professional competition staff. TopCoder members are a worldwide community of programmers who compete in algorithm and development contests for prize money. Become a member now to compete in this challenge and other TopCoder contests! If you are already a TopCoder member, go to step 3. <a href="https://www..topcoder.com/reg/?module=Main&amp;rt=2">Sign up at TopCoder &gt;&gt;</a></li>
								<li class="three"><strong><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1002">Register</a> for the Ribbit Killer App Challenge now!</strong><br />Once you are a TopCoder member, all you have to do is register for the Ribbit Killer App Challenge! Register now to participate in this contest! <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&ct=1002">Contest registration >></a> </li>
								<li class="four"><strong><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&ct=1002">Submit</a> your application</strong><br />  Once your app is live, submit it to the contest. You will need to submit a zip file to TopCoder which includes 2 items: 
									
									<ol class="sublist">
										<li>A text document containing:
											<ul class="sublist2">
												<li>Your TopCoder handle name</li>
												<li>Your unique Ribbit Developer ID</li>
												<li>The Ribbit AppID (assigned when you create a project for the contest) </li>
												<li>A title and brief overview of the application to be used as an online description</li>
												<li>The Killer App Category to which you are submitting</li>
												<li>Most importantly, a link to the URL where the application can be viewed/downloaded</li>
											</ul>
										</li>
										<li>An image file (jpg, or png) containing a screengrab or graphic representation of your application (no larger than 300x300 pixels)</li>
									</ol>
								</li>
							</ol>
					  	</div>
					  	
					  <h3>Prizes / Prize Amounts</h3>
						<p>Five, $15,000 Prizes will be awarded to the Killer Apps that best utilize the Ribbit Platform to captivate, innovate, and have the best overall market potential in each category. From the five category winners, one will be selected as overall winner and receive an additional $15,000 for a total of $30,000. Plus, we'll be awarding $10,000 in prizes to early submitters at three Checkpoints along the way. We can't wait to see what develops!</p>
					
						<h3>Benefits of Submitting Early - Prizes! Feedback!</h3>
							<p>Checkpoint winners, will also receive direct feedback from the judging panel for ways to improve or enhance your submission &mdash; giving you a better chance of winning the Grand Prize and creating the ultimate Killer Application.</p>
						
						<div id="timeline"><img src="/images/killerapp/killerapp_timeline.png"></div>
						
						<h3>How to Submit</h3>
							<p>The requirements for submission may vary depending on the Killer App category, so please be sure you check out your specific Category Detail page before submitting.</p>
							<p>Once your app is live, <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=<%=Constants.MINISITE_CONTEST_ID%>">submit it to the contest</a>.</p>
							<p>You will need to submit a zip file to TopCoder which includes 2 items:</p>
						
						
						<div id="register">
							<ol class="sublist">
								<li>A text document containing:
									<ul class="sublist2">
										<li>Your TopCoder handle name</li>
										<li>Your unique Ribbit Developer ID</li>
										<li>The Ribbit AppID (assigned when you create a project for the contest) </li>
										<li>A title and brief overview of the application to be used as an online description</li>
										<li>The Killer App Category to which you are submitting</li>
										<li>Most importantly, a link to the URL where the application can be viewed/downloaded</li>
									</ul>
								</li>
								
								<li>An image file (jpg, or png) containing a screengrab or graphic representation of your application (no larger than 300x300 pixels)</li>
							</ol>
							<p><em>Note:</em> Please review the Category Detail page(s) for full submission guidelines.</p>
						</div>
					
					<h3>How Your App will be Judged</h3>
						<p>All submissions will be judged by the Ribbit Killer App Challenge judging team consisting of key representatives from Adobe, British Telecom, Ribbit, and other industry experts.</p>
						
					<h3>Overall Weighted Judging Criteria</h3>
						<ul>
							<li>Innovation - 40%</li>
							<li>Usage of the Ribbit API/Rich Application Deployment - 20%</li>
							<li>Overall User Value/Usability - 20% </li>
							<li>Potential Audience Reached and Impacted - 20%</li>
						</ul>
					
						<p>For more information on specific judging criteria, be sure to read the Category Detail page for the category to which you are submitting.</p>
					</div>
				</div>
        
				<div id="right-sidebar">
					<div id="blog-posts-sidebar">
						<h3>Judges</h3>
						
						<ul class="judges">
							<li>
                                <img src="/images/killerapp/judge-lee.png" />
                                <h4>Lee Brimelow</h4>
                                <p class="title">Flash Platform Evangelist, Adobe<br /><a href="http://theflashblog.com/" target="_blank">Lee's Blog</a></p>
                            </li>
                            <li>
                                <img src="/images/killerapp/judge-matt.png" />
                                <h4>Matt Chotin</h4>
                                <p class="title">Sr. Product Manager, Adobe<br /><a href="http://weblogs.macromedia.com/mchotin" target="_blank">Matt's Blog</a></p>
                            </li>
                            <li>
                                <img src="/images/killerapp/judge-daniel.png" />
                                <h4>Daniel Dura</h4>
                                <p class="title">AIR Evangelist, Adobe<br  /><a href="http://www.danieldura.com/" target="_blank">Daniel's Blog</a></p>
                            </li>
                            <li>
                                <img src="/images/killerapp/judge-bt.png" />
                                <h4>JP Rangaswami</h4>
                                <p class="title">Managing Director, BT Design</p>
                            </li>
                            <li>
                                <img src="/images/killerapp/judge-ribbit.png" />
                                <h4>Chuck Freedman</h4>
                                <p class="title">Director of Developer Platform, Ribbit</p>
                            </li>
						</ul>
					</div>
				</div>
        	<p style="clear:both;"></p>
        </div>
       </div>
<jsp:include page="tcFoot.jsp"/>

</body>
</html>