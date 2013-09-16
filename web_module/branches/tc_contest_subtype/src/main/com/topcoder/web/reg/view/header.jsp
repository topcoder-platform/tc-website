<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<div id="header"> 
	<div class="top">
		<a href="#" class="logo"></a>
		<a class="redBtn" href="/reg">
			<span class="buttonMask"><span class="text">LOGIN / REGISTER</span></span>
		</a>
		<ul>
			<li>
				<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc" class="menu community">Community</a>
				<div class="subMenus" style="width: 150px;">
					<a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/tc" style="display: block; width: auto;">Developer (/TC)</a>
					<a target="_blank" href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>" style="display: block; width: auto;">Graphic Design (Studio)</a>
					<a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/" style="display: block; width: auto;">Analytics (Marathon)</a>
					<a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewCopilotPool&amp;size=20&amp;view=0&amp;sort=12" style="display: block; width: auto;">Copilots (Manage)</a>
					<a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/reg2" style="display: block; width: auto;">Join Now!</a>
				</div>
			</li>
			<li>
				<a href="/whatiseoi" class="menu platform">Platform</a>
				<div class="subMenus" style="width: 150px;">
					<a href="http://<%=ApplicationServer.SERVER_NAME%>/whatiseoi" style="display: block; width: auto;">What is it?</a>
					<a href="http://<%=ApplicationServer.SERVER_NAME%>/case-studies" style="display: block; width: auto;">Case Studies</a>
					<a href="http://<%=ApplicationServer.SERVER_NAME%>/webinar/" style="display: block; width: auto;">Videos &amp; Webinars</a>
					<a href="http://<%=ApplicationServer.SERVER_NAME%>/platform-updates" style="display: block; width: auto;">Roadmap</a>
					<a target="_blank" href="/wp-content/themes/tc-eoi-theme-v3.2/sampleprojects/1/index.html" style="display: block; width: auto;">Example Project</a><a target="_blank" href="http://topcoder.com/home/component-catalog/" style="display: block; width: auto;">Catalog</a>
					<a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/direct" style="display: block; width: auto;">Go To Cockpit</a>
				</div>
			</li>
			<li>
				<a href="/leadership" class="menu about">About Us</a>
				<div class="subMenus" style="width: 150px;">
					<a href="http://<%=ApplicationServer.SERVER_NAME%>/leadership/" style="display: block; width: auto;">Leadership</a>
					<a href="http://<%=ApplicationServer.SERVER_NAME%>/pressroom/" style="display: block; width: auto;">News</a>
					<a href="http://<%=ApplicationServer.SERVER_NAME%>/event/" style="display: block; width: auto;">Events</a>
					<a href="http://<%=ApplicationServer.SERVER_NAME%>/aboutus/careers/" style="display: block; width: auto;">Careers</a>
				</div>
			</li>
			<li>
				<a href="/aboutus/contact-us/" class="menu contact">Contact</a>
				<div class="subMenus" style="width: 150px;">
					<a href="http://<%=ApplicationServer.SERVER_NAME%>/ContactUsGeneral_General.html" style="display: block; width: auto;">Sales</a>
					<a href="http://<%=ApplicationServer.SERVER_NAME%>/ContactUs_Sponsorships.html" style="display: block; width: auto;">Sponsorship</a>
					<a href="mailto:support@topcoder.com" style="display: block; width: auto;">Support</a>
					<a href="http://<%=ApplicationServer.SERVER_NAME%>/aboutus/contact-us/" style="display: block; width: auto;">Connect</a>
				</div>
			</li>
			<li class="right"><a href="http://<%=ApplicationServer.SERVER_NAME%>/blog" class="menu blog">Blog</a></li> 
		</ul>
	</div>
	<!-- END .top -->
</div>