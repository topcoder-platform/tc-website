<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="nav.jsp" >
        <jsp:param name="tabLev1" value="overview"/>
        <jsp:param name="tabLev2" value="schedule"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBodyST">

                <h1><span>Schedule of Online Competitions</span></h1>

<p><strong>Registration</strong><br />
Eligible employees must register separately for the Sponsor Track Competition.  There is no limit to the number of registrants in the competition; however each individual may only register once.  Registration will open at 9:00AM EDT (GMT/UTC -4) on Monday, July 30 and will close at 5:00PM EDT (GMT/UTC -4) on Thursday, August 30, 2007.</p>
<div align="center">
<table cellpadding="0" cellspacing="0" class="stat" style="width:450px"> 
    <tbody> 
        <tr> 
            <td class="header">Round of Competition</td> 
            <td class="header">Date and Time * (all Eastern Daylight Time)</td> 
        </tr> 
        <tr class="light"> 
            <td class="value">Online Round #1</td> 
            <td class="value">Saturday, September 1, 2007<br />Arena Sign-in: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td>
        </tr> 
        <tr class="dark"> 
            <td class="value">Online Round #2</td> 
            <td class="value">Saturday, September 8, 2007<br />Arena Sign-in: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
        </tr> 
        <tr class="light"> 
            <td class="value">Online Round #3</td> 
            <td class="value">Saturday, September 15, 2007<br />Arena Sign-in: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td>
        </tr> 
        <tr class="dark"> 
            <td class="value">Championship Round</td> 
            <td class="value">Saturday, September 22, 2007<br />Arena Sign-in: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
        </tr> 
        <tr class="light"><td class="value" colspan="2">*NOTE:  In the event that a round must be cancelled for any reason, the round will be held the following day at the same time.</td></tr>
    </tbody> 
</table>
<br /><br />
<p>See the official <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsortrack&d4=rules" alt="TCCC07 Sponsor Track Rules and Regulations">rules and regulations</a> for more details.</p>
</div>

            </div>
    </div>
    <jsp:include page="footer.jsp" />
    </div>
</div>
</body>
</html>
