<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="component"/>
    <jsp:param name="tabLev2" value="schedule"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        <h2>Component Competition Schedule</h2>
        
        <div class="sub_content">
        
            <h3>Registration</h3>
            <p>Registration for the 2008 TopCoder Open Component Design and Development Competition will open at 9:00 AM EST on Monday, January 14 and will close at 9:00 AM EST on Thursday, February 28, 2008.</p>
            <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                <tr>
                    <th colspan="4">Online Rounds</th>
                </tr>
                <tr>
                    <th>Round</th>
                    <th>Date and Time</th>
                    <th>Submission Timeframe</th>
                    <th>Submission Deadline</th>
                </tr>
                <tr class="dark">
                    <td>Week 1 of Online<br />Participation Round</td>
                    <td>January 24, 2008<br />at 9:00 AM*</td>
                    <td>72 Hours</td>
                    <td>January 31, 2008<br />at 9:00 AM*</td>
                </tr>
                <tr class="light">
                    <td>Week 2 of Online<br />Participation Round</td>
                    <td>January 31, 2008<br />at 9:00 AM*</td>
                    <td>72 Hours</td>
                    <td>February 7, 2008<br />at 9:00 AM*</td>
                </tr>
                <tr class="dark">
                    <td>Week 3 of Online<br />Participation Round</td>
                    <td>February 7, 2008<br />at 9:00 AM*</td>
                    <td>72 Hours</td>
                    <td>February 14, 2008<br />at 9:00 AM*</td>
                </tr>
                <tr class="light">
                    <td>Week 4 of Online<br />Participation Round</td>
                    <td>February 14, 2008<br />at 9:00 AM*</td>
                    <td>72 Hours</td>
                    <td>February 21, 2008<br />at 9:00 AM*</td>
                </tr>
                <tr class="dark">
                    <td>Week 5 of Online<br />Participation Round</td>
                    <td>February 21, 2008<br />at 9:00 AM*</td>
                    <td>72 Hours</td>
                    <td>February 28, 2008<br />at 9:00 AM*</td>
                </tr>
                <tr class="light">
                    <td>Week 6 of Online<br />Participation Round</td>
                    <td>February 28, 2008<br />at 9:00 AM*</td>
                    <td>72 Hours</td>
                    <td>March 6, 2008<br />at 9:00 AM*</td>
                </tr>
                <tr>
                    <th>Onsite Rounds</th>
                    <th>&nbsp;</th>
                    <th># of Participants</th>
                    <th>Submission Deadline</th>
                </tr>
                <tr class="dark">
                    <td>Component<br />Design Finals</td>
                    <td>May 12, 2008<br />at 12:00 PM**</td>
                    <td>12</td>
                    <td>May 12, 2008<br />at 6:00 PM**</td>
                </tr>
                <tr class="light">
                    <td>Component<br />Development Finals</td>
                    <td>May 14, 2008<br />at 8:30 AM**</td>
                    <td>12</td>
                    <td>May 14, 2008<br />at 5:00 PM**</td>
                </tr>
            </table>
            <br />
            
            <p>*Times listed in Eastern Standard Time (UTC/GMT -5)<br />
            **Times listed in Pacific Daylight Time (UTC/GMT -7)</p>

            
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
