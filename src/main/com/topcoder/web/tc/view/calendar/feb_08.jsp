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
<jsp:param name="title" value="February 2008"/>
</jsp:include>

<div style="float:right;white-space:nowrap;" align="right">
    All times are <A target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</A> unless stated otherwise.<br />
    Stay informed with our <a href="/wiki/display/tc/Upcoming+Contests">Upcoming Contests page</a> or subscribe to the RSS feed
    <a href="/tc?module=BasicRSS&amp;c=rss_Pipeline&amp;dsid=28"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
</div>

<strong><A href="/tc?module=Static&d1=calendar&d2=jan_08" class="prevNext">&lt; prev</A> | <A href="/tc?module=Static&d1=calendar&d2=mar_08" class="prevNext">next &gt;</A></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="feb_08"/>
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
      <td class="empty">&#160;<br /><br /><br /><br /><br /></td>
      <td class="empty">&#160;</td>
      <td class="empty">&#160;</td>
      <td class="empty">&#160;</td>
      <td class="empty">&#160;</td>
      <td class="value">1
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=schedule">Algorithm Registration Closes</A></strong><br />
         5:00 PM
         </div>
      </td>
      <td class="value">2
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=11124">SRM 390</A></strong><br />
         <A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=sponsorpatrons&d4=lilly">Eli Lilly</A><br />
         12:00 NOON
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">3
      </td>
      <td class="value">4
      </td>
      <td class="value">5
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=schedule">Algo Qual Round 1</A></strong><br />
         9:00 PM 
         </div>
      </td>
      <td class="value">6
      </td>
      <td class="value">7
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=schedule">CDDC Week 3 Projects Posted</A></strong><br />
         9:00 AM 
         </div>
      </td>
      <td class="value">8
      </td>
      <td class="value">9
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=schedule">Algo Qual Round 2</A></strong><br />
         1:00 PM 
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">10
      </td>
      <td class="value">11
      </td>
      <td class="value">12
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=schedule">Algo Qual Round 3</A></strong><br />
         7:00 AM 
         </div>
      </td>
      <td class="value">13
         <div class="long">
         <strong><A href="/tc?module=MatchDetails&rd=11135">Marathon Match 30</A></strong><br />
         12:00 NOON<br />
         1 week
         </div>
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=marathon&d4=schedule">Marathon Round 2</A></strong><br />
         12:00 NOON
         </div>
      </td>
      <td class="value">14
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=schedule">CDDC Week 4 Projects Posted</A></strong><br />
         9:00 AM 
         </div>
      </td>
      <td class="value">15
      </td>
      <td class="value">16
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=schedule">Algo Round 1</A></strong><br />
         1:00 PM 
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">17
      </td>
      <td class="value">18
      </td>
      <td class="value">19
      </td>
      <td class="value">20
      </td>
      <td class="value">21
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=schedule">CDDC Week 5 Projects Posted</A></strong><br />
         9:00 AM 
         </div>
      </td>
      <td class="value">22
      </td>
      <td class="value">23
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=schedule">Algo Round 2</A></strong><br />
         1:00 PM 
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">24
      </td>
      <td class="value">25
      </td>
      <td class="value">26
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=11125">SRM 391</A></strong><br />
         <A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=sponsorpatrons&d4=nsa">NSA</A><br />
         9:00 PM
         </div>
      </td>
      <td class="value">27
         <div class="long">
         <strong><A href="/tc?module=MatchDetails&rd=11136">Marathon Match 31</A></strong><br />
         12:00 NOON<br />
         2 weeks
         </div>
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=marathon&d4=schedule">Marathon Round 3</A></strong><br />
         12:00 NOON
         </div>
      </td>
      <td class="value">28
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=schedule">CDDC Registration Closes</A></strong><br />
         9:00 AM
         </div>
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=schedule">CDDC Week 6 Projects Posted</A></strong><br />
         9:00 AM 
         </div>
      </td>
      <td class="value">29
      </td>
      <td class="empty">&#160;<br /><br /><br /><br /><br /></td>
      </td>
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