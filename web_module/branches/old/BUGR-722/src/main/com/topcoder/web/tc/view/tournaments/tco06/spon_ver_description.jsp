<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="spon_ver_links.jsp" >
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="description"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
	<tr valign="top">
		<td valign="top" align="center">
		<div class="bodySpacer">
            
<span class="bigTitle">Description of the Sponsor Track Competition</span>
<br><br>
Welcome to the 2006 TopCoder Open VeriSign Sponsor Track competition--one of many opportunities you will have this year to participate in coding competitions, demonstrate your technology talents, and network with other engineers throughout the company worldwide.
<br/><br/> 
This year, we hope to strengthen our engineering community by finding ways for us to connect with each other, such as: 
<ul>
<li>sharing information and code</li>
<li>promoting the development and use of best practices</li>
<li>facilitating access to and adoption of the Common Application Framework (CAF)*</li>
<li>fostering a company-wide engineers' network</li>
</ul>
For some fun, we have teamed up with TopCoder to bring you exciting online coding contests with fantastic prizes. 
<br/><br/> 
There are several rounds of competitions planned this year. The final competition will take place this summer at the first ever VeriSign Technical Symposium (VTS).  The VTS is a multi-day, multi-track event where engineers will meet with industry experts and vendors, exchange ideas, and build relationships with each other.
<br/><br/> 
The first coding competition of the year is the Sponsor Track challenge.  Win this and you will collect $2,500 and become a finalist in our live coding competition at the VTS. Following this Sponsor Track competition, VeriSign will hold two internal competitions.  First and second place winners of each will win $1,500 and $750 respectively and become finalists.  
<br/><br/> 
For more details on the Sponsor Track, see the <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=spon_ver_rules">official rules & regulations</a> and <a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=spon_ver_schedule">schedule</a>. 
<br/><br/> 
VeriSign Human Resources, VSS, VIS, O&I, and the CAF team are sponsoring the Sponsor Track competition.
<br/><br/> 
Best of luck and let the coding begin! 
<%--
--%>
<br><br>
<span class="bigTitle">How to Register for the Sponsor Track Competition</span>
<br><br>
<strong>Already a TopCoder Member?</strong><br>
            Click
            <% if (sessionInfo.isAnonymous()) { %>
    <A href="/tc?module=Login&nextpage=http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=spon_ver_reg">here</A>
            <% } else { %>
            <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=spon_ver_reg">here</A>
            <% } %>
             to register for the Sponsor Track Competition.
<br><br>
<strong>Not Yet a TopCoder Member?</strong><br>
Click <A href="/reg/">here</A> to register as a TopCoder member.<br>
Check your email and activate your new TopCoder account.<br>
Click             <% if (sessionInfo.isAnonymous()) { %>
    <A href="/tc?module=Login&nextpage=http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=spon_ver_reg">here</A>
            <% } else { %>
            <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=spon_ver_reg">here</A>
            <% } %>
 to register for the Sponsor Track Competition
<br/><br/><br/>
* <i>The Common Application Framework (CAF) is a set of reusable infrastructure components and best practices for building transaction-oriented applications in Java/J2EE. Learn more about CAF components, reference applications, and documentation by accessing:  <a href="http://portal.vrsn.com/sites/cafinfo/default.aspx">CAF SharePoint site</a> or contact <a href="mailto:%20afinan@verisign.com">Angelique Finan</a><.</i>
<br/><br/>
        </div>
		</td>


<!-- Right Column-->
<td width="170" align="right">
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<img src="/i/tournament/tco06/verisign_right.gif" alt="Verisign" border="0" /><br />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<div align="center" class="bodyText"><strong><A href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder Events</A></strong></div>
</td>

	</tr>

</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>