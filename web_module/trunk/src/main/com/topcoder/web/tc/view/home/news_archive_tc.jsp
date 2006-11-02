<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.tc.Constants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder News Archive</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
		<td width="180">
			<jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="m_competitions"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="news_archive"/>
            <jsp:param name="title" value="General News"/>
        </jsp:include>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr class="bodyText"><td nowrap="nowrap">11.02.06 11:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=sponsors&d2=aolMashups">Now open: AOL Mashup contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.01.06 4:50 PM - </td><td width="100%">Online Review scheduled maintenance</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.30.06 4:00 PM - </td><td width="100%">TopCoder members honor victor_lxd</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.27.06 3:00 PM - </td><td width="100%"><A href="http://studio.topcoder.com/forums?module=Thread&threadID=123">Introducing AOL Mashups, at TopCoder Studio</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.09.06 9:40 PM - </td><td width="100%">Recent Color Changes now available</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.02.06 2:00 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=513341">TopCoder is turning 100!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.18.06 4:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=pressroom&d2=art_091806">In memoriam: victor_lxd</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.14.06 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=collegetour&d2=description">2006 TopCoder College Tour continues</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.30.06 4:00 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/">gojohnie wins the first TopCoder Studio contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.14.06 10:00 AM - </td><td width="100%"><A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/">Introducing TopCoder Studio</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.06.06 9:00 AM - </td><td width="100%">Downtime for scheduled maintenance: 08.03</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.31.06 7:30 PM - </td><td width="100%"><A href="/tc?module=MemberContact">Member Contacting now available</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.10.06 10:00 AM - </td><td width="100%">Syntax Highlighter and other features added to the arena</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.06.06 11:05 AM - </td><td width="100%">Downtime for scheduled maintenance: 07.07</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.06 6:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=my_home&d2=empReferrals">TopCoder Employee Referral Program Prize Increase</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.25.06 2:30 AM - </td><td width="100%"><A href="/tc?module=Static&d1=hs&d2=home">High School Registration Open</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.24.06 1:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=calendar&d2=jun_06">Events Calendar Updated for Marathon Matches</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.24.06 10:30 AM - </td><td width="100%">Downtime for scheduled maintenance: 05.24</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.19.06 1:20 PM - </td><td width="100%">Downtime for scheduled maintenance: 05.21</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.08.06 6:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=calendar&d2=jun_06">Events Calendar Updated through December</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.18.06 12:15 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=510488">.NET 2.0 now supported on TopCoder systems</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.04.06 7:25 PM - </td><td width="100%">"Coder of the Month" split</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.06 12:00 NOON - </td><td width="100%"><A href="/tc?module=Static&d1=my_home&d2=empReferrals">TopCoder Employee Referral Program</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.07.06 12:30 AM - </td><td width="100%">New look, new navigation, new www.topcoder.com</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.02.06 9:00 PM - </td><td width="100%">Ratings added to Forums</td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.06.05 11:00 AM - </td><td width="100%">Event calendar updated for <A href="/tc?module=Static&d1=calendar&d2=feb_06">February</A>, <A href="/tc?module=Static&d1=calendar&d2=mar_06">March</A>, <A href="/tc?module=Static&d1=calendar&d2=apr_06">April</A>, and <A href="/tc?module=Static&d1=calendar&d2=may_06">May</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.05 2:00 PM - </td><td width="100%">"Achievements" added to Member Profiles</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.05 4:40 PM - </td><td width="100%">Event calendar updated for <A href="/tc?module=Static&d1=calendar&d2=nov_05">November</A>, <A href="/tc?module=Static&d1=calendar&d2=dec_05">December</A>, and <A href="/tc?module=Static&d1=calendar&d2=jan_06">January</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.30.05 6:30 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=8">"News Discussions" now in the Forums</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.11.05 5:50 PM - </td><td width="100%">New Rating Distribution Graphs</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.25.05 12:20 PM - </td><td width="100%">New Rating History Graphs</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.18.05 8:30 AM - </td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>">New TopCoder Forums</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.13.05 11:40 AM - </td><td width="100%"><A href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_COM%>">Coder of the Month Archive</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.08.05 11:40 AM - </td><td width="100%"><A href="/rtables/viewThread.jsp?forum=244237&thread=500228&mc=1">More data feeds for accessing TopCoder statistics</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.03.05 4:00 PM - </td><td width="100%">Event calendar updated for <A href="/tc?module=Static&d1=calendar&d2=aug_05">August</A>, <A href="/tc?module=Static&d1=calendar&d2=sep_05">September</A>, and <A href="/tc?module=Static&d1=calendar&d2=oct_05">October</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.12.05 5:50 PM - </td><td width="100%">Ratings have been updated</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.11.05 6:00 PM - </td><td width="100%">New Member Profiles</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.09.05 11:20 AM - </td><td width="100%"><A href="/rtables/viewThread.jsp?forum=244237&thread=496018&mc=1">New Algorithm, Design, and Development rating formulas</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.03.05 4:15 PM - </td><td width="100%"><A href="/rtables/viewThread.jsp?forum=244237&thread=443165&mc=1">School name to be made public in Member Profiles</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.21.05 9:30 AM - </td><td width="100%"><A href="/tc">New /tc homepage</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.09.05 9:00 AM - </td><td width="100%"><A href="http://software.topcoder.com/components/subscriptions.jsp">Developer Subscriptions just became FREE</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.07.05 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=pressroom&d2=pr_020705">TC Community Surpasses 50,000 Worldwide</A></td></tr>
</table>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>