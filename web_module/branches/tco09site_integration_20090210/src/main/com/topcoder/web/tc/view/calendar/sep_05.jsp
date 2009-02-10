<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Events Calendar</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</head>

<body>


<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
<jsp:include page="../includes/global_left.jsp">
<jsp:param name="node" value="competition_calendar"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="calendar"/>
<jsp:param name="title" value="September 2005"/>
</jsp:include>

<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="sep_05"/>
</jsp:include>

<table width="100%" cellspacing="1" cellpadding="3" id="calendarFrame">
   <tr> 
      <td id="calendarDays" width="14%">Sun</td>
      <td id="calendarDays" width="14%">Mon</td>
      <td id="calendarDays" width="14%">Tues</td>
      <td id="calendarDays" width="14%">Wed</td>
      <td id="calendarDays" width="14%">Thurs</td>
      <td id="calendarDays" width="14%">Fri</td>
      <td id="calendarDays" width="14%">Sat</td>
   </tr>
   
   <tr> 
      <td id="calendarBlank">&#160;</td>
      <td id="calendarBlank">&#160;</td>
      <td id="calendarBlank">&#160;</td>
      <td id="calendarBlank">
      &#160;<br />
      &#160;<br />
      &#160;<br />
      &#160;<br />
      &#160;<br />
      &#160;</td>
      <td id="calendar">1</td>
      <td id="calendar">2</td>
      <td id="calendar">3</td>
   </tr>
  
   <tr> 
      <td id="calendar">4</td>
      <td id="calendar">5</td>
      <td id="calendar">6</td>
      <td id="calendarTCO05">
      <span id="calendarTCO05Date">7</span><br/>
      <strong>2005 TopCoder Open Algorithm Competition</strong><br/>
      Online Round #4<br/>
      Registration: 6:30PM - 9:25PM ET<br/>
      Compete: 9:30PM<br/>
      &#160;<br />
      <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
      <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_schedule">Details</A>
      </td>
      <td id="calendar">8</td>
      <td id="calendarSRM">
      <span id="calendarSRMDate">9</span><br />
      <strong>Match 262</strong><br />
      Register: 8:00&#160;AM<br />
      Compete: 11:00&#160;AM<br />
      <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
      <A href="/tc?module=MatchDetails&rd=7996">Details</A><br/><br/></td>
      <td id="calendar">10</td>
   </tr>
   <tr> 
      <td id="calendar">11</td>
      <td id="calendar">12</td>
      <td id="calendar">13</td>
      <td id="calendarSRM">
      <span id="calendarSRMDate">14</span><br />
      <strong>Match 263</strong><br />
      Register: 6:00&#160;PM<br />
      Compete: 9:00&#160;PM<br />
      Sponsored by: <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun">Sun</A><br />
      <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
      <A href="/tc?module=MatchDetails&rd=7997">Details</A><br/><br/></td>
      <td id="calendar">15</td>
      <td id="calendar">16</td>
      <td id="calendar">17</td>
   </tr>
  
   <tr> 
      <td id="calendar">18</td>
      <td id="calendar">19</td>
      <td id="calendarSRM">
      <span id="calendarSRMDate">20</span><br />
      <strong>Match 264</strong><br />
      Register: 6:00&#160;PM<br />
      Compete: 9:00&#160;PM<br />
      Sponsored by: <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=nsa">NSA</A><br />
      <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
      <A href="/tc?module=MatchDetails&rd=7998">Details</A><br/><br/></td>
      <td id="calendar">21</td>
      <td id="calendar">22</td>
      <td id="calendar">23</td>
      <td id="calendar">24</td>
   </tr>
   
   <tr> 
      <td id="calendar">25</td>
      <td id="calendar">26</td>
      <td id="calendarSRM">
      <span id="calendarSRMDate">27</span><br />
      <strong>Match 265</strong><br />
      Register: 6:00&#160;AM<br />
      Compete: 9:00&#160;AM<br />
      Sponsored by: <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=verisign">VeriSign</A><br />
      <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
      <A href="/tc?module=MatchDetails&rd=8007">Details</A><br/><br/></td>
      <td id="calendar">28</td>
      <td id="calendar">29</td>
      <td id="calendar">30</td>
      <td id="calendarBlank">
      &#160;<br />
      &#160;<br />
      &#160;<br />
      &#160;<br />
      &#160;<br />
      &#160;</td>
   </tr>
</table>

</div>
</td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
