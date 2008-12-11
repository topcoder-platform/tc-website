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
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="nav.jsp" >
        <jsp:param name="tabLev1" value="overview"/>
        <jsp:param name="tabLev2" value="joinus"/>
        <jsp:param name="tabLev3" value="onsiteschedule"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Onsite Schedule</span></h1>
                <div align="center">
                    <br />
                    <br />
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                        <tbody>
                            <tr>
                                <td class="title" colspan="2">Schedule of Onsite Events</td>
                            </tr>
                            <tr> 
                                <td class="header" colspan="2">Tuesday, October 30, 2007</td> 
                            </tr>
                            <tr class="light"> 
                                <td class="value">8:00 PM - 10:00 PM</td> 
                                <td class="value">Welcome Reception</td>
                            </tr> 
                            <tr>
                                <td class="header" colspan="2">Wednesday, October 31, 2007</td>
                            </tr>
                            <tr class="light"> 
                                <td class="value">8:30 AM - 10:30 AM </td> 
                                <td class="value">Algorithm Semifinal Room 1</td>
                            </tr> 
                            <tr class="dark"> 
                                <td class="value">9:00 AM - 5:00 PM </td> 
                                <td class="value">Marathon Match Finals</td>
                            </tr>
                            <tr class="light"> 
                                <td class="value">11:00 AM - NOON </td> 
                                <td class="value">NSA Presentation</td>
                            </tr>
                            <tr class="dark"> 
                                <td class="value">12:30 - 1:30 PM</td> 
                                <td class="value">Lunch</td>
                            </tr> 
                            <tr class="light">
                                <td class="value">11:30 AM - 1:00 PM </td>
                                <td class="value">Component Design &amp; Development 1</td>
                            </tr> 
                            <tr class="dark">
                                <td class="value">2:00 PM - 4:00 PM </td>
                                <td class="value">Algorithm Semifinal Room 2</td>
                            </tr>
                            <tr class="light">
                                <td class="value">6:00 PM - 10:00 PM </td>
                                <td class="value">Evening Event</td>
                            </tr>
                            <tr>
                                <td class="header" colspan="2">Thursday, November 1, 2007</td>
                            </tr>
                            <tr class="light">
                                <td class="value">8:30 AM - 10:30 AM </td>
                                <td class="value">Algorithm Semifinal Room 3</td>
                            </tr>
                            <tr class="dark">
                                <td class="value">9:00 AM - 5:00 PM </td>
                                <td class="value">Studio Graphic Design Finals</td>
                            </tr>
                            <tr class="light"> 
                                <td class="value">11:00 AM - NOON </td> 
                                <td class="value">Eli Lilly Presentation</td>
                            </tr>
                            <tr class="dark">
                                <td class="value">12:30 - 1:30 PM</td>
                                <td class="value">Lunch</td>
                            </tr>
                            <tr class="light">
                                <td class="value">11:30 AM - 1:00 PM </td>
                                <td class="value">Component Design & Development 2</td>
                            </tr>
                            <tr class="dark">
                                <td class="value">2:00 PM - 4:00 PM</td>
                                <td class="value">Algorithm Wildcard Round</td>
                            </tr>
                            <tr class="light">
                                <td class="value">4:00 PM - 5:00 PM</td>
                                <td class="value">Designing for Reuse Roundtable</td>
                            </tr>
                            <tr class="dark">
                                <td class="value">5:30 PM - 10:00 PM </td>
                                <td class="value">Evening Event</td>
                            </tr>
                            <tr>
                                <td class="header" colspan="2">Friday, November 2, 2007</td>
                            </tr>
                            <tr class="light">
                                <td class="value">9:00 AM - 10:30 AM </td>
                                <td class="value">Component Design &amp; Development Appeals Final</td>
                            </tr>
                            <tr class="dark"> 
                                <td class="value">11:00 AM - NOON </td> 
                                <td class="value">Deutsche Bank Presentation</td>
                            </tr>
                            <tr class="light">
                                <td class="value">12:30 - 1:30 PM</td>
                                <td class="value">Lunch</td>
                            </tr>
                            <tr class="dark">
                                <td class="value">1:30 PM - 3:30 PM </td>
                                <td class="value">Algorithm Championship Round</td>
                            </tr>
                            <tr class="light">
                                <td class="value">3:30 PM - 4:30 PM </td>
                                <td class="value">All Champion Announcements and Awards</td>
                            </tr>
                            <tr class="dark">
                                <td class="value">7:00 PM - 10:00 PM </td>
                                <td class="value">Reception</td>
                            </tr>
                        </tbody>
                    </table> 
                    <p>* Schedule subject to change with or without notice.</p>
                </div>
            </div>
        
    </div>
    <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
