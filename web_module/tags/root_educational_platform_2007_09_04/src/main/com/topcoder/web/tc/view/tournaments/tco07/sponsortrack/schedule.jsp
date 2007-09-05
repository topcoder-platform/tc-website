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

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="schedule"/>
                    <jsp:param name="tabLev2" value=""/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <%--<img src="/i/tournament/tco07/competitorsbanner.jpg" alt="Competitors" />--%>
                    <div id="pageBody">

                        <h1><span>Schedule of Online Competitions</span></h1>
<p><b>Registration</b><br>
Eligible employees must register separately for the Sponsor Track Competition.  There is no limit to the number of registrants in the competition; however each individual may only register once.  Registration will open at 9:00AM EDT (GMT/UTC -4) on Monday, March 12, and will close at 6:00PM EDT (GMT/UTC -4) on Tuesday, March 27, 2007.   </p>

                        <div align="center">
                        <table cellspacing="0" cellpadding="0" class="stat" style="width: 450px;">
                        <thead>
                                <tr>
                                       <td class="header">Round of Competition</td>
                                       <td class="header">Date and Time * <br>(all Eastern Daylight Time)</td>
                                </tr>
                        </thead>
                        <tbody>
                                <tr class="light">
                                       <td class="value">Qualification Round</td>
                                       <td class="value">Tuesday, April 3, 2007<br>
                                       Arena Sign-in:  6:00 – 8:55 PM<br>
                                       START:    9:00 PM
                                       </td>
                                </tr>
                                <tr class="dark">
                                       <td class="value">Online Round #1</td>
                                       <td class="value">Tuesday, April 10, 2007 <br>
                                       Arena Sign-in:  6:00 – 8:55 PM<br>
                                       START:    9:00 PM
                                       </td>
                                </tr>
                                <tr class="light">
                                       <td class="value">Online Round #2</td>
                                       <td class="value">Saturday, April 14, 2007<br>
                                       Arena Sign-in:  10:00 AM – 12:55 PM<br>
                                       START:    1:00 PM
                                       </td>
                                </tr>
                                <tr class="dark">
                                       <td class="value">Online Round #3</td>
                                       <td class="value">Saturday, April 21, 2007<br>
                                       Arena Sign-in:  10:00 AM – 12:55 PM<br>
                                       START:    1:00 PM
                                       </td>
                                </tr>
                                <tr class="light">
                                       <td class="value">Championship Round</td>
                                       <td class="value">Saturday, April 28, 2007<br>
                                       Arena Sign-in:  10:00 AM – 12:55 PM<br>
                                       START:    1:00 PM
                                       </td>
                                </tr>
                                <tr class="dark">
                                <td class="value" colspan="2">*NOTE:  In the event that a round must be cancelled for any reason, the round will be held the following day at the same time.</td>
                                </tr>
                        </tbody>
                        </table>
                        <p>&#160;</p>
<p>See the official <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=rules">rules and regulations</a> for more details.</p>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
