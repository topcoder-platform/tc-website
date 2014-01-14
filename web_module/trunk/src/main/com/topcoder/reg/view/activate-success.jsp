<%--
   - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
   - This is the home page of registration app.
   - Version: 1.0
   - Author: notpad
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<s:include value="includes/html_head.jsp">
		<s:param name="pageTitle">Account is Activated</s:param>
	</s:include>
    <body>
		<s:include value="includes/head.jsp"></s:include>
        <div id="heading" class="registrationSuccessfulHedading">	
            <div class="inner">
                <h1>Account is Activated</h1>
            </div><!-- END .inner -->
        </div>

		<div id="content" class="registrationSuccessful">	
        	<p class="hightLight">Thank you, <a href='http://www.topcoder.com/member-profile/<%=request.getAttribute("user_handle")%>'><strong><%=request.getAttribute("user_handle")%></strong></a>. Your registration is now completed.</p>
            
			<p>Note: You can now post in forums and view all of the competitions. However, if you plan to compete you will need to <a href="https://www.topcoder.com/reg/">complete your full profile</a> so we can pay you if you win. Why not do that now?
Or, choose an area to visit below.</p>

			<ul>
            	<li>
                	<a href="http://www.topcoder.com/" class="tcLogo"><img src="i/logo-topcoder.png" width="136" height="21" alt="TopCoder" /></a>
                    <h5> Main Site and Software Community</h5>
                    <p>Visit the home page and learn more about TopCoder.</p>
                    <p>Compete in algorithm, component design and development, marathon matches, architecture and much more. There are competitions tailored to every stage of development for projects in various technologies. Join the software community and compete!</p>
                </li>
            	<li class="middle">
                	<a href="http://studio.topcoder.com/" class="studioLogo"><img src="i/logo-tc-studio.png" width="135" height="45" alt="TopCoder Studio" /></a>
                    <h5>Graphic Design Community</h5>
                    <p>Compete in competitions ranging from graphic design, information architecture, mobile app design, UX and UI, logos, print and more.</p>
                    <p> Have the opportunity to design for big-name clients and compete against designers from across the globe. Learn more in the Studio Help Center. Join the design community and compete!</p>
                </li>
            	<li>
                	<a href="#"><img src="i/logo-tc-cockpit.png" width="136" height="71" alt="TopCoder Cockpit" /></a>
                    <h5>Customer Portal</h5>
                    <p>Plug into the world's largest community of competitive software developers and graphic designers.</p>
                    <p> Launch, manage and monitor your projects with the help of TC community members called "copilots", then view and download your submissions all through the Cockpit tool. Engage the community now!</p>
                </li>
            </ul>
            <div class="clear"></div>

        </div><!-- End #content -->
		<div class="clear"></div>
        <s:include value="includes/footer.jsp"></s:include>
		<s:include value="includes/modal.jsp"></s:include>
    </body>
</html>