<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>2008 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />

<style type="text/css">
html{ 
margin:0px;
padding:0px;
font-family: Arial, Verdana, Helvetica, sans-serif;
}

body{ 
font-family: Arial, Verdana, Helvetica, sans-serif;
line-height: normal;
font-size: 12px;
color: #ffffff;
background: #000000;
margin:0px;
padding:0px;
}

img{
border: none;
display: block;
}

h1{
font-style: italic;
font-size: 125%;
}

p{
padding: 0px;
margin: 0px 0px 10px 0px;
}

td, th{ 
line-height: normal;
font-size: 12px;
}

#contentOut{
width: 700px;
margin: 0;
background: transparent url(/i/tournament/tco08/rsvpBGStretch.png) top center repeat-y;
border-top: 1px solid black;
}

#contentIn{
background: transparent url(/i/tournament/tco08/rsvpBG.jpg) top center no-repeat;
border-top: 1px solid black;
padding: 40px 10px;
}

#contentBottom{
 font-size: 1px;
 height: 10px;
 margin-bottom: 20px;
 background: transparent url(/i/tournament/tco08/rsvpBGBottom.png) bottom center no-repeat;
}

a:link, a:visited {
    text-decoration: none;
    color: #ac1414;
}

a:hover, a:active {
    text-decoration: underline;
    color: #FFF;
}

#contentIn table.stat th, #contentIn table.stat td {  
    padding: 5px 10px; 
    border-bottom: 1px solid #000; 
    text-align: left;
}

#contentIn table.stat th { 
    background: #ed1c24; 
    text-align: left; 
}

#content table.stat th a:link, #content table.stat th a:visited {
    color: #ffffff;
    text-decoration: underline;
    text-align: left;
}
#contentIn table.stat th a:hover, #contentIn table.stat th a:active { 
    color: #ff9900;
    text-decoration: none;
    text-align: left;
}

#contentIn table.stat tr.dark td { 
    background: #0d0d0d;
    text-align: left;
}

#contentIn table.stat tr.light td { background: #2b292a; }
</style>

</head>
<body>


<div align="center" style="background: transparent;">
    <div id="contentOut">
        <div id="contentIn">

            <div align="center" style="margin: 20px;">
                <a target="_blank" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=about"><img src="/i/tournament/tco08/rsvpBanner.png" alt="2008 TopCoder Open" /></a>
            </div>
 
            <br />
            <table width="75%" cellpadding="0" cellspacing="0" class="stat">
                <tr>
                    <th colspan="2">Tuesday, May 13, 2008</th>
                </tr>
                <tr>
                    <th>Time</th>
                    <th>Event</th>
                </tr>
                <tr class="light">
                    <td>3:00 PM - 3:30 PM</td>
                    <td>TopCoder 101</td>
                </tr>
                <tr class="dark">
                    <td>4:00 PM - 4:45 PM</td>
                    <td>Developer Forum:  From Assembly to Architecture</td>
                </tr>
                <tr class="light">
                    <td>7:00 PM</td>
                    <td>Welcome Reception at <a target="_blank" href="<tc-webtag:linkTracking link='http://www.hofbrauhauslasvegas.com/' refer='tco08_rsvp' />">Hofbrauhaus Las Vegas</a></td>
                </tr>
                <tr>
                    <th colspan="2">Wednesday, May 14, 2008</th>
                </tr>
                <tr>
                    <th>Time</th>
                    <th>Event</th>
                </tr>
                <tr class="light">
                    <td>12:15 PM</td>
                    <td>Lunch time Member discussions</td>
                </tr>
                <tr class="dark">
                    <td>1:00 PM - 1:30 PM</td>
                    <td>TopCoder 101</td>
                </tr>
                <tr class="light">
                    <td>1:00 PM - 1:45 PM</td>
                    <td>Crowd Sourcing Collaboration and Innovation</td>
                </tr>
                <tr class="dark">
                    <td>2:00 PM - 2:45 PM</td>
                    <td>Developer Forum:  TC Direct &amp; Cockpit and Widget Innerworkings</td>
                </tr>
                <tr class="light">
                    <td>3:00 PM - 3:45 PM</td>
                    <td>Corporate Forum:  Grady Bryant from VeriSign</td>
                </tr>
                <tr class="dark">
                    <td>4:00 PM - 4:45 PM</td>
                    <td>Developer Forum: Quality Through Review</td>
                </tr>
                <tr class="light">
                    <td>6:30 PM - 8:30 PM</td>
                    <td>Casino Night Cocktail Party</td>
                </tr>
                <tr>
                    <th colspan="2">Thursday, May 15, 2008</th>
                </tr>
                <tr>
                    <th>Time</th>
                    <th>Event</th>
                </tr>
                <tr class="light">
                    <td>9:00 AM - 9:45 AM</td>
                    <td>Corporate Forum:  Ron Burkhart from On Point Technology</td>
                </tr>
                <tr class="dark">
                    <td>10:30 AM - 11:15 AM</td>
                    <td>Corporate Forum:  Nic Perez from AOL</td>
                </tr>
                <%--
                <tr class="dark">
                    <td>11:30 AM - 12:00 PM</td>
                    <td>Business Transformation Discussion</td>
                </tr>
                --%>
                <tr class="light">
                    <td>12:15 PM</td>
                    <td>Lunch time Member discussions</td>
                </tr>
                <tr class="dark">
                    <td>1:30 PM - 2:00 PM</td>
                    <td>Jack Hughes Key Note</td>
                </tr>
            </table>
    
        </div>

        <div id="contentBottom">&nbsp;</div>

    </div>
</div>


</body>

</html>
