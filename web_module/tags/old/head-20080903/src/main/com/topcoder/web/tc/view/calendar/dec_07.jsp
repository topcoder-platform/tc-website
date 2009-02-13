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
<jsp:param name="title" value="December 2007"/>
</jsp:include>

<div style="float:right;white-space:nowrap;">All times are <A target="_blank" href="http://www.timeanddate.com/worldclock/city.html?n=98">Eastern Time</A> unless stated otherwise.  &#160; &#160; </div>

<strong><A href="/tc?module=Static&d1=calendar&d2=nov_07" class="prevNext">&lt; prev</A> | <A href="/tc?module=Static&d1=calendar&d2=jan_08" class="prevNext">next &gt;</A></strong>
<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="dec_07"/>
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
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10802">SRM 380</A></strong><br />
         7:00 AM
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10803">TCHS SRM 47</A></strong><br />
         7:00 AM
         </div>
      </td>
      <td class="value">5
      </td>
      <td class="value">6
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
      </td>
      <td class="value">7
      </td>
      <td class="value">8
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10804">SRM 381</A></strong><br />
         12:00 Noon
         </div>
      </td>
   </tr>

   <tr>
      <td class="value">9
      </td>
      <td class="value">10
      </td>
      <td class="value">11
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10805">SRM 382</A></strong><br />
         9:00 PM
         </div>
      </td>
      <td class="value">12
         <div class="long">
         <strong><A href="/tc?module=MatchDetails&rd=10933">Marathon Match 27</A></strong><br />
         12:00 NOON<br />
         1 week
         </div>
      </td>
      <td class="value">13
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10806">SRM 383</A></strong><br />
         11:00 AM
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10807">TCHS SRM 48</A></strong><br />
         11:00 AM
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
      </td>
      <td class="value">18
      </td>
      <td class="value">19
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10808">SRM 384</A></strong><br />
         9:00 PM
         </div>
         <div class="hs">
         <strong><A href="/tc?module=MatchDetails&rd=10809">TCHS SRM 49</A></strong><br />
         9:00 PM
         </div>
      </td>
      <td class="value">20
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
      </td>
      <td class="value">21
      </td>
      <td class="value">22
      </td>
   </tr>

   <tr>
      <td class="value">23
      </td>
      <td class="value">24
         <div class="tcHoliday">
         <strong>Office Closed</strong><br />
         Chistmas Eve
         </div>
      </td>
      <td class="value">25
         <div class="tcHoliday">
         <strong>Office Closed</strong><br />
         Christmas Day
         </div>
      </td>
      <td class="value">26
      </td>
      <td class="value">27
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br />
         9:00 AM
         </div>
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=10810">SRM 385</A></strong><br />
         11:00 AM
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