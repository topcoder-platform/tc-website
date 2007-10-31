<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
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
<tr class="bodyText"><td nowrap="nowrap">10.31.07 7:30 PM - </td><td width="100%">Component <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=desSummary">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=devSummary">Development</A> Finals: Round 1</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.07 4:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=umltool&d3=description">How Do You Like the UML Tool?</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.07 1:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=stage1Winners">2007.5 Digital Run: Stage 1 Winners</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.20.07 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=umltool&d3=description&node=des_uml_tool">Try the TopCoder UML Tool</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.30.07 12:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=digital_run&d2=2007Stage4Winners">Digital Run: Stage 4 winners</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.23.07 7:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=support&d3=desReliability">Design &amp; Development reliability bonuses increased</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.04.07 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=digital_run&d2=description">Announcing the Digital Run 2007.5 Season</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.02.07 2:00 PM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=16730">Vote for the TopCoder UML Tool Splash Screen Design</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.16.07 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=testing&d3=activeContests">Metric Reporting Testing Competitions</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.02.07 3:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=digital_run&d2=2007Stage3Winners">Digital Run: Stage 3 Winners</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.13.07 9:00 AM - </td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=22">Software Forums integrated into TopCoder Forums</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.27.06 5:00 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Announcement&annID=55">Poseidon version update</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.05.06 5:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=assembly&d3=activeContests">Three Assembly Competitions open: $55,000+ in prizes</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.04.06 9:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">New Records in the Component Record Book</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.10.06 12:10 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_orpheusGameServer">New Assembly contest online: $45,000 in prizes!</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.01.06 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=digital_run&d2=2006_des_prizes">Design prizes <strong><em>DOUBLED</em></strong> for next Digital Run stage</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.31.06 3:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=assembly&d3=activeContests">Latest Software Assembly winners claim $22,500 in prizes</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.23.06 6:00 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewPastContests">leungxiao wins Digital Run logo contest</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.06 11:00 AM - </td><td width="100%"><A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2040">UML Tool Icons contest over at the Studio</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.03.06 10:00 AM - </td><td width="100%">Appeals statistics on member profiles and <A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">Record Book</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.21.06 12:30 PM - </td><td width="100%"><A href="/tc?module=ViewActiveContests&ph=112">Puzzled? Components offer brainy challenge</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.20.06 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=assembly&d3=det_costingEngineAdminTool">New Assembly contest online: $22,500 in prizes!</A><br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.14.06 10:30 PM - </td><td width="100%">Design and Development Submission Downloads<br></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.31.06 2:30 PM - </td><td width="100%">Digital Run: Stage 1 winners finalized<br>
<A href="/tc?module=LeaderBoard&ph=112&sc=&sd=&staid=1&nr=50&sr=1">Design Stage 1 Leaderboard</A>&#160;|&#160;<A href="/tc?module=LeaderBoard&ph=113&sc=&sd=&staid=1&nr=50&sr=51">Development Stage 1 Leaderboard</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.24.06 1:25 PM - </td><td width="100%"><A href="/tc?module=Static&d1=digital_run&d2=2006_stage1_winners">Announcing the Digital Run: Stage 1 winners</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.18.06 2:30 PM - </td><td width="100%">A banner week for Component Competitions <br>
<A href="/tc?module=ViewActiveContests&ph=112">design contests</A>&#160;|&#160;<A href="/tc?module=ViewActiveContests&ph=113">development contests</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.03.06 12:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=assembly&d3=activeContests">Assembly Competition prizes top five figures</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.26.06 1:30 PM - </td><td width="100%">New guidelines for component competitors and reviewers<br>
<A href="/tc?module=Static&d1=dev&d2=support&d3=desDocumentation">design docs</A>&#160;|&#160;<A href="/tc?module=Static&d1=dev&d2=support&d3=devDocumentation">development docs</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.08.06 5:30 PM - </td><td width="100%">Poseidon 4.1 now the official standard</td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.28.06 5:30 PM - </td><td width="100%">New Software <A href="/tc?module=Static&d1=dev&d2=support&d3=desGettingStarted">Design</A> and <A href="/tc?module=Static&d1=dev&d2=support&d3=devGettingStarted">Development</A> Tutorial Movies</td></tr>
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
<tr class="bodyText"><td nowrap="nowrap">07.12.05 3:50 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/index.jsp">software.topcoder.com</A> will be down for maintenance on 7/18</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.05 5:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=dev&d2=support&d3=desReviewSample">New Sample Design Review Scorecard now available</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.23.05 11:20 AM - </td><td width="100%"><A href="/i/development/downloads/topcoder_global.build">Global NAnt properties file now available</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.17.05 11:55 AM - </td><td width="100%"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=14836181">oldbig scores a perfect 100 in a Component Development Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.06.05 1:05 PM - </td><td width="100%"><A href="/rtables/viewThread.jsp?forum=205768&thread=495791&mc=1">Reviewer minimum requirements updated</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.29.05 3:25 PM - </td><td width="100%">TCS to post Design and Development projects on Wednesdays</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.05 11:15 AM - </td><td width="100%"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/index.jsp">"Top 10 Most Downloaded Components" added to TCS homepage</A></td></tr>
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
