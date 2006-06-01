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
<tr class="bodyText"><td nowrap="nowrap">05.23.06 1:45 PM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=10015">Marathon Match 1 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.11.06 10:30 AM - </td><td width="100%">Intel Multi-Threading Competition 5 postponed</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.08.06 2:30 PM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=9974">Intel Multi-Threading Competition 4 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.27.06 9:00 AM - </td><td width="100%"><A href="/longcontest/?module=Static&d1=instructions">Marathon Match 1 to start on May 10th</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.10.06 12:00 NOON - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=9958">Intel Multi-Threading Competition 3 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.29.06 3:15 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Announcement&annID=13">Intel Multi-Threading Competition 3 server maintenance, extended deadline</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.09.06 3:00 PM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=9892">Intel Multi-Threading Competition 2 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.17.06 5:00 PM - </td><td width="100%"><A href="/longcontest/?module=ViewOverview&rd=9881">Intel Multi-Threading Competition 1 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.27.06 3:30 PM - </td><td width="100%"><A href="/longcontest/?module=ViewActiveContests&rt=15">Intel Multi-Threading Competition 1 Extended</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.16.06 9:00 AM - </td><td width="100%"><A href="/longcontest/?module=Static&d1=intel_overview">Introducing the Intel Multi-Threading Competition Series</A></td></tr>
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