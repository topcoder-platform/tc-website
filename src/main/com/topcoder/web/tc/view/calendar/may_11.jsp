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
<jsp:param name="title" value="May 2011"/>
</jsp:include>

<div style="float:right;white-space:nowrap;" align="right">
    All times are <a target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</a> unless stated otherwise.<br />
    Stay informed with our <a href="/wiki/display/tc/Upcoming+Contests">Upcoming Contests page</a> or subscribe to the RSS feed
    <a href="/tc?module=BasicRSS&amp;c=rss_Pipeline&amp;dsid=28"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
</div>

<strong><a href="/tc?module=Static&amp;d1=calendar&amp;d2=apr_11" class="prevNext">&lt; prev</a> <a href="/tc?module=Static&amp;d1=calendar&amp;d2=jun_11" class="prevNext">next &gt;</a></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="may_11"/>
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
      	<div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=14434">Member SRM 505</A></strong><br />
         7:00
        </div>
      </td>
      <td class="value">4
      </td>
      <td class="value">5
      </td>
      <td class="value">6
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
      	<div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=14435">SRM 506</A></strong><br />
         21:00
        </div>
      </td>
      <td class="value">12
      </td>
      <td class="value">13
      </td>
      <td class="value">14
	     <div class="tco11">
         <div class="emblem"><img src="/i/tournament/tco11/emblem.png" alt="TCO11" /></div>
         <strong><A href="http://community.topcoder.com/tco11/algorithm/algorithm-schedule/">Algorithm Qualification Round 1</A></strong><br />
         12:00
         </div>
      </td>
   </tr>
   
   <tr>
      <td class="value">15
      </td>
      <td class="value">16
      </td>
      <td class="value">17
      </td>
      <td class="value">18
      </td>
      <td class="value">19
	     <div class="tco11">
         <div class="emblem"><img src="/i/tournament/tco11/emblem.png" alt="TCO11" /></div>
         <strong><A href="http://community.topcoder.com/tco11/algorithm/algorithm-schedule/">Algorithm Qualification Round 2</A></strong><br />
         07:00
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
	     <div class="tco11">
         <div class="emblem"><img src="/i/tournament/tco11/emblem.png" alt="TCO10" /></div>
         <strong><A href="http://community.topcoder.com/tco11/algorithm/">Algorithm Registration Ends</A></strong><br />
         09:00
         </div>
	     <div class="tco11">
         <div class="emblem"><img src="/i/tournament/tco11/emblem.png" alt="TCO11" /></div>
         <strong><A href="http://community.topcoder.com/tco11/algorithm/algorithm-schedule/">Algorithm Qualification Round 3</A></strong><br />
         21:00
         </div>
      </td>
      <td class="value">24
      </td>
      <td class="value">25
      </td>
      <td class="value">26
      </td>
      <td class="value">27
      </td>
      <td class="value">28
      	<div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=14436">SRM 507</A></strong><br />
         12:00
        </div>
      </td>
   </tr>
   
   <tr>
      <td class="value">29
      </td>
      <td class="value">30
      </td>
      <td class="value">31
      </td>
      <td class="empty">&#160;<br /><br /><br /><br /><br /></td>
      <td class="empty">&#160;<br /><br /><br /><br /><br /></td>
      <td class="empty">&#160;<br /><br /><br /><br /><br /></td>
      <td class="empty">&#160;<br /><br /><br /><br /><br /></td>
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