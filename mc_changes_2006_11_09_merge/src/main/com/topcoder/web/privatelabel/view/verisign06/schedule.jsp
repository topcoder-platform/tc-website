<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

<title>VeriSign Internal Coding Competition, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/verisign06.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev2" value="details"/>
    <jsp:param name="tabLev3" value="schedule"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- Body-->
    <tr valign="top">
        <td valign="top" align="center">
            <div class="bodySpacer">

                <span class="bigTitle">Schedule</span>
                <br/><br/>
                <table width="500" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
                    <tr>
                        <td class="sidebarTitle" width="25%"><b>Date</b></td>
                        <td class="sidebarTitle" width="40%" colspan="2"><b>Time</b></td>
                        <td class="sidebarTitle" width="35%"><b>Status</b></td>
                    </tr>
                    <tr valign="top">
                        <td class="sidebarText">&#160;</td>
                        <td class="sidebarText"><b>Register</b></td>
                        <td class="sidebarText"><b>Start</b></td>
                        <td class="sidebarText">&#160;</td>
                    </tr>
                    <tr valign="top">
                        <td class="sidebarText">SRM 1 <br/>April 25, 2006</td>
                        <td class="sidebarText">7:00 - 9:55 AM*</td>
                        <td class="sidebarText">10:00 AM*</td>
                        <td class="sidebarText">All participants</td>
                    </tr>
                    <tr valign="top">
                        <td class="sidebarText">SRM 2 <br/>May 17, 2006</td>
                        <td class="sidebarText">6:00 - 8:55 PM*</td>
                        <td class="sidebarText">9:00 PM*</td>
                        <td class="sidebarText">All participants</td>
                    </tr>
                    <tr>
                        <td class="sidebarText" colspan="4">&#160;</td>
                    </tr>
                    <tr valign="top">
                        <td class="sidebarText">Finals <br/>June 13, 2006</td>
                        <td class="sidebarText">&#160;</td>
                        <td class="sidebarText">TBD</td>
                        <td class="sidebarText">Championship Round <br/>5 participants</td>
                    </tr>
                    <tr valign="top">
                        <td class="sidebarText" colspan="4">*All times are Eastern Daylight Time. <br/>
                        NOTE: In the event that a round must be cancelled for any reason, the round will be held the following day at the same time.</td>
                    </tr>
                </table>
                <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                See the official <A href="/pl/?module=Static&d1=verisign06&d2=rules">rules and regulations</A> for more
                details.
            </div>
        </td>


        <!-- Right Column-->
        <td width="180" align="right" style="padding: 0px 15px 0px 0px;">
            <jsp:include page="right.jsp"/>

        </td>

    </tr>

</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
