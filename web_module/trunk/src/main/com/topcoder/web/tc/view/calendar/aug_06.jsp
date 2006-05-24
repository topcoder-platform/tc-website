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
<jsp:param name="title" value="August 2006"/>
</jsp:include>

<div style="float:right;">All times are <A target="_blank" href="http://www.timeanddate.com/">Eastern Time</A> unless stated otherwise.  &#160; &#160; <strong><A href="/tc?module=Static&d1=calendar&d2=jul_06" class="prevNext">&lt; PREV</A> &#160; <A href="/tc?module=Static&d1=calendar&d2=sep_06" class="prevNext">NEXT &gt;</A></strong></div>

<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="aug_06"/>
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
      <td class="value">1
      </td>
      <td class="value">2
      </td>
      <td class="value">3
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9994">SRM 314</A></strong><br>
         7:00 AM
         </div>
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">4
      </td>
      <td class="value">5
      </td>
   </tr>
   
   <tr>
      <td class="value">6
      </td>
      <td class="value">7
         <%--<div class="hs">
         <strong><A href="">HS SRM 10</A></strong><br>
         2:00 PM
         </div>--%>
      </td>
      <td class="value">8
      </td>
      <td class="value">9
         <div class="long">
         <strong><A href="/longcontest/?module=Static&d1=instructions">Marathon Match 4</A></strong><br>
         12:00 NOON
         </div>
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9995">SRM 315</A></strong><br>
         9:00 PM
         </div>
      </td>
      <td class="value">10
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">11
      </td>
      <td class="value">12
      </td>
   </tr>
   
   <tr>
      <td class="value">13
      </td>
      <td class="value">14
         <%--<div class="hs">
         <strong><A href="">HS SRM 11</A></strong><br>
         10:00 AM
         </div>--%>
      </td>
      <td class="value">15
      </td>
      <td class="value">16
         <div class="long">
         <strong><A href="/longcontest/?module=Static&d1=intel_rules">Intel&#174; Multi-threading Competition 8</A></strong><br>
         12:00 NOON
         </div>
      </td>
      <td class="value">17
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="value">18
      </td>
      <td class="value">19
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9996">SRM 316</A></strong><br>
         12:00 NOON
         </div>
      </td>
   </tr>
   
   <tr>
      <td class="value">20
      </td>
      <td class="value">21
         <%--<div class="hs">
         <strong><A href="">HS SRM 12</A></strong><br>
         6:00 AM
         </div>--%>
      </td>
      <td class="value">22
      </td>
      <td class="value">23
      </td>
      <td class="value">24
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9997">SRM 317</A></strong><br>
         11:00 AM
      </td>
      <td class="value">25
      </td>
      <td class="value">26
         </div>
      </td>
   </tr>
   
   <tr>
      <td class="value">27
      </td>
      <td class="value">28
         <%--<div class="hs">
         <strong><A href="">HS SRM 13</A></strong><br>
         7:00 PM
         </div>--%>
      </td>
      <td class="value">29
         <div class="srm">
         <strong><A href="/tc?module=MatchDetails&rd=9998">SRM 318</A></strong><br>
         9:00 PM
      </td>
      <td class="value">30
      </td>
      <td class="value">31
         <div class="des_dev">
         <strong><A href="/tc?module=ViewActiveContests&ph=112">Des</A> & <A href="/tc?module=ViewActiveContests&ph=113">Dev</A> contests posted</strong><br>
         9:00 AM
         </div>
      </td>
      <td class="empty">&#160;<br><br><br><br><br></td>
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