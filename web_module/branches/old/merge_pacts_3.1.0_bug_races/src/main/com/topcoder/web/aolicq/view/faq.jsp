<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.aolicq.Constants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge - FAQs :: Powered by TopCoder</title>

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
				<h2 class="faq">Frequently Asked Questions</h2>
				
					<h3>General FAQs</h3>
						<ul>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=faq#gen1">Is the Contest open to non-U.S. residents?</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=faq#gen2">Is this competition strictly for individuals or is teaming up also allowed ?</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=faq#gen3">Are Ribbit Calls Free?</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=faq#gen4">Where can I dial using my Ribbit developer account?</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=faq#gen5">Can I dial internationally with my Ribbit developer account?</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=faq#gen6">Who terminates/enables the calls I place with my apps?</a></li>
						</ul>
				
					<h3>Ribbit SDK Related FAQs</h3>
						<ul>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=faq#sdk1">Where/how do I get the SDK?</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=faq#sdk2">How do I report a bug?</a></li>
							<li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=faq#sdk3">How do I request a new feature for the Ribbit platform?</a></li>
						</ul>
						
					<br />
						
						<h4><a name="gen1"></a>Is the Contest open to non-U.S. residents?</h4>
							<p>YES! ABSOLUTELY! You are eligible to participate unless you are a resident of any of the following countries: Cuba, Iran, North Korea, Sudan, and Syria. (U.S. export regulations prohibit the export of goods and services to Cuba, Iran, Iraq, North Korea, Sudan and Syria. Therefore residents of these countries / regions are not eligible to participate. Residents of the Province of Quebec are also ineligible due to local contest restrictions.)</p>
							<p>Please note: non-U.S. Residents must be authorized in the country in which the member resides while participating in the competition to perform services as an independent contractor.</p>
							<p>Members must not violate and are solely responsible for maintaining compliance with their immigration visas, or other employment laws, in the country in which they are located as well as any and all individual employment contracts/obligations which prevent or restrict them from working as an independent contractor.</p>
							
						<h4><a name="gen2"></a>Is this competition strictly for individuals or is teaming up also allowed ?</h4>
							<p>Multiple people may work on your submission, but there are no teams in this competition, so only the submitting member is eligible for prizes.</p>
							<p>But we encourage you to take advantage of the resources you have to develop the best app, and stay tuned: soon we'll be announcing some exciting ways you can use TopCoder Studio for your killer UI!</p>
						
						<h4><a name="gen3"></a>Are Ribbit Calls Free?</h4>
							<p>Our goal at Ribbit to enable developers to create new and innovative ways to integrate our capabilities into new applications and workflows. Therefore, Ribbit developers are not charged to use the API or terminate US domestic phone calls while your applications are in the developer sandbox. If you need the voice transcription capability enabled, contact us directly at <a href="mailto:developersupport@ribbit.com">developersupport@ribbit.com</a>. Preferring a common sense approach, we&rsquo;ve thus far been successful in not having to impose usage limits on our developer community, but we do reserve the right to limit individual developer accounts if needed.</p>
							<p>When you are ready to move your application out of the sandbox and into production, then you&rsquo;ll be able to take advantage of Ribbit&rsquo;s innovative pay-as-you-go pricing model (<a href="http://developer.ribbit.com/platform/pricing">http://developer.ribbit.com/platform/pricing</a>), something we think benefits our developers by giving them the powerful telecom industry capabilities without giving them the telecom industry&rsquo;s high-priced long-term contracts.</p>
							
						<h4><a name="gen4"></a>Where can I dial using my Ribbit developer account?</h4>	
							<p>Developers are given access to dial anywhere in the domestic U.S. for free.</p>
							
						<h4><a name="gen5"></a>Can I dial internationally with my Ribbit developer account?</h4>	
							<p>No. At this time international dialing is not available for developer accounts.</p>
							
						<h4><a name="gen6"></a>Who terminates/enables the calls I place with my apps?</h4>	
							<p>Ribbit is acting as the phone company and manages all call terminations you place with your apps.</p>
					
					<br />
					<h3>Ribbit SDK Related FAQs</h3>
					
						<h4><a name="sdk1"></a>Where/how do I get the SDK?</h4>
							<p>You&rsquo;ll first need to register with Ribbit to download and get access to technical support. To sign up for a Ribbit Developer account go to: <a href="http://developer.ribbit.com/register">http://developer.ribbit.com/register</a></p>
						
						<h4><a name="sdk2"></a>How do I report a bug?</h4>
							<p>In order to help us provide comprehensive developer support, please use the <a href="http://developer.ribbit.com/bug">report a bug</a> link in the dev center to report any bugs.</p>
							<p>This will allow us to assign, track, and respond to all fixes/issues as well as update our database for future queries.</p>
							
						<h4><a name="sdk3"></a>How do I request a new feature for the Ribbit platform?</h4>
							<p>Please use the <a href="http://developer.ribbit.com/feedback">feedback</a> link to send us new feature requests.</p>
					</div>
				</div>
        
				
        	<p style="clear:both;"></p>
        </div>
       </div>
<jsp:include page="tcFoot.jsp"/>

</body>
</html>