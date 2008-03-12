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
<jsp:param name="title" value="January 2008"/>
</jsp:include>

<div style="float:right;white-space:nowrap;" align="right">
    All times are <A target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</A> unless stated otherwise.<br />
    Stay informed with our <a href="/wiki/display/tc/Upcoming+Contests">Upcoming Contests page</a> or subscribe to the RSS feed
    <a href="/tc?module=BasicRSS&c=rss_Upcoming_Contests&dsid=29"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
</div>

<strong><A href="/tc?module=Static&d1=calendar&d2=dec_07" class="prevNext">&lt; prev</A> | <A href="/tc?module=Static&d1=calendar&d2=feb_08" class="prevNext">next &gt;</A></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="jan_08"/>
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
      <td class="value">1
         <div class="tcHoliday">
         <strong>Office Closed</strong><br />
         New Year's Day
         </div>
      </td>
      <td class="value">2</td>
      <td class="value">3
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
      </td>
      <td class="value">4</td>
      <td class="value">5
        <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=11120">SRM 386</A></strong><br />
         12:00 NOON
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">6
      </td>
      <td class="value">7
      </td>
      <td class="value">8
      </td>
      <td class="value">9
        <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=11121">SRM 387</A></strong><br />
         9:00 PM
         </div>
         <div class="long">
         <strong><A href="/tc?module=MatchDetails&rd=11133">Marathon Match 28</A></strong><br />
         12:00 NOON<br />
         2 weeks
         </div>
      </td>
      <td class="value">10
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
      </td>
      <td class="value">11
      </td>
      <td class="value">12
         <div class="tchs08">
         <div class="emblem"><img src="/i/tournament/tchs08/emblem.png" alt="TCHS08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=onlineSchedule">Online Round 1</A></strong><br />
         1:00 PM 
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">13
      </td>
      <td class="value">14
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong>TCO08 Registration Opens</strong><br />
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=schedule">Algo</A></strong>,
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=schedule">CDDC</A></strong>,
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=marathon&d4=schedule">MM</A></strong>,
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=studio&d4=schedule">SDC</A></strong><br />
         9:00 AM
         </div>
      </td>
      <td class="value">15
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=11122">SRM 388</A></strong><br />
         <A href="/tc?module=Static&d1=sponsors&d2=bt">BT</A><br />
         $5,000<br />
         11:00 AM
         </div>
      </td>
      <td class="value">16
      </td>
      <td class="value">17
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
      </td>
      <td class="value">18
      </td>
      <td class="value">19
         <div class="tchs08">
         <div class="emblem"><img src="/i/tournament/tchs08/emblem.png" alt="TCHS08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=onlineSchedule">Online Round 2</A></strong><br />
         1:00 PM 
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">20
      </td>
      <td class="value">21
      </td>
      <td class="value">22
      </td>
      <td class="value">23
      </td>
      <td class="value">24
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=11123">SRM 389</A></strong><br />
         7:00 AM
         </div>
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=schedule">CDDC Week 1 Projects Posted</A></strong><br />
         9:00 AM 
         </div>
      </td>
      <td class="value">25
      </td>
      <td class="value">26
         <div class="tchs08">
         <div class="emblem"><img src="/i/tournament/tchs08/emblem.png" alt="TCHS08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=onlineSchedule">Online Round 3</A></strong><br />
         1:00 PM 
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">27
      </td>
      <td class="value">28
      </td>
      <td class="value">29
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=marathon&d4=schedule">Marathon Registration Closes</A></strong><br />
         5:00 PM
         </div>
      </td>
      <td class="value">30
         <div class="long">
         <strong><A href="/tc?module=MatchDetails&rd=11134">Marathon Match 29</A></strong><br />
         12:00 NOON<br />
         1 week
         </div>
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=marathon&d4=schedule">Marathon Round 1</A></strong><br />
         12:00 NOON
         </div>
      </td>
      <td class="value">31
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
         <div class="tco08">
         <div class="emblem"><img src="/i/tournament/tco08/emblem.png" alt="TCO08" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=schedule">CDDC Week 2 Projects Posted</A></strong><br />
         9:00 AM 
         </div>
      </td>
      <td class="empty">&#160;<br /><br /><br /><br /><br /></td>
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