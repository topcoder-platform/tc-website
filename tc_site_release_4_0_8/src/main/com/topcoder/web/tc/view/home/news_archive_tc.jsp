<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder News Archive</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
		<td width="180">
			<jsp:include page="../includes/global_left.jsp">
				<jsp:param name="level1" value=""/>
				<jsp:param name="level2" value=""/>
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

<table border=0 cellpadding=2 cellspacing=0 width="100%">
<tr class="bodyText"><td nowrap="nowrap">10.04.05 2:00 PM&#160;-&#160</td><td width="100%">"Achievements" added to Member Profiles</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.05 4:40 PM&#160;-&#160</td><td width="100%">Event calendar updated for <A href="/tc?module=Static&d1=calendar&d2=nov_05">November</A>, <A href="/tc?module=Static&d1=calendar&d2=dec_05">December</A>, and <A href="/tc?module=Static&d1=calendar&d2=jan_06">January</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.30.05 6:30 PM&#160;-&#160</td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=8">"News Discussions" now in the Forums</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.11.05 5:50 PM&#160;-&#160</td><td width="100%">New Rating Distribution Graphs</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.25.05 12:20 PM&#160;-&#160</td><td width="100%">New Rating History Graphs</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.18.05 8:30 AM&#160;-&#160</td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>">New TopCoder Forums</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.13.05 11:40 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=SimpleStats&trans=true&c=com_history&d1=statistics&d2=coderOfMonth">Coder of the Month Archive</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.08.05 11:40 AM&#160;-&#160</td><td width="100%"><A href="/rtables/viewThread.jsp?forum=244237&thread=500228&mc=1">More data feeds for accessing TopCoder statistics</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.03.05 4:00 PM&#160;-&#160</td><td width="100%">Event calendar updated for <A href="/index?t=schedule&c=aug_05">August</A>, <A href="/index?t=schedule&c=sep_05">September</A>, and <A href="/index?t=schedule&c=oct_05">October</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.12.05 5:50 PM&#160;-&#160</td><td width="100%">Ratings have been updated</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.11.05 6:00 PM&#160;-&#160</td><td width="100%">New Member Profiles</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.09.05 11:20 AM&#160;-&#160</td><td width="100%"><A href="/rtables/viewThread.jsp?forum=244237&thread=496018&mc=1">New Algorithm, Design, and Development rating formulas</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.03.05 4:15 PM&#160;-&#160</td><td width="100%"><A href="/rtables/viewThread.jsp?forum=244237&thread=443165&mc=1">School name to be made public in Member Profiles</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.21.05 9:30 AM&#160;-&#160</td><td width="100%"><A href="/tc">New /tc homepage</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.09.05 9:00 AM&#160;-&#160</td><td width="100%"><A href="http://software.topcoder.com/components/subscriptions.jsp">Developer Subscriptions just became FREE</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.07.05 9:00 AM&#160;-&#160</td><td width="100%"><A href="/?&t=news_events&c=pr_02_07_05">TC Community Surpasses 50,000 Worldwide</A></td></tr>
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
