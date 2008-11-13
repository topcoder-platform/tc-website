<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.aolicq.Constants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge - Home</title>

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
            <h2 class="learn-more">How to Compete</h2>
            <h3 class="highlight">Announcing the $100,000 Ribbit Killer App Challenge!</h3>
            <p>Ribbit was created with the understanding that the next generation of great communication solutions would be created, not by us, and not by a traditional phone company&mdash;but by you, the Flash and Flex Developers. The Ribbit Voice Platform gives you, the most creative developers in the world, the ability to add rich communication features into your Flash and Flex projects by giving you direct access to the world's first global, programmable phone company. We're challenging you to help build the next generation phone company&mdash;by creating the next Ribbit Killer Application.</p>
            <h3>Everybody Wins!</h3>
            <p>You win no matter what. These are your inventions, your applications. We don't own them, you do. Even if you are not selected as an official contest winner, you're free to bring your solutions to your customers or marketplace and directly profit from your creativity.</p>
            <h3>What Can I Build?</h3>
            <p>Anything you want! We will be awarding grand prizes in the following categories:</p>
            <ul>
              <li>Business and Productivity - Push business apps even further by bringing voice and rich communication features into the application workflow. <em><strong>(learn more)</strong></em></li>
              <li>Carrier and Network Integration - Show us the most innovative integration to an existing cable, carrier or mobile network. <em><strong>(learn more)</strong></em></li>
              <li>Media, Advertising and Entertainment - To win this category you need to captivate an audience and add unprecedented interactive value. <em><strong>(learn more)</strong></em></li>
              <li>Social Networking and Communication - Give us a Web 3.0 preview with the best example of connecting people via open telephony. <em><strong>(learn more)</strong></em></li>
              <li>Wildcard - Blow us away by improving the usability of any device or interface (from vending machines to ticket kiosks). <em><strong>(learn more)</strong></em></li>
            </ul>
            <h3>How to Compete</h3>
            <p>Be sure to read the <a href="#">full contest rules</a>. <em><strong>*Link here</strong></em><br />
              <em><br />
              <strong>copy/paste the steps to registering</strong></em><strong><br />
              </strong><br />
              Five, $15,000 Grand Prizes will be awarded to the Killer Apps that best utilize the Ribbit platform to captivate, innovate, and have the best overall market potential in each category. From the five category winners, one will be selected as overall winner and receive an additional $15,000 for a total of $30,000. Plus, we'll be awarding $10,000 in prizes to early submitters at three checkpoints along the way. We can't wait to see what develops!</p>
            <h3>Benefits of Submitting Early - Prizes, Feedback and Your Own Studio Competition!</h3>
            <p>In addition to the prizes awarded to each checkpoint winner,  Ribbit &amp; TopCoder will provide feedback on these apps, in order for you to continue to improve and enhance your application. Taking the advice and guidance of the judging panel to further develop your submission into a Killer App, gives you a better chance to win a grand prize at the end of the competition.</p>
            <p>TopCoder will also award each checkpoint winner a $500 credit that can be used to run your own design competition (link to studio) on TopCoder Studio. Using this credit is entirely optional, but with it you can take advantage of the global design community of Studio to give your app a Killer UI!</p>
            <p>To be eligible for a checkpoint prize the application must have been submitted during the applicable phase of the contest. An application submitted in one phase can be eligible for prizes at additional checkpoints only if it has been resubmitted with notable changes, upgrades, improvements or enhancements as determined by the contest judges.</p>
            <h3>How to Submit</h3>
            <p><em><strong>Get full details from Ribbit-</strong></em></p>
            <p>The requirements for submission may vary depending on the Killer App category, make sure you check out your specific category info page before submitting. (link)</p>
            <p>Once your app is live, <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=<%=Constants.MINISITE_CONTEST_ID%>">submit it to the contest</a>.</p>
            <p>You will need to submit a zip file to TopCoder which includes 2 items:</p>
            <ul>
              <li>A text document containing:
                <ul>
                  <li>Your TopCoder handle name</li>
                  <li>Your unique Ribbit Developer ID</li>
                  <li>A title and brief overview of the application to be used as an online description</li>
                  <li>The Killer App Category to which you are submitting</li>
                  <li>Most importantly, a link to the URL where the application can be viewed/downloaded<br />
                    </li>
                </ul>
              </li>
              <li>An image file (jpg, or png) containing a screengrab or graphic representation of your application (no larger than 300x300 pixels).</li>
              </ul>
            <h3>How Your App will be Judged</h3>
            <p>Submissions will be judged by the Ribbit Killer App Challenge judging team.<br />
              <br />
              <em><strong>Need Ribbit to flesh this out.</strong></em><br />
              <br />
              A panel of judges including <em><strong>XXX</strong></em> and &quot;celebrity judges&quot; will score each app according to specific criteria in each contest category.</p>
            <p><em><strong>Little bit on the &quot;celeb judges&quot;</strong></em></p>
            <p>For more information on specific judging criteria, be sure to read the info page for the category to which you are submitting.</p>
            <h3>Contest Details</h3>
            <p>For contest information and details on the Ribbit API, please visit: ribbit.com/killerappchallenge.</p>
            <p>For full contest rules, eligibility, and to register to participate, go to:topcoder.com/killerappchallenge.</p>
            <h3>One Planet. One Phone Company</h3>
            <p>Ribbit is a phone company without borders, and since we are now part of the BT family of companies, we'll be quickly expanding our global reach and capabilities. Already, well over 50% of our 7,000 developers are global and yes, this contest is open to everyone, (as long as it doesn't conflict with local or area restrictions) – and we can't wait to see what to see the innovative solutions you come up with.</p>
          </div>
        </div>
        
        <div id="right-sidebar">
        	
            <div id="blog-posts-sidebar">
                <h3>Judges</h3>
          		
                <ul class="judges">
                    <li>
                        <img src="/images/killerapp/judges-temp.png" />
                        <h4>Judge Name 1</h4>
                        <p>Some description</p>
                    </li>
                    <li>
                        <img src="/images/killerapp/judges-temp.png" />
                        <h4>Judge Name 2</h4>
                        <p>Some description</p>
                    </li>
                    <li>
                        <img src="/images/killerapp/judges-temp.png" />
                        <h4>Judge Name 3</h4>
                        <p>Some description</p>
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