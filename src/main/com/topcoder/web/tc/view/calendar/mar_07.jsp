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
<jsp:param name="title" value="March 2007"/>
</jsp:include>

<div style="float:right;white-space:nowrap;">All times are <A target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</A> unless stated otherwise.  &#160; &#160; </div>

<strong><A href="/tc?module=Static&d1=calendar&d2=feb_07" class="prevNext">&lt; prev</A> | <A href="/tc?module=Static&d1=calendar&d2=apr_07" class="prevNext">next &gt;</A></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="mar_07"/>
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
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">2
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
         <div class="tchs07">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onlineSchedule">TCHS07 Delta Round 1</A></strong><br>
         6:00 AM
         </div>
         <div class="tchs07">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onlineSchedule">TCHS07 Beta Round 1</A></strong><br>
         2:00 PM
         </div>
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=schedule">Marathon Registration Closes</A></strong><br>
         6:00 PM 
         </div>
      </td>
      <td class="value">7
        <%-- <div class="long">
         <strong><A href="/longcontest/?module=Static&d1=instructions">Marathon Match 8</A></strong><br>
         12:00 NOON
         </div>--%>
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=schedule">Marathon Match Round 1</A></strong><br>
         <%--<A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=verisign">VeriSign</A><br>--%>
         12:00 NOON
         </div>
      </td>
      <td class="value">8
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
         <div class="tchs07">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onlineSchedule">TCHS07 Gamma Round 2</A></strong><br>
         10:00 AM
         </div>
         <div class="tchs07">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onlineSchedule">TCHS07 Alpha Round 2</A></strong><br>
         9:00 PM
         </div>
      </td>
      <td class="value">9
      </td>
      <td class="value">10
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10665">SRM 341</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=nsa">NSA</A><br>
         $5,000<br>
         12:00 Noon
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">11
      </td>
      <td class="value">12
         <div class="tchs07">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onlineSchedule">TCHS07 Delta Round 2</A></strong><br>
         6:00 AM
         </div>
         <div class="tchs07">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onlineSchedule">TCHS07 Beta Round 2</A></strong><br>
         2:00 PM
         </div>
      </td>
      <td class="value">13
      </td>
      <td class="value">14
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10666">SRM 342</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aol">AOL</A><br>
         $5,000<br>
         9:00 PM
         </div>
      </td>
      <td class="value">15
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=schedule">CDDC Week 1 Projects Posted</A></strong><br>
         9:00 AM 
         </div>
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">16
      </td>
      <td class="value">17
      </td>
   </tr>

   <tr>
      <td class="value">18
      </td>
      <td class="value">19
         <div class="tchs07">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onlineSchedule">TCHS07 Gamma Round 3</A></strong><br>
         10:00 AM
         </div>
         <div class="tchs07">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onlineSchedule">TCHS07 Alpha Round 3</A></strong><br>
         9:00 PM
         </div>
      </td>
      <td class="value">20
      </td>
      <td class="value">21
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=schedule">Marathon Match Round 2</A></strong><br>
         <%--<A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=verisign">VeriSign</A><br>--%>
         12:00 NOON
         </div>
      </td>
      <td class="value">22
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10667">SRM 343</A></strong><br>
         7:00 AM
         </div>
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=schedule">CDDC Week 2 Projects Posted</A></strong><br>
         9:00 AM 
         </div>
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
         <div class="tchs07">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onlineSchedule">TCHS07 Delta Round 3</A></strong><br>
         6:00 AM
         </div>
         <div class="tchs07">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onlineSchedule">TCHS07 Beta Round 3</A></strong><br>
         2:00 PM
         </div>
      </td>
      <td class="value">27
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">Algo Registration Closes</A></strong><br>
         5:00 PM
         </div>
       </td>
      <td class="value">28
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10668">SRM 344</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw">DRW</A><br>
         11:00 AM
         </div>
      </td>
      <td class="value">29
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">Algo Qual Round 1</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aol">AOL</A><br>
         7:00 AM 
         </div>
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=schedule">CDDC Week 3 Projects Posted</A></strong><br>
         9:00 AM 
         </div>
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">30
      </td>
      <td class="value">31
         <div class="tco07">
         <div class="emblem"><img src="/i/tournament/tco07/emblem.png" alt="TCO07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">Algo Qual Round 2</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aol">AOL</A><br>
         1:00 PM 
         </div>
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