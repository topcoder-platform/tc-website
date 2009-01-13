<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<%
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>


<%-- ##########################################
 						CHANGES START HERE
 		 #######################################	 --%>

    <div id="header2">
        <div class="wrapper2">
            
<%-- MASTHEAD AND LOGO --%>
            <h1><a href="http://www.topcoder.com" title="TopCoder"><span>TopCoder Direct</span></a></h1>
			
			
	<%-- LOGIN FORM (NEW) --%>
	<div id="loginform">
		<div id="login_left"></div>
		<div id="login_right"></div>
		
		<form action="">
		<div id="left">
			<div>Handle</div>
				<div><input type="text" /></div>
				<div><input type="checkbox" name="remember" value="Remember me" /> Remember me</div>
			</div>
			<div id="right">
				<a href="#" class="button">Login</a>
			<div class="register"><a href="#">Register today!</a></div>
		</div>
		
		<div id="middle">
			<div>Password</div>
			<div><input type="text" /></div>
			<div><a href="#" >Forgot your password?</a></div>
		</div>
		</form>
		
	</div>
       <h2 id="ready_engage"><span>Ready.. ENGAGE</span></h2>
          <div id="studio_menu">
				<ul>
					<li class="left <% if (section.equals("home")) {%> active <% } %>"><a href="/">{ }</a></li>
					<li <% if (section.equals("contest")) {%> class="active"<% } %>><a href="/?module=ViewActiveContests">Contests</a></li>
					<li <% if (section.equals("forums")) {%> class="active"<% } %> ><a href="/forums">Forums</a></li>
					<li <% if (section.equals("howitworks")) {%> class="active"<% } %>><a href="/?module=Static&amp;d1=support&amp;d2=getStarted">How It Works</a></li>
					<li <% if (section.equals("cup")) {%> class="active"<% } %>><a href="/?module=Static&d1=digitalrun&d2=2008v2&d3=home">Studio Cup</a></li>
					<li <% if (section.equals("my_studio")) {%> class="active"<% } %>><a href="/?module=MyStudioHome">My Studio</a></li>
					<li <% if (section.equals("blog")) {%> class="active"<% } %>><a href="http://studio.topcoder.com/blog/">Blog</a></li>
					<li <% if (section.equals("portfolio")) {%> class="active"<% } %>><a href="/?module=Static&amp;d1=portfolio&amp;d2=portfolio">Portfolio</a></li>
					<li class="right <% if (section.equals("contact")) {%> active<% } %>"><a href="/?module=Static&amp;d1=contactUs">Contact Us</a></li>
				</ul>
			</div>
		  
<%-- MAIN NAVIGATION --%>
            <div id="nav">
                <h3 class="hide">Main Navigation</h3>
                <ul>
                    <li class="left"><a href="http://www.topcoder.com/">TopCoder Home</a></li>
                    <li><a href="http://software.topcoder.com/">Engage</a>
                        <ul>
                            <li><a href="http://www.topcoder.com/direct/cockpit/cockpit.jsp">TopCoder Direct</a></li>
                            <li><a href="http://software.topcoder.com/catalog/">Components</a></li>
                            <li><a href="http://software.topcoder.com/indexTCS.jsp">Software</a></li>
                            <li><a href="http://software.topcoder.com/TCD/platform-tools.jsp">Platform Tools</a></li>
                            <li><a href="http://software.topcoder.com/TCD/training.jsp">Training &amp; Mentoring</a></li>
                            <li><a href="http://software.topcoder.com/TCD/support.jsp">Support &amp; Maintenance</a></li>
                            <li class="last-li"><a href="http://software.topcoder.com/contact.jsp">Contact Us</a></li>
                        </ul>
                    </li>
                    <li><a href="http://www.topcoder.com/tc">Compete</a>
                        <ul>
                            <li><a href="http://www.topcoder.com/tc?module=ViewActiveContests&amp;ph=112">Component Design</a></li>
                            <li><a href="http://www.topcoder.com/tc?module=ViewActiveContests&amp;ph=113">Component Development</a></li> 
                            <li><a href="http://www.topcoder.com/tc?module=ViewAssemblyActiveContests">Assembly</a></li>
                            <li><a href="http://www.topcoder.com/longcontest/?module=ViewActiveContests">Marathon Matches</a></li>
                            <li><a href="http://www.topcoder.com/wiki/display/tc/Bug+Races">Bug Races</a></li>
                            <li class="last-li"><a href="http://studio.topcoder.com/?module=ViewActiveContests">Studio Competitions</a></li>
                        </ul>
                    </li>
                    <li   id="studio" class="on" ><a href="http://studio.topcoder.com/">Studio</a>
               		<%--<ul>
                            <li><a href="http://studio.topcoder.com/?module=ViewActiveContests">Active Contests</a></li>
                            <li><a href="http://www.topcoder.com/direct/">Launch a Contest</a></li>
                            <li><a href="http://studio.topcoder.com/forums">Studio Forums</a></li>
                            <li><a href="http://www.tcstudioblogs.com/">Studio Blog</a></li>
                            <li><a href="http://studio.topcoder.com/?module=MyStudioHome">My Studio</a></li>
                            <li class="last-li"><a href="http://studio.topcoder.com/?module=Static&amp;d1=contactUs">Contact Studio</a></li>    
                        </ul>--%>
                    </li>
                    <li><a href="http://www.topcoder.com/tc">Community</a>
                        <ul>
                            <li><a href="http://www.topcoder.com/reg/">Join TopCoder</a></li>
                            <li><a href="http://www.topcoder.com/tc?module=MyHome">My TopCoder</a></li>
                            <li><a href="http://forums.topcoder.com/">TopCoder Forums</a></li>
                            <li class="last-li"><a href="http://studio.topcoder.com/forums">Studio Forums</a></li>
                           </ul>
                    </li>
                </ul>
            </div><%-- #navigation ends --%>
            
            <%-- SUB NAVIGATION --%>
            <div id="nav_support">
                <h3 class="hide">SUB Navigation</h3>
                <ul>
                    <li class="left"><a href="#">FAQ</a></li>
                    <li><a href="#">News</a></li>
                    <li><a href="#">Contact Us</a></li>  
                    <li><a class="gMetal" id="login_link" href="#">Login</a></li>
					<li class="logout gMetal"><a  href="#" id="logout_link">Logout</a></li>
				</ul>
            </div><%-- #navigation ends --%>
        </div>
      <%-- .wrapper ends --%>
    </div><%-- #header ends --%>

