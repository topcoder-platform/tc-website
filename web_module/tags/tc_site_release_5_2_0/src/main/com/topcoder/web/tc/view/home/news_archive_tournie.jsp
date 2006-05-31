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
<%--
<tr class="bodyText"><td nowrap="nowrap">03.16.06 11:15 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=ubs_chat_031606">UBS TCO06 Round 3 chat session transcript</A></td></tr>
--%>
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
<tr class="bodyText"><td nowrap="nowrap">10.21.05 2:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_des_finals">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_dev_finals">Development</A> results for the TCO05 Finals</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 8:30 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_finals_analysis">Eryx is the new Algorithm Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 8:30 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_des_summary">nicka81 is the new Design Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 8:30 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_dev_summary">visualage is the new Development Champion</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 1:25 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_wildcard_analysis">John Dethridge wins the WildCard Room</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.14.05 12:15 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room1_analysis">ploh wins Room 1</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.13.05 9:30 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room3_analysis">misof wins Room 3</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.13.05 7:15 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room2_analysis">Eryx wins Room 2</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.13.05 4:10 PM&#160;-&#160</td><td width="100%">Room 1 Semifinals will be held at 7:00PM PDT</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.12.05 9:00 PM&#160;-&#160</td><td width="100%">Ryan wins the TCO05 Poker Tournament</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.07.05 4:50 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_100505">Sun chat session from SRM 267</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.05 5:15 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_100505">Sun chat session scheduled for SRM 267</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.29.05 6:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_prize_winners">TCO05 Online Component Contest Prize Winners</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.29.05 11:45 AM&#160;-&#160</td><td width="100%"><A href="/?t=sponsor&c=link&link=/pdfs/tournaments/tco05_program.pdf&refer=slashtc">TCO05 Program</A> [PDF - 10MB]</td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.23.05 4:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_bracket">TCO05 Algorithm Semifinalists Bracket</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.19.05 5:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=nsa">NSA chat session scheduled for SRM 264</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.15.05 2:15 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_091405">Sun chat session from SRM 263</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.05 5:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun">Sun chat session scheduled for SRM 263</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.13.05 9:35 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco05_spon_adv_overview&trans=true&d1=tournaments&d2=tco05&d3=spon_adv_overview">AdrianKuegel wins the TCO05 Sponsor Track</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.08.05 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&d1=tournaments&d2=tco05&d3=alg_adv_overview">TCO05 Algorithm Round 4 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.08.05 10:45 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_090705">Sun chat session from TCO05 Algorithm Round 4</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.07.05 10:00 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_090705">Sun chat session scheduled for TCO05 Algorithm Round 4</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.02.05 10:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=dev_conferences">Announcing the 2005 TopCoder Open Developer Conference</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.01.05 11:45 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&d1=tournaments&d2=tco05&d3=alg_adv_overview">TCO05 Algorithm Round 3 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.29.05 5:10 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=nsa">NSA chat session scheduled for SRM 261</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.25.05 11:30 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&d1=tournaments&d2=tco05&d3=alg_adv_overview">TCO05 Algorithm Round 2 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.22.05 11:40 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tco05_alg_adv_overview&trans=true&d1=tournaments&d2=tco05&d3=alg_adv_overview">TCO05 Algorithm Round 1 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.17.05 3:45 PM&#160;-&#160</td><td width="100%">TCO05 <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_des_bracket">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_dev_bracket">Development</A> Competitions TCO05 Finalists</td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.11.05 10:10 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat_081005">Sun chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.10.05 9:15 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun">Sun chat session scheduled for SRM 258</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.27.05 5:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=nsa">NSA chat session scheduled for SRM 255</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.13.05 9:10 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun_chat">Sun chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.11.05 5:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun">Sun chat session scheduled for SRM 251</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.01.05 12:45 PM - </td><td width="100%"><A href="/pl/?&module=Static&d1=javaone05&d2=wednesday">JavaOne 05 Coding Challenge Results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.30.05 9:25 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=yahoo_chat">Yahoo! chat session</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.01.05 9:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=about">Announcing the 2005 TopCoder Open</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.25.05 5:00 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=logo_finalists">kristofferrouge is the TCO05 Logo Contest Winner!</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.18.05 10:00 AM - </td><td width="100%"><A href="/tc?&module=ViewSurvey&sid=209">Vote for the TCO05 logo</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.02.05 10:25 AM - </td><td width="100%"><A href="/pl/?&module=Static&d1=javaone05&d2=overview">Announcing the 2005 JavaOne<sup>SM</sup> Coding Challenge</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.20.05 11:15 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=logo_submissions">Logo Design Contest submissions</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.18.05 9:15 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=logo_overview">TCO05 Logo Design Contest</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.05 11:00 AM - </td><td width="100%">TCCC05 <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_des_finals">Design</A>&#160;|&#160;<A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_dev_finals">Development</A> Finals details available.</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.28.05 9:50 AM - </td><td width="100%">Steven Skiena's TCCC05 Presentation: <A href="/i/tournament/tccc05/onsite_movies/skiena1.mov">Part 1</A>&#160;|&#160;<A href="/i/tournament/tccc05/onsite_movies/skiena2.mov">Part 2</A>&#160;|&#160;<A href="/i/tournament/tccc05/onsite_movies/skiena3.mov">Part 3</A>&#160;|&#160;<A href="/i/tournament/tccc05/onsite_movies/skiena4.mov">Part 4</A></td></tr>
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