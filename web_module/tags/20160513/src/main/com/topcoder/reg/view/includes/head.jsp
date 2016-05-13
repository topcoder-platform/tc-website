<%--
   - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
   - This is the head section of registration app. All pages share the same structure should reuse it.
   - - Change in 1.1 (Release Assembly - TopCoder Website Social Login)
   - - Change the LOGIN / REGISTER button to SOCIAL LOGIN button.
   -
   - Version 1.1
   - Author: leo_lol , ecnu_haozi
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.reg.Constants" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
		<header id="header"> 
      		<nav class="top">
	            <a href="#" class="logo"></a>
                <%-- showAuthWidget function is defined in top.jsp --%>
	          	<a class="redBtn" href="javascript:showAuthWidget();">
					<span class="buttonMask"><span class="text">SOCIAL LOGIN</span></span>
				</a>
	            <ul>
	                <li>
						<a href="http://community.topcoder.com/tc"  class="menu community">Community</a>
						<div class="subMenus">
							<a target="_blank" href="http://community.topcoder.com/tc" >Developer (/TC)</a>
							<a target="_blank" href="http://studio.topcoder.com" >Graphic Design (Studio)</a>
							<a target="_blank" href="http://www.topcoder.com/tc" >Analytics (Marathon)</a>
							<a target="_blank" href="http://community.topcoder.com/tc?module=ViewCopilotPool&amp;size=20&amp;view=0&amp;sort=12" >Copilots (Manage)</a>
							<a target="_blank" href="http://www.topcoder.com/reg2" >Join Now!</a>
						</div>
					</li>
	                <li>
						<a href="/whatiseoi" class="menu platform">Platform</a>
						<div class="subMenus">
							<a href="http://www.topcoder.com/whatiseoi" >What is it?</a>
							<a href="http://www.topcoder.com/case-studies" >Case Studies</a>
							<a href="http://www.topcoder.com/webinar/" >Videos &#038; Webinars</a>
							<a href="http://www.topcoder.com/platform-updates" >Roadmap</a>
							<a target="_blank" href="/wp-content/themes/tc-eoi-theme-v3.2/sampleprojects/1/index.html">Example Project</a><a target="_blank" href="http://topcoder.com/home/component-catalog/" >Catalog</a>
							<a target="_blank" href="https://www.topcoder.com/direct" >Go To Cockpit</a>
						</div>
					</li>
	                <li>
						<a href="/leadership" class="menu about">About Us</a>
						<div class="subMenus">
							<a href="http://www.topcoder.com/leadership/" >Leadership</a>
							<a href="http://www.topcoder.com/pressroom/" >News</a>
							<a href="http://www.topcoder.com/event/" >Events</a>
							<a href="http://www.topcoder.com/aboutus/careers/" >Careers</a>
						</div>
					</li>
	                <li>
						<a href="/aboutus/contact-us/" class="menu contact">Contact</a>
						<div class="subMenus">
							<a href="http://connect.topcoder.com/ContactUsGeneral_General.html" >Sales</a>
							<a href="http://connect.topcoder.com/ContactUs_Sponsorships.html" >Sponsorship</a>
							<a href="mailto:support@topcoder.com">Support</a>
							<a href="http://www.topcoder.com/aboutus/contact-us/" >Connect</a>
						</div>
					</li>
	                <li class="right"><a href="http://www.topcoder.com/blog" class="menu blog">Blog</a></li> 
	            </ul>
	        </nav><!-- END nav.top -->
	        <div class="titleLine">
	            <h1>
	                <span class="heading"><img src="i/text-member-login.png" width="132" height="21" alt="Member Login" /></span>
	            </h1>
	            <div class="loginForm_msg"></div>
	            <div class="loginForm">
	                <s:form action="login" method="post" id="loginForm" namespace="/ajax">
		            	<div>
		            	    <div class="msg_hidden"></div>
		            	    <s:textfield type="text" value="Handle" cssClass="text light default handle" name="handle" theme="simple" tabindex="1"></s:textfield><br />
							<label><input type="checkbox" class="checkbox" name="rememberMe" tabindex="3"/><span>Remember me</span></label>
						</div>
						<div>
						    <s:textfield type="password" value="Password" cssClass="text light default password" name="password" tabindex="2"></s:textfield>
		            		<a class="forgot" id="passworRecoveryBtn" href="javascript:;">Forgot Password?</a>
		            	</div>
		            	<div class="last">
			            	<a class="redBtn arrow" href="javascript:doLogin();">
								<span class="buttonMask"><span class="text"><span class="arrow">LOGIN</span></span></span>
							</a>
						</div>
	                </s:form>
	            </div><!-- End .loginForm -->
	            <div class="clear"></div>
	        </div> <!-- End of .titleLine -->
		</header><!-- End #header -->
