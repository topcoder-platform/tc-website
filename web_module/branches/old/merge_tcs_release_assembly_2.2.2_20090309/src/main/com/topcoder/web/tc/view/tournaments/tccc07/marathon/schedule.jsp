<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.MARATHON_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="schedule"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>
        
        <div id="pageBody">
            <h1><span>Marathon Match Competition Schedule*</span></h1>
            
            <br /><br />
            <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                <tbody> 
                    <tr> 
                        <td class="header">Registration</td> 
                        <td class="header">OPENS: Monday, July 23, 2007 9:00 AM EDT<br />CLOSES: Tuesday, August 7, 2007 5:00 PM EDT</td> 
                    </tr>
                </tbody>
            </table>
            <br /><br />

            <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                <tbody>
                    <tr>
                        <td class="title" colspan="5">Online and Onsite Schedule</td>
                    </tr>
                    <tr> 
                        <td class="header">Round of Competition</td> 
                        <td class="header">Start Date and Time*</td> 
                        <td class="header">End Date and Time*</td> 
                        <td class="header">Participants</td> 
                        <td class="header">Advancers</td>

                    </tr> 
                    <tr class="light"> 
                        <td class="value">Online Round 1</td> 
                        <td class="value">Wednesday, August 8 Noon</td> 
                        <td class="value">Wednesday,  August 15 Noon</td> 
                        <td class="value">Unlimited</td>
                        <td class="value">300</td>
                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Online Round 2</td> 
                        <td class="value">Wednesday, August 22 Noon</td> 
                        <td class="value">Wednesday, August 29 Noon</td> 
                        <td class="value">up to 300</td>

                        <td class="value">100</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Online Round 3</td> 
                        <td class="value">Wednesday, September 5 Noon</td> 
                        <td class="value">Wednesday, September 19 Noon</td> 
                        <td class="value">up to 100</td>
                        <td class="value">8</td>

                    </tr>
                    <tr class="dark"> 
                        <td class="value">Onsite Finals</td> 
                        <td class="value">Wednesday, October 31 9:00 AM </td> 
                        <td class="value">Wednesday, October 31 6:00 PM</td> 
                        <td class="value">8</td>
                        <td class="value">Champion</td>
                    </tr> 
                    <tr class="light">

                        <td class="value" colspan="5">*Times listed in Eastern Daylight Time (UTC/GMT -4). In the event that a round must be cancelled for any reason, the round will start the following day at the same time.</td>
                    </tr> 
                </tbody>
            </table> 
            <br /><br />
                
            <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                <tbody> 
                    <tr>
                        <td class="title" colspan="2">Important Dates</td>
                    </tr>

                    <tr> 
                        <td class="header">Important Items To Note</td> 
                        <td class="header">Date and Time (Eastern Daylight Time)</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Last Day to Request a Visa Letter</td> 
                        <td class="value">Friday, September 14, 2007 at 5:00 PM</td> 
                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Finalist Documents Due</td> 
                        <td class="value">Friday, September 28, 2007 at 5:00 PM</td> 
                    </tr> 
                </tbody> 
            </table>
            <br /><br />
            
            <h2>* Find start times in your time zone</h2>
            <p>Below is a list of start times for the various rounds. Click the time that corresponds to the round you are interested in to see what time coding begins in your time zone.</p>
            <p><a href="http://www.timeanddate.com/worldclock/fixedtime.html?month=9&day=12&year=2007&hour=9&min=0&sec=0&p1=179">9:00 AM</a> | 
                <a href="http://www.timeanddate.com/worldclock/fixedtime.html?month=9&day=12&year=2007&hour=12&min=0&sec=0&p1=179">Noon</a></p>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>