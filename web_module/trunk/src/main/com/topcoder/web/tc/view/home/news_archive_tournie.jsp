<%@  page language="java"  %>
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
            <jsp:param name="title" value="Tournaments"/>
        </jsp:include>


<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr class="bodyText"><td nowrap="nowrap">10.31.07 7:30 PM - </td><td width="100%">Component <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=desSummary">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=devSummary">Development</A> Finals: Round 1</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.31.07 5:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=algoSemi02">ACRush wins Room 2!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.31.07 12:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=algoSemi01">Petr wins Room 1!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.29.07 5:00 PM - </td><td width="100%"><A href="http://www.topcoder.com/wiki/display/tccc07/2007/10/29/Meet+the+TCCC+Bloggers">TCCC07: Meet the Bloggers</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.29.07 1:00 PM - </td><td width="100%"><A href="/tc?module=SurveyResults&sid=20540">TCHS08 logo design winner</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.26.07 11:00 AM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=20540">Vote for the TCHS08 logo</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.22.07 12:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=db">Deutsche Bank chat before SRM 373</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.22.07 10:00 AM - </td><td width="100%"><A href="/tc?module=SurveyResults&sid=19850">TCO08 website winner</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.19.07 12:30 PM - </td><td width="100%"><A href="/pdfs/tournaments/TCCC07_Program_View.pdf">TCCC07 Program now available</A> [PDF - 3mb]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.17.07 6:15 PM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=19850">Vote for the TCO08 website</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.17.07 2:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=schedule">Round 3 of the TCCC07 CDDC Finals</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.16.07 12:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=nsa">NSA chat before SRM 372</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.12.07 12:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=lilly">Eli Lilly chat before SRM 371</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.11.07 11:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=dbChat20070926">Deutsche Bank SRM 367 chat transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.09.07 12:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=bracket">TCCC07 Algorithm bracket</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.07 10:15 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=schedule">Round 2 of the TCCC07 CDDC Finals</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.03.07 12:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=lillyChat20070912">Eli Lilly SRM 365 chat transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.02.07 1:00 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2133">Design the TCO08 Web Site</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.01.07 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=preview">2008 TopCoder Open</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.27.07 4:45 PM - </td><td width="100%"><A href="/tc?module=SurveyResults&sid=19628">TCO08 logo design winner</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.26.07 12:45 PM - </td><td width="100%"><A href="/tc?module=SurveyResults&sid=19559">Prestigious Professor vote results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.25.07 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=bracket">TCCC07 Marathon Match finalists</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.24.07 4:30 PM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=19628">Vote for the TCO08 logo</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.24.07 2:45 PM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=19559">Vote for the TCCC07 Prestigious Professor</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.21.07 3:00 PM - </td><td width="100%"><A href="/tc?module=SurveyResults&sid=19560">TCCC07 Bloggers Contest Winners</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.21.07 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=studio&d4=bracket">TCCC07 Studio Design finalists</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.21.07 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">TCCC07 Algorithm Round 4 set for September 22</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.20.07 2:00 PM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=19560">Vote for the TCCC07 Bloggers</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.19.07 4:00 PM - </td><td width="100%"><A href="/tc?module=SurveyResults&sid=19443">TCCC07 T-shirt winner</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.19.07 3:00 PM - </td><td width="100%">TCCC07 Component <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=desBracket">Design</a> &amp; <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=devBracket">Development</a> finalists updated</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.18.07 4:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=blog&d4=description">Last call for blog entries</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.17.07 4:30 PM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=19443">Vote for the TCCC07 T-shirts</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.14.07 1:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">TCCC07 Algorithm Round 3 set for September 15</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.07 1:00 PM - </td><td width="100%">TCCC07 Component <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=desBracket">Design</a> &amp; <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=devBracket">Development</a> finalists</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.11.07 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=getVisa">Visa invitation letter deadline approaching</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.11.07 1:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=lilly">Eli Lilly chat before SRM 365</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.10.07 4:30 PM - </td><td width="100%"><A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2127">Design the TCO08 logo</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.07.07 12:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">TCCC07 Algorithm Round 2 set for September 8</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.07.07 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=blog&d4=description">TCCC07 Blog Contest now open</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.05.07 1:00 PM - </td><td width="100%"><A href="/longcontest/?module=ViewActiveContests">TCCC07 Marathon Match 3 now underway</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.04.07 12:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=nsa">NSA chat before SRM 364</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.31.07 2:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">TCCC07 Algorithm Round 1C set for September 1</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.29.07 11:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">TCCC07 Algorithm Round 1B set for August 30</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.28.07 9:15 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">TCCC07 Algorithm Round 1A set for August 28</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.26.07 3:45 PM - </td><td width="100%"><A href="/tc?module=TCCC07AlgorithmSections&rd=10898">TCCC07 Algorithm Sections Posted</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.22.07 1:00 PM - </td><td width="100%"><A href="/longcontest/?module=ViewActiveContests">TCCC07 Marathon Match 2 now underway</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.22.07 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=schedule">TCCC07 Component registration ends tomorrow</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.21.07 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=db">Deutsche Bank sponsors the TCCC07</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.20.07 11:30 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">TCCC07 Algorithm Qualification Round 2 set for August 21</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.17.07 1:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">TCCC07 Algorithm Qualification Round 1 set for August 18</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.16.07 5:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=byes">Top Algorithm competitors bypass TCCC07 Qual Round</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.15.07 2:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=description">TCCC07 Algorithm registration ends August 16</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.13.07 1:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=professor&d4=description">Got a great teacher? Take them to Disney World!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.10.07 5:00 PM - </td><td width="100%"><A href="/tc?module=MatchDetails&rd=10777">NSA chat before SRM 363</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.08.07 12:15 PM - </td><td width="100%"><A href="/longcontest/?module=ViewActiveContests">TCCC07 Marathon Match Round 1 now underway</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.07.07 1:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=description">TCCC07 Marathon Match registration ending soon</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.07.07 12:00 PM - </td><td width="100%"><A href="http://forums.topcoder.com/?module=Thread&threadID=583850">TCCC07 Algorithm Competition: Section preference policy updated</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.23.07 9:30 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=about">The 2007 TopCoder Collegiate Challenge is here!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.16.07 5:15 PM - </td><td width="100%"><A href="/tc?module=SurveyResults&sid=19130">TCCC07 Logo Design vote results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.12.07 2:45 PM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=19130">Vote for the TCCC07 logo design</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.03.07 2:45 PM - </td><td width="100%"><A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2104">Design the TCCC07 logo</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.02.07 1:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=verisign">VeriSign chat scheduled before SRM 356</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 8:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=algoFinals">Congratulations to Jan_Kuipers, the TCO07 Algorithm Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 8:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=desSummary">Congratulations to kyky, the TCO07 Component Design Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 8:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=devSummary">Congratulations to hefeng, the TCO07 Component Development Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 8:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=summary">Congratulations to Mojito1, the TCO07 Marathon Match Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 8:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=studio&d4=summary">Congratulations to yiming, the TCO07 Studio Design Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 5:00 PM - </td><td width="100%">Component <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=desSummary">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=devSummary">Development</A> Finals: Round 3</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 4:25 PM - </td><td width="100%"><a href="http://www.topcoder.com/tc?module=LinkTracking&amp;link=http://dev.aol.com/tco_webcast1&amp;refer=/tc" />The TCO07 Webcast is now live!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.28.07 10:45 PM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=19040">Pick the winner of the Studio competition!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.28.07 9:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=algoWildcard">JongMan wins the Wildcard round!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.28.07 6:50 PM - </td><td width="100%">Component <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=desSummary">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=devSummary">Development</A> Finals: Round 2</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.28.07 4:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=algoSemi03">bmerry wins Room 3!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.07 10:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=algoSemi02">Vitaliy wins Room 2!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.07 7:00 PM - </td><td width="100%">Component <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=desSummary">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=devSummary">Development</A> Finals: Round 1</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.07 5:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=blogs&d4=overview">The TCO blogs are now online</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.07 3:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=algoSemi01">Jan_Kuipers wins Room 1!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.21.07 12:00 PM - </td><td width="100%"><A href="/pdfs/tournaments/TCO07_Program_View.pdf">TCO07 Program now available</A> [PDF - 6.87mb]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.20.07 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aol">AOL chat session: Introducing the MapQuest APIs</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.08.07 2:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=devForums">Developer Forums added to TCO07 Schedule</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.06.07 4:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=ubs">UBS chat session before SRM 353</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.01.07 6:00 PM - </td><td width="100%"><A href="/tc?module=MatchDetails&rd=10709">NSA presents SRM 352</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.31.07 10:15 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drwChat20070523">DRW Trading SRM 350 chat session transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.23.07 3:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview">TCHS07 Photos &amp; Video now available</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.23.07 11:30 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw">DRW Trading chat session scheduled for SRM 350</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.21.07 4:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=bracket">TCO07 Algorithm Competition Brackets now online</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.19.07 9:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=bracketInd">Burunduk2 wins the TCHS07!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.19.07 12:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=bracketInd">TCHS07 semifinals advancers</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.19.07 10:45 AM - </td><td width="100%">Watch the LIVE video feed of the TCHS competitors</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.14.07 5:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=studio&d4=bracket">TCO07 Studio Finalists announced</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.14.07 4:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=ubs">UBS chat scheduled before SRM 349</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.14.07 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=blogWinners">Introducing the TCO07 bloggers</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.09.07 7:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=bracketInd">TCHS07 Finalists announced</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.09.07 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=nsa">NSA chat scheduled before SRM 348</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.08.07 12:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=bracket">TCO07 Marathon Match Finalists announced</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.07.07 2:00 PM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=17090">Vote now for the TCO07 bloggers</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.27.07 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">TCO07 Algorithm Round 4 set for April 27</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.27.07 12:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=description">TCO07 Component Design &amp; Development finalists announced</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.24.07 1:20 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=nsa">NSA chat scheduled before SRM 346</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.20.07 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">TCO07 Algorithm Round 3 set for April 21</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.18.07 12:45 PM - </td><td width="100%"><A href="/longcontest/?module=ViewActiveContests">TCO07 Marathon Match Online Round 3 starts today</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.17.07 5:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aolBoxely">AOL Boxely chat scheduled before SRM 345</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.13.07 4:00 PM - </td><td width="100%"><A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">New TCO-eligible contests open at Studio</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.13.07 2:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">TCO07 Algorithm Round 2 set for April 14</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.11.07 2:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">TCO07 Algorithm Round 1C set for April 12</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.10.07 2:00 PM - </td><td width="100%"><A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2080">Now open at Studio: TCO07 Program Design Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.10.07 2:00 PM - </td><td width="100%"><A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2079">Now open at Studio: 2007 TCCC Web Site Design Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.10.07 11:10 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">TCO07 Algorithm Round 1B set for April 10</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.09.07 2:00 PM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco07_alg_adv_overview&trans=true&d1=tournaments&d2=tco07&d3=algorithm&d4=advancers">TCO07 Round 1A Advancers now online</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.05.07 6:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">TCO07 Algorithm Round 1A set for April 7</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.05.07 11:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=sectionA">TCO07 Algorithm Sections posted</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.04.07 12:15 PM - </td><td width="100%"><A href="/longcontest/?module=ViewActiveContests">TCO07 Marathon Match Online Round 3 starts today</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.03.07 2:40 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drwChat20070328">DRW Trading SRM 344 chat session transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.03.07 1:20 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">TCO07 Algorithm Qualification Round 3 set for April 3</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.07 5:20 PM - </td><td width="100%"><A href="/tc?module=SimpleStats&d1=tournaments&d2=tco07&d3=algorithm&&d4=qualification&c=tco07_alg_qual&trans=true">TCO07 Algorithm Qualification Round 1 Advancers</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.07 5:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">TCO07 Algorithm Qualification Round 2 set for March 31</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.28.07 5:20 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">TCO07 Algorithm Qualification Round 1 set for March 29</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.28.07 9:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&d1=tournaments&d2=tco07&d3=algorithm&&d4=qualification&c=tco07_alg_qual&trans=true">TCO07 Algorithm Qualification Byes</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.27.07 5:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw">DRW Trading chat session scheduled for SRM 344</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.27.07 4:00 PM - </td><td width="100%"><A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">Component Catalog, T-shirt contests now open at Studio</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.27.07 3:00 PM - </td><td width="100%"><A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2070">Win a trip to blog from the TCO</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.27.07 12:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about">TCO07 Algorithm registration ends March 27</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.23.07 7:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aolChat20070314">AOL SRM 342 chat session transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.21.07 1:00 PM - </td><td width="100%"><A href="/longcontest/?module=ViewActiveContests">TCO07 Marathon Match Online Round 2 starts today</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.14.07 1:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aol">AOL chat session scheduled for SRM 342</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.07.07 11:30 AM - </td><td width="100%"><A href="/longcontest/?module=ViewActiveContests">TCO07 Marathon Match Online Round 1 starts today</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.05.07 11:20 AM - </td><td width="100%"><A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2063">TopCoder Web Video contest now open at Studio</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.22.07 6:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview">TCHS 07 registration closes this weekend</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.21.07 5:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aol">AOL chat session scheduled for SRM 340</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.19.07 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about">The 2007 TopCoder Open is here</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.26.07 2:00 PM - </td><td width="100%"><A href="/tc?module=SurveyResults&sid=16270">dogsoldier39 is the TCO07 Web Site Design Contest Winner!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.22.07 2:00 PM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=16270">Vote for your favorite TCO'07 web design</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.12.07 2:00 PM - </td><td width="100%"><A href="/tc?module=SurveyResults&sid=11144">maxsense is the TCO07 Logo Contest Winner!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.08.07 2:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movies">Watch the full TCCC06 Webcast</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.08.07 12:00 NOON - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=11144">Vote for the TCO07 logo design</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.27.06 4:00 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2050">2007 TopCoder Open Web Design Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.13.06 6:30 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2047">2007 TCO Logo Design Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.13.06 4:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=rules">TCHS07 Rules Change</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.08.06 5:00 PM - </td><td width="100%"><A href="/movies/tournament/tccc06/final_webcast_preview.mov">TCCC06 Webcast Highlights</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.04.06 2:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview">The 2007 TopCoder High School Tournament</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.06 8:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_finals_analysis">Congratulations to Petr, TCCC06 Algorithm Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.06 8:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_summary">Congratulations to nicka81, TCCC06 Design Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.06 8:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_summary">Congratulations to PE, TCCC06 Development Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.06 5:30 PM - </td><td width="100%">Component <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_summary">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_summary">Development</A> Part 3 Details</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.06 4:20 PM - </td><td width="100%"><A href="http://dev.aol.com/video">TCCC AOL webcast live now</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.16.06 2:25 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_wildcard_analysis">Eryx wins the WildCard Round</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.16.06 5:45 PM - </td><td width="100%">Component <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_summary">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_summary">Development</A> Part 2 Details</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.16.06 2:25 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_room3_analysis">Petr wins Room 3</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.16.06 2:25 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=blogs&d4=overview">TCCC06: Day 1 blogs now online</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.15.06 9:20 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_room2_analysis">mathijs wins Room 2</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.15.06 8:30 PM - </td><td width="100%">Component <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_summary">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_summary">Development</A> Part 1 Details</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.15.06 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_room1_analysis">Ying wins Room 1</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.10.06 9:30 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa">NSA chat session scheduled for SRM 326</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.09.06 11:30 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_bracket">TCCC06 Algorithm Bracket Update</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.07.06 12:00 NOON - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol_chat_110206">AOL SRM 325 chat session transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.03.06 1:00 PM - </td><td width="100%"><A href="/i/downloads/tccc06_program.pdf">TCCC06 Program now available</A> [PDF]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.02.06 11:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol">AOL chat session scheduled for SRM 325</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.24.06 4:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloomberg_chat_101906">Bloomberg SRM 323 chat session transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.23.06 5:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_bracket">TCCC06 Algorithm Competition Semifinalists</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.18.06 2:00 PM - </td><td width="100%">DamianK wins the TCCC06 Sponsor Track</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.17.06 8:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=blogger_winners">TCCC06 "Pick Me" Contest Winners</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.11.06 1:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol_chat_100906">AOL SRM 322 chat session transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.10.06 12:00 NOON - </td><td width="100%"><A href="/tc?module=TCCC06StudentReps">zhengqiang is the TCCC06 Student Rep Winner</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.09.06 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol">AOL SRM 322 chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.06 5:00 PM - </td><td width="100%"><A href="/tc?module=SurveyResults&sid=220">andrey_atlas is the TCHS07 Logo Contest Winner!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.02.06 5:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa">NSA SRM 321 chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.28.06 5:00 PM - </td><td width="100%">Finalists for the TCCC06 <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_bracket">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_bracket">Development</A> Competitions</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.27.06 10:00 AM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=220">Vote for the TCHS07 logo design</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.25.06 2:00 PM - </td><td width="100%"><A href="/tc?module=SurveyResults&sid=219">TCCC06 t-shirt quote vote results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.24.06 5:30 PM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tccc06_alg_adv_overview&trans=true&d1=tournaments&d2=tccc06&d3=alg_adv_overview">TCCC06 Algorithm Round 1B Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.22.06 11:45 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tccc06_alg_adv_overview&trans=true&d1=tournaments&d2=tccc06&d3=alg_adv_overview">TCCC06 Algorithm Round 1A Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.22.06 9:00 AM - </td><td width="100%"><A href="/tc?module=AOLAlertsDescription">Announcing AOL&#174; Alerts</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.18.06 12:10 PM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=219">Vote for the TCCC t-shirt quote</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.18.06 11:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa">NSA SRM 319 Chat Session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.18.06 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=pickme_contest">TCCC06 "Pick Me" Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.06 4:15 PM - </td><td width="100%">TCCC06 Algorithm Sections: <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionA">A</A>, <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionB">B</A>, and <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionC">C</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.06 11:45 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&d1=tournaments&d2=tccc06&d3=alg_qualification&c=tccc06_alg_qual&trans=true">TCCC06 Algorithm Qualification Round 3 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.06 11:30 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloomberg_chat_082406">Bloomberg SRM 317 chat session transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.12.06 1:45 PM - </td><td width="100%">TCCC Registration Ends This Week</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.11.06 3:00 PM - </td><td width="100%"><A href="/tc?module=SimpleStats&d1=tournaments&d2=tccc06&d3=alg_qualification&c=tccc06_alg_qual&trans=true">TCCC06 Algorithm Qualification Round 2 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.11.06 10:00 AM - </td><td width="100%"><A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2030">2007 TCHS Tournament Logo Design Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.11.06 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=dev_forums">TCCC06 Developer Forums Announced</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.08.06 5:20 PM - </td><td width="100%"><A href="/tc?module=SimpleStats&d1=tournaments&d2=tccc06&d3=alg_qualification&c=tccc06_alg_qual&trans=true">TCCC06 Algorithm Qualification Round 1 Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.06.06 12:30 PM - </td><td width="100%"><A href="/tc?module=SimpleStats&d1=tournaments&d2=tccc06&d3=alg_qualification&c=tccc06_alg_qual&trans=true">TCCC06 Algorithm Qualification Byes</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.01.06 2:45 PM - </td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=512848">TCCC06 automatic berth cutoff date changed</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.28.06 9:00 AM - </td><td width="100%"><A href="/tc?module=TCCC06ViewAlgoReg">TCCC06 Algorithm registration is now open</A></td></tr> 
<tr class="bodyText"><td nowrap="nowrap">08.10.06 4:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol_chat_080906">AOL SRM 315 chat session transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.01.06 10:45 AM - </td><td width="100%"><A href="/tc?module=TCCC06StudentReps">Student Rep Referral Leaderboard</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.31.06 9:00 AM - </td><td width="100%"><A href="/tc?module=TCCC06ComponentTerms">TCCC06 CDDC registration is now open</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.26.06 2:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol_chat_072206">AOL SRM 312 chat session transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.20.06 6:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=student_reps">Want to be a Student Rep for the TCCC06?</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.19.06 12:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about">Announcing the 2006 TopCoder Collegiate Challenge</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.05.06 5:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_winner">kristofferrouge is the TCCC06 Logo Contest Winner!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.28.05 10:00 AM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=217">Vote for the TCCC06 Logo</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.05.05 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_overview">TCCC06 Logo Design Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.10.06 1:30 PM - </td><td width="100%">TCO06 <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_des_finals">Design</A> & <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_dev_finals">Development</A> Finals results</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.09.06 10:45 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=ccip_results">TCO06 CCIP results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.05.06 9:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_finals_analysis">Congratulations to Petr, TCO06 Algorithm Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.05.06 9:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_des_summary">Congratulations to Pops, TCO06 Design Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.05.06 9:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_dev_summary">Congratulations to sindu, TCO06 Development Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.04.06 9:40 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_wildcard_analysis">andrewzta wins the WildCard Room of the TCO06</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.04.06 3:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_room3_analysis">tomek wins Room 3 of the TCO06</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.03.06 10:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_room2_analysis">misof wins Room 2 of the TCO06</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.03.06 2:35 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_room1_analysis">cyfra wins Room 1 of the TCO06</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.27.06 6:45 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=ubs">UBS chat session prior to SRM 300</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.25.06 3:00 PM - </td><td width="100%"><A href="/?t=sponsor&c=link&link=/pdfs/tournaments/tco06_tshirt.pdf">TCO06 T-shirt</A> [PDF - 1.6MB]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.24.06 3:45 PM - </td><td width="100%"><A href="/pdfs/tournaments/tco06_program.pdf">TCO06 Program</A> [PDF - 3.5MB]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.17.06 10:30 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=blogger_winners">TCO06 "Pick Me" Contest Winners</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.11.06 9:30 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=amd">AMD chat session scheduled for SRM 298</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.06.06 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_bracket">TCO06 Algorithm Bracket rooms swapped</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.31.06 1:40 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_bracket">TCO06 Algorithm Competition Bracket</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.22.06 11:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=amd_chat_031706">AMD SRM 293 chat session transcript</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.16.06 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco06_alg_adv_overview&trans=true&d1=tournaments&d2=tco06&d3=alg_adv_overview">Round 3 Results for TCO06 Algorithm Competition</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.15.06 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=ubs">UBS chat session prior to TCO06 Round 3</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.09.06 9:30 AM - </td><td width="100%">TCO06 <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_des_prizes">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_dev_prizes">Development</A> Competition Prize Winners</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.09.06 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco06_alg_adv_overview&trans=true&d1=tournaments&d2=tco06&d3=alg_adv_overview">Round 2 Results for TCO06 Algorithm Competition</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.08.06 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=pickme_contest">TCO06 "Pick Me" Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.06.06 12:00 NOON - </td><td width="100%">Finalists for the TCO06 <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_des_bracket">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_dev_bracket">Development</A> Competitions</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.05.06 8:00 PM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco06_alg_adv_overview&trans=true&d1=tournaments&d2=tco06&d3=alg_adv_overview">Round 1 Results for TCO06 Algorithm Competition</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.28.06 7:00 PM - </td><td width="100%"><A href="/tc?module=SimpleStats&d1=tournaments&d2=tco06&d3=alg_qualification&c=tco06_alg_qual&trans=true">TCO06 Algorithm Qualification Round Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.28.06 11:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=alg_qual_byes">TCO06 Algorithm Competition Qualification Byes</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.27.06 5:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=amd">AMD Announced as TCO06 Title Sponsor</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.15.06 10:45 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=dev_forums">TCO06 Developer Forums Announced</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.13.06 9:00 AM - </td><td width="100%">TCO06 Algorithm Competition Registration is now open</td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.24.06 10:30 AM - </td><td width="100%">TCO06 <A href="/tc?module=TCO06ContestDetails&ct=236">Design</A> or <A href="/tc?module=TCO06ContestDetails&ct=237">Development</A> Results pages</td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.12.06 1:25 PM - </td><td width="100%">What makes a <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_des_summary">Design</A> or <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_dev_summary">Development</A> Champion a Champion?</td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.05.06 10:00 AM - </td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=508559">TCO06 Component Competition Schedule Changes</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.19.05 1:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=verisign">VeriSign returns as TCO06 sponsor</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.12.05 2:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=nsa">NSA returns as TCO06 event patron</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.05.05 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=ccip_description">TCO06 Complete Coder Incentive Program</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.30.05 5:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=logo_winner">b21 is the TCO06 Logo Contest Winner!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.23.05 10:00 AM - </td><td width="100%"><A href="/tc?module=ViewSurvey&sid=213">Vote for the TCO06 logo</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.24.05 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=logo_overview">TCO06 Logo Design Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.21.05 2:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_des_finals">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_dev_finals">Development</A> results for the TCO05 Finals</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 8:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_finals_analysis">Eryx is the new Algorithm Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 8:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_des_summary">nicka81 is the new Design Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 8:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_dev_summary">visualage is the new Development Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 1:25 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_wildcard_analysis">John Dethridge wins the WildCard Room</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 12:15 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room1_analysis">ploh wins Room 1</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.13.05 9:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room3_analysis">misof wins Room 3</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.13.05 7:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room2_analysis">Eryx wins Room 2</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.13.05 4:10 PM - </td><td width="100%">Room 1 Semifinals will be held at 7:00PM PDT</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.12.05 9:00 PM - </td><td width="100%">Ryan wins the TCO05 Poker Tournament</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.07.05 4:50 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_100505">Sun chat session from SRM 267</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.05 5:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_100505">Sun chat session scheduled for SRM 267</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.29.05 6:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_prize_winners">TCO05 Online Component Contest Prize Winners</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.29.05 11:45 AM - </td><td width="100%"><A href="/?t=sponsor&c=link&link=/pdfs/tournaments/tco05_program.pdf&refer=slashtc">TCO05 Program</A> [PDF - 10MB]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.23.05 4:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_bracket">TCO05 Algorithm Semifinalists Bracket</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.19.05 5:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=nsa">NSA chat session scheduled for SRM 264</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.15.05 2:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_091405">Sun chat session from SRM 263</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.05 5:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun">Sun chat session scheduled for SRM 263</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.05 9:35 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco05_spon_adv_overview&trans=true&d1=tournaments&d2=tco05&d3=spon_adv_overview">AdrianKuegel wins the TCO05 Sponsor Track</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.08.05 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&d1=tournaments&d2=tco05&d3=alg_adv_overview">TCO05 Algorithm Round 4 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.08.05 10:45 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_090705">Sun chat session from TCO05 Algorithm Round 4</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.07.05 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_090705">Sun chat session scheduled for TCO05 Algorithm Round 4</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.02.05 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=dev_conferences">Announcing the 2005 TopCoder Open Developer Conference</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.01.05 11:45 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&d1=tournaments&d2=tco05&d3=alg_adv_overview">TCO05 Algorithm Round 3 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.29.05 5:10 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=nsa">NSA chat session scheduled for SRM 261</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.25.05 11:30 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&d1=tournaments&d2=tco05&d3=alg_adv_overview">TCO05 Algorithm Round 2 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.22.05 11:40 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&d1=tournaments&d2=tco05&d3=alg_adv_overview">TCO05 Algorithm Round 1 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.17.05 3:45 PM - </td><td width="100%">TCO05 <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_des_bracket">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_dev_bracket">Development</A> Competitions TCO05 Finalists</td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.11.05 10:10 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_081005">Sun chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.10.05 9:15 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun">Sun chat session scheduled for SRM 258</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.27.05 5:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=nsa">NSA chat session scheduled for SRM 255</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.13.05 9:10 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat">Sun chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.11.05 5:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun">Sun chat session scheduled for SRM 251</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.01.05 12:45 PM - </td><td width="100%"><A href="/pl/?&module=Static&d1=javaone05&d2=wednesday">JavaOne 05 Coding Challenge Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.30.05 9:25 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=yahoo_chat">Yahoo! chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.01.05 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=about">Announcing the 2005 TopCoder Open</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.25.05 5:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=logo_finalists">kristofferrouge is the TCO05 Logo Contest Winner!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.18.05 10:00 AM - </td><td width="100%"><A href="/tc?&module=ViewSurvey&sid=209">Vote for the TCO05 logo</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.02.05 10:25 AM - </td><td width="100%"><A href="/pl/?&module=Static&d1=javaone05&d2=overview">Announcing the 2005 JavaOne<sup>SM</sup> Coding Challenge</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.20.05 11:15 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=logo_submissions">Logo Design Contest submissions</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.18.05 9:15 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=logo_overview">TCO05 Logo Design Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.05 11:00 AM - </td><td width="100%">TCCC05 <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_des_finals">Design</A> | <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_dev_finals">Development</A> Finals details available.</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.28.05 9:50 AM - </td><td width="100%">Steven Skiena's TCCC05 Presentation: <A href="/i/tournament/tccc05/onsite_movies/skiena1.mov">Part 1</A> | <A href="/i/tournament/tccc05/onsite_movies/skiena2.mov">Part 2</A> | <A href="/i/tournament/tccc05/onsite_movies/skiena3.mov">Part 3</A> | <A href="/i/tournament/tccc05/onsite_movies/skiena4.mov">Part 4</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.28.05 9:50 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=skienaReview">Steven Skiena's TCCC05 Review</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.21.05 5:20 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=supernova">"My TCCC05 Experience" by supernova</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 8:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_finals_analysis">mathijs wins the TCCC05 Algorithm Competition!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 8:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_des_summary">adic wins the TCCC05 Design Competition!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 8:15 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_dev_summary">gladius wins the TCCC05 Development Competition!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 6:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=ss_leader_website">lars wins Day 2 of the Spectator Showdown</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 3:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_wildcard_analysis">misof wins the WildCard Round</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 12:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=ss_leader_website">radeye wins Day 1 of the Spectator Showdown</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.10.05 9:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room3_analysis">mathijs wins Room 3</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.10.05 6:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room2_analysis">ploh wins Room 2</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.10.05 3:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room1_analysis">tomek takes Room 1</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.09.05 5:45 PM - </td><td width="100%"><A href="/i/tournament/tccc05/TCCC05_Program.pdf">TCCC05 Program</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.28.05 1:05 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=ss_description">Announcing the TCCC05 Spectator Showdown</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.22.05 9:45 AM - </td><td width="100%">The TCCC05 <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_des_bracket">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_dev_bracket">Development</A> finalists have been announced.</td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.21.05 9:30 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=skiena">Professor Steven Skiena to speak at TCCC05</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.03.05 11:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_bracket">TCCC05 Algorithm SemiFinalists</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.27.05 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&d1=tournaments&d2=tccc05&d3=alg_adv_overview">TCCC05 Algorithm Round 3 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.20.05 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&d1=tournaments&d2=tccc05&d3=alg_adv_overview">TCCC05 Algorithm Round 2 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.17.05 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&d1=tournaments&d2=tccc05&d3=alg_adv_overview">TCCC05 Algorithm Round 1 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.13.05 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tccc05_alg_qual&trans=true&d1=tournaments&d2=tccc05&d3=alg_qualification">TCCC05 Algorithm Qualification Round results</A></td></tr>
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