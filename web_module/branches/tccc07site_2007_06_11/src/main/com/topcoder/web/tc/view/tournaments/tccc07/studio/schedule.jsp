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
            <div id="h1Border">&nbsp;</div>
            <h1><span>Studio Design Competition Schedule</span></h1>
            <div id="h1Border">&nbsp;</div>
            <p>
            The Studio competitions will have eight (8) weeks of online competition and one (1) onsite Championship round. Each contestant participating in an online round must submit his/her design submission for any contest by the submission deadline as scheduled.
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
                        <td class="value">9:00 AM EDT<br />(GMT/UTC -4)</td> 
                        <td class="value">August 24, 2007</td>
                        <td class="value">5:00 PM EDT<br />(GMT/UTC -4)</td>
                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Online Competition</td> 
                        <td class="value">July 23, 2007</td> 
                        <td class="value">9:00 AM EDT<br />(GMT/UTC -4)</td> 
                        <td class="value">September 7, 2007</td>
                        <td class="value">2:00 PM EDT<br />(GMT/UTC -4)</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Onsite Competition</td> 
                        <td class="value">November 1, 2007</td> 
                        <td class="value">9:00 AM PDT<br />(GMT/UTC -4)</td> 
                        <td class="value">November 1, 2007</td>
                        <td class="value">5:00 PM EDT<br />(GMT/UTC -4)</td>
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
                        <td class="header">Important Items to Note</td> 
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

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>