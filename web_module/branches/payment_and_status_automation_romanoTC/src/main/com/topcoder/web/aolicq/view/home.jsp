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
            	<h2>CREATE. INNOVATE. WIN.</h2>
                <p>We&rsquo;re challenging you to develop the next killer voice ware application</p>
                <h3>Up to $100,000.00 in Prizes</h3>
            </div>
            
            <div id="about-text">
           	<h2 style="color:#ff6600;">Announcing the Winners of <br />the Ribbit Killer App Challenge!</h2>
	
			<p>Thank you to everyone who participated in the Ribbit Killer App Challenge.</p>
			<p>The choice was tough, as many apps pushed the envelope of integrating Ribbit's voice, telephony and messaging API. Overall, we looked for apps that achieved innovative interactions with Flash - and integrated Ribbit's features to make significant impact on the way we communicate.</p>
			
			<h2 style="color:#47ad00;">And the winners are:</h2>
			<h3 style="text-align: center; font-size:14px;"><strong>Media Advertising &amp; Entertainment</strong><strong> : $15,000</strong></h3> 
			<h3 style="text-align: center; font-size:14px;"><strong>Ribbit Killer App Challenge &#8220;Best in Show&#8221; Winner : $15,000</strong></h3> 
			<p style="text-align: center;"><a href="http://killerappchallenge.ribbit.com/news/?page_id=576"><strong>Lucid Viewer - Developer, Jason Villmer, Naples, Italy [villmer]</strong></a></p>
			<p style="text-align: center;"><a href="http://killerappchallenge.ribbit.com/news/?page_id=576"><img class="aligncenter" title="Lucid Viewer" src="http://killerappchallenge.ribbit.com/news/wp-content/uploads/2009/03/lucid_viewer.jpg" alt="" width="300" height="211" /></a></p>
			<p style="text-align: left;">Lucid&#8217;s immersion technology coupled with Ribbit&#8217;s capabilities is the next step in terms of creating new interactive experiences. Adding a voice and communications layer completes the bridge to the real world that is missing in other virtual reality experiences. The landscape for new business and artistic applications is almost endless.</p>
			
			<br />
			<br />
			
			<h3 style="text-align: center; font-size:14px;"><strong>Social Networking &amp; Communications</strong><strong> : $15,000</strong></h3> 
			<p style="text-align: center;"><strong><a href="http://killerappchallenge.ribbit.com/news/?page_id=712">Save a Life - Developer - Romin K. Irani, Mumbai, India [rominirani]</a></strong></p>
			<p style="text-align: center;">
				<a href="http://killerappchallenge.ribbit.com/news/?page_id=712"><img class="aligncenter" src="http://killerappchallenge.ribbit.com/news/wp-content/uploads/2009/03/savealife1.png" alt="" width="289" height="226" /></a>
			</p>
			<p style="text-align: left;">
				This socially-conscious application really brings to light the use of voice and telephony as an enabler to address real-world communication challenges; in this case as it relates to finding blood donors. This serves as a informative example to institutions that currently perform similar tasks and how they can drive workflow enhancements by communications enabling healthcare processes.
			</p>
			
			<br />
			<br />
			
			<h3 style="text-align: center; font-size:14px;"><strong>Business &amp; Productivity</strong><strong> : $15,000</strong></h3> 
			<p style="text-align: center;">
				<strong><a href="http://killerappchallenge.ribbit.com/news/?page_id=899">Sugared Frog - Developer - Sena Gbeckor-Kove, Amsterdam, The Netherlands [senagbe]</a></strong>
			</p>
			<p style="text-align: center;">
				<a href="http://killerappchallenge.ribbit.com/news/?page_id=899"><img class="aligncenter" style="border: 1px solid black;" src="http://killerappchallenge.ribbit.com/news/wp-content/uploads/2009/03/screenshot.jpg" alt="" width="270" height="237" /></a>
			</p>
			<p style="text-align: left;">
				Continuing in the vein of Ribbit&#8217;s award-winning Ribbit for Salesforce application, Sugared Frog demonstrates the tremendous market potential for communications enabling business processes. The return on investment from a CRM perspective is especially compelling in the current economic environment.
			</p>
			
			<br />
			<br />
			
			<h3 style="text-align: center; font-size:14px;"><strong>Carrier, Network or ISP Integration : $15,000</strong></h3> 
			<p style="text-align: center;">
				<strong><a href="http://killerappchallenge.ribbit.com/news/?page_id=868">SimplePhone - Developer - Joseph Farrar, Las Vegas, NV [joedeveloper]</a></strong>
			</p>
			<p style="text-align: center;">
				<a href="http://killerappchallenge.ribbit.com/news/?page_id=868"><img class="aligncenter" src="http://killerappchallenge.ribbit.com/news/wp-content/uploads/2009/03/appimage.jpg" alt="" width="182" height="268" /></a>
			</p>
			<p style="text-align: left;">
				This app integrates the Ribbit platform and Broadsoft's Broadworx API and is skinned and deployed on SimpleSignal It can function as a stand-alone Flash phone and can also be linked with Broadworx XSP accounts to access Broadworx user profile feature set. For example, the user has set his DND (Do-Not-Disturb) notification on his Broadsoft account which is supported on the Ribbit Flash Phone.
			</p>
			<p style="text-align: left;">
				It also demonstrates a federated developer ecosystem model - marrying Ribbit's open platform with the Broadworx API - which, in turn, opens up Broadsoft's customer base (including a number of the world's largest telecom carriers) to the Ribbit Developer Community.
			</p>
			
			<br />
			<br />
			
			<h3 style="text-align: center; font-size:14px;"><strong>Wildcard</strong> <strong>: $15,000</strong></h3> 
			<p style="text-align: center;">
				<strong><a href="http://killerappchallenge.ribbit.com/news/?page_id=571">CHYAA - Developer - David H. Bello, Bogota, Columbia [dhbellol]</a></strong>
			</p>
			<p style="text-align: center;">
				<a href="http://killerappchallenge.ribbit.com/news/?page_id=571"><img class="aligncenter" src="http://killerappchallenge.ribbit.com/news/wp-content/uploads/2009/03/cyhaa.jpg" alt="" width="240" height="240" /></a>
			</p>
			<p style="text-align: left;">Voice as an interface is an incredibly exciting prospect with a multitude of potential applications. The ease and familiarity of using a phone and your voice combined with the usefulness of remotely controlling home functions highlights a broad category of applications that are innovative yet easy to use.</p>
			<p>Congratulations to all of the winners! We'll take great pride seeing these apps deployed around the world.</p>
			<p>On a final contest note, there were some very close votes and we are planning to contact several submitters directly in the coming weeks to discuss other Ribbit opportunities on the horizon. And, if you are planning on monetizing your application, please contact us as partneropps@ribbit.com.</p>
            	
            	
            	
            	
            <%--	
            	<div id="home-side">
                    <div id="fiveways">
                        <div id="fivecontainer">
                            <h2><div>5</div> Ways to Win</h2>
                            <ul>
                                <li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=media">Media, Advertising &amp; Entertainment</a></li>
                                <li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=socialNetworking">Social Networking &amp; Communication</a></li>
                                <li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=business">Business &amp; Productivity</a></li>
                                <li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=carrier">Carrier, Network, or ISP Integration</a></li>
                                <li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=wildcard">Wildcard</a></li>
                            </ul>
                        </div>
                        <p>The winner in each of the <strong>5 categories</strong> will receive <strong class="prize">$15,000</strong> and will be eligible for the <strong class="prize">$30,000</strong> Grand Prize.</p>
                        <p class="five-learnmore"><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=learnMore">Learn More ></a></p>
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
            	</div>
            	<h2>KILLER IDEAS, KILLER APPS</h2>
            	<p>Ribbit&rsquo;s Open Telephony Platform gives you direct access to the world&rsquo;s first global, programmable phone company. And, we&rsquo;ve teamed up with TopCoder to find out what will happen when we put that power into the hands of the most creative Flash & Flex developers in the world.</p>
            	<p>With Ribbit, voice is now a programmable feature that is free from the traditional device. It can go anywhere&hellip; on a phone, on a webpage, inside email, and in an existing app. Voice can now live inside any environment including online communities or stores, CRM systems, call center applications, media properties - you name it.</p>

            	<p>This competition is your chance to show your stuff. Build a great app, have it reviewed by a panel of highly respected judges from around the industry, and you can win big money in any of our five contest categories: Media, Advertising and Entertainment, Social Networking and Communication, Business and Productivity, Carrier, Network, or ISP Integration, and Wildcard.</p>
            	<p><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=learnMore">Click here</a> to learn more about how to compete and the benefits of submitting early.</p>

				<p>Good Luck!</p>
			    --%> 
            </div>
           
            
              <%-- <div id="timeline"><img src="/images/killerapp/killerapp_timeline.png"></div> --%> 
            
            
           
			
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <%-- 
            
            <div id="register-steps">
            	<h2>Steps to Register</h2>
                <p>Participation in the Ribbit Killer App Challenge is completely FREE! Just follow the simple steps below and you'll be on your way to possibly claiming some of our $100,000 in prize money! Here's a quick overview:</p>
            	<ol>
                	<li><strong>Register for a developer id at <a href="http://developer.ribbit.com/register">ribbit.com.</a></strong></li>
                    <li class="two"><strong><a href="https://www.topcoder.com/reg/?module=Main&amp;rt=2">Sign up</a> to become a Topcoder member </strong><br />
                    The Killer App Challenge is run using TopCoder's patented competition engine and administered by TopCoder's professional competition staff. TopCoder members are a worldwide community of programmers who compete in algorithm and development contests for prize money. Become a member now to compete in this challenge and other TopCoder contests! If you are already a TopCoder member, go to step 3. <a href="https://www.topcoder.com/reg/?module=Main&amp;rt=2">Sign up at TopCoder &gt;&gt;</a></li>
                  	<li class="three"><strong><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1002">Register</a> for the Ribbit Killer App Challenge now!</strong><br />Once you are a TopCoder member, all you have to do is register for the Ribbit Killer App Challenge! Register now to participate in this contest! <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&ct=1002">Contest registration &gt;&gt;</a> </li>
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
        --%> 
        </div>
        
        <div id="right-sidebar">
        	
            <div id="blog-posts-sidebar">
                <h3>Latest Blog Posts</h3>
          		
                <ul>
                    <div id="replace"></div>
					 <script>
							var rss = "/news/?feed=rss2";
				
							//A sample URL to get Template
							var template = "/js/killerapp/blogTemplate.txt";
				
							var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
							document.getElementById("replace").innerHTML = (processor.transformRSSFeed(rss));
					 </script>
                    <li class="buttons">
                    	<span class="rss-button"><a href="http://feeds.feedburner.com/ribbitdeveloper?format=xml"><img src="/images/killerapp/rss.gif" /></a></span><a href="http://developer.ribbit.com/blog/?cat=10" class="view-all" title="Learn More">Learn More</a>
                    </li>
                </ul>
            </div>
            
            <div id="forum-posts-sidebar">
                <h3>Latest Forum Posts</h3>
                
                <ul>
                    <div id="replace2"> </div>
                    <li class="buttons">
                    	 <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/forums" class="view-all" title="Learn More">Learn More</a>
                    </li>
                </ul>
               <script>
						var rss = "/forums?module=RSS&categoryID=1";
			
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