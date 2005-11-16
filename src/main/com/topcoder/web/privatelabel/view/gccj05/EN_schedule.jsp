<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Google Code Jam China, Powered by TopCoder</title>
</head>

<body>


<table border="0" width=100% cellpadding=0 cellspacing=0>
<tr>
    <td width="49%">&#160;</td>
    <td align="center">
        <table border="0" width=100% cellpadding=0 cellspacing=0>
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gcjc_logo.gif"
                                                        alt="Google Coder Jam China logo"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
    <td width="49%"></td>
</tr>
<tr>
    <td width="49%">&#160;</td>
    <td>
        <div class="greenBigBox">

            <!-- Tab bar links-->
            <div align="center">
                <jsp:include page="EN_links.jsp">
                    <jsp:param name="selectedTab" value="schedule"/>
                </jsp:include>
            </div>


            <br><br>
            <span class="bigTitle">Schedule</span>
            <span valign=top>
         <jsp:include page="EN_right.jsp"/>
         </span>
            <br><br>

            <span class="greenSubtitle">Qualification Round</span><br>
            <a name="sched"></a>
            <table width="450" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Competitors</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Qualification Round</td>
                    <td class="sidebarText" nowrap=nowrap>
					Noon, December 12, 2005<br>to<br>Noon, December 13, 2005
                    </td>
                    <td class="sidebarText" align="center">All eligible members</td>
                    <td class="sidebarText" align="center">500</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="4">*NOTE: All times listed GMT +8 (Beijing Time)</td>
                </tr>
            </table>

            <br><br>
            <span class="greenSubtitle">Online Elimination Rounds</span><br>
            Everyone who advances to an online round must log in to the TopCoder Competition Arena no later than ten
            minutes prior to the start of the round. All start times will be communicated as GMT +8. If a coder does not
            participate, for any reason, in an online round he/she has advanced to, it will be treated as an automatic
            loss in that round of competition.
            <br><br>

            <table width="450" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Competitors</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Online Round 1</td>
                    <td class="sidebarText">December 19, 9:00 PM</td>
                    <td class="sidebarText" align="center">500</td>
                    <td class="sidebarText" align="center">250</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Online Round 2</td>
                    <td class="sidebarText">December 22, 2005, 9:00 PM</td>
                    <td class="sidebarText" align="center">250</td>
                    <td class="sidebarText" align="center">50</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="4">*NOTE: All times listed GMT +8. In the event that an online
                        round must be cancelled for any reason, the "rain date" will be the next possible business day
                        at the same time.</td>
                </tr>
            </table>

            <br><br>
            <span class="greenSubtitle">Onsite Championship Round</span><br>
            Up to 50 coders will compete at an onsite Championship Round.  Each finalist must be present onsite to compete in the onsite finals.
            <br><br>

            <table width="450" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="50%">Date and Time*</td>
                    <td class="sidebarTitle" width="25%" align="center"># of Participants</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" nowrap="nowrap">Championship Round</td>
                    <td class="sidebarText">January 20, time TBD</td>
                    <td class="sidebarText" align="center">50</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3">*NOTE: All times listed in GMT +8. The time of the onsite round
                        is subject to change.</td>
                </tr>
            </table>

            <br><br>
To find out more detailed information about the Google&#153; Code Jam China, including a list of the prizes, please read the
<a href="/pl/?module=Static&d1=gccj05&d2=EN_rules">Terms and Conditions</a>.
        </div>
    </td>
    <td width="49%">&#160;</td>
<tr>
</table>
<jsp:include page="EN_foot.jsp"/>
</body>
</html>