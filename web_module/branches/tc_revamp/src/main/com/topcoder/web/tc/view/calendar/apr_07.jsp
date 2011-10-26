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
<jsp:param name="title" value="April 2007"/>
</jsp:include>

<div style="float:right;white-space:nowrap;">All times are <A target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</A> unless stated otherwise.  &#160; &#160; </div>

<strong><A href="/tc?module=Static&d1=calendar&d2=mar_07" class="prevNext">&lt; prev</A> | <A href="/tc?module=Static&d1=calendar&d2=may_07" class="prevNext">next &gt;</A></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="apr_07"/>
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
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">Algo Qual Round 3</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aol">AOL</A><br>
         9:00 PM 
         </div>
      </td>
      <td class="value">4
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=schedule">Marathon Match Round 3</A></strong><br>
         <%--<A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=verisign">VeriSign</A><br>--%>
         12:00 NOON
         </div>
         <%--<div class="long">
         <strong><A href="/longcontest/?module=Static&d1=instructions">Marathon Match 8</A></strong><br>
         12:00 NOON
         </div>--%>
      </td>
      <td class="value">5
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=schedule">CDDC Week 4 Projects Posted</A></strong><br>
         9:00 AM 
         </div>
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">6
      </td>
      <td class="value">7
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">Algo Round 1A</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=ubs">UBS</A><br>
         1:00 PM 
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">8
      </td>
      <td class="value">9
      </td>
      <td class="value">10
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">Algo Round 1B</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=nsa">NSA</A><br>
         9:00 PM 
         </div>
      </td>
      <td class="value">11
      </td>
      <td class="value">12
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">Algo Round 1C</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw">DRW</A><br>
         7:00 AM 
         </div>
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=schedule">CDDC Registration Closes</A></strong><br>
         9:00 AM 
         </div>
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=schedule">CDDC Week 5 Projects Posted</A></strong><br>
         9:00 AM 
         </div>
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">13
      </td>
      <td class="value">14
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">Algo Round 2</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=ubs">UBS</A><br>
         1:00 PM 
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
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10669">SRM 345</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aol">AOL</A><br>
         $5,000<br>
         11:00 AM
         </div>
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=schedule">Marathon Match Round 4</A></strong><br>
         <%--<A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=verisign">VeriSign</A><br>--%>
         12:00 NOON
         </div>
      </td>
      <td class="value">19
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">20
      </td>
      <td class="value">21
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">Algo Round 3</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=nsa">NSA</A><br>
         1:00 PM 
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
         <strong><A href="/tc?module=MatchDetails&rd=10670">SRM 346</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=nsa">NSA</A><br>
         9:00 PM
         </div>
      </td>
      <td class="value">25
      </td>
      <td class="value">26
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">27
      </td>
      <td class="value">28
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">Algo Round 4</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw">DRW</A><br>
         1:00 PM 
         </div>
      </td>
   </tr>
   
   <tr>
      <td class="value">29
      </td>
      <td class="value">30
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=studio&d4=schedule">SDC Registration Closes</A></strong><br>
         6:00 PM 
         </div>
      </td>
      <td class="empty">&#160;<br><br><br><br><br></td>
      <td class="empty">&#160;<br><br><br><br><br></td>
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