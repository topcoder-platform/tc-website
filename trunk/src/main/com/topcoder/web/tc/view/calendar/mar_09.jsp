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
<jsp:param name="title" value="March 2009"/>
</jsp:include>

<div style="float:right;white-space:nowrap;" align="right">
    All times are <a target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</a> unless stated otherwise.<br />
    Stay informed with our <a href="/wiki/display/tc/Upcoming+Contests">Upcoming Contests page</a> or subscribe to the RSS feed
    <a href="/tc?module=BasicRSS&amp;c=rss_Pipeline&amp;dsid=28"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
</div>

<strong><a href="/tc?module=Static&amp;d1=calendar&amp;d2=feb_09" class="prevNext">&lt; prev</a> <a href="/tc?module=Static&amp;d1=calendar&amp;d2=apr_09" class="prevNext">next &gt;</a></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="mar_09"/>
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
         <div class="tco09">
         <div class="emblem"><img src="/i/tournament/tco09/emblem.png" alt="TCO09" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=schedule">Algo Registration Closes</A></strong><br />
         11:00 AM
         </div>
         <div class="tco09">
         <div class="emblem"><img src="/i/tournament/tco09/emblem.png" alt="TCO09" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=schedule">Algo Qual Round 3</A></strong><br />
         9:00 PM
         </div>
      </td>
      <td class="value">5
      </td>
      <td class="value">6
      </td>
      <td class="value">7
         <div class="tco09">
         <div class="emblem"><img src="/i/tournament/tco09/emblem.png" alt="TCO09" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=schedule">Algo Round 1</A></strong><br />
         12:00 PM
         </div>
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
         <div class="tco09">
         <div class="emblem"><img src="/i/tournament/tco09/emblem.png" alt="TCO09" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco09&d3=marathon&d4=schedule">Marathon Round 2</A></strong><br />
         12:00 PM
         </div>
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=13698">SRM 436</A></strong><br />
         7:00 AM
         </div>
      </td>
      <td class="value">12
      </td>
      <td class="value">13
      </td>
      <td class="value">14
         <div class="tco09">
         <div class="emblem"><img src="/i/tournament/tco09/emblem.png" alt="TCO09" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=schedule">Algo Round 2</A></strong><br />
         12:00 PM
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
         <div class="tco09">
         <div class="emblem"><img src="/i/tournament/tco09/emblem.png" alt="TCO09" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=tco09">Registration for All Tracks Closes</A></strong><br />
         9:00 AM
         </div>
      </td>
      <td class="value">20
      </td>
      <td class="value">21
         <div class="tco09">
         <div class="emblem"><img src="/i/tournament/tco09/emblem.png" alt="TCO09" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=schedule">Algo Round 3</A></strong><br />
         12:00 PM
         </div>
      </td>      
   </tr>
   
   <tr>
      <td class="value">22
      </td>
      <td class="value">23
      </td>
      <td class="value">24
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=13699">SRM 437</A></strong><br />
         11:00 AM
         </div>
      </td>
      <td class="value">25
         <div class="tco09">
         <div class="emblem"><img src="/i/tournament/tco09/emblem.png" alt="TCO09" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco09&d3=marathon&d4=schedule">Marathon Round 3</A></strong><br />
         12:00 PM
         </div>
      </td>
      <td class="value">26
      </td>
      <td class="value">27
      </td>
      <td class="value">28
         <div class="tco09">
         <div class="emblem"><img src="/i/tournament/tco09/emblem.png" alt="TCO09" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco09&d3=algorithm&d4=schedule">Algo Round 4</A></strong><br />
         12:00 PM
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