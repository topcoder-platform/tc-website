<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Events Calendar</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
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
<jsp:param name="title" value="March 2005"/>
</jsp:include>

<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="mar_05"/>
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
        <td id="calendar">1</td>
        <td id="calendar">2</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">3</span><br />
            <strong>Match 233</strong><br />
            Register: 6:00&#160;AM<br />
            Compete: 9:00&#160;AM<br />
            Sponsored by: <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=nvidia">NVIDIA</A><br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=6532&t=schedule&c=srm">Details</A><br/><br/></td>
        <td id="calendar">4</td>
        <td id="calendar">5</td>
    </tr>
    
    <tr> 
        <td id="calendar">6</td>
        <td id="calendar">7</td>
        <td id="calendar">8</td>
        <td id="calendar">9</td>
        <td id="calendarTCCC05">
            <span id="calendarTCCC05Date">10</span><br/>
            <strong>2005 TopCoder Collegiate Challenge</strong><br/>
            Semifinals<br/>
            &#160;<br />
            &#160;<br />
            <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
            <A class="calendarTCCC05Link" href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=onsite_schedule">Details</A>
            </td>
        <td id="calendarTCCC05">
            <span id="calendarTCCC05Date">11</span><br/>
            <strong>2005 TopCoder Collegiate Challenge</strong><br/>
            Finals<br/>
            &#160;<br />
            &#160;<br />
            <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
            <A class="calendarTCCC05Link" href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=onsite_schedule">Details</A>
            </td>
        <td id="calendar">12</td>
    </tr>
    
    <tr> 
        <td id="calendar">13</td>
        <td id="calendar">14</td>
        <td id="calendar">15</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">16</span><br />
            <strong>Match 234</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            Sponsored by: <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=yahoo">Yahoo!</A><br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=6533&t=schedule&c=srm">Details</A><br/><br/></td>
        <td id="calendar">17</td>
        <td id="calendar">18</td>
        <td id="calendar">19</td>
    </tr>
    
    <tr> 
        <td id="calendar">20</td>
        <td id="calendar">21</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">22</span><br />
            <strong>Match 235</strong><br />
            Register: 7:00&#160;PM<br />
            Compete: 10:00&#160;PM<br />
            Sponsored by: <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=motorola">Motorola</A><br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=6534&t=schedule&c=srm">Details</A><br/><br/></td>
        <td id="calendar">23</td>
        <td id="calendar">24</td>
        <td id="calendar">25</td>
        <td id="calendar">26</td>
    </tr>
    
    <tr> 
        <td id="calendar">27</td>
        <td id="calendar">28</td>
        <td id="calendar">29</td>
        <td id="calendar">30</td>
        <td id="calendar">31</td>
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
