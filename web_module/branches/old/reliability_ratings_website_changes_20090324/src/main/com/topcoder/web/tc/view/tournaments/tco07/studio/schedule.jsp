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
                    <jsp:param name="tabLev1" value="studio"/>
                    <jsp:param name="tabLev2" value="schedule"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Studio Design Competition Schedule</span></h1>
                        <p>
                        The Studio competitions will have eight (8) weeks of online competition and one (1) onsite Championship round. Each contestant participating in an online round must submit his/her design submission for any contest by the submission deadline as scheduled. 
                        </p>
                        
                        <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
                        <thead>
                                <tr>
                                       <td class="title" colspan="2">Schedule</td>
                                </tr>
                                <tr>
                                       <td class="header">&#160;</td>
                                       <td class="header">Start Date</td>
                                       <td class="header">Start Time</td>
                                       <td class="header">End Date</td>
                                       <td class="header">End Time</td>
                                </tr>
                        </thead>
                        <tbody>
                                <tr class="light">
                                       <td class="value">SDC Registration</td>
                                       <td class="value">Feb 19, 2007</td>
                                       <td class="value">9:00 AM EST (GMT/UTC -5)</td>
                                       <td class="value">April 30, 2007</td>
                                       <td class="value">6:00 PM EDT (GMT/UTC -4)</td>
                                </tr>
                                <tr class="dark">
                                       <td class="value">Online Competition*</td>
                                       <td class="value">March 5, 2007</td>
                                       <td class="value">9:00 AM EST (GMT/UTC -5)</td>
                                       <td class="value">April 30, 2007</td>
                                       <td class="value">6:00 PM EDT (GMT/UTC -4)</td>
                                </tr>
                                <tr class="light">
                                       <td class="value">Onsite Competition</td>
                                       <td class="value">June 28, 2007</td>
                                       <td class="value">9:00 AM PDT (GMT/UTC -4)</td>
                                       <td class="value">June 28, 2007</td>
                                       <td class="value">6:00 PM PDT (GMT/UTC -4)</td>
                                </tr>
                                <tr class="dark">
                                       <td class="value" colspan="5">* New contests will be available each Tuesday, so keep an eye on the <a href="http://studio.topcoder.com/?module=ViewActiveContests">Active Contests</a>.</td>
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
                         <p></p>
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
