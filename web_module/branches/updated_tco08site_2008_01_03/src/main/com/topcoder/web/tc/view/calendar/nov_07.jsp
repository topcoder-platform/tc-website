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
<jsp:param name="title" value="November 2007"/>
</jsp:include>

<div style="float:right;white-space:nowrap;">All times are <A target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</A> unless stated otherwise.  &#160; &#160; </div>

<strong><A href="/tc?module=Static&d1=calendar&d2=oct_07" class="prevNext">&lt; prev</A> | <A href="/tc?module=Static&d1=calendar&d2=dec_07" class="prevNext">next &gt;</A></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="nov_07"/>
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
      <td class="empty">&#160;</td>
      <td class="empty">&#160;</td>
      <td class="empty">&#160;</td>
      <td class="value">1
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule">Algo Room 3</A></strong><br>
         8:30 AM 
         </div>
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule">Studio Finals</A></strong><br>
         9:00 AM 
         </div>
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule">CDDC 2</A></strong><br>
         1:00 PM 
         </div>
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule">Algo Wildcard</A></strong><br>
         4:00 PM 
         </div>
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">2
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule">CDDC Finals</A></strong><br>
         9:00 AM 
         </div>
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule">Algo Finals</A></strong><br>
         1:30 PM
         </div>
      </td>
      <td class="value">3
      </td>
   </tr>

   <tr>
      <td class="value">4
      </td>
      <td class="value">5
      </td>
      <td class="value">6
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10793">SRM 374</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=db">Deutsche Bank</A><br>
         11:00 AM
         </div>
      </td>
      <td class="value">7
         <div class="long">
         <strong><A href="/tc?module=MatchDetails&rd=10931">Marathon Match 25</A></strong><br>
         12:00 NOON<br>
         2 weeks
         </div>
      </td>
      <td class="value">8
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">9
      </td>
      <td class="value">10
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10794">SRM 375</A></strong><br>
         12:00 NOON
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10795">TCHS SRM 44</A></strong><br>
         12:00 NOON
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">11
      </td>
      <td class="value">12
      </td>
      <td class="value">13
      </td>
      <td class="value">14
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10796">SRM 376</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=nsa">NSA</A><br>
         9:00 PM
         </div>
      </td>
      <td class="value">15
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">16
      </td>
      <td class="value">17
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10797">SRM 377</A></strong><br>
         12:00 NOON
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">18
      </td>
      <td class="value">19
      </td>
      <td class="value">20
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10798">SRM 378</A></strong><br>
         11:00 AM
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10799">TCHS SRM 45</A></strong><br>
         11:00 AM
         </div>
      </td>
      <td class="value">21
      </td>
      <td class="value">22
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">23
      </td>
      <td class="value">24
      </td>
   </tr>

   <tr>
      <td class="value">25
      </td>
      <td class="value">26
      </td>
      <td class="value">27
      </td>
      <td class="value">28
         <div class="long">
         <strong><A href="/tc?module=MatchDetails&rd=10932">Marathon Match 26</A></strong><br>
         12:00 NOON<br>
         1 week
         </div>
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10800">SRM 379</A></strong><br>
         9:00 PM
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10801">TCHS SRM 46</A></strong><br>
         9:00 PM
         </div>
      </td>
      <td class="value">29
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">30
      </td>
      <td class="empty">&#160;<br><br><br><br><br></td>
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