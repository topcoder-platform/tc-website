<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link rel=stylesheet href="http://java.sun.com/javaone/javaone2004.css">
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/doubleclick.css"/>

<title>2004 JavaOne Coding Challenge</title>



<jsp:include page="../script.jsp" />

</head>
	<body>
		<div align="center">
			<table border=0 cellspacing=0 width="800">
				<tr>
					<td colspan="2" align="left" valign="middle"> <img src="/i/events/javaone04/javaone04_logo.gif" width="166" height="80" border="0"/>
					<img src="/i/clear.gif" width="420" height="80" border="0"/>
					<a href="http://www.topcoder.com/"><img src="/i/events/javaone04/pbtc_logo.gif" width="166" height="80" border="0"/></a><br/>
					<img src="/i/events/javaone04/purple_dot.gif" width="800" height="25" border="0"></td></tr>
				<tr>
					<td valign="top" width="164">
						<jsp:include page="links.jsp" /></td>
					<td valign="top">
				<!-- start breadcrumb -->
  						<table border="0" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0" >
   							<tr><td width="19"><img src="/i/clear.gif" width="634" height="20"></td></tr>
						</table>
  				<!-- end breadcrumb -->
  					<p></p>
  					<img src="/i/clear.gif" width="7" height="1"><img src="/i/events/javaone04/coding_challenge.gif" width="351" height="27" border="0">  						
  						<p></p>
  						<p class="regmiddle"><strong><font size="4">Practice Arena</font></strong></p>
						<p class="regmiddle">Practice for the JavaOne Coding Challenge! From May 28-June 26, a dedicated online practice room is 
						available for registered JavaOne conference Attendees. In the practice room, you get to solve algorithmic 
						problems and code, compile, test, and submit problems similar to the ones in the JavaOne Coding Challenge. 
						Log in anytime and give yourself a better chance at walking away with one of the grand prizes.</p>

						<p class="regmiddle">In the meantime, get everything you need to sharpen your Java programming skills through the Sun Developer 
						Network at sun.com/developers/. With technical articles, code samples, blueprints, and more, you're sure to 
						learn something new. Gear up on the tips and tricks that will give you the edge!</p>
					
					
					</td>
				</tr>
			</table>
			<jsp:include page="foot.jsp" />
		</div>
	</body>
</html>