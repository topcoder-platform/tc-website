<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="marathon"/>
                    <jsp:param name="tabLev2" value="schedule"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Marathon Match Schedule</span></h1>

    <p><br></p>
                        <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
                        <thead>
                                <tr>
                                       <td class="header">Registration</td>
                                       <td class="header">OPENS: Monday, February 19, 2007 9:00 AM EDT<br>
                                       CLOSES: Tuesday, March 6, 2007 6:00 PM EDT </td>
                                </tr>
                        </thead>
                        </table>
                        <p></p>

<table cellpadding="0" cellspacing="0" class="stat" width="100%">
<thead>
            <tr>
                   <td class="title" colspan="5">Online and Onsite Schedule</td>
            </tr>
    <tr>
        <td class="header">Round of Competition</td>
        <td class="header">Start Date and Time</td>
        <td class="header">End Date and Time</td>
        <td class="header">Participants</td>
        <td class="headerC">Advancers</td>
    </tr>
</thead>
<tbody>
    <tr class="light">
        <td style="value" nowrap="nowrap">
            Online Round #1
        </td>
        <td style="value">
            Wednesday, March 7<br>
            Noon*
        </td>
        <td style="value">
            Wednesday, March 14
            Noon**
        </td>
        <td style="value">
            All Registered Participants
        </td>
        <td style="valueC">
            500
        </td>
    </tr>
    <tr class="dark">
        <td style="value" nowrap="nowrap">
            Online Round #2
        </td>
        <td style="value">
            Wednesday, March 21<br>
            Noon**
        </td>
        <td style="value">
            Wednesday, March 28
            Noon**
        </td>
        <td style="value">
            up to 500
        </td>
        <td style="valueC">
            200
        </td>
    </tr>
    <tr class="light">
        <td style="value" nowrap="nowrap">
            Online Round #3
        </td>
        <td style="value">
            Wednesday, April 4<br>
            Noon**
        </td>
        <td style="value">
            Wednesday, April 11
            Noon**
        </td>
        <td style="value">
            up to 200
        </td>
        <td style="valueC">
            50
        </td>
    </tr>
    <tr class="dark">
        <td style="value" nowrap="nowrap">
            Online Round #4
        </td>
        <td style="value">
            Wednesday, April 18<br>
            Noon**
        </td>
        <td style="value">
            Wednesday, May 2
            Noon**
        </td>
        <td style="value">
            up to 50
        </td>
        <td style="valueC">
            8
        </td>
    </tr>
    <tr class="light">
        <td style="value" nowrap="nowrap">
            Onsite Finals
        </td>
        <td style="value">
            Wednesday, June 27<br>
            9:00am
        </td>
        <td style="value">
            Wednesday, June 27<br>
            6:00pm
        </td>
        <td style="value">
            8
        </td>
        <td style="valueC">
            Champion
        </td>
    </tr>
    <tr class="dark">
        <td class="value" colspan="5">
            *Time listed in Eastern Standard Time (UTC/GMT -5). In the event that a round must be cancelled for any reason, the round will start the following day at the same time.<br>
            **Times listed in Eastern Daylight Time (UTC/GMT -4). In the event that a round must be cancelled for any reason, the round will start the following day at the same time.
        </td>
    </tr>
</tbody>
</table>

    <p><br></p>

    <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
    <thead>
            <tr>
                   <td class="title" colspan="2">Important Dates</td>
            </tr>
            <tr>
                   <td class="header">Important Items to Note</td>
                   <td class="header">Date and Time (Eastern Daylight Time)</td>
            </tr>
    </thead>
    <tbody>
            <tr class="light">
                   <td class="value">Last Day to Request a Visa Letter</td>
                   <td class="value">Monday, April 23, 2007 at 5:00 PM</td>
            </tr>
            <tr class="dark">
                   <td class="value">Finalist Documents Due</td>
                   <td class="value">Friday, May 11, 2007 at 5:00 PM</td>
            </tr>
   </tbody>
    </table>
                        </p>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
