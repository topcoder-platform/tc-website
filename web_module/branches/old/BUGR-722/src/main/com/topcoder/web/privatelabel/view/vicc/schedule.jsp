<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>VeriSign Code Fest, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/vicc.css"/>
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
                <br /><br />
<table width="500" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
    <tr>
        <td class="sidebarTitle" width="25%"><strong>Date</strong></td>
        <td class="sidebarTitle" width="40%" colspan="2"><strong>Time*</strong></td>
        <td class="sidebarTitle" width="35%"><strong>Status</strong></td>
    </tr>
    <tr valign="top">
        <td class="sidebarText">&#160;</td>
        <td class="sidebarText"><strong>Register</strong></td>
        <td class="sidebarText"><strong>Start</strong></td>
        <td class="sidebarText">&#160;</td>
    </tr>
    <tr valign="top">
        <td class="sidebarText"><strong>SRM 1</strong><br />March 4, 2008</td>
        <td class="sidebarText">6:00 PM - 8:55 PM</td>
        <td class="sidebarText">9:00 PM</td>
        <td class="sidebarText">All participants</td>
    </tr>
    <tr valign="top">
        <td class="sidebarText"><strong>SRM 2</strong><br />April 17, 2008</td>
        <td class="sidebarText">7:00 AM - 9:55 AM</td>
        <td class="sidebarText">10:00 AM</td>
        <td class="sidebarText">All participants</td>
    </tr>
    <%--
    <tr valign="top">
        <td class="sidebarText"><strong>TopCoder Sponsor Track</strong><br />April 3 - April 14, 2007</td>
        <td class="sidebarText">TBD</td>
        <td class="sidebarText">TBD</td>
        <td class="sidebarText">All participants</td>
    </tr>
    --%>
    <tr valign="top">
        <td class="sidebarText"><strong>SRM 3</strong><br />June 3, 2008</td>
        <td class="sidebarText">6:00 PM - 8:55 PM</td>
        <td class="sidebarText">9:00 PM</td>
        <td class="sidebarText">All participants</td>
    </tr>
    <tr>
        <td class="sidebarText" colspan="4">&#160;</td>
    </tr>
    <tr valign="top">
        <td class="sidebarText"><strong>VTS Finals</strong><br />August 12, 2008</td>
        <td class="sidebarText">&#160;</td>
        <td class="sidebarText">TBD</td>
        <td class="sidebarText">Championship Round<br />4 participants</td>
    </tr>
    <tr valign="top">
        <td class="sidebarText" colspan="4">*All times are in Eastern Time.<br />NOTE: In the event that a round must be cancelled for any reason, 
        the round will be held<br />the following day at the same time. 
        </td>
    </tr>
</table>
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                See the official <a href="/pl/?module=Static&amp;d1=vicc&amp;d2=rules">rules and regulations</a> for more
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
