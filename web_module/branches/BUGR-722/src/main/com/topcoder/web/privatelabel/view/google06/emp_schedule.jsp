<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google06.css"/>
    <title>Google Code Jam 2006 Employee Competition, Powered by TopCoder</title>

    <jsp:include page="../script.jsp"/>
</head>

<body>

<!-- top - logo -->

<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center">
                 <img border="0" src="/i/events/google2006/codejamLogo_emp.gif" alt="Google Code Jam Employee Competition"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
</tr>

<!-- Tab bar links-->
<tr>
    <td>
        <div align="center">
            <jsp:include page="emp_links.jsp">
                <jsp:param name="selectedTab" value="schedule"/>
            </jsp:include>
            <br>
        </div>
    </td>
</tr>

<!-- content -->
<tr>
    <td>
        <div align="center">
        <div class="pageLayout" align="left">

         <span valign="top">
         <jsp:include page="emp_right.jsp"/>
         </span>

            <span class="bigBluetitle">Schedule</span>
            <br><br>

            <!-- Qualification Rounds begins -->
            <span class="subTitle">Qualification Round</span>
            <br><br>

            <a name="sched"></a>
            <table width="450" align="left" class="box">
                <tr>
                    <td class="boxTitle" width="25%">Round</td>
                    <td class="boxTitle" width="35%">Date and Time*</td>
                    <td class="boxTitle" width="21%" align="center"># of Competitors</td>
                    <td class="boxTitle" width="19%" align="center"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="boxText">Qualification Round</td>
                    <td class="boxText" nowrap=nowrap>12:00 PM (Noon) September 5 <br> to<br/>12:00 PM (Noon) September
                        6, 2006</td>
                    <td class="boxText" align="center">All eligible members</td>
                    <td class="boxText" align="center">100</td>
                </tr>
                <tr valign="top">
                    <td class="boxText" colspan="4">*NOTE: All times denoted as EDT (GMT/UTC -4).</td>
                </tr>
            </table>

            <br><br><br><br><br><br><br><br><br>

            <span class="subTitle">Online Elimination Rounds</span><br>
            Everyone who advances to the online rounds must log in to the TopCoder Competition Arena no later than five 
            minutes prior to the start of the round. All start times will be communicated as EDT (GMT/UTC -4). If a coder 
            does not participate, for any reason, in an online round he/she has advanced to, it will be treated as an 
            automatic loss in that round of competition.
            <br><br>

            <table width="450" align="left" class="box">
                <tr>
                    <td class="boxTitle" width="25%">Round</td>
                    <td class="boxTitle" width="35%">Date and Time*</td>
                    <td class="boxTitle" width="21%" align="center"># of Competitors</td>
                    <td class="boxTitle" width="19%" align="center"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="boxText">Online Round 1</td>
                    <td class="boxText">September 14, 2006<br/>10:00 AM</td>
                    <td class="boxText" align="center">100</td>
                    <td class="boxText" align="center">50</td>
                </tr>
                <tr valign="top">
                    <td class="boxText">Online Round 2</td>
                    <td class="boxText">September 19<br/>10:00 AM</td>
                    <td class="boxText" align="center">50</td>
                    <td class="boxText" align="center">25</td>
                </tr>
                <tr valign="top">
                    <td class="boxText" colspan="4">*NOTE: All times listed as EDT (GMT/UTC -4). In the event that an
                        online round must be cancelled
                        for any reason, the round will be held the next possible business day at the same time.</td>
                </tr>
            </table>
            <br><br><br><br><br><br><br><br><br><br><br><br><br>

            <span class="subTitle">Online Championship Round</span><br>
            Up to 25 coders will compete online during the Championship Round.
            <br><br>

            <table width="450" class="box" align="center" style="clear:right;">
                <tr>
                    <td class="boxTitle" width="25%">Round</td>
                    <td class="boxTitle" width="35%">Date and Time*</td>
                    <td class="boxTitle" width="21%" align="center"># of Participants</td>
                </tr>
                <tr valign="top">
                    <td class="boxText">Championship Round</td>
                    <td class="boxText">October 27, 2006<br/>Time TBD<br/></td>
                    <td class="boxText" align="center">25</td>
                </tr>
                <tr valign="top">
                    <td class="boxText" colspan="3">*NOTE: All times listed in EDT (GMT/UTC -4). The date and time of
                        the Championship Round is subject to change with or without prior notice.</td>
                </tr>
            </table>

            <br><br>
            To find out more detailed information about the Google&#153; Code Jam 2006 Employee Competition, please read the
            <a href="/pl/?&module=Static&d1=google06&d2=emp_rules">Terms and Conditions</a>.
            <br><br>
        </div>
        </div>
    </td>
</tr>
<tr>
    <td>
        <div align="center">
            <jsp:include page="foot.jsp"/>
        </div>
    </td>
</tr>

</table>
</body>
</html>