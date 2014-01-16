<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Events Calendar</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_calendar"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
<jsp:include page="../includes/global_left.jsp">
<jsp:param name="node" value="competition_calendar"/>
</jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="left" class="bodyColumn">
<div class="bodyText">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="calendar"/>
<jsp:param name="title" value="October 2007"/>
</jsp:include>

<div style="float:right;white-space:nowrap;">All times are <A target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</A> unless stated otherwise.  &#160; &#160; </div>

<strong><A href="/tc?module=Static&d1=calendar&d2=sep_07" class="prevNext">&lt; prev</A> | <A href="/tc?module=Static&d1=calendar&d2=nov_07" class="prevNext">next &gt;</A></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="oct_07"/>
</jsp:include>

<table cellspacing="0" cellpadding="0" class="calendar" width="100%">
   <tr>
      <td class="headerC" width="14%">Sun</td>
      <td class="headerC" width="14%">Mon</td>
      <td class="headerC" width="14%">Tues</td>
      <td class="headerC" width="14%">Wed</td>
      <td class="headerC" width="14%">Thurs</td>
      <td class="headerC" width="14%">Fri</td>
      <td class="headerC" width="14%">Sat</td>
   </tr>

   <tr>
      <td class="empty">&#160;<br><br><br><br><br></td>
      <td class="value">1
      </td>
      <td class="value">2
      <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10936">SRM 368</A></strong><br>
         7:00 AM
         </div>
      </td>
      <td class="value">3
      </td>
      <td class="value">4
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> challenges posted</strong><br>
         9:00 AM
         </div>
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=schedule">CDDC Online Championship Round 2 Projects Posted</A></strong><br>
         9:00 AM 
         </div>
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10785">SRM 369</A></strong><br>
         7:00 AM
         </div>
      </td>
      <td class="value">5
      </td>
      <td class="value">6
      </td>
   </tr>

   <tr>
      <td class="value">7
      </td>
      <td class="value">8
      </td>
      <td class="value">9
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10786">SRM 370</A></strong><br>
         <%--<A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=XXX">XXX</A><br>--%>
         7:00 AM
         </div>
      </td>
      <td class="value">10
         <div class="long">
         <strong><A href="/tc?module=MatchDetails&rd=10930">Marathon Match 24</A></strong><br>
         $15,000<br>
         12:00 NOON<br>
         2 weeks
         </div>
      </td>
      <td class="value">11
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> challenges posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">12
      </td>
      <td class="value">13
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10787">SRM 371</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=lilly">Eli Lilly</A><br>
         $5,000<br>
         12:00 Noon
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10788">TCHS SRM 41</A></strong><br>
         12:00 Noon
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">14
      </td>
      <td class="value">15
      </td>
      <td class="value">16
      </td>
      <td class="value">17
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10789">SRM 372</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=nsa">NSA</A><br>
         11:00 AM
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10790">TCHS SRM 42</A></strong><br>
         11:00 AM
         </div>
      </td>
      <td class="value">18
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> challenges posted</strong><br>
         9:00 AM
         </div>
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=schedule">CDDC Online Championship Round 3 Projects Posted</A></strong><br>
         9:00 AM 
         </div>
      </td>
      <td class="value">19
      </td>
      <td class="value">20
      </td>
   </tr>

   <tr>
      <td class="value">21
      </td>
      <td class="value">22
      </td>
      <td class="value">23
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10791">SRM 373</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=db">Deutsche Bank</A><br>
         9:00 PM
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10792">TCHS SRM 43</A></strong><br>
         9:00 PM
         </div>
      </td>
      <td class="value">24
      </td>
      <td class="value">25
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> challenges posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">26
      </td>
      <td class="value">27
      </td>
   </tr>

   <tr>
      <td class="value">28
      </td>
      <td class="value">29
      </td>
      <td class="value">30
      </td>
      <td class="value">31
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule">Algo Room 1</A></strong><br>
         8:30 AM
         </div>
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule">Marathon Match Finals</A></strong><br>
         9:00 AM
         </div>
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule">CDDC 1</A></strong><br>
         1:00 PM 
         </div>
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule">Algo Room 2</A></strong><br>
         2:00 PM 
         </div>
      </td>
      <td class="empty">&#160;<br><br><br><br><br></td>
      <td class="empty">&#160;</td>
      <td class="empty">&#160;</td>
   </tr>

</table>

</div>
</td>
<%-- Center Column Ends --%>

    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>
</html>