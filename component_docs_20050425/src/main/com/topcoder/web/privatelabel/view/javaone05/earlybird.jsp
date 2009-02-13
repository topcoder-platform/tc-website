<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel=stylesheet href="/css/javaone05.css">
<title>2005 JavaOne Coding Challenge</title>
</head>
<body>
<map name="bannerMap">
<area shape="rect" alt="http://www.sun.com/" coords="697,4,799,72" href="http://www.sun.com/" target="_new">
<area shape="rect" alt="http://java.sun.com/" coords="624,3,694,72" href="http://java.sun.com/" target="_new">
<area shape="rect" alt="http://www.sun.com/javaone" coords="0,7,616,70" href="http://www.sun.com/javaone" target="_new">
</map>

<center>
<table id="main" width="800" cellpadding="0" cellspacing="0" border="0">
            <tr>
               <td colspan="2" align="left" valign="middle">
               <img src="/i/events/javaone05/banner_top.gif" border="0" usemap="#bannerMap" alt="JavaOne - Experiencing Java technology through education, industry, and community">
               </td>
            </tr>
            <tr>
               <td valign="top" width="164"><jsp:include page="links.jsp" /></td>
               <td valign="top" >
                 <table border="0" width="100%" cellpadding="7" cellspacing="0"><tr><td valign="top"><img src="/i/events/javaone05/coding_challenge.gif" width="351" height="27" border="0" /></td>
                 <td align="right" valign="top"><a href="/"><img src="/i/events/javaone05/pbtc_logo.gif" width="130" height="27" border="0" /></a></td></tr></table>
                    <p class="regmiddle">   
                       <b>Early Bird Discount</b>&#160;&#160;|&#160;&#160;
                        <a href="/pl/?&module=Static&d1=javaone05&d2=student"><b>Student Discount</b></a></p>
               <p class ="regmiddle"><strong><font size="4">Early Bird Discount</font></strong></p>
               
						<p class="regmiddle">Early Bird TopCoder Professional discount:</p>

						<p class="regmiddle">Join Us and SAVE $300 at the JavaOne<sup>SM</sup> Conference in San Francisco!</p>

						<p class="regmiddle">Come join us at the JavaOne Conference taking place June 27-June 30, 
						2005, at Moscone Center in San Francisco. As the power behind the Coding Challenge at the Conference, 
						TopCoder invites you to stop by the Competition Arena in the JavaOne Pavilion. It all starts at the 
						JavaOne Conference, your source for cutting-edge knowledge and proven solutions.</p>

						<p class="regmiddle">Professional TopCoder members save $200 off onsite pricing when you register by May 27, 2005.  
						Register online today at <a href="http://java.sun.com/javaone/sf/registration.jsp" target="_blank">java.sun.com/javaone/sf/registration.jsp</a>.
						Please use Registration Code "TCODER2" to receive your savings. </p>

						<p class="regmiddle">The JavaOne conference is your ultimate source for Java technology knowledge and 
						education. Here's a glimpse of what you'll find on site: </p>


						<blockquote>
						<ul class="regmiddle">
						<li>JavaOne Pavilion, featuring the latest products and technologies from leading companies</li> 
						<li>Hundreds of in-depth technical sessions that focus on real-world solutions </li> 
						<li>Popular Birds-of-a-Feather sessions where you can interact with your peers </li> 
						<li>Renowned JavaOneSM After Dark activities where you can cut loose </li> 
						<li>Interactive Hands-on Labs led by industry experts </li> 
						</ul></blockquote>


						<p class="regmiddle">Register online at <a href="http://java.sun.com/javaone/sf/registration.jsp" target="_blank">java.sun.com/javaone/sf/registration.jsp</a> today. 
						Be sure to use Registration Code "TCODER2" to receive your savings. </p>

						<p class="regmiddle">We look forward to seeing you in San Francisco this June! </p>
                  <p class="regmiddle">This offer is not valid for Web-based registration. Offer expires May 27, 2005. </p>
               </td>
            <tr>
               <td colspan="2" align="left" valign="middle">
                  <jsp:include page="foot.jsp" />
               </td>
            </tr>
            
         </table>
</center>
   </body>
</html>