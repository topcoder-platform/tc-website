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
        <jsp:param name="tabLev1" value="<%=EventType.STUDIO_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="schedule"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>
        
        <div id="pageBody">
            <h1><span>Studio Design Competition Schedule</span></h1>
            <p>
            The Studio competitions will have seven (7) weeks of online competition and one (1) onsite Championship Round. Each contestant participating in an online round must submit his/her design submission for any contest by the submission deadline as scheduled.
            </p>
            
            <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                <tbody> 
                    <tr> 
                        <td class="title" colspan="5">Schedule</td> 
                    </tr> 
                    <tr> 
                        <td class="header">&nbsp;</td> 
                        <td class="header">Start Date</td> 
                        <td class="header">Start Time</td> 
                        <td class="header">End Date</td> 
                        <td class="header">End Time</td> 
                    </tr> 
                    <tr class="light"> 
                        <td class="value">SDC Registration</td> 
                        <td class="value">July 23, 2007</td> 
                        <td class="value">9:00 AM</td> 
                        <td class="value">August 24, 2007</td>

                        <td class="value">5:00 PM</td>
                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Online Competition</td> 
                        <td class="value">Week of July 23, 2007</td> 
                        <td class="value">TBD</td> 
                        <td class="value">September 11, 2007</td>
                        <td class="value">6:00 PM</td>

                    </tr> 
                    <tr class="light"> 
                        <td class="value">Onsite Competition</td> 
                        <td class="value">November 1, 2007</td> 
                        <td class="value">9:00 AM</td> 
                        <td class="value">November 1, 2007</td>
                        <td class="value">5:00 PM</td>
                    </tr> 
                    <tr class="dark"><td class="value" colspan="5">*Times listed in Eastern Daylight Time (UTC/GMT -4).</td></tr>
                </tbody> 
            </table>

            <br /><br />
            
            <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                <tbody> 
                    <tr> 
                        <td class="title" colspan="2">Important Dates</td> 
                    </tr> 
                    <tr> 
                        <td class="header">Important Items to Note</td> 
                        <td class="header">Date and Time (Eastern Daylight Time)</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Last Day to Request a Visa Letter</td> 
                        <td class="value">Friday, September 14, 2007 5:00 PM</td> 
                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Finalist Documents Due</td> 
                        <td class="value">Friday, September 28, 2007 5:00 PM</td> 
                    </tr> 
                </tbody> 
            </table>
            <br /><br/>
            
            <h2>* Find start times in your time zone</h2>
            <p>See when the 9:00 AM EDT competitions begin in your time zone <a href="http://www.timeanddate.com/worldclock/fixedtime.html?month=9&day=12&year=2007&hour=9&min=0&sec=0&p1=179">here</a>.</p>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>