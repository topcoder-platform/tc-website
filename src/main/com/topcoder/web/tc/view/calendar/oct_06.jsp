<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Events Calendar</title>
<jsp:include page="/script.jsp"/>
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
<%-- Left Column Begins--%>
        <td width="180">
<jsp:include page="../includes/global_left.jsp">
<jsp:param name="node" value="competition_calendar"/>
</jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="calendar"/>
<jsp:param name="title" value="October 2006"/>
</jsp:include>

<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="oct_06"/>
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
        <td id="calendar">1
            &#160;<br />
            &#160;<br />
            &#160;<br />
            &#160;<br />
            &#160;<br />
            &#160;</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">2</span><br />
            <strong>Match 321</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
           <A href="/tc?module=MatchDetails&rd=10001">Details</A><br/><br/></td>
        <td id="calendar">3</td>
        <td id="calendar">4</td>
        <td id="calendar">5</td>
        <td id="calendar">6</td>
        <td id="calendar">7</td>
    </tr>
    <tr> 
        <td id="calendar">8</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">9</span><br />
            <strong>Match 322</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
           <A href="/tc?module=MatchDetails&rd=10002">Details</A><br/><br/></td>
        <td id="calendar">10</td>
        <td id="calendar">11</td>
        <td id="calendar">12</td>
        <td id="calendar">13</td>
        <td id="calendar">14</td>
    </tr>

    <tr> 
        <td id="calendar">15</td>
        <td id="calendar">16</td>
     <%--   <td id="calendarTCHS"> ****need to design style****
            <span id="calendarTCHSDate">16</span><br />
            <strong>Match 16</strong><br />
            Register: 3:00&#160;AM<br />
            Compete: 6:00&#160;AM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/tc?module=MatchDetails&rd=9822">Details</A><br/><br/></td>--%>
        <td id="calendar">17</td>
        <td id="calendarLong">
            <span id="calendarLongDate">18</span><br />
            <strong>Intel Multi-threading Competition 10</strong><br />
            Registration Opens: 12:00 Noon<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/longcontest/?module=Static&d1=intel_rules">Details</A><br/><br/></td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">19</span><br />
            <strong>Match 323</strong><br />
            Register: 8:00&#160;AM<br />
            Compete: 11:00&#160;AM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
           <A href="/tc?module=MatchDetails&rd=10003">Details</A><br/><br/></td>
        <td id="calendar">20</td>
        <td id="calendar">21</td>
    </tr>
    
    <tr> 
        <td id="calendar">22</td>
        <td id="calendar">23</td>
     <%--   <td id="calendarTCHS"> ****need to design style****
            <span id="calendarTCHSDate">23</span><br />
            <strong>Match 17</strong><br />
            Register: 4:00&#160;PM<br />
            Compete: 7:00&#160;PM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/tc?module=MatchDetails&rd=9822">Details</A><br/><br/></td>--%>
        <td id="calendar">24</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">25</span><br />
            <strong>Match 324</strong><br />
            Register: 4:00&#160;AM<br />
            Compete: 7:00&#160;AM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
           <A href="/tc?module=MatchDetails&rd=10004">Details</A><br/><br/></td>
        <td id="calendar">26</td>
        <td id="calendar">27</td>
        <td id="calendar">28</td>
    </tr>
    
    <tr> 
        <td id="calendar">29
            &#160;<br />
            &#160;<br />
            &#160;<br />
            &#160;<br />
            &#160;<br />
            &#160;</td>
        <td id="calendar">30</td>
     <%--   <td id="calendarTCHS"> ****need to design style****
            <span id="calendarTCHSDate">30</span><br />
            <strong>Match 18</strong><br />
            Register: 11:00&#160;AM<br />
            Compete: 2:00&#160;PM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/tc?module=MatchDetails&rd=9822">Details</A><br/><br/></td>--%>           
        <td id="calendar">31</td>
        <td id="calendarBlank"></td>
        <td id="calendarBlank"></td>
        <td id="calendarBlank"></td>
        <td id="calendarBlank"></td>
    </tr>
</table>

</div>
</td>
<%-- Center Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
