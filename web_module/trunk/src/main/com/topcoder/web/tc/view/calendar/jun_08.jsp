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
<jsp:param name="title" value="June 2008"/>
</jsp:include>

<div style="float:right;white-space:nowrap;" align="right">
    All times are <a target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</a> unless stated otherwise.<br />
    Stay informed with our <a href="/wiki/display/tc/Upcoming+Contests">Upcoming Contests page</a> or subscribe to the RSS feed
    <a href="/tc?module=BasicRSS&amp;c=rss_Upcoming_Contests&amp;dsid=29"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
</div>

<strong><a href="/tc?module=Static&amp;d1=calendar&amp;d2=may_08" class="prevNext">&lt; prev</a> | <a href="/tc?module=Static&amp;d1=calendar&amp;d2=jul_08" class="prevNext">next &gt;</a></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="jun_08"/>
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
      <td class="value">1
      </td>
      <td class="value">2
      </td>
      <td class="value">3
      </td>
      <td class="value">4
      </td>
      <td class="value">5
         <div class="des_dev">
         <strong><a href="/tc?module=ViewActiveContests&amp;ph=112">Des</a> &amp; <a href="/tc?module=ViewActiveContests&amp;ph=113">Dev</a> contests posted</strong><br />
         9:00 AM
         </div>
         <div class="srm">
         <strong><a href="/tc?module=MatchDetails&amp;rd=12176">SRM 404</a></strong><br />
         7:00 AM
         </div>
      </td>
      <td class="value">6
         <div class="predictive">
         <strong><a href="/tc?module=Static&amp;d1=sponsors&amp;d2=predictiveOverview">Predictive Marathon Competition 1</a></strong><br />
         12:00 NOON<br />
         4 weeks
         </div>
      </td>
      <td class="value">7
      </td>
   </tr>

   <tr>
      <td class="value">8
      </td>
      <td class="value">9
      </td>
      <td class="value">10
      </td>
      <td class="value">11
         <div class="long">
         <strong><a href="/tc?module=MatchDetails&amp;rd=12201">Marathon Match 35</a></strong><br />
         12:00 NOON<br />
         1 week
         </div>
      </td>
      <td class="value">12
         <div class="des_dev">
         <strong><a href="/tc?module=ViewActiveContests&amp;ph=112">Des</a> &amp; <a href="/tc?module=ViewActiveContests&amp;ph=113">Dev</a> contests posted</strong><br />
         9:00 AM
         </div>
      </td>
      <td class="value">13
      </td>
      <td class="value">14
         <div class="srm">
         <strong><a href="/tc?module=MatchDetails&amp;rd=12177">SRM 405</a></strong><br />
         <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=bt">BT</a><br />
         $5,000<br />
         12:00 NOON
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">15
      </td>
      <td class="value">16
      </td>
      <td class="value">17
         <div class="srm">
         <strong><a href="/tc?module=MatchDetails&amp;rd=12178">SRM 406</a></strong><br />
         9:00 PM
         </div>
         <div class="hs">
         <strong><a href="/tc?module=MatchDetails&amp;rd=13483">TCHS SRM 50</a></strong><br />
         9:00 PM
         </div>
      </td>
      <td class="value">18
      </td>
      <td class="value">19
         <div class="des_dev">
         <strong><a href="/tc?module=ViewActiveContests&amp;ph=112">Des</a> &amp; <a href="/tc?module=ViewActiveContests&amp;ph=113">Dev</a> contests posted</strong><br />
         9:00 AM
         </div>
      </td>
      <td class="value">20
      </td>
      <td class="value">21
      </td>
   </tr>

   <tr>
      <td class="value">22
      </td>
      <td class="value">23
         <div class="long">
         <strong><a href="/tc?module=MatchDetails&amp;rd=12202">Marathon Match 36</a></strong><br />
         12:00 NOON<br />
         1 week
         </div>
      </td>
      <td class="value">24
      </td>
      <td class="value">25
      </td>
      <td class="value">26
         <div class="des_dev">
         <strong><a href="/tc?module=ViewActiveContests&amp;ph=112">Des</a> &amp; <a href="/tc?module=ViewActiveContests&amp;ph=113">Dev</a> contests posted</strong><br />
         9:00 AM
         </div>
         <div class="srm">
         <strong><a href="/tc?module=MatchDetails&amp;rd=12179">SRM 407</a></strong><br />
         <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=betfair">Betfair</a><br />
         11:00 AM
         </div>
         <div class="hs">
         <strong><a href="/tc?module=MatchDetails&amp;rd=13484">TCHS SRM 51</a></strong><br />
         11:00 AM
         </div>
      </td>
      <td class="value">27
      </td>
      <td class="value">28
      </td>
   </tr>

   <tr>
      <td class="value">29
      </td>
      <td class="value">30
      </td>
      <td class="empty">&#160;<br /><br /><br /><br /><br /></td>
      <td class="empty">&#160;</td>
      <td class="empty">&#160;</td>
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