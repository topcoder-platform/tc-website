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
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="schedule"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>
        
        <div id="pageBody">
            <h1><span>Algorithm Competition Schedule*</span></h1>
            
            <h2>Registration</h2>

            <p>Registration for the 2007 TopCoder Collegiate Challenge Algorithm Competition will open at 9:00 AM EDT on Monday, July 23, and will close at 5:00 PM EDT on Thursday, August 16, 2007. In order to be eligible to compete in the Algorithm Competition, competitors must be a registered TopCoder member and have registered separately for the Algorithm Competition. There is no limit to the number of registrants for the competition, however each individual may only register once.</p>
            
            <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                <tbody> 
                    <tr> 
                        <td class="header">Registration</td> 
                        <td class="header">OPENS: Monday, July 23, 2007 9:00 AM EDT<br />CLOSES: Thursday, August 16 2007 5:00 PM EDT </td> 
                    </tr>
                </tbody>
            </table>

            <br /><br />

            <h2>Qualification Round</h2>
            <p>There will be three (3) Qualification Rounds available for those registered for the TCCC. A maximum of 550 competitors will advance to Online Round 1 from each Qualification Round, in addition to the 150 top rated members who automatically advance without competing in the Qualification Round.</p>
            <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                <tbody> 
                    <tr> 
                        <td class="header">Round</td> 
                        <td class="header">Date and Time*</td> 
                        <td class="header"># of Participants</td> 
                        <td class="header"># of Advancers</td> 
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Qualification Round 1</td> 
                        <td class="value">Saturday, August 18<br />Register: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
                        <td class="value">All members who have <br />not previously qualified - <br />limited to the first 1,350 <br />participants to register</td> 
                        <td class="value">550</td>

                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Qualification Round 2</td> 
                        <td class="value">Tuesday, August 21<br />Register: 4:00 - 6:55 AM<br />START: 7:00 AM</td> 
                        <td class="value">All members who have <br />not previously qualified - <br />limited to the first 1,350 <br />participants to register</td> 
                        <td class="value">550</td>

                    </tr> 
                    <tr class="light"> 
                        <td class="value">Qualification Round 3</td> 
                        <td class="value">Thursday, August 23<br />Register: 6:00 - 8:55 PM<br />START: 9:00 PM</td> 
                        <td class="value">All members who have <br />not previously qualified - <br />limited to the first 1,350 <br />participants to register</td> 
                        <td class="value">550</td>

                    </tr>
                    <tr class="dark">
                        <td class="value" colspan="4">*Times are Eastern Daylight Time (UTC/GMT -4). In the event that a round must be cancelled for any reason, the round will be held the following day at the same time.</td>
                    </tr> 
                </tbody>
            </table> 
            <br /><br />
                
            <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                <tbody> 
                    <tr>

                        <td class="title" colspan="4">Online Elimination Rounds</td>
                    </tr>
                    <tr> 
                        <td class="header">Round</td> 
                        <td class="header">Date and Time*</td> 
                        <td class="header"># of Participants</td> 
                        <td class="header"># of Advancers</td> 
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Online Round 1 - <br />
                          Section A</td> 
                        <td class="value">Tuesday, August 28<br />Register: 6:00 - 8:55 PM<br />START: 9:00 PM</td> 
                        <td class="value">Up to 720**</td> 
                        <td class="value">300</td>

                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Online Round 1 - <br />
                          Section B</td> 
                        <td class="value">Thursday, August 30<br />Register: 4:00 - 6:55 AM<br />START: 7:00 AM</td> 
                        <td class="value">Up to 720**</td> 
                        <td class="value">300</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Online Round 1 - <br />
                          Section C</td> 
                        <td class="value">Saturday, September 1<br />Register: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
                        <td class="value">Up to 720**</td> 
                        <td class="value">300</td>

                    </tr>
                    <tr class="dark"> 
                        <td class="value">Online Round 2 </td> 
                        <td class="value">Saturday, September 8<br />Register: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
                        <td class="value">900</td> 
                        <td class="value">300</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Online Round 3</td> 
                        <td class="value">Saturday, September 15<br />Register: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
                        <td class="value">300</td> 
                        <td class="value">150</td>

                    </tr>
                    <tr class="dark"> 
                        <td class="value">Online Round 4</td> 
                        <td class="value">Saturday, September 22<br />Register: 10:00 AM - 12:55 PM<br />START: 1:00 PM</td> 
                        <td class="value">150</td> 
                        <td class="value">48</td>
                    </tr>

                    <tr class="light">

                      <td class="value" colspan="4">* NOTE: All times are Eastern Daylight Time (UTC/GMT -4). In the event that a round must be cancelled for any reason, the round will be the following day at the same time.<br />
                        ** If less than 1,800 competitors qualify to compete in Online Round #1, the maximum number of competitors that will be assigned into any section will be 40% of the actual number of qualifiers, rounded up.</td>
                    </tr> 
                </tbody> 
            </table>
            <br /><br />
        
            <table cellpadding="0" cellspacing="0" class="stat" width="100%"> 
                <tbody> 
                    <tr>

                        <td class="title" colspan="2">Onsite Semifinal and Championship Rounds</td>
                    </tr>
                    <tr> 
                        <td class="header">Round of Competition</td> 
                        <td class="header">Date and Time (Eastern Daylight Time)</td>
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Semifinal Room 1</td> 
                        <td class="value">Wednesday, October 31, 8:30 AM</td> 
                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Semifinal Room 2</td> 
                        <td class="value">Wednesday, October 31, 2:00 PM</td> 
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Semifinal Room 3</td> 
                        <td class="value">Thursday, November 1, 8:30 AM</td> 
                    </tr> 
                    <tr class="dark"> 
                        <td class="value">Wildcard Round</td> 
                        <td class="value">Thursday, November 1, 2:00 PM</td> 
                    </tr> 
                    <tr class="light"> 
                        <td class="value">Championship Round</td> 
                        <td class="value">Friday, November 2, 1:30 PM</td> 
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
            <p><a href="http://www.timeanddate.com/worldclock/fixedtime.html?month=9&day=12&year=2007&hour=7&min=0&sec=0&p1=179">7:00 AM</a> | 
                <a href="http://www.timeanddate.com/worldclock/fixedtime.html?month=9&day=12&year=2007&hour=9&min=0&sec=0&p1=179">9:00 AM</a> | 
                <a href="http://www.timeanddate.com/worldclock/fixedtime.html?month=9&day=12&year=2007&hour=13&min=0&sec=0&p1=179">1:00 PM</a> | 
                <a href="http://www.timeanddate.com/worldclock/fixedtime.html?month=9&day=12&year=2007&hour=18&min=0&sec=0&p1=179">6:00 PM</a> | 
                <a href="http://www.timeanddate.com/worldclock/fixedtime.html?month=9&day=12&year=2007&hour=21&min=0&sec=0&p1=179">9:00 PM</a>

            </p>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>