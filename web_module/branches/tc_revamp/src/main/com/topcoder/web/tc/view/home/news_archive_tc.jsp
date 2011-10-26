<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
<tr class="bodyText"><td nowrap="nowrap">12.17.08 5:00 PM - </td><td width="100%"><a href="http://winningformula.espn.com">ESPN Winning Formula Challenge Results are in!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.17.08 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&d1=hs&d2=spotlightSessions">Spotlight Session with tomek Chat Transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.11.08 1:45 PM - </td><td width="100%"><a href="/tc?module=Static&d1=features&d2=120908">Meet the November Coders and Designers of the Month!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.25.08 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&d1=hs&d2=spotlightSessions">Spotlight Session with tomek</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.25.08 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&d1=hs&d2=spotlightSessions">Spotlight Session with Yarin Chat Transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.20.08 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&d1=hs&d2=spotlightSessions">Spotlight Sessions with Yarin</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.06.08 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081106">Spotlight Sessions with Psyho Chat Transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.04.08 4:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2405">$1,500 Studio Mini-Tournament to develop a Flash Arcade-style Game</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.03.08 12:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081028">Spotlight Sessions with John Dethridge Chat Transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.28.08 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions">Spotlight Sessions with John Dethridge</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.08.08 2:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081008">Spotlight Sessions with ACRush Chat Transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.08.08 11:00 AM - </td><td width="100%"><a href="/tc?module=ProjectDetail&amp;pj=30005332">Help Architect a new Flex-ible TopCoder</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.06.08 1:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081002">Spotlight Sessions with SnapDragon Chat Transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.01.08 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions">Spotlight Sessions with SnapDragon</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.22.08 6:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20080920">Spotlight Sessions with Petr Chat Transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.17.08 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions">Introducing Spotlight Sessions at TopCoder</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.11.08 10:30 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1000132">Calling all Designers!  We Need a TCO09 Logo!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.05.08 4:30 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2343">Flex Your Muscles In Studio</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.04.08 2:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2339">New Contest at TopCoder Studio – My eBay HTML Optimization!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.05.08 3:45 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2313">PROFLO JQuery Plugin Contest at TopCoder Studio!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.16.08 10:00 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2288">Facebook Application Build at TopCoder Studio!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.13.08 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=calendar&amp;d2=thisMonth">Event Calendar updated through December 2008</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.12.08 12:15 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=616032">The TCCC: A Difficult Decision</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.05.08 9:30 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2249">Facebook Application Design at TopCoder Studio!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.07.08 9:15 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2229">yourminis flash widget news flash!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.20.08 11:45 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=calendar&amp;d2=apr_08">Seven Marathon Matches added to Event Calendar</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.20.08 9:15 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2201">How's Your Javascript?</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.12.08 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=calendar&amp;d2=thisMonth">Event Calendar updated through July 2008</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.26.08 12:30 PM - </td><td width="100%">Downtime for scheduled maintenance: Tuesday, February 26</td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.18.08 3:45 PM - </td><td width="100%">Downtime for scheduled maintenance: Monday, February 18</td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.18.08 12:00 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=21981">What is your awareness of AMD products and developer program?</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.14.08 6:00 PM - </td><td width="100%">Downtime for scheduled maintenance: Thursday, February 14</td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.14.08 1:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewPastContests">Happy Valentines Day from TopCoder!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.13.08 4:00 PM - </td><td width="100%">Downtime for scheduled maintenance: Wednesday, February 13</td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.25.08 2:00 PM - </td><td width="100%"><a href="/wiki/display/tc/Bug+Races">Off to the Races</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.15.08 6:00 PM - </td><td width="100%"><a href="/wiki/display/tc/Bug+Races">Introducing the TopCoder Bug Races!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.03.08 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=architecture&amp;d2=beta">Registration Open for Three More Architecture Competitions</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.19.07 9:00 AM - </td><td width="100%">TopCoder Has Moved</td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.13.07 12:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=calendar&amp;d2=thisMonth">Event Calendar updated through March 2008</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.12.07 2:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=architecture&amp;d2=beta">TopCoder Architecture Competitions Are Here!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.21.07 1:15 PM - </td><td width="100%"><a href="http://www.topcoder.com/registration/actions/ProjectDetails.do?method=displayProjectDetails&projectId=30002900">Milestone added to Client Cockpit Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.12.07 1:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=593270&amp;start=0">The Next Evolution of TopCoder</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.30.07 5:45 PM - </td><td width="100%"><A target="_blank" href="http://csf.topcoder.com/forums?module=Thread&amp;threadID=123&amp;start=0">CSF Mashup Assembly $40,000.00 Series Prize Purse Winners</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.10.07 10:15 AM - </td><td width="100%"><A target="_blank" href="http://www.equitrader.com/trader/xco/tournaments">Test your trading skills, win $20,000</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.07.07 2:15 PM - </td><td width="100%"><a href="/registration/actions/ProjectManagement.do?method=displayProjectList">New Registration Tool for Assembly Contests</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.04.07 4:30 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=586772">Coder of the Month dates updated</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.28.07 5:00 PM - </td><td width="100%"><a href="http://csf.topcoder.com/?module=Static&amp;d1=assembly&amp;d2=btWorkspaceDetails">BT Workspace Mashup Assembly Competition now open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.28.07 11:00 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=585029&amp;start=24&amp;mc=35">Congratulations to tomekkulczynski</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.27.07 12:45 PM - </td><td width="100%"><a href="http://csf.topcoder.com/">BT Workspace Design Mashup winner</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.17.07 3:00 PM - </td><td width="100%"><a href="http://csf.topcoder.com/?module=Static&amp;d1=assembly&amp;d2=btWiCitiesDetails">BT Wireless Cities Mashup Assembly Competition open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.14.07 3:00 PM - </td><td width="100%"><a href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2118">TopCoder Arena Navigation Wireframe Design Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.09.07 2:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=dev&amp;d2=umltool&d3=description">Introducing the TopCoder UML Tool</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.25.07 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=sponsors&amp;d2=btChat20070721">BT SRM 359 chat session transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.19.07 3:00 PM - </td><td width="100%"><a href="http://csf.topcoder.com/?module=ViewContestDetails&amp;ct=1007">British Telecom Mashup Design Competition open for registration</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.17.07 12:30 PM - </td><td width="100%"><a href="http://csf.topcoder.com/">Microsoft CSF Competitions - Winners Announced!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.09.07 6:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=calendar&amp;d2=thisMonth">Marathon Matches added to Event Calendar</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.18.07 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=help&amp;d2=assignmentDocFaq">New Assignment requirements for TopCoder competitions</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.12.07 3:10 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=17349">What does finding a clue sound like to you?</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.07.07 4:00 PM - </td><td width="100%"><a href="http://csf.topcoder.com/?module=ViewContestDetails&amp;ct=1006">Connected Services "Wireless Cities 2" mashup competition open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.24.07 6:00 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&amp;sid=17170">The Ball Tshirt Design: We have a winner</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.22.07 5:45 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=17170">Vote now for The Ball Tshirt</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.11.07 3:00 PM - </td><td width="100%">Downtime for scheduled maintenance: Sunday, May 13</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.04.07 5:35 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=calendar&amp;d2=thisMonth">Event Calendar updated through December 2007</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.04.07 4:40 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&amp;sid=17060">TCCC07 Web Design vote results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.02.07 5:15 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=17060">Vote now for the final TCCC07 Web design</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.02.07 5:15 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&amp;sid=17020">The Ball Logo &amp; Icons: We have a winner</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.30.07 3:00 PM - </td><td width="100%"><a href="/to/?module=ViewBallot&rd=2036">TCCC07 Web Design Predictive Vote</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.30.07 3:00 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=17020">The Ball Logo &amp; Icon Design Vote</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.27.07 4:00 PM - </td><td width="100%"><a href="http://csf.topcoder.com/?module=ViewContestDetails&amp;ct=1005">Connected Services "Wireless Cities" mashup competition open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.24.07 2:20 PM - </td><td width="100%">Vote for the TCO07 t-shirt designs: 
        <a href="/tc?module=ViewSurvey&amp;sid=16939">Studio Design</a>; 
        <a href="/tc?module=ViewSurvey&amp;sid=16934">Component Design &amp; Development</a>; 
        <a href="/tc?module=ViewSurvey&amp;sid=16923">Marathon Match</a>; 
        <a href="/tc?module=ViewSurvey&amp;sid=16928">Algorithm</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.23.07 5:45 PM - </td><td width="100%"><a href="/to/?module=ViewBallot&rd=2032">"The Ball" Logo &amp; Icon Prediction Contest Round 2</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.19.07 2:00 PM - </td><td width="100%">Predict the TCO T-shirt winners</td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.19.07 2:00 PM - </td><td width="100%"><a href="/to/?module=ViewBallot&rd=2028">"The Ball" Logo &amp; Icon Prediction Contest Round 1</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.13.07 10:00 AM - </td><td width="100%"><a href="/belarus">TopCoder College Tour comes to Belarus</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.11.07 10:30 AM - </td><td width="100%"><a href="http://csf.topcoder.com/?module=Static&amp;d1=assembly&amp;d2=activeContests">Connected Services Assembly Competition now open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.10.07 12:15 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=16884">Vote for the homepage redesign winner</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.10.07 10:45 AM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=16853">Vote for the TopCoder video portal graphic set</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.04.07 9:00 PM - </td><td width="100%"><a href="/to/">Predict the homepage redesign winner: Round 2</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.02.07 1:00 PM - </td><td width="100%"><a href="/to/">Predict the homepage redesign winner</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.07 10:00 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums?module=Thread&amp;threadID=363">Bug in the voting results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.29.07 11:30 AM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=16690">Vote for the new TopCoder video portal</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.16.07 2:00 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&amp;sid=16651">The votes are in for the new Press Room design</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.13.07 2:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2065">Redesign the homepage at TopCoder Studio</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.12.07 6:00 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=16651">Vote for the new Press Room design</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.06.07 3:15 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&amp;sid=16491">The votes are in for the new Member Badges</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.28.07 2:00 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=16491">Vote for the new member badges</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.12.07 3:45 PM - </td><td width="100%">Additional forums maintenance scheduled</td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.08.07 9:20 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2056">Now open: Registration Tool Design Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.07.07 5:00 PM - </td><td width="100%">Forums maintenance scheduled</td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.11.07 4:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2051">New at TopCoder Studio: Equitrader Wireframe contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.02.07 3:15 PM - </td><td width="100%">Deadlines extended due to site outage</td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.20.06 4:15 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2048">New AOL Mashup: $19,000 in prizes</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.14.06 11:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=features&amp;d2=121406">TopCoder Celebrates 100,000 Members</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.11.06 4:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=help&amp;d2=getPaid&node=algo_get_paid">"How to get paid" updated</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.01.06 9:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=calendar&amp;d2=jan_07">Events Calendar updated through May 2007</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.15.06 7:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=sponsors&amp;d2=aolMashups">Now open: AOL Mashup contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.06.06 10:30 AM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=8054">News Icons Contest Vote</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.03.06 10:30 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review">Updated Online Review now online</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.01.06 4:50 PM - </td><td width="100%">Online Review scheduled maintenance</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.30.06 4:00 PM - </td><td width="100%">TopCoder members honor victor_lxd</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.27.06 3:00 PM - </td><td width="100%"><a href="http://studio.topcoder.com/forums?module=Thread&amp;threadID=123">Introducing AOL Mashups, at TopCoder Studio</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.09.06 9:40 PM - </td><td width="100%">Recent Color Changes now available</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.02.06 2:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=513341">TopCoder is turning 100!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.18.06 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=art_091806">In memoriam: victor_lxd</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.14.06 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=collegetour&amp;d2=description">2006 TopCoder College Tour continues</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.30.06 4:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/">gojohnie wins the first TopCoder Studio contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.14.06 10:00 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/">Introducing TopCoder Studio</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.06.06 9:00 AM - </td><td width="100%">Downtime for scheduled maintenance: 08.03</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.31.06 7:30 PM - </td><td width="100%"><a href="/tc?module=MemberContact">Member Contacting now available</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.10.06 10:00 AM - </td><td width="100%">Syntax Highlighter and other features added to the arena</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.06.06 11:05 AM - </td><td width="100%">Downtime for scheduled maintenance: 07.07</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.06 6:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=my_home&amp;d2=empReferrals">TopCoder Employee Referral Program Prize Increase</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.25.06 2:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=hs&amp;d2=home">High School Registration Open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.24.06 1:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=calendar&amp;d2=jun_06">Events Calendar Updated for Marathon Matches</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.24.06 10:30 AM - </td><td width="100%">Downtime for scheduled maintenance: 05.24</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.19.06 1:20 PM - </td><td width="100%">Downtime for scheduled maintenance: 05.21</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.08.06 6:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=calendar&amp;d2=jun_06">Events Calendar Updated through December</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.18.06 12:15 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=510488">.NET 2.0 now supported on TopCoder systems</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.04.06 7:25 PM - </td><td width="100%">"Coder of the Month" split</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.06 12:00 NOON - </td><td width="100%"><a href="/tc?module=Static&amp;d1=my_home&amp;d2=empReferrals">TopCoder Employee Referral Program</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.07.06 12:30 AM - </td><td width="100%">New look, new navigation, new www.topcoder.com</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.02.06 9:00 PM - </td><td width="100%">Ratings added to Forums</td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.06.05 11:00 AM - </td><td width="100%">Event calendar updated for <a href="/tc?module=Static&amp;d1=calendar&amp;d2=feb_06">February</a>, <a href="/tc?module=Static&amp;d1=calendar&amp;d2=mar_06">March</a>, <a href="/tc?module=Static&amp;d1=calendar&amp;d2=apr_06">April</a>, and <a href="/tc?module=Static&amp;d1=calendar&amp;d2=may_06">May</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.05 2:00 PM - </td><td width="100%">"Achievements" added to Member Profiles</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.05 4:40 PM - </td><td width="100%">Event calendar updated for <a href="/tc?module=Static&amp;d1=calendar&amp;d2=nov_05">November</a>, <a href="/tc?module=Static&amp;d1=calendar&amp;d2=dec_05">December</a>, and <a href="/tc?module=Static&amp;d1=calendar&amp;d2=jan_06">January</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.30.05 6:30 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=8">"News Discussions" now in the Forums</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.11.05 5:50 PM - </td><td width="100%">New Rating Distribution Graphs</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.25.05 12:20 PM - </td><td width="100%">New Rating History Graphs</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.18.05 8:30 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>">New TopCoder Forums</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.13.05 11:40 AM - </td><td width="100%"><a href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_COM%>">Coder of the Month Archive</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.08.05 11:40 AM - </td><td width="100%"><a href="/rtables/viewThread.jsp?forum=244237&thread=500228&amp;mc=1">More data feeds for accessing TopCoder statistics</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.03.05 4:00 PM - </td><td width="100%">Event calendar updated for <a href="/tc?module=Static&amp;d1=calendar&amp;d2=aug_05">August</a>, <a href="/tc?module=Static&amp;d1=calendar&amp;d2=sep_05">September</a>, and <a href="/tc?module=Static&amp;d1=calendar&amp;d2=oct_05">October</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.12.05 5:50 PM - </td><td width="100%">Ratings have been updated</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.11.05 6:00 PM - </td><td width="100%">New Member Profiles</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.09.05 11:20 AM - </td><td width="100%"><a href="/rtables/viewThread.jsp?forum=244237&thread=496018&amp;mc=1">New Algorithm, Design, and Development rating formulas</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.03.05 4:15 PM - </td><td width="100%"><a href="/rtables/viewThread.jsp?forum=244237&thread=443165&amp;mc=1">School name to be made public in Member Profiles</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.21.05 9:30 AM - </td><td width="100%"><a href="/tc">New /tc homepage</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.09.05 9:00 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/components/subscriptions.jsp">Developer Subscriptions just became FREE</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.07.05 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=pressroom&amp;d2=pr_020705">TC Community Surpasses 50,000 Worldwide</a></td></tr>
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