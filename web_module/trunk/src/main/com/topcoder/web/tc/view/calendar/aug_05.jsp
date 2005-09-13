<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Events Calendar</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>

<body onload="initDropMenu()">

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="calendar"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="calendar"/>
<jsp:param name="title" value="August 2005"/>
</jsp:include>

<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="aug_05"/>
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
        <td id="calendarTCO05">
            <span id="calendarTCO05Date">1</span><br/>
            <strong>2005 TopCoder Open Algorithm Competition</strong><br/>
            Registration Opens: 9:00 AM ET<br/>
            &#160;<br />
            &#160;<br />
            <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
            <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_schedule">Details</A>
            </td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">2</span><br />
            <strong>Match 256</strong><br />
            Register: 8:00&#160;AM<br />
            Compete: 11:00&#160;AM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=7992&t=schedule&c=srm">Details</A><br/><br/></td>
        <td id="calendarTCO05">
            <span id="calendarTCO05Date">3</span><br/>
            <strong>2005 TopCoder Open Component Competition</strong><br/>
            Week 5 Submission Deadline: 9:00 AM ET<br/>
            &#160;<br />
            <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
            <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_schedule">Details</A>
            </td>
        <td id="calendar">4</td>
        <td id="calendar">5</td>
        <td id="calendar">6</td>
    </tr>
    
    <tr> 
        <td id="calendar">7</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">8</span><br />
            <strong>Match 257</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            Sponsored by: <A href="/tc?module=Static&d1=contracting&d2=citigroup">Citigroup</A><br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=8005&t=schedule&c=srm">Details</A><br/><br/></td>
        <td id="calendar">9</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">10</span><br />
            <strong>Match 258</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            Sponsored by: <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=sun">Sun</A><br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=7993&t=schedule&c=srm">Details</A><br/><br/></td>
        <td id="calendar">11</td>
        <td id="calendar">12</td>
        <td id="calendar">13</td>
    </tr>
    
    <tr> 
        <td id="calendar">14</td>
        <td id="calendar">15</td>
        <td id="calendarTCO05">
            <span id="calendarTCO05Date">16</span><br/>
            <strong>2005 TopCoder Open Algorithm Competition</strong><br/>
            Registration Closes: 9:00 AM ET<br/>
            Qualification Round<br/>
            START: 12:00 PM ET (noon)<br/>
            &#160;<br />
            &#160;<br />
            <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
            <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_schedule">Details</A>
            </td>
        <td id="calendarTCO05">
            <span id="calendarTCO05Date">17</span><br/>
            <strong>2005 TopCoder Open Algorithm Competition</strong><br/>
            Qualification Round<br/>
            END: 12:00 PM ET (noon)<br/>
            &#160;<br />
            &#160;<br />
            <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
            <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_schedule">Details</A>
            </td>
        <td id="calendar">18</td>
        <td id="calendar">19</td>
        <td id="calendarTCO05">
            <span id="calendarTCO05Date">20</span><br/>
            <strong>2005 TopCoder Open Algorithm Competition</strong><br/>
            Online Round #1<br/>
            Registration: 9:00AM - 11:55AM ET<br/>
            Compete: 12:00 PM(noon)<br/>
            &#160;<br />
            <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
            <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_schedule">Details</A>
            </td>
    </tr>
    
    <tr> 
        <td id="calendar">21</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">22</span><br />
            <strong>Match 259</strong><br />
            Register: 4:00&#160;AM<br />
            Compete: 7:00&#160;AM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=8012&t=schedule&c=srm">Details</A><br/><br/></td>
        <td id="calendar">23</td>
        <td id="calendarTCO05">
            <span id="calendarTCO05Date">24</span><br/>
            <strong>2005 TopCoder Open Algorithm Competition</strong><br/>
            Online Round #2<br/>
            Registration: 6:30PM - 9:25PM ET<br/>
            Compete: 9:30PM<br/>
            <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_schedule">Details</A><br /><br />
            <strong>Component Competition</strong><br/>
            Online Championship Round Projects Posted: 9:00 AM ET<br/>
            <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_schedule">Details</A>
            </td>
        <td id="calendar">25</td>
        <td id="calendar">26</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">27</span><br />
            <strong>Match 260</strong><br />
            Register: 9:00&#160;AM<br />
            Compete: 12:00&#160;PM<br />
            Sponsored by:<br /><A href="http://software.topcoder.com/">TopCoder Software</A><br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=7994&t=schedule&c=srm">Details</A><br/><br/></td>
    </tr>
    <tr> 
        <td id="calendar">28</td>
        <td id="calendar">29</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">30</span><br />
            <strong>Match 261</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            Sponsored by: <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=nsa">NSA</A><br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=7995&t=schedule&c=srm">Details</A><br/><br/></td>
        <td id="calendarTCO05">
            <span id="calendarTCO05Date">31</span><br/>
            <strong>2005 TopCoder Open Algorithm Competition</strong><br/>
            Online Round #3<br/>
            Registration: 6:30PM - 9:25PM ET<br/>
            Compete: 9:30PM<br/>
            <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_schedule">Details</A><br /><br />
            <strong>Component Competition</strong><br/>
            Online Championship Round Deadline: 9:00 AM ET<br/>
            <A class="calendarTCO05Link" href="/tc?module=Static&d1=tournaments&d2=tco05&d3=comp_schedule">Details</A>
            </td>
        <td id="calendarBlank">&#160;</td>
        <td id="calendarBlank">&#160;</td>
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
