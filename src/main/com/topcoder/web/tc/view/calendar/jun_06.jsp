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
<jsp:param name="title" value="June 2006"/>
</jsp:include>

<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="jun_06"/>
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
        <td id="calendarBlank"></td>
        <td id="calendarBlank"></td>
        <td id="calendarBlank"></td>
        <td id="calendar">1</td>
        <td id="calendar">2</td>
        <td id="calendar">3</td>
    </tr>
    <tr> 
        <td id="calendar">4</td>
        <td id="calendar">5</td>
     <%--   <td id="calendarTCHS"> ****need to design style****
            <span id="calendarTCHSDate">5</span><br />
            <strong>Match 1</strong><br />
            Register: 4:00&#160;PM<br />
            Compete: 7:00&#160;PM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/tc?module=MatchDetails&rd=9822">Details</A><br/><br/></td>--%>
        <td id="calendar">6</td>
        <td id="calendar">7</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">8</span><br />
            <strong>Match 306</strong><br />
            Register: 4:00&#160;AM<br />
            Compete: 7:00&#160;AM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
           <A href="/tc?module=MatchDetails&rd=9986">Details</A><br/><br/></td>
        <td id="calendar">9</td>
        <td id="calendar">10</td>
    </tr>
    
         <%--   <td id="calendarTCHS"> ****need to design style****
            <span id="calendarTCHSDate">8</span><br />
            <strong>Match 2</strong><br />
            Register: 11:00&#160;AM<br />
            Compete: 2:00&#160;PM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/tc?module=MatchDetails&rd=9822">Details</A><br/><br/></td>--%>

    <tr> 
        <td id="calendar" rowspan="2">11</td>
        <td id="calendar" rowspan="2">12</td>
        <td id="calendar" rowspan="2">13</td>
        <td id="calendarLong">
            <span id="calendarLongDate">14</span><br />
            <strong>Intel Multi-threading Competition 6</strong><br />
            Registration Opens: 12:00 Noon<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/longcontest/?module=Static&d1=intel_rules">Details</A><br/><br/></td>
        <td id="calendar" rowspan="2">15</td>
        <td id="calendar" rowspan="2">16</td>
        <td id="calendar" rowspan="2">17</td>
    </tr>
    
    <tr> 
        <td id="calendarSRM">
            <strong>Match 307</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
           <A href="/tc?module=MatchDetails&rd=9987">Details</A><br/><br/></td>
    </tr>

    <tr> 
        <td id="calendar">18</td>
        <td id="calendar">19</td>
         <%--   <td id="calendarTCHS"> ****need to design style****
            <span id="calendarTCHSDate">19</span><br />
            <strong>Match 3</strong><br />
            Register: 7:00&#160;AM<br />
            Compete: 10:00&#160;AM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/tc?module=MatchDetails&rd=9822">Details</A><br/><br/></td>--%>
        <td id="calendar">20</td>
        <td id="calendar">21</td>
        <td id="calendar">22</td>
        <td id="calendar">23</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">24</span><br />
            <strong>Match 308</strong><br />
            Register: 9:00&#160;AM<br />
            Compete: 12:00&#160;Noon<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
           <A href="/tc?module=MatchDetails&rd=9988">Details</A><br/><br/></td>
    </tr>
    
    <tr> 
        <td id="calendar">25</td>
        <td id="calendar">26</td>
         <%--   <td id="calendarTCHS"> ****need to design style****
            <span id="calendarTCHSDate">26</span><br />
            <strong>Match 4</strong><br />
            Register: 5:00&#160;AM<br />
            Compete: 8:00&#160;AM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/tc?module=MatchDetails&rd=9822">Details</A><br/><br/></td>--%>
        <td id="calendar">27</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">28</span><br />
            <strong>Match 309</strong><br />
            Register: 8:00&#160;AM<br />
            Compete: 11:00&#160;AM<br />
           <%-- Sponsored by: <br><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=amd">AMD</A><br />--%>
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
           <A href="/tc?module=MatchDetails&rd=9989">Details</A><br/><br/></td>
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
<%-- Center Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
