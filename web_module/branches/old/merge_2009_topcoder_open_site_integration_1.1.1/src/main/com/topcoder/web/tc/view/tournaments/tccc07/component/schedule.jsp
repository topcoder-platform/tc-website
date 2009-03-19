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
        <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="schedule"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>
        
        <div id="pageBody">
            <h1><span>Component Competition Schedule*</span></h1>
            
            <br /><br />
            <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                <tbody> 
                    <tr> 
                        <td class="header">Registration</td> 
                        <td class="header">OPENS: Monday, July 23, 2007 at 9:00 AM EDT<br />CLOSES: Thursday, August, 23, 2007 at 9:00 AM EDT</td> 
                    </tr>
                </tbody>
            </table>
            <br /><br />

            <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                <tbody> 
                    <tr> 
                        <td class="header">Round</td> 
                        <td class="header">All Projects Posted*</td> 
                        <td class="header">Registration Period</td> 
                        <td class="header">Submission Deadline</td> 
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Week 1 of Online Qualification Round</td> 
                        <td class="value">July 26, 2007 9:00 AM</td> 
                        <td class="value">72 Hours</td> 
                        <td class="value">August 2, 2007 9:00 AM</td>

                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Week 2 of Online Qualification Round</td> 
                        <td class="value">August 2, 2007 9:00 AM</td> 
                        <td class="value">72 Hours</td> 
                        <td class="value">August 9, 2007 9:00 AM</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Week 3 of Online Qualification Round</td> 
                        <td class="value">August 9, 2007 9:00 AM</td> 
                        <td class="value">72 Hours</td> 
                        <td class="value">August 16, 2007 9:00 AM</td>

                    </tr>
                    <tr class="dark"> 
                        <td class="value">Week 4 of Online Qualification Round</td> 
                        <td class="value">August 16, 2007 9:00 AM</td> 
                        <td class="value">72 Hours</td> 
                        <td class="value">August 23, 2007 9:00 AM</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Week 5 of Online Qualification Round</td> 
                        <td class="value">August 23, 2007 9:00 AM</td> 
                        <td class="value">72 Hours</td> 
                        <td class="value">August 30, 2007 9:00 AM</td>

                    </tr>
                    <tr class="dark"> 
                        <td class="value">Championship Round (online portion component 1)</td> 
                        <td class="value">September 20, 2007 9:00 AM</td> 
                        <td class="value">72 Hours</td> 
                        <td class="value">September 27, 2007 9:00 AM</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Championship Round (online portion component 2)</td> 
                        <td class="value">October 4, 2007 9:00 AM</td> 
                        <td class="value">72 Hours</td> 
                        <td class="value">October 11, 2007 9:00 AM</td>

                    </tr>
                    <tr class="dark"> 
                        <td class="value">Championship Round (online portion component 3)</td> 
                        <td class="value">October 18, 2007 9:00 AM</td> 
                        <td class="value">72 Hours</td> 
                        <td class="value">October 25, 2007 9:00 AM</td>
                    </tr> 
     
                    <tr class="light"> 
                        <td class="value">Championship Round (onsite portion component 1)</td> 
                        <td class="value">October 31, 2007 11:30 AM</td> 
                        <td class="value">1.5 Hours</td> 
                        <td class="value">October 31, 2007 1:00 PM</td>
                    </tr>

                    <tr class="dark"> 
                        <td class="value">Championship Round (onsite portion component 2)</td> 
                        <td class="value">November 1, 2007 11:30 AM</td> 
                        <td class="value">1.5 Hours</td> 
                        <td class="value">November 1, 2007 1:00 PM</td>
                    </tr>

                    <tr class="light"> 
                        <td class="value">Championship Round (onsite portion component 3)</td> 
                        <td class="value">November 2, 2007 9:00 AM</td> 
                        <td class="value">1.5 Hours</td> 
                        <td class="value">November 2, 2007 10:30 AM</td>
                    </tr>

                    <tr class="dark">
                        <td class="value" colspan="4">*All times are noted in Eastern Daylight Time (UTC/GMT -4). Click <a href="http://www.timeanddate.com/worldclock/fixedtime.html?month=8&day=17&year=2007&hour=9&min=0&sec=0&p1=179" alt="Time Zone">here</a> for your time zone.</td>
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

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>