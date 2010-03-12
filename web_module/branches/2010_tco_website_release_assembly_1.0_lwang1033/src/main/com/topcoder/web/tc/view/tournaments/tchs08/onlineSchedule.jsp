<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="onlineSchedule"/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    
    
        <div id="title">
            <h2>Online Competition Schedule</h2>
        </div><%-- #title --%>
        
        <div id="content">
            <h3>Registration</h3>
            <p><strong>OPENS</strong>: Monday, December 17, 2007 at 9:00 AM EST<br />
            <strong>CLOSES</strong>:  Friday, January 10, 2008 at 5:00 PM EST</p>
            <p>In order to be eligible to compete in the tournament, each competitor must be a registered TopCoder High School member and have registered separately for the tournament. There is no limit to the number of registrants for the tournament; however each individual may only register once.</p>
    
            <h3>Online Elimination Rounds</h3>
            <div id="sample_table">
                <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                    <tr>
                        <th>Round of Competition</th>
                        <th>Date and Time *</th>
                        <th># of Participants</th>
                        <th># of Advancers</th>
                    </tr>
                    <tr class="light">
                        <td>Online Round 1</td>
                        <td>Saturday, January 12, 2008<br />Register: 10:00 - 12:55 PM<br />START: 1:00 PM</td>
                        <td>All Registered Participants</td>
                        <td>500</td>
                    </tr>
                    <tr class="dark">
                        <td>Online Round 2</td>
                        <td>Saturday, January 19, 2008<br />Register: 10:00 - 12:55 PM<br />START: 1:00 PM</td>
                        <td>Up to 500</td>
                        <td>100</td>
                    </tr>
                    <tr class="light">
                        <td>Online Round 3</td>
                        <td>Saturday, January 26, 2008<br />Register: 10:00 - 12:55 PM<br />START: 1:00 PM</td>
                        <td>Up to 100</td>
                        <td>50</td>
                    </tr>
                    <tr class="dark">
                        <td colspan="4">*All times are listed as Eastern Standard Time (GMT/UTC -5)<br /><br />NOTE: In the event that a round must be cancelled for any reason, the round will take place the following day at the same time.</td>
                    </tr>
                </table>
            </div><%-- #sample_table --%>
            
            <p><a target="_blank" href="<tc-webtag:linkTracking link='http://www.timeanddate.com/worldclock/fixedtime.html?month=1&day=12&year=2008&hour=13&min=0&sec=0&p1=179' refer='tchs08_onlineSchedule' />">Find start times in your time zone.</a></p>
            
        </div><%-- #content --%>
        
        <jsp:include page="footer.jsp" />


</div><%-- #wrapper --%>

</body>
</html>