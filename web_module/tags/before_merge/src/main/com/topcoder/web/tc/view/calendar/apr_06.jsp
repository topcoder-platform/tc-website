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
<STYLE TYPE="text/css">
        #calendarTCO06
        {
        color: #FFF;
        font-size: 11px;
        font-weight: normal;
        text-align: left;
        vertical-align: top;
        background-color: #0F4377;
        background-image: url(/i/bg_calcell_tco06_gradient.gif);
        background-repeat: repeat-x;
        }
        #calendarTCO06Date
        {
        color: #FFFFFF;
        font-weight: bold;
        }
        A.calendarTCO06Link:link
        {
        color: #DDDDFF;
        text-decoration: underline;
        }
        A.calendarTCO06Link:visited
        {
        color: #DDDDFF;
        text-decoration: underline;
        }
        A.calendarTCO06Link:hover
        {
        color: #FF0000;
        text-decoration: none;
        }

</STYLE>

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
   <jsp:param name="node" value="competition_calendar"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="calendar"/>
<jsp:param name="title" value="April 2006"/>
</jsp:include>

<jsp:include page="dropdown.jsp" >
<jsp:param name="currMonth" value="apr_06"/>
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
        <td id="calendarBlank">&#160;</td>
        <td id="calendarBlank">&#160;</td>
        <td id="calendarBlank">&#160;</td>
        <td id="calendar">1</td>
    </tr>
    
    <tr> 
        <td id="calendar">2</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">3</span><br />
            <strong>Match 296</strong><br />
            Register: 4:00&#160;AM<br />
            Compete: 7:00&#160;AM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=9817&t=schedule&c=srm">Details</A><br/><br/></td>
        <td id="calendar">4</td>
        <td id="calendarTCO06">
            <span id="calendarTCO06Date">5</span><br/>
            <strong>2006 TopCoder Open Component Competition</strong><br/>
            Online Championship Round #2 Submission Deadline: 9:00 AM ET
            &#160;<br />
            <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
            <A class="calendarTCO06Link" href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_schedule">Details</A>
            </td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">6</span><br />
            <strong>Match 297</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            Sponsored by: <br><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=nsa">NSA</A><br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=9818&t=schedule&c=srm">Details</A><br/><br/></td>
        <td id="calendar">7</td>
        <td id="calendar">8</td>
    </tr>
    
    <tr> 
        <td id="calendar">9</td>
        <td id="calendar">10</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">11</span><br />
            <strong>Match 298</strong><br />
            Register: 8:00&#160;AM<br />
            Compete: 11:00&#160;AM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=9819&t=schedule&c=srm">Details</A><br/><br/></td>
        <td id="calendarTCO06">
            <span id="calendarTCO06Date">12</span><br/>
            <strong>2006 TopCoder Open Component Competition</strong><br/>
            Online Championship Round #3 Projects Posted: 9:00 AM ET
            &#160;<br />
            <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
            <A class="calendarTCO06Link" href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_schedule">Details</A>
            </td>
        <td id="calendar">13</td>
        <td id="calendar">14</td>
        <td id="calendar">15</td>
    </tr>
    
    <tr> 
        <td id="calendar">16</td>
        <td id="calendar">17</td>
        <td id="calendar">18</td>
        <td id="calendarTCO06">
            <span id="calendarTCO06Date">19</span><br/>
            <strong>2006 TopCoder Open Component Competition</strong><br/>
            Online Championship Round #3 Submission Deadline: 9:00 AM ET
            &#160;<br />
            <img src="/i/clear.gif" width="50" height="1" border="0"/><br/>
            <A class="calendarTCO06Link" href="/tc?module=Static&d1=tournaments&d2=tco06&d3=comp_schedule">Details</A>
            </td>
        <td id="calendar">20</td>
        <td id="calendar">21</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">22</span><br />
            <strong>Match 299</strong><br />
            Register: 9:00&#160;AM<br />
            Compete: 12:00&#160;PM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=9820&t=schedule&c=srm">Details</A><br/><br/></td>
    </tr>
    
    <tr> 
        <td id="calendar">23</td>
        <td id="calendar">24</td>
        <td id="calendar">25</td>
        <td id="calendar">26</td>
        <td id="calendarSRM">
            <span id="calendarSRMDate">27</span><br />
            <strong>Match 300</strong><br />
            Register: 6:00&#160;PM<br />
            Compete: 9:00&#160;PM<br />
            <IMG src="/i/clear.gif" width="50" height="5" border="0" /><br />
            <A href="/?RoundId=9821&t=schedule&c=srm">Details</A><br/><br/>
            &#160;<br />
            </td>
        <td id="calendar">28</td>
        <td id="calendar">29</td>
    </tr>
    
    <tr> 
        <td id="calendar">30</td>
        <td id="calendarBlank">&#160;</td>
        <td id="calendarBlank">&#160;</td>
        <td id="calendarBlank">&#160;</td>
        <td id="calendarBlank">&#160;</td>
        <td id="calendarBlank">&#160;</td>
        <td id="calendarBlank">
            &#160;<br />
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
