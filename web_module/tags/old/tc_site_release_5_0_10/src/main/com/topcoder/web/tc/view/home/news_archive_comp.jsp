<%@ page import="com.topcoder.web.tc.Constants"%>
<%@  page language="java"  %>
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
            <jsp:param name="title" value="Component Competitions"/>
        </jsp:include>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr class="bodyText"><td nowrap="nowrap">03.29.06 3:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=testing&d3=activeContests">Software Testing registration extended</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.21.06 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=testing&d3=activeContests">Software Testing Active Contests</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.15.06 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=assembly&d3=overview">Introducing Software Assembly Competitions</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.15.06 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=testing&d3=overview">Introducing Software Testing Competitions</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.11.06 2:25 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=support&d3=desReviewSample">Design Review Scorecard Changes</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.08.05 11:25 AM - </td><td width="100%"><A href="/tc?module=Static&d1=contracting&d2=tcs_chat_110805">TopCoder Software chat session from SRM 271</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.07.05 5:30 PM - </td><td width="100%">TopCoder Software chat session scheduled for SRM 271</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.27.05 11:05 AM - </td><td width="100%"><A href="/tc?module=CompList&amp;<%=Constants.PHASE_ID%>=112">Design</A> and <A href="/tc?module=CompList&amp;<%=Constants.PHASE_ID%>=113">Development</A> Contest Lists, Scorecard Details</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.05.05 9:25 AM - </td><td width="100%">Reliability Rating changes</td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.26.05 3:00 PM - </td><td width="100%">Software Royalties updated in Member Profiles</td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.17.05 8:00 PM - </td><td width="100%">New Statistics: Component Contest Details</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.12.05 3:50 PM - </td><td width="100%"><A href="http://software.topcoder.com/index.jsp">software.topcoder.com</A> will be down for maintenance on 7/18</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.05 5:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=support&d3=desReviewSample">New Sample Design Review Scorecard now available</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.23.05 11:20 AM - </td><td width="100%"><A href="/i/development/downloads/topcoder_global.build">Global NAnt properties file now available</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.17.05 11:55 AM - </td><td width="100%"><A href="http://software.topcoder.com/catalog/c_component.jsp?comp=14836181">oldbig scores a perfect 100 in a Component Development Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.06.05 1:05 PM - </td><td width="100%"><A href="/rtables/viewThread.jsp?forum=205768&thread=495791&mc=1">Reviewer minimum requirements updated</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.29.05 3:25 PM - </td><td width="100%">TCS to post Design and Development projects on Wednesdays</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.05 11:15 AM - </td><td width="100%"><A href="http://software.topcoder.com/index.jsp">"Top 10 Most Downloaded Components" added to TCS homepage</A></td></tr>
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
