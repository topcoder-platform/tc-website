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
  <tr class="bodyText">
    <td nowrap="nowrap">01.05.09 4:30 PM - </td>
    <td><a href="/tc?module=Static&d1=tco09&d2=teaser">Save-the-Date for the All-New TCO09!</a></td>
  </tr>
  <tr class="bodyText">
    <td nowrap="nowrap">01.02.09 1:00 PM - </td>
    <td><a href="http://www.topcoder.com/tc?module=Static&d1=tchs09&d2=pages&d3=rules">Round 1 of the TCHS09 </a></td>
  </tr>
<tr class="bodyText"><td nowrap="nowrap">12.15.08 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&d1=tchs09&d2=index">Announcing the TCHS09!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.23.08 11:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=betfairChat20080719">Betfair SRM 410 Chat Transcript Available</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.18.08 12:00 PM - </td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=12182">Betfair Chat prior to SRM 410</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.15.08 12:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=verisignChat20080710">VeriSign SRM 409 Chat Transcript Available</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.09.08 11:00 AM - </td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=12181">VeriSign Chat prior to SRM 409</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.09.08 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=betfairChat20080626">Betfair SRM 407 Chat Transcript Available</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.25.08 12:00 PM - </td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=12179">Betfair chat session prior to SRM 407</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.28.08 12:30 PM - </td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=12175">NSA chat session prior to SRM 403</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.15.08 7:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=blog">Congratulations TCO08 Champions!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.15.08 11:45 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=blog">The Official Blog of the 2008 TopCoder Open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.09.08 6:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=aolChat20080506">AOL SRM 401 Chat Transcript Available</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.05.08 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=aol">AOL chat before SRM 401</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.02.08 10:30 AM - </td><td width="100%"><a href="/pdfs/tournaments/tco08/TCO08_Program_View.pdf">TCO08 Program now available</a> [PDF - 2mb]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.25.08 12:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=lillyChat20080415">Eli Lilly SRM 398 Chat Transcript Available</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.23.08 1:30 PM - </td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=12171">SRM 399 is brought to you by NSA</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.22.08 12:45 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=onsiteSchedule">New Forums added to the TCO08 Onsite Schedule</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.14.08 10:30 AM - </td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=12170">SRM 398 is sponsored by Eli Lilly</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.07.08 11:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=lillyChat20080403">Eli Lilly SRM 396 Chat Transcript Available</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.02.08 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=lilly">Eli Lilly chat before SRM 396</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.26.08 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=nsa">NSA chat before SRM 395</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.26.08 9:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=about">TCO08 Finalists Documents Due at 5:00 PM EST</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.19.08 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=verisignChat20080311">VeriSign SRM 393 Chat Transcript Available</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.17.08 10:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=bracketInd">TCHS08 Champion is ahyangyi</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.14.08 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=onsiteSchedule">TCHS08 Finals are set for Saturday, March 15 at 10:00 AM EDT</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.12.08 5:00 PM - </td><td width="100%"><a target="_blank" href="/pdfs/tournaments/TCHS08_Program_View.pdf">TCHS08 Program Now Available!</a> [PDF - 375kb]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.12.08 9:30 AM - </td><td width="100%"><a href="/wiki/display/tc/Getting+your+Visa+and+Getting+it+Early">Last Call for TCO08 Visa Letter Requests</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.10.08 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=verisign">VeriSign chat before SRM 393</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.07.08 4:00 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=22051">Vote for the TCO08 T-shirts</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.07.08 1:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=schedule">TCO08 Algorithm Round 4</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.03.08 12:00 PM - </td><td width="100%"><a href="/tco08?module=AlgorithmAdvancers">See Who Advanced from Algorithm Round 3 of the TCO08</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.29.08 6:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=schedule">TCO08 Algorithm Round 3</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.27.08 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=bracketInd">TCHS08 Finalists Announced!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.26.08 6:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=nsa">NSA chat before SRM 391</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.26.08 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=registerNow">Only 2 days left to Register for the TCO08 Component Competition</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.25.08 5:00 PM - </td><td width="100%"><a href="/tco08?module=AlgorithmAdvancers">See Who Advanced from Algorithm Round 2 of the TCO08</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.22.08 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=schedule">TCO08 Algorithm Round 2</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.18.08 3:15 PM - </td><td width="100%"><a href="/tco08?module=AlgorithmAdvancers">See Who Advanced from Algorithm Round 1 of the TCO08</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.15.08 3:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=601138">TCHS08 Finalists documents due. Act now!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.15.08 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=schedule">TCO08 Algorithm Round 1</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.14.08 10:45 AM - </td><td width="100%">TCO08 Component <a href="/tco08?module=ContestDetails&amp;ct=460&amp;eid=3006">Design</a> &amp; <a href="/tco08?module=ContestDetails&amp;ct=461&amp;eid=3006">Development</a> Competition Week 4</td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.13.08 1:00 PM - </td><td width="100%"><a href="/longcontest/?module=ViewActiveContests">TCO08 Marathon Round 2 Now Underway</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.12.08 12:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=602680&mc=25#928522">TCO08 Qualification Round 3 rescheduled</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.11.08 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=schedule">TCO08 Algorithm Qualification Round 3</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.11.08 2:00 PM - </td><td width="100%"><a href="/tco08?module=MarathonAdvancers">TCO08 Marathon Round 1 results are up!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.11.08 12:00 PM - </td><td width="100%"><a href="/tco08?module=AlgorithmQualification&full=true">TCO08 Algorithm Qualification Round 2 results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.08.08 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=schedule">TCO08 Algorithm Qualification Round 2</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.07.08 12:00 PM - </td><td width="100%"><a href="/tco08?module=AlgorithmQualification&full=true">TCO08 Algorithm Qualification Round 1 results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.05.08 9:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=schedule">TCO08 Algorithm Qualification Round 1</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.04.08 10:30 AM - </td><td width="100%"><a href="/tco08?module=AlgorithmQualification">TCO08 Algorithm Qualification Byes</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.01.08 3:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=lilly">Eli Lilly chat before SRM 390</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.30.08 2:00 PM - </td><td width="100%"><a href="/longcontest/?module=ViewActiveContests">TCO08  Marathon Round 1 Now Underway</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.30.08 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=description">End of TCO08 Algorithm Registration</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.28.08 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=description">End of TCO08 Marathon Match Registration</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.25.08 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=onlineSchedule">TCHS08 Online Round 3</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.23.08 12:00 PM - </td><td width="100%"><a href="/wiki/display/tc/Getting+your+Visa+and+Getting+it+Early">Last Call for TCHS08 Visa Letter Requests</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.18.08 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=onlineSchedule">TCHS08 Online Round 2</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.14.08 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=about">2008 TopCoder Open is here</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.11.08 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=onlineSchedule">TCHS08 Online Round 1</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.17.07 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=overview">TCHS08 registration is open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.19.07 6:30 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=20670">TCHS08 website winner</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.14.07 12:00 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=20670">Vote for the TCHS08 website</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.13.07 12:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=dbChat20071106">Deutsche Bank SRM 374 chat transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.05.07 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=db">Deutsche Bank chat before SRM 374</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.02.07 7:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=algoFinals">Petr is the new Algorithm Champion!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.02.07 7:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=desSummary">nicka81 is the new Component Design Champion!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.02.07 7:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=devSummary">PE is the new Component Development Champion!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.02.07 7:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=marathon&amp;d4=summary">paranoia is the new Marathon Match Champion!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.02.07 7:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=studio&amp;d4=summary">abedavera is the new Studio Champion!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.01.07 5:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=algoWildcard">cyfra wins the Wildcard round!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.01.07 5:00 PM - </td><td width="100%">Component <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=desSummary">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=devSummary">Development</a> Finals: Round 2</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.01.07 2:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=algoSemi03">Vitaliy wins Room 3!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.31.07 7:30 PM - </td><td width="100%">Component <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=desSummary">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=devSummary">Development</a> Finals: Round 1</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.31.07 5:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=algoSemi02">ACRush wins Room 2!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.31.07 12:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=algoSemi01">Petr wins Room 1!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.29.07 5:00 PM - </td><td width="100%"><a href="http://www.topcoder.com/wiki/display/tccc07/2007/10/29/Meet+the+TCCC+Bloggers">TCCC07: Meet the Bloggers</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.29.07 1:00 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=20540">TCHS08 logo design winner</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.26.07 11:00 AM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=20540">Vote for the TCHS08 logo</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.22.07 12:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=db">Deutsche Bank chat before SRM 373</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.22.07 10:00 AM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=19850">TCO08 website winner</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.19.07 12:30 PM - </td><td width="100%"><a href="/pdfs/tournaments/TCCC07_Program_View.pdf">TCCC07 Program now available</a> [PDF - 3mb]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.17.07 6:15 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=19850">Vote for the TCO08 website</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.17.07 2:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=schedule">Round 3 of the TCCC07 CDDC Finals</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.16.07 12:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=nsa">NSA chat before SRM 372</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.12.07 12:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=lilly">Eli Lilly chat before SRM 371</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.11.07 11:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=dbChat20070926">Deutsche Bank SRM 367 chat transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.09.07 12:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=bracket">TCCC07 Algorithm bracket</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.07 10:15 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=schedule">Round 2 of the TCCC07 CDDC Finals</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.03.07 12:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=lillyChat20070912">Eli Lilly SRM 365 chat transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.02.07 1:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2133">Design the TCO08 Web Site</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.01.07 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=preview">2008 TopCoder Open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.27.07 4:45 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=19628">TCO08 logo design winner</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.26.07 12:45 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=19559">Prestigious Professor vote results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.25.07 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=marathon&amp;d4=bracket">TCCC07 Marathon Match finalists</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.24.07 4:30 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=19628">Vote for the TCO08 logo</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.24.07 2:45 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=19559">Vote for the TCCC07 Prestigious Professor</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.21.07 3:00 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=19560">TCCC07 Bloggers Contest Winners</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.21.07 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=studio&amp;d4=bracket">TCCC07 Studio Design finalists</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.21.07 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=schedule">TCCC07 Algorithm Round 4 set for September 22</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.20.07 2:00 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=19560">Vote for the TCCC07 Bloggers</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.19.07 4:00 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=19443">TCCC07 T-shirt winner</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.19.07 3:00 PM - </td><td width="100%">TCCC07 Component <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=desBracket">Design</a> &amp; <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=devBracket">Development</a> finalists updated</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.18.07 4:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=blog&amp;d4=description">Last call for blog entries</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.17.07 4:30 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=19443">Vote for the TCCC07 T-shirts</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.14.07 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=schedule">TCCC07 Algorithm Round 3 set for September 15</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.07 1:00 PM - </td><td width="100%">TCCC07 Component <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=desBracket">Design</a> &amp; <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=devBracket">Development</a> finalists</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.11.07 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=getVisa">Visa invitation letter deadline approaching</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.11.07 1:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=lilly">Eli Lilly chat before SRM 365</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.10.07 4:30 PM - </td><td width="100%"><a href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2127">Design the TCO08 logo</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.07.07 12:45 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=schedule">TCCC07 Algorithm Round 2 set for September 8</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.07.07 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=blog&amp;d4=description">TCCC07 Blog Contest now open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.05.07 1:00 PM - </td><td width="100%"><a href="/longcontest/?module=ViewActiveContests">TCCC07 Marathon Match 3 now underway</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.04.07 12:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=nsa">NSA chat before SRM 364</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.31.07 2:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=schedule">TCCC07 Algorithm Round 1C set for September 1</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.29.07 11:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=schedule">TCCC07 Algorithm Round 1B set for August 30</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.28.07 9:15 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=schedule">TCCC07 Algorithm Round 1A set for August 28</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.26.07 3:45 PM - </td><td width="100%"><a href="/tc?module=TCCC07AlgorithmSections&rd=10898">TCCC07 Algorithm Sections Posted</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.22.07 1:00 PM - </td><td width="100%"><a href="/longcontest/?module=ViewActiveContests">TCCC07 Marathon Match 2 now underway</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.22.07 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=component&amp;d4=schedule">TCCC07 Component registration ends tomorrow</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.21.07 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=db">Deutsche Bank sponsors the TCCC07</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.20.07 11:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=schedule">TCCC07 Algorithm Qualification Round 2 set for August 21</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.17.07 1:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=schedule">TCCC07 Algorithm Qualification Round 1 set for August 18</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.16.07 5:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=byes">Top Algorithm competitors bypass TCCC07 Qual Round</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.15.07 2:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=algorithm&amp;d4=description">TCCC07 Algorithm registration ends August 16</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.13.07 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=professor&amp;d4=description">Got a great teacher? Take them to Disney World!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.10.07 5:00 PM - </td><td width="100%"><a href="/tc?module=MatchDetails&rd=10777">NSA chat before SRM 363</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.08.07 12:15 PM - </td><td width="100%"><a href="/longcontest/?module=ViewActiveContests">TCCC07 Marathon Match Round 1 now underway</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.07.07 1:45 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=marathon&amp;d4=description">TCCC07 Marathon Match registration ending soon</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.07.07 12:00 PM - </td><td width="100%"><a href="http://forums.topcoder.com/?module=Thread&threadID=583850">TCCC07 Algorithm Competition: Section preference policy updated</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.23.07 9:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=about">The 2007 TopCoder Collegiate Challenge is here!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.16.07 5:15 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=19130">TCCC07 Logo Design vote results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.12.07 2:45 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=19130">Vote for the TCCC07 logo design</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.03.07 2:45 PM - </td><td width="100%"><a href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2104">Design the TCCC07 logo</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.02.07 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=verisign">VeriSign chat scheduled before SRM 356</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 8:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=algoFinals">Congratulations to Jan_Kuipers, the TCO07 Algorithm Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 8:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=desSummary">Congratulations to kyky, the TCO07 Component Design Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 8:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=devSummary">Congratulations to hefeng, the TCO07 Component Development Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 8:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=marathon&amp;d4=summary">Congratulations to Mojito1, the TCO07 Marathon Match Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 8:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=studio&amp;d4=summary">Congratulations to yiming, the TCO07 Studio Design Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 5:00 PM - </td><td width="100%">Component <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=desSummary">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=devSummary">Development</a> Finals: Round 3</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.29.07 4:25 PM - </td><td width="100%"><a href="http://dev.aol.com/tco_webcast1" />The TCO07 Webcast is now live!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.28.07 10:45 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=19040">Pick the winner of the Studio competition!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.28.07 9:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=algoWildcard">JongMan wins the Wildcard round!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.28.07 6:50 PM - </td><td width="100%">Component <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=desSummary">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=devSummary">Development</a> Finals: Round 2</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.28.07 4:45 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=algoSemi03">bmerry wins Room 3!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.07 10:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=algoSemi02">Vitaliy wins Room 2!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.07 7:00 PM - </td><td width="100%">Component <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=desSummary">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=devSummary">Development</a> Finals: Round 1</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.07 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=blogs&amp;d4=overview">The TCO blogs are now online</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.07 3:45 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=algoSemi01">Jan_Kuipers wins Room 1!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.21.07 12:00 PM - </td><td width="100%"><a href="/pdfs/tournaments/TCO07_Program_View.pdf">TCO07 Program now available</a> [PDF - 6.87mb]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.20.07 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aol">AOL chat session: Introducing the MapQuest APIs</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.08.07 2:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=devForums">Developer Forums added to TCO07 Schedule</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.06.07 4:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=ubs">UBS chat session before SRM 353</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.01.07 6:00 PM - </td><td width="100%"><a href="/tc?module=MatchDetails&rd=10709">NSA presents SRM 352</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.31.07 10:15 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=drwChat20070523">DRW Trading SRM 350 chat session transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.23.07 3:45 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs07&amp;d3=overview">TCHS07 Photos &amp; Video now available</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.23.07 11:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=drw">DRW Trading chat session scheduled for SRM 350</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.21.07 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=bracket">TCO07 Algorithm Competition Brackets now online</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.19.07 9:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs07&amp;d3=bracketInd">Burunduk2 wins the TCHS07!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.19.07 12:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs07&amp;d3=bracketInd">TCHS07 semifinals advancers</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.19.07 10:45 AM - </td><td width="100%">Watch the LIVE video feed of the TCHS competitors</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.14.07 5:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=studio&amp;d4=bracket">TCO07 Studio Finalists announced</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.14.07 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=ubs">UBS chat scheduled before SRM 349</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.14.07 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=blogWinners">Introducing the TCO07 bloggers</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.09.07 7:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs07&amp;d3=bracketInd">TCHS07 Finalists announced</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.09.07 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=nsa">NSA chat scheduled before SRM 348</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.08.07 12:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=marathon&amp;d4=bracket">TCO07 Marathon Match Finalists announced</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.07.07 2:00 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=17090">Vote now for the TCO07 bloggers</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.27.07 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=schedule">TCO07 Algorithm Round 4 set for April 27</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.27.07 12:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=description">TCO07 Component Design &amp; Development finalists announced</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.24.07 1:20 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=nsa">NSA chat scheduled before SRM 346</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.20.07 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=schedule">TCO07 Algorithm Round 3 set for April 21</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.18.07 12:45 PM - </td><td width="100%"><a href="/longcontest/?module=ViewActiveContests">TCO07 Marathon Match Online Round 3 starts today</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.17.07 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aolBoxely">AOL Boxely chat scheduled before SRM 345</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.13.07 4:00 PM - </td><td width="100%"><a href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">New TCO-eligible contests open at Studio</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.13.07 2:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=schedule">TCO07 Algorithm Round 2 set for April 14</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.11.07 2:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=schedule">TCO07 Algorithm Round 1C set for April 12</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.10.07 2:00 PM - </td><td width="100%"><a href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2080">Now open at Studio: TCO07 Program Design Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.10.07 2:00 PM - </td><td width="100%"><a href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2079">Now open at Studio: 2007 TCCC Web Site Design Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.10.07 11:10 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=schedule">TCO07 Algorithm Round 1B set for April 10</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.09.07 2:00 PM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tco07_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">TCO07 Round 1A Advancers now online</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.05.07 6:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=schedule">TCO07 Algorithm Round 1A set for April 7</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.05.07 11:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=sectionA">TCO07 Algorithm Sections posted</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.04.07 12:15 PM - </td><td width="100%"><a href="/longcontest/?module=ViewActiveContests">TCO07 Marathon Match Online Round 3 starts today</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.03.07 2:40 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=drwChat20070328">DRW Trading SRM 344 chat session transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.03.07 1:20 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=schedule">TCO07 Algorithm Qualification Round 3 set for April 3</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.07 5:20 PM - </td><td width="100%"><a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&&amp;d4=qualification&c=tco07_alg_qual&trans=true">TCO07 Algorithm Qualification Round 1 Advancers</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.07 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=schedule">TCO07 Algorithm Qualification Round 2 set for March 31</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.28.07 5:20 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=schedule">TCO07 Algorithm Qualification Round 1 set for March 29</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.28.07 9:00 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&&amp;d4=qualification&c=tco07_alg_qual&trans=true">TCO07 Algorithm Qualification Byes</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.27.07 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=drw">DRW Trading chat session scheduled for SRM 344</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.27.07 4:00 PM - </td><td width="100%"><a href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">Component Catalog, T-shirt contests now open at Studio</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.27.07 3:00 PM - </td><td width="100%"><a href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2070">Win a trip to blog from the TCO</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.27.07 12:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=about">TCO07 Algorithm registration ends March 27</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.23.07 7:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aolChat20070314">AOL SRM 342 chat session transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.21.07 1:00 PM - </td><td width="100%"><a href="/longcontest/?module=ViewActiveContests">TCO07 Marathon Match Online Round 2 starts today</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.14.07 1:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aol">AOL chat session scheduled for SRM 342</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.07.07 11:30 AM - </td><td width="100%"><a href="/longcontest/?module=ViewActiveContests">TCO07 Marathon Match Online Round 1 starts today</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.05.07 11:20 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2063">TopCoder Web Video contest now open at Studio</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.22.07 6:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs07&amp;d3=overview">TCHS 07 registration closes this weekend</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.21.07 5:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aol">AOL chat session scheduled for SRM 340</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.19.07 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=about">The 2007 TopCoder Open is here</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.26.07 2:00 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=16270">dogsoldier39 is the TCO07 Web Site Design Contest Winner!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.22.07 2:00 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=16270">Vote for your favorite TCO'07 web design</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.12.07 2:00 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=11144">maxsense is the TCO07 Logo Contest Winner!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.08.07 2:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=movies">Watch the full TCCC06 Webcast</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.08.07 12:00 NOON - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=11144">Vote for the TCO07 logo design</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.27.06 4:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2050">2007 TopCoder Open Web Design Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.13.06 6:30 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2047">2007 TCO Logo Design Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.13.06 4:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs07&amp;d3=rules">TCHS07 Rules Change</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.08.06 5:00 PM - </td><td width="100%"><a href="/movies/tournament/tccc06/final_webcast_preview.mov">TCCC06 Webcast Highlights</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.04.06 2:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs07&amp;d3=overview">The 2007 TopCoder High School Tournament</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.06 8:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_finals_analysis">Congratulations to Petr, TCCC06 Algorithm Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.06 8:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=comp_des_summary">Congratulations to nicka81, TCCC06 Design Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.06 8:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=comp_dev_summary">Congratulations to PE, TCCC06 Development Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.06 5:30 PM - </td><td width="100%">Component <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=comp_des_summary">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=comp_dev_summary">Development</a> Part 3 Details</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.06 4:20 PM - </td><td width="100%"><a href="http://dev.aol.com/video">TCCC AOL webcast live now</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.16.06 2:25 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_wildcard_analysis">Eryx wins the WildCard Round</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.16.06 5:45 PM - </td><td width="100%">Component <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=comp_des_summary">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=comp_dev_summary">Development</a> Part 2 Details</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.16.06 2:25 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_room3_analysis">Petr wins Room 3</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.16.06 2:25 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=blogs&amp;d4=overview">TCCC06: Day 1 blogs now online</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.15.06 9:20 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_room2_analysis">mathijs wins Room 2</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.15.06 8:30 PM - </td><td width="100%">Component <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=comp_des_summary">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=comp_dev_summary">Development</a> Part 1 Details</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.15.06 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_room1_analysis">Ying wins Room 1</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.10.06 9:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=nsa">NSA chat session scheduled for SRM 326</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.09.06 11:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_bracket">TCCC06 Algorithm Bracket Update</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.07.06 12:00 NOON - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=aol_chat_110206">AOL SRM 325 chat session transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.03.06 1:00 PM - </td><td width="100%"><a href="/i/downloads/tccc06_program.pdf">TCCC06 Program now available</a> [PDF]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.02.06 11:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=aol">AOL chat session scheduled for SRM 325</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.24.06 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=bloomberg_chat_101906">Bloomberg SRM 323 chat session transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.23.06 5:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_bracket">TCCC06 Algorithm Competition Semifinalists</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.18.06 2:00 PM - </td><td width="100%">DamianK wins the TCCC06 Sponsor Track</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.17.06 8:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=blogger_winners">TCCC06 "Pick Me" Contest Winners</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.11.06 1:45 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=aol_chat_100906">AOL SRM 322 chat session transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.10.06 12:00 NOON - </td><td width="100%"><a href="/tc?module=TCCC06StudentReps">zhengqiang is the TCCC06 Student Rep Winner</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.09.06 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=aol">AOL SRM 322 chat session</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.06 5:00 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=220">andrey_atlas is the TCHS07 Logo Contest Winner!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.02.06 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=nsa">NSA SRM 321 chat session</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.28.06 5:00 PM - </td><td width="100%">Finalists for the TCCC06 <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=comp_des_bracket">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=comp_dev_bracket">Development</a> Competitions</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.27.06 10:00 AM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=220">Vote for the TCHS07 logo design</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.25.06 2:00 PM - </td><td width="100%"><a href="/tc?module=SurveyResults&sid=219">TCCC06 t-shirt quote vote results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.24.06 5:30 PM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tccc06_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_adv_overview">TCCC06 Algorithm Round 1B Results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.22.06 11:45 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tccc06_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_adv_overview">TCCC06 Algorithm Round 1A Results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.22.06 9:00 AM - </td><td width="100%"><a href="/tc?module=AOLAlertsDescription">Announcing AOL&#174; Alerts</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.18.06 12:10 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=219">Vote for the TCCC t-shirt quote</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.18.06 11:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=nsa">NSA SRM 319 Chat Session</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.18.06 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=pickme_contest">TCCC06 "Pick Me" Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.06 4:15 PM - </td><td width="100%">TCCC06 Algorithm Sections: <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_sectionA">A</a>, <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_sectionB">B</a>, and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_sectionC">C</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.06 11:45 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_qualification&c=tccc06_alg_qual&trans=true">TCCC06 Algorithm Qualification Round 3 Results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.06 11:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=bloomberg_chat_082406">Bloomberg SRM 317 chat session transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.12.06 1:45 PM - </td><td width="100%">TCCC Registration Ends This Week</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.11.06 3:00 PM - </td><td width="100%"><a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_qualification&c=tccc06_alg_qual&trans=true">TCCC06 Algorithm Qualification Round 2 Results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.11.06 10:00 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2030">2007 TCHS Tournament Logo Design Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.11.06 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=dev_forums">TCCC06 Developer Forums Announced</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.08.06 5:20 PM - </td><td width="100%"><a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_qualification&c=tccc06_alg_qual&trans=true">TCCC06 Algorithm Qualification Round 1 Results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.06.06 12:30 PM - </td><td width="100%"><a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tccc06&amp;d3=alg_qualification&c=tccc06_alg_qual&trans=true">TCCC06 Algorithm Qualification Byes</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.01.06 2:45 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=512848">TCCC06 automatic berth cutoff date changed</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.28.06 9:00 AM - </td><td width="100%"><a href="/tc?module=TCCC06ViewAlgoReg">TCCC06 Algorithm registration is now open</a></td></tr> 
<tr class="bodyText"><td nowrap="nowrap">08.10.06 4:45 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=aol_chat_080906">AOL SRM 315 chat session transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.01.06 10:45 AM - </td><td width="100%"><a href="/tc?module=TCCC06StudentReps">Student Rep Referral Leaderboard</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.31.06 9:00 AM - </td><td width="100%"><a href="/tc?module=TCCC06ComponentTerms">TCCC06 CDDC registration is now open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.26.06 2:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=aol_chat_072206">AOL SRM 312 chat session transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.20.06 6:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=student_reps">Want to be a Student Rep for the TCCC06?</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.19.06 12:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=about">Announcing the 2006 TopCoder Collegiate Challenge</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.05.06 5:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=logo_winner">kristofferrouge is the TCCC06 Logo Contest Winner!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.28.05 10:00 AM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=217">Vote for the TCCC06 Logo</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.05.05 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=logo_overview">TCCC06 Logo Design Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.10.06 1:30 PM - </td><td width="100%">TCO06 <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=comp_des_finals">Design</a> & <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=comp_dev_finals">Development</a> Finals results</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.09.06 10:45 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=ccip_results">TCO06 CCIP results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.05.06 9:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_finals_analysis">Congratulations to Petr, TCO06 Algorithm Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.05.06 9:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=comp_des_summary">Congratulations to Pops, TCO06 Design Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.05.06 9:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=comp_dev_summary">Congratulations to sindu, TCO06 Development Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.04.06 9:40 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_wildcard_analysis">andrewzta wins the WildCard Room of the TCO06</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.04.06 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_room3_analysis">tomek wins Room 3 of the TCO06</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.03.06 10:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_room2_analysis">misof wins Room 2 of the TCO06</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.03.06 2:35 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_room1_analysis">cyfra wins Room 1 of the TCO06</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.27.06 6:45 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=ubs">UBS chat session prior to SRM 300</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.25.06 3:00 PM - </td><td width="100%"><a href="/?t=sponsor&c=link&link=/pdfs/tournaments/tco06_tshirt.pdf">TCO06 T-shirt</a> [PDF - 1.6MB]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.24.06 3:45 PM - </td><td width="100%"><a href="/pdfs/tournaments/tco06_program.pdf">TCO06 Program</a> [PDF - 3.5MB]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.17.06 10:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=blogger_winners">TCO06 "Pick Me" Contest Winners</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.11.06 9:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=amd">AMD chat session scheduled for SRM 298</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.06.06 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_bracket">TCO06 Algorithm Bracket rooms swapped</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.31.06 1:40 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_bracket">TCO06 Algorithm Competition Bracket</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.22.06 11:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=amd_chat_031706">AMD SRM 293 chat session transcript</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.16.06 11:00 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tco06_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_adv_overview">Round 3 Results for TCO06 Algorithm Competition</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.15.06 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=ubs">UBS chat session prior to TCO06 Round 3</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.09.06 9:30 AM - </td><td width="100%">TCO06 <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=comp_des_prizes">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=comp_dev_prizes">Development</a> Competition Prize Winners</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.09.06 11:00 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tco06_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_adv_overview">Round 2 Results for TCO06 Algorithm Competition</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.08.06 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=pickme_contest">TCO06 "Pick Me" Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.06.06 12:00 NOON - </td><td width="100%">Finalists for the TCO06 <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=comp_des_bracket">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=comp_dev_bracket">Development</a> Competitions</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.05.06 8:00 PM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tco06_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_adv_overview">Round 1 Results for TCO06 Algorithm Competition</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.28.06 7:00 PM - </td><td width="100%"><a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_qualification&c=tco06_alg_qual&trans=true">TCO06 Algorithm Qualification Round Results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.28.06 11:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=alg_qual_byes">TCO06 Algorithm Competition Qualification Byes</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.27.06 5:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=amd">AMD Announced as TCO06 Title Sponsor</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.15.06 10:45 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=dev_forums">TCO06 Developer Forums Announced</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.13.06 9:00 AM - </td><td width="100%">TCO06 Algorithm Competition Registration is now open</td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.24.06 10:30 AM - </td><td width="100%">TCO06 <a href="/tc?module=TCO06ContestDetails&ct=236">Design</a> or <a href="/tc?module=TCO06ContestDetails&ct=237">Development</a> Results pages</td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.12.06 1:25 PM - </td><td width="100%">What makes a <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=comp_des_summary">Design</a> or <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=comp_dev_summary">Development</a> Champion a Champion?</td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.05.06 10:00 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=508559">TCO06 Component Competition Schedule Changes</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.19.05 1:45 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=verisign">VeriSign returns as TCO06 sponsor</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.12.05 2:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=nsa">NSA returns as TCO06 event patron</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.05.05 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=ccip_description">TCO06 Complete Coder Incentive Program</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.30.05 5:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=logo_winner">b21 is the TCO06 Logo Contest Winner!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.23.05 10:00 AM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=213">Vote for the TCO06 logo</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.24.05 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=logo_overview">TCO06 Logo Design Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.21.05 2:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=comp_des_finals">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=comp_dev_finals">Development</a> results for the TCO05 Finals</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 8:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=alg_finals_analysis">Eryx is the new Algorithm Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 8:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=comp_des_summary">nicka81 is the new Design Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 8:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=comp_dev_summary">visualage is the new Development Champion</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 1:25 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=alg_wildcard_analysis">John Dethridge wins the WildCard Room</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 12:15 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=alg_room1_analysis">ploh wins Room 1</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.13.05 9:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=alg_room3_analysis">misof wins Room 3</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.13.05 7:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=alg_room2_analysis">Eryx wins Room 2</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.13.05 4:10 PM - </td><td width="100%">Room 1 Semifinals will be held at 7:00PM PDT</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.12.05 9:00 PM - </td><td width="100%">Ryan wins the TCO05 Poker Tournament</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.07.05 4:50 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=sun_chat_100505">Sun chat session from SRM 267</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.05 5:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=sun_chat_100505">Sun chat session scheduled for SRM 267</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.29.05 6:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=comp_prize_winners">TCO05 Online Component Contest Prize Winners</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.29.05 11:45 AM - </td><td width="100%"><a href="/?t=sponsor&c=link&link=/pdfs/tournaments/tco05_program.pdf&refer=slashtc">TCO05 Program</a> [PDF - 10MB]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.23.05 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=alg_bracket">TCO05 Algorithm Semifinalists Bracket</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.19.05 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=nsa">NSA chat session scheduled for SRM 264</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.15.05 2:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=sun_chat_091405">Sun chat session from SRM 263</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.05 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=sun">Sun chat session scheduled for SRM 263</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.05 9:35 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tco05_spon_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tco05&amp;d3=spon_adv_overview">AdrianKuegel wins the TCO05 Sponsor Track</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.08.05 11:00 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tco05&amp;d3=alg_adv_overview">TCO05 Algorithm Round 4 results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.08.05 10:45 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=sun_chat_090705">Sun chat session from TCO05 Algorithm Round 4</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.07.05 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=sun_chat_090705">Sun chat session scheduled for TCO05 Algorithm Round 4</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.02.05 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=dev_conferences">Announcing the 2005 TopCoder Open Developer Conference</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.01.05 11:45 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tco05&amp;d3=alg_adv_overview">TCO05 Algorithm Round 3 results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.29.05 5:10 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=nsa">NSA chat session scheduled for SRM 261</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.25.05 11:30 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tco05&amp;d3=alg_adv_overview">TCO05 Algorithm Round 2 results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.22.05 11:40 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tco05&amp;d3=alg_adv_overview">TCO05 Algorithm Round 1 results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.17.05 3:45 PM - </td><td width="100%">TCO05 <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=comp_des_bracket">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=comp_dev_bracket">Development</a> Competitions TCO05 Finalists</td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.11.05 10:10 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=sun_chat_081005">Sun chat session</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.10.05 9:15 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=sun">Sun chat session scheduled for SRM 258</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.27.05 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=nsa">NSA chat session scheduled for SRM 255</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.13.05 9:10 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=sun_chat">Sun chat session</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.11.05 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=sun">Sun chat session scheduled for SRM 251</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.01.05 12:45 PM - </td><td width="100%"><a href="/pl/?&module=Static&amp;d1=javaone05&amp;d2=wednesday">JavaOne 05 Coding Challenge Results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.30.05 9:25 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=yahoo_chat">Yahoo! chat session</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.01.05 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about">Announcing the 2005 TopCoder Open</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.25.05 5:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=logo_finalists">kristofferrouge is the TCO05 Logo Contest Winner!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.18.05 10:00 AM - </td><td width="100%"><a href="/tc?&module=ViewSurvey&sid=209">Vote for the TCO05 logo</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.02.05 10:25 AM - </td><td width="100%"><a href="/pl/?&module=Static&amp;d1=javaone05&amp;d2=overview">Announcing the 2005 JavaOne<sup>SM</sup> Coding Challenge</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.20.05 11:15 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=logo_submissions">Logo Design Contest submissions</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.18.05 9:15 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=logo_overview">TCO05 Logo Design Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.05 11:00 AM - </td><td width="100%">TCCC05 <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=comp_des_finals">Design</a> | <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=comp_dev_finals">Development</a> Finals details available.</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.28.05 9:50 AM - </td><td width="100%">Steven Skiena's TCCC05 Presentation: <a href="/i/tournament/tccc05/onsite_movies/skiena1.mov">Part 1</a> | <a href="/i/tournament/tccc05/onsite_movies/skiena2.mov">Part 2</a> | <a href="/i/tournament/tccc05/onsite_movies/skiena3.mov">Part 3</a> | <a href="/i/tournament/tccc05/onsite_movies/skiena4.mov">Part 4</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.28.05 9:50 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=skienaReview">Steven Skiena's TCCC05 Review</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.21.05 5:20 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=supernova">"My TCCC05 Experience" by supernova</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 8:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_finals_analysis">mathijs wins the TCCC05 Algorithm Competition!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 8:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=comp_des_summary">adic wins the TCCC05 Design Competition!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 8:15 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=comp_dev_summary">gladius wins the TCCC05 Development Competition!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 6:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=ss_leader_website">lars wins Day 2 of the Spectator Showdown</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 3:45 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_wildcard_analysis">misof wins the WildCard Round</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 12:45 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=ss_leader_website">radeye wins Day 1 of the Spectator Showdown</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.10.05 9:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_room3_analysis">mathijs wins Room 3</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.10.05 6:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_room2_analysis">ploh wins Room 2</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.10.05 3:30 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_room1_analysis">tomek takes Room 1</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.09.05 5:45 PM - </td><td width="100%"><a href="/i/tournament/tccc05/TCCC05_Program.pdf">TCCC05 Program</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.28.05 1:05 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=ss_description">Announcing the TCCC05 Spectator Showdown</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.22.05 9:45 AM - </td><td width="100%">The TCCC05 <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=comp_des_bracket">Design</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=comp_dev_bracket">Development</a> finalists have been announced.</td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.21.05 9:30 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=skiena">Professor Steven Skiena to speak at TCCC05</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.03.05 11:00 AM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_bracket">TCCC05 Algorithm SemiFinalists</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.27.05 11:00 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_adv_overview">TCCC05 Algorithm Round 3 results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.20.05 11:00 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_adv_overview">TCCC05 Algorithm Round 2 results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.17.05 11:00 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_adv_overview">TCCC05 Algorithm Round 1 results</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.13.05 11:00 AM - </td><td width="100%"><a href="/tc?module=SimpleStats&c=tccc05_alg_qual&trans=true&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_qualification">TCCC05 Algorithm Qualification Round results</a></td></tr>
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