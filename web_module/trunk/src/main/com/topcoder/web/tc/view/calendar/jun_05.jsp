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
<jsp:param name="title" value="June 2005"/>
</jsp:include>

<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="jun_05"/>
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
        <td id="calendarBlank">
            &#160;<br />
            &#160;<br />
            &#160;<br />
            &#160;<br />
            &#160;<br />
            &#160;</td>
        <td id="calendarBlank">&#160;</td>
        <td id="calendarBlank">&#160;</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">1</span><br />
            <strong>Match 245</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            Sponsored by: <A href="/pl/?&module=Static&d1=javaone05&d2=overview">Sun & JavaOne</A><br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/tc?module=MatchDetails&rd=7220">Details</A><br/><br/></td>
        <td id="calendar">2</td>
        <td id="calendar">3</td>
        <td id="calendar">4</td>
    </tr>
    
    <tr> 
        <td id="calendar">5</td>
        <td id="calendar">6</td>
        <td id="calendar">7</td>
        <td id="calendar">8</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">9</span><br />
            <strong>Match 246</strong><br />
            Register: 10:00&#160;AM<br />
            Compete: 1:00&#160;PM<br />
            Sponsored by: <A href="/tc?module=Static&d1=contracting&d2=index">TC Employment Services</A><br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/tc?module=MatchDetails&rd=7221">Details</A><br/><br/></td>
        <td id="calendar">10</td>
        <td id="calendar">11</td>
    </tr>
    
    <tr> 
        <td id="calendar">12</td>
        <td id="calendarTCO05">
            <span id="calendarTCO05Date">13</span><br/>
            <strong>2005 TopCoder Open CDDC</strong><br/>
            Registration Opens: 9:00 AM ET<br/>
            &#160;<br />
            &#160;<br />
            <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
            <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_schedule">Details</A>
            </td>
        <td id="calendar">14</td>
        <td id="calendar">15</td>
        <td id="calendar">16</td>
        <td id="calendar">17</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">18</span><br />
            <strong>Match 247</strong><br />
            Register: 9:00&#160;AM<br />
            Compete: 12:00&#160;PM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/tc?module=MatchDetails&rd=7222">Details</A><br/><br/></td>
    </tr>
    
    <tr> 
        <td id="calendar">19</td>
        <td id="calendar">20</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">21</span><br />
            <strong>Match 248</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            Sponsored by: <A href="/tc?module=Static&d1=contracting&d2=citigroup">Citigroup</A><br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/tc?module=MatchDetails&rd=7223">Details</A><br/><br/></td>
        <td id="calendar">22</td>
        <td id="calendar">23</td>
        <td id="calendar">24</td>
        <td id="calendar">25</td>
    </tr>
    
    <tr> 
        <td id="calendar" rowspan="2">26</td>
        <td id="calendar" rowspan="2">27</td>
        <td id="calendar" rowspan="2">28</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">29</span><br />
            <strong>Match 249</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            Sponsored by: <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=yahoo">Yahoo!</A><br />
            <A href="/tc?module=MatchDetails&rd=7224">Details</A></td>
        <td id="calendar" rowspan="2">30</td>
        <td id="calendarBlank" rowspan="2">&#160;</td>
        <td id="calendarBlank" rowspan="2">&#160;</td>
    </tr>
    <tr> 
        <td id="calendarTCO05">
            <strong>2005 TopCoder Open CDDC</strong><br/>
            Registration Closes & Week 1 Projects Posted: 9:00 AM ET<br/>
            <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_schedule">Details</A>
            </td>
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
