<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.aolicq.Constants" %>
<%@ page import="com.topcoder.web.aolicq.controller.request.Login" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="aolicq.tld" prefix="aolicq" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge - Home :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>

</head>
<body>
	  
	 <jsp:include page="topNav.jsp">
        <jsp:param name="active_page" value="home"/>
    </jsp:include>
<div id="wrapper">
<jsp:include page="aolicqTop.jsp"/>
      <%-- Front Page Body Content --%>  
        <div id="left-content">
        	
            <div id="about-banner">
            	<h2>Show Us What You've Got!</h2>
                <p>We want to challenge the top developers out there. Give us your best submissions and you might be a big winner.</p>
                <h3>Up to $100,000.00 in Prizes</h3>
            </div>
            
            <div id="about-text">
            	<div id="fiveways">
                	<h2>5 Ways to Win</h2>
                    <ul>
                    	<li><a href="#">Media, Advertising &amp; Entertainment</a></li>
                        <li><a href="#">Social Networking &amp; Communication</a></li>
                        <li><a href="#">Business &amp; Productivity</a></li>
                        <li><a href="#">Carrier, Network, or ISP Integration</a></li>
                        <li><a href="#">Wildcard</a></li>
                    </ul>
                    <p>Submit an app in any of these <strong>5 categories</strong> for a chance to win a <strong class="prize">$15,000 1st prize</strong> or our <strong class="prize">$30,000 &quot;Best in Show&quot;</strong></p>
                    <p><a href="#">Learn More ></a></p>
                </div>
                <div id="contest-stats">
                	<h2>Latest Contest Statistics</h2>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <th class="first">Registered Competitors</th>
                            <th>Number of Submitted Apps</th>
                            <th class="last">Days Remaining</th>
                        </tr>
                        <tr>
                        	<td class="first">${homeData.map['registered_competitors']}</td>
                            <td>${homeData.map['submissions']}</td>
                            <td class="last">${homeData.map['days_remaining']}</td>
                        </tr>
                        <tr>
                        	<td class="table-foot" colspan="3"></td>
                        </tr>
                    </table>
                </div>
            
            	<h2>KILLER IDEAS, KILLER APPS</h2>
            	<p>Ribbit&rsquo;s Open Telephony Platform gives you direct access to the world&rsquo;s first global, programmable phone company. And, we&rsquo;ve teamed up with TopCoder to find out what will happen when we put that power into the hands of the most creative Flash & Flex developers in the world.</p>
            	<p>With Ribbit, voice is now a programmable feature that is free from the traditional device. It can go anywhere&hellip; on a phone, on a webpage, inside email, and in an existing app. Voice can now live inside any environment including online communities or stores, CRM systems, call center applications, media properties - you name it.</p>

            	<p>This competition is your chance to show your stuff. Build a great app, have it reviewed by a panel of highly respected judges from around the industry, and you can win big money in any of our five contest categories: <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=media">Media, Advertising and Entertainment</a>, <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=socialNetworking">Social Networking and Communication</a>, <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=business">Business and Productivity</a>, <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=carrier">Carrier, Network, or ISP Integration</a>, and <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=wildcard">Wildcard</a>.</p>
            	<p><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=learnMore"">Click here</a> to learn more about how to compete and the benefits of submitting early.</p>

				<p>Good Luck!</p>
            </div>
            
            <div id="register-steps">
            	<h2>Steps to Register</h2>
                <p>Participation in the Ribbit Killer App Challenge is completely FREE! Just follow the simple steps below and you'll be on your way to possibly claiming some of our $100,000 in prize money! Here's a quick overview:</p>
            	<ol>
                	<li><strong>Register for a developer id at <a href="http://developer.ribbit.com/register/">ribbit.com.</a></strong></li>
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
                    	Submit early to be eligible for Check Point Awards. Check Point winners will gain first hand feedback for improving and enhancing submissions &mdash; increasing your chances of creating the ultimate Killer App and winning the Grand Prize.
                    </li>
                </ol>
          </div>
        
        </div>
        
        <div id="right-sidebar">
        	
            <div id="blog-posts-sidebar">
                <h3>Latest Blog Posts</h3>
          		
                <ul>
                    <div id="replace"></div>
        		 <script>
						var rss = "/blog/?cat=10&feed=rss2";
			
						//A sample URL to get Template
						var template = "/js/killerapp/blogTemplate.txt";
			
						var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
						document.getElementById("replace").innerHTML = (processor.transformRSSFeed(rss));
       			 </script>
                    
                    
                    <li>
                    	 <a href="http://developer.ribbit.com/blog/?cat=10" class="view-all" title="Learn More">Learn More</a>
                    </li>
                </ul>
            </div>
            
            <div id="forum-posts-sidebar">
                <h3>Latest Forum Posts</h3>
                
                <ul>
                    <div id="replace2"> </div>
                    <li>
                    	 <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/forums" class="view-all" title="Learn More">Learn More</a>
                    </li>
                </ul>
               <script>
						var rss = "/forums?module=RSS&forumID=2";
			
						//A sample URL to get Template
						var template = "/js/killerapp/forumTemplate.txt";
			
						var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
						document.getElementById("replace2").innerHTML = (processor.transformRSSFeed(rss));
       			 </script>
            </div>
        </div>
        <p style="clear:both;"></p>
        </div>
        </div>
	<jsp:include page="tcFoot.jsp"/>
</body>
</html>