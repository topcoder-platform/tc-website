<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
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
            <jsp:param name="title" value="Marathon Matches"/>
        </jsp:include>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr class="bodyText"><td nowrap="nowrap">11.02.07 7:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=summary">TCCC07 Marathon Match Finals</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.09.07 4:00 PM - </td><td width="100%"><A href="/tc?module=MatchDetails&rd=10930">Prizes Added to Marathon Match 24</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.26.07 2:00 PM - </td><td width="100%"><A href="http://forums.topcoder.com/?module=Thread&threadID=588630">Marathon Match support added to the Arena</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.20.07 11:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=calendar&d2=sep_07">New Marathon Matches added</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.07.07 11:00 AM - </td><td width="100%"><A href="/longcontest/?module=ViewActiveContests">Marathon Match statistics upgraded</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.24.07 4:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=calendar&d2=may_07">Two new Marathon Matches added to Event Calendar</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.18.07 9:00 AM - </td><td width="100%">Marathon Match Ratings</td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.04.07 9:40 AM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=10681">Intel&#174; Multi-Threading Competition 12 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.09.06 10:45 AM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=10649">Intel&#174; Multi-Threading Competition 11 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.09.06 10:45 AM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=10123">Intel&#174; Multi-Threading Competition 10 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.02.06 1:30 PM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=10105">Intel&#174; Multi-Threading Competition 9 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.06.06 10:50 AM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=10089">Intel&#174; Multi-Threading Competition 8 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.08.06 3:50 PM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=10087">Intel&#174; Multi-Threading Competition 7 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.04.06 10:45 AM - </td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=512394">Python now supported in Marathon Matches</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.05.06 10:00 AM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=10083">Intel&#174; Multi-Threading Competition 6 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.20.06 2:20 PM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=10082">Marathon Match 2 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.05.06 10:00 AM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=10019">Intel&#174; Multi-Threading Competition 5 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.23.06 1:45 PM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=10015">Marathon Match 1 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.11.06 10:30 AM - </td><td width="100%">Intel&#174; Multi-Threading Competition 5 postponed</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.08.06 2:30 PM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=9974">Intel&#174; Multi-Threading Competition 4 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.27.06 9:00 AM - </td><td width="100%"><A href="/longcontest/?module=Static&d1=instructions">Marathon Match 1 to start on May 10th</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.10.06 12:00 NOON - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=9958">Intel&#174; Multi-Threading Competition 3 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.29.06 3:15 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Announcement&annID=13">Intel&#174; Multi-Threading Competition 3 server maintenance, extended deadline</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.09.06 3:00 PM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=9892">Intel&#174; Multi-Threading Competition 2 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.17.06 5:00 PM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=9881">Intel&#174; Multi-Threading Competition 1 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.27.06 3:30 PM - </td><td width="100%"><A href="/longcontest/?module=ViewActiveContests&rt=15">Intel&#174; Multi-Threading Competition 1 Extended</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.16.06 9:00 AM - </td><td width="100%"><A href="/longcontest/?module=Static&d1=intel_overview">Introducing the Intel&#174; Multi-Threading Competition Series</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.13.05 10:00 AM - </td><td width="100%"><A href="/longcontest/?module=Static&d1=instructions">Introducing Marathon Matches</A></td></tr>
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