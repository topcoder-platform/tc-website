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
    <jsp:param name="tabLev1" value="onsiteSchedule"/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    
    
        <div id="title">
            <h2>Onsite Schedule</h2>
        </div><%-- #title --%>
        
        <div>&nbsp;</div>
        <div id="content">
            <div id="sample_table">
                <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                    <tr>
                        <th>Friday, March 14, 2008</th>
                    </tr>
                    <tr class="light">
                        <td>9:00 AM - 5:00 PM Registration &amp; Hotel Check In</td>
                    </tr>
                    <tr class="dark">
                        <td>8:00 PM - 9:30 PM Welcome Reception</td>
                    </tr>
                    <tr>
                        <th>Saturday, March 15, 2008</th>
                    </tr>
                    <tr class="light">
                        <td>8:00 AM - 9:00 AM Breakfast</td>
                    </tr>
                    <tr class="dark">
                        <td>9:30 AM - 10:00 AM Competitor Set-up Time</td>
                    </tr>
                    <tr class="light">
                        <td><strong>10:00 AM - Noon Championship Round</strong></td>
                    </tr>
                    <tr class="dark">
                        <td>12:30 PM - 1:30 PM Lunch</td>
                    </tr>
                    <tr class="light">
                        <td>1:30 PM - 2:30 PM Purdue Presentation</td>
                    </tr>
                    <tr class="dark">
                        <td>6:30 PM - 8:30 PM Awards Ceremony &amp; Dinner</td>
                    </tr>
                    <tr class="light">
                        <td>9:00 PM - 11:00 PM Bowling Tournament &amp; Party</td>
                    </tr>
                    <tr>
                        <th>Sunday, March 16, 2008</th>
                    </tr>
                    <tr class="light">
                        <td>8:00 AM - 3:00 PM Check Out &amp; Departure</td>
                    </tr>
                    <tr class="dark">
                        <td>Note:  All times are listed as Eastern Daylight Time (UTC/GMT -4).</td>
                    </tr>
                </table>
            </div><%-- #sample_table --%>
            
            <div align="center">Times of onsite events are subject to change with or without notice.</div>
            
        </div><%-- #content --%>
        
        <jsp:include page="footer.jsp" />


</div><%-- #wrapper --%>

</body>
</html>