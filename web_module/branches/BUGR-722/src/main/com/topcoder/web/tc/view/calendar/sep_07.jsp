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
<jsp:param name="title" value="September 2007"/>
</jsp:include>

<div style="float:right;white-space:nowrap;">All times are <A target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</A> unless stated otherwise.  &#160; &#160; </div>

<strong><A href="/tc?module=Static&d1=calendar&d2=aug_07" class="prevNext">&lt; prev</A> | <A href="/tc?module=Static&d1=calendar&d2=oct_07" class="prevNext">next &gt;</A></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="sep_07"/>
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
      <td class="empty">&#160;</td>
      <td class="empty">&#160;</td>
      <td class="value">1
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">Algo Round 1C</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=db">Deutsche Bank</A><br>
         1:00 PM 
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">2
      </td>
      <td class="value">3
      </td>
      <td class="value">4
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10778">SRM 364</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=nsa">NSA</A><br>
         $5,000<br>
         9:00 PM
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10779">TCHS SRM 38</A></strong><br>
         9:00 PM
         </div>
      </td>
      <td class="value">5
         <div class="long">
         <strong><A href="/tc?module=MatchDetails&rd=10862">Marathon Match 22</A></strong><br>
         12:00 NOON<br>
         2 weeks
         </div>
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=schedule">Marathon Match Round 3</A></strong><br>
         12:00 Noon 
         </div>
      </td>
      <td class="value">6
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">7
      </td>
      <td class="value">8
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">Algo Round 2</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=lilly">Eli Lilly</A><br>
         1:00 PM 
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">9
      </td>
      <td class="value">10
      </td>
      <td class="value">11
      </td>
      <td class="value">12
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10780">SRM 365</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=lilly">Eli Lilly</A><br>
         11:00 AM
         </div>
      </td>
      <td class="value">13
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">14
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">Visa request deadline</A></strong><br>
         5:00 PM 
         </div>
      </td>
      <td class="value">15
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">Algo Round 3</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=nsa">NSA</A><br>
         1:00 PM 
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">16
      </td>
      <td class="value">17
      </td>
      <td class="value">18
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10781">SRM 366</A></strong><br>
         <%--<A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=XXX">XXX</A><br>--%>
         7:00 AM
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10782">TCHS SRM 39</A></strong><br>
         <%--<A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=XXX">XXX</A><br>--%>
         7:00 AM
         </div>
      </td>
      <td class="value">19
      </td>
      <td class="value">20
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=schedule">CDDC Online Championship Round 1 Projects Posted</A></strong><br>
         9:00 AM 
         </div>
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">21
      </td>
      <td class="value">22
         <div class="tccc07">
         <div class="emblem"><img src="/i/tournament/tccc07/emblem.png" alt="TCCC07" /></div>
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule">Algo Round 4</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=db">Deutsche Bank</A><br>
         1:00 PM 
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">23
      </td>
      <td class="value">24
      </td>
      <td class="value">25
      </td>
      <td class="value">26
         <div class="long">
         <strong><A href="/tc?module=MatchDetails&rd=10929">Marathon Match 23</A></strong><br>
         12:00 NOON<br>
         1 week
         </div>
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10783">SRM 367</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=db">Deutsche Bank</A><br>
         11:00 AM
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10784">TCHS SRM 40</A></strong><br>
         11:00 AM
         </div>
      </td>
      <td class="value">27
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">28
      </td>
      <td class="value">29
      </td>
   </tr>

   <tr>
      <td class="value">30
      </td>
      <td class="empty">&#160;<br><br><br><br><br></td>
      <td class="empty">&#160;</td>
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