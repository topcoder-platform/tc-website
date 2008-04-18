<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
<%@ page import="java.util.Map" %>
<%--
<% ResultSetContainer recentWinners = (ResultSetContainer) ((Map) request.getAttribute("studio_home_data")).get("recent_winners");%>
--%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>


<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Welcome to TopCoder Studio</title>

<link rel="stylesheet" href="/css/v2/studio_home.css" media="all" type="text/css" />

</head>

<body>
<div id="wrapper">

<!-- header -->
   <div id="header">

     <!-- logoBox -->
     <div id="header_data">
       <div class="logoBox"><a href="${sessionInfo.servletPath}"><img src="http://studio.topcoder.com/i/v2/studio_logo.png" alt="TopCoder Studio" /></a></div>
     </div>

     <!-- menubar -->
	 <ul id="nav">
		<li><a href="${sessionInfo.servletPath}" title="Home" onfocus="this.blur();">Home</a></li>
		<li><a href="${sessionInfo.servletPath}?module=ViewActiveContests" title="Contests" onfocus="this.blur();">Contests</a></li>
		<li><a href="/forums" title="Forums" onfocus="this.blur();">Forums</a></li>
		<li><a href="${sessionInfo.servletPath}?module=MyStudioHome" title="My Studio" onfocus="this.blur();">My Studio</a></li>
		<li><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=getStarted" title="Support" onfocus="this.blur();">Help</a></li>
		<li><a href="${sessionInfo.servletPath}?module=Static&amp;d1=contactUs" title="Contact Us" onfocus="this.blur();">Contact Us</a></li>
	 </ul>
   </div>

	<!-- main content -->
	<div id="content">

		<!-- begin left container -->
		<div class="content_l">

			<!-- welcome box -->
			<div class="welcome">
			    <div id="welcome_head">
				   <h1>Welcome to TopCoder Studio!</h1>
				   <p>Show  off your creative skills in a competitive environment and get paid for being the best!</p>
				</div>
				<div id="welcome_banner">
				   <a href="http://studio.topcoder.com/forums?module=Thread&threadID=1541&start=0"><img alt="Get Started Now!" src="i/welcome_banner.png" width="536" height="121" border="0" /></a>
				</div>
			</div>

			<!-- banner -->
			<div class="banner">
			<p></p>
			</div>

			<!-- contest box -->
			<div class="contests"><div>
				<h2><span>ACTIVE CONTESTS</span></h2>
				<span class="more"><a href="/?module=ViewActiveContests">View All</a></span>
				<table>
					<thead>
					<tr>
						<th class="first">Contest</th>
						<th class="second">Purse</th>
						<th class="last">Deadline</th>
					</tr></thead>
					<tbody>
						<tr>
							<td class="first"><a href="#">Hermes Bracket Integration Storyboard</a></td>
							<td class="second">$500</td>
							<td class="last">04.22.2008<br />13:00 EDT</td>
						</tr>
						<tr>
							<td class="first"><a href="#">Argus VP Chart Interaction/Animation Phase 3</a></td>
							<td class="second">$1200</td>
							<td class="last">04.22.2008<br />1:00 EDT</td>
						</tr>
						<tr class="last_row">
							<td class="first"><a href="#">AIM Expressions Prototype</a></td>
							<td class="second">$1250</td>
							<td class="last">04.22.2008<br />23:00 EDT</td>
						</tr>
					</tbody>
				</table>
			<div><div></div></div></div></div>

			<!-- winners box -->
	        <div class="winners"><div>
				<h2><span>RECENT WINNERS</span></h2>
				<span class="more"><a href="/?module=ViewActiveContests">View All</a></span>
                	<table>
                    <tbody>
					<tr>
						<td class="img"><a href="#"><img alt="winner 1" src="i/winners/winner_2.png" /></a></td>
						<td>
							<i>rutam</i><br />
							<a href="/?module=ViewPastContests">AIM Expressions Storyboard</a><br />
							$1500.00
						</td>
					</tr>
					<tr class="last_row">
						<td class="img"><a href="/?module=ViewPastContests"><img alt="winner 2" src="i/winners/winner_3.png" /></a></td>
						<td>
							<i>bohuss</i><br />
							<a href="#">Argus VP Chart Interaction/Animation Phase 2</a><br />
							$800.00
						</td>
					</tr>
					<tr>
						<td class="img"><a href="/?module=ViewPastContests"><img alt="winner 3" src="i/winners/winner_1.png" /></a></td>
						<td>
							<i>dafei</i><br />
							<a href="#">TC Pipeline Yahoo Widget Storyboard</a><br />
							$450.00
						</td>
					</tr>
                </tbody>
				</table>
			 <div><div></div></div></div></div>
		</div><!-- end left container -->

		<!-- begin right container -->
		<div class="content_r">

            <!-- login box -->
			<div id="loginBox">
			    <h2>LOGIN</h2>
<!-- JSP START --><c:choose>
				  <c:when test="${sessionInfo.anonymous}">
				  <%--have to use the constant because this page can be used with multiple servlets --%>
				  <form method="post" name="frmLogin" action="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>">
				  <input type="hidden" name="module" value="Login" />
						<span>
						<table cellspacing="0" cellpadding="0" align="center">
						  <tbody>
							<tr class="pd">
								<td width="50%" align="right" valign="bottom">Handle: </td>
								<td valign="bottom"><input class="txt" name="<%=Login.USER_NAME%>" size="8" maxlength="15" type="text" value=""/></td>
							</tr>
							<tr>
								<td align="right">Password: </td>
								<td><input class="txt" name="<%=Login.PASSWORD%>" size="8" maxlength="30" type="password" value=""/></td>
							</tr>
							<tr>
								<td align="right"><input class="checkbox" type="checkbox" id="remember" name="<%=Login.REMEMBER_USER%>"/> </td>
								<td>Remember me</td>
							</tr>
							<tr class="pd">
								<td align="right">
									<input class="btn" type="image" src="http://studio.topcoder.com/i/v2/interface/btnGo.png" width="40" height="22" alt="Go" /></td>
								<td>
									<input class="btn" type="image" src="http://studio.topcoder.com/i/v2/interface/btnRegister.png" width="60" height="22" alt="Register" /></a></td>
							</tr>
							<tr class="pd">
								<td align="center" valign="top" colspan="2"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword" title="Forgot your password?">Forgot your password?</a></td>
							</tr>
						  </tbody>
						</table>
						</span>
			      </form>
				  </c:when>
				  <c:otherwise>
				        <p id="login_data">
					 	    Hello <b>member_handle</b><br />
						   <a href="http://studio.topcoder.com/?module=Logout">Log out</a> |
						   <a href="http://www.topcoder.com/reg/?nrg=false">Update my profile</a>
					    </p>
				  </c:otherwise>
<!-- JSP END -->  </c:choose>
            <div></div></div>

			<!-- news box -->
			<div class="newsBox">
			    <h2>WHAT'S NEW</h2>
				<ul>
					<li>The New Studio enhancements are live! Be sure to check the <a href="/forums">forums</a> for more information on the new submission procedures, and many other cool new features.</li>
					<li>TCO08 Studio finalists are preparing for the finals in Las Vegas. Be sure to watch the <a href="/forums">forums</a> for updates, reports and general info as the championship round approaches! Good luck, everyone!</li>
				</ul>
			<div></div></div>

			<!-- designer box -->
			<div class="designerBox">
				<h2><span>DESIGNER OF THE MONTH</span></h2>
				<p>
					<img class="member" width="57" height="63" alt="Designer of the month" src="http://www.topcoder.com/i/m/oton_big.jpg" />
					<b>March 2008 </b><br />
					<i>oton</i><br />
					Won $2,100 in
					three contests
				</p>
			<div></div></div>

			<!-- assignement box -->
			<div class="assignmentBox">
			   <p class="simpleArrow">
				Have you signed your assignment document?<br />
				<img alt="More Info" src="i/right_arrow.png" /><a class="img_c" href="http://www.topcoder.com/wiki/display/tc/The+Assignment+Document" target="_blank"> Click here for more info!</a>
			   </p>
		    </div></div><br class="clear" />

		<!-- footer -->
		<div id="footer">
			<a href="http://www.topcoder.com/"><img alt="TopCoder" class="TClogo" src="i/tc_logo.jpg" /></a>
			<p><a href="/">Home</a> &nbsp;|&nbsp; <a href="/?module=Static&amp;d1=contactUs">Contact Us</a> &nbsp;|&nbsp; <a href="/?module=Static&amp;d1=about&amp;d2=privacy">Privacy</a> &nbsp;|&nbsp; <a href="/?module=Static&amp;d1=about&amp;d2=terms">Terms</a></p>
		</div>

    </div><!-- end content -->
</div><!-- end wrapper -->
</body>
</html>
