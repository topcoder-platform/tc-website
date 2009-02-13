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
<jsp:param name="title" value="July 2006"/>
</jsp:include>

<div style="float:right;white-space:nowrap;">All times are <A target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</A> unless stated otherwise.  &#160; &#160; </div>

<strong><A href="/tc?module=Static&d1=calendar&d2=jun_06" class="prevNext">&lt; prev</A> | <A href="/tc?module=Static&d1=calendar&d2=aug_06" class="prevNext">next &gt;</A></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="jul_06"/>
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
      </td>
   </tr>
   
   <tr>
      <td class="value">2
      </td>
      <td class="value">3
      </td>
      <td class="value">4
      </td>
      <td class="value">5
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10057">TCHS SRM 5 - Alpha</A></strong><br>
         7:00 PM
         </div>
      </td>
      <td class="value">6
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9990">SRM 310</A></strong><br>
         9:00 PM
         </div>
      </td>
      <td class="value">7
      </td>
      <td class="value">8
      </td>
   </tr>
   
   <tr>
      <td class="value">9
      </td>
      <td class="value">10
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10058">TCHS SRM 6 - Beta</A></strong><br>
         2:00 PM
         </div>
      </td>
      <td class="value">11
      </td>
      <td class="value">12
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9991">SRM 311</A></strong><br>
         7:00 AM
         </div>
         <div class="long">
         <strong><A href="/longcontest/?module=Static&d1=instructions">Marathon Match 3</A></strong><br>
         12:00 NOON
         </div>
      </td>
      <td class="value">13
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">14
      </td>
      <td class="value">15
      </td>
   </tr>
   
   <tr>
      <td class="value">16
      </td>
      <td class="value">17
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10059">TCHS SRM 7 - Gamma</A></strong><br>
         10:00 AM
         </div>
      </td>
      <td class="value">18
      </td>
      <td class="value">19
         <div class="long">
         <strong><A href="/longcontest/?module=Static&d1=intel_rules">Intel&#174; Multi-threading Competition 7</A></strong><br>
         12:00 NOON
         </div>
      </td>
      <td class="value">20
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">21
      </td>
      <td class="value">22
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9992">SRM 312</A></strong><br>
         <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=aol">AOL</A><br>
         12:00 NOON
         </div>
      </td>
   </tr>
   
   <tr>
      <td class="value">23
      </td>
      <td class="value">24
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10060">TCHS SRM 8 - Delta</A></strong><br>
         6:00 AM
         </div>
      </td>
      <td class="value">25
      </td>
      <td class="value">26
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9993">SRM 313</A></strong><br>
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
      <td class="value">31
         <div class="tccc06">
         <strong><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_schedule">CDDC Registration Begins</A></strong><br>
         9:00 AM
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10061">TCHS SRM 9 - Alpha</A></strong><br>
         7:00 PM
         </div>
      </td>
      <td class="empty">&#160;<br><br><br><br><br></td>
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