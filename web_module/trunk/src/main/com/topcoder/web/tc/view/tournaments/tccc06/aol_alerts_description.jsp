<%@ page import="com.topcoder.web.tc.controller.request.tournament.tccc06.AOLHelper" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="sponsors"/>
    <jsp:param name="tabLev3" value="aol"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
<tr valign="top">
    <td valign="top" align="center">
        <div class="bodySpacer">

            <div align="center"><img src="/i/tournament/tccc06/aol_logo.gif" alt="AOL" border="0"/></div>

            <p>For the duration of the 2006 TopCoder&#174; Collegiate Challenge, Sponsored by AOL&#174;, we will be
                offering
                TopCoder members the ability to sign up for SMS (text messages), AIM and email messages from
                TopCoder
                about tournament, SRM and component related items. The following types of messages are
                available:</p>

            <p>

                <p>
                    <span class="bodySubtitle">Group alerts – You can sign up for any or all of the following:</span>
                </p>

                <p>
                    TopCoder SRM reminder: <br/>
                    Example: SRM 318 starts at 9:00 PM EDT (UTC/GMT -4) on Tuesday, Sept. 20.  Register between 6:00
                    PM & 8:55 PM EDT.  $5,000 prize purse.
                </p>

                <p>
                    TCCC reminder: <br/>
                    Example: TCCC Qual Rd. 1 starts at 9:00 PM EDT (UTC/GMT -4) on Tuesday, Sept. 12.  Register
                    between 6:00 PM & 8:55 PM EDT.
                </p>

                <p>
                    TCCC announcement: <br/>
                    Example: TCCC Qual Rd. 1 starts at 9:00 PM EDT (UTC/GMT -4) on Tuesday, Sept. 12.  Watch the
                    action to see who advances to Round 1.
                </p>

                <p>
                    TopCoder Onsite finals:<br/>
                    Example: John Dethridge and Petr have advanced from Room 1 of the TCCC finals to the
                    Championship Round.  Room 2 starts at 1:00 PM PST (UTC/GMT -4).
                </p>

                <p>
                    Component posting announcement:<br/>
                    Example: 5 new component design projects and 4 new component development projects have been
                    posted.  Check them out now.
                </p>

                <p>
                    <span class="bodySubtitle">Individual alerts – You can sign up for these types of messages and will be sent those that apply to you:</span>

                </p>

                <p>
                    TopCoder SRM score and place:<br/>
                    Example: Results for SRM 315 are in.  You placed #16 in your room with 1250.87 points. Check out
                    the results online now.
                </p>

                <p>TCCC round score and place:<br/>
                    Example: Results for Qual Round 1 of the TCCC are in.  You placed #213 with a score of 1000.00
                    and unfortunately did not advance to the next round.</p>

                <p>
                    Component score and place:<br/>
                    Example: Results for the Java Super Awesome component are in.  You placed #2 with a score of
                    85.66 and won $400.  Check out the results now.
                </p>


                <p>
                    In order to sign up an alert, click the appropriate link below. If you are currently logged in to
                    the AOL
                    site, the alert you selected will be added to your AOL account. If you are not currently logged in
                    to the AOL site, you will first be asked to login, and then the alert you selected will be added to
                    your AOL account. You can see your alert information at <a href="http://alerts.aol.com">http://alerts.aol.com</a>
                </p>


                <ul>
                    <li>
                        <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.registry.getMappedAlertData(AOLHelper.SRM_REMINDER).getAlertId()%>&GetUserId=true">TopCoder
                            SRM reminder</a></li>
                    <li>
                        <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.registry.getMappedAlertData(AOLHelper.TCCC_REMINDER).getAlertId()%>&GetUserId=true">TCCC
                            reminder</a></li>
                    <li>
                        <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.registry.getMappedAlertData(AOLHelper.TCCC_ANNOUNCEMENT).getAlertId()%>&GetUserId=true">TCCC
                            announcement</a></li>
                    <li>
                        <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.registry.getMappedAlertData(AOLHelper.TCCC_ONSITE_FINALS).getAlertId()%>&GetUserId=true">TopCoder
                            Onsite finals</a></li>
                    <li>
                        <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.registry.getMappedAlertData(AOLHelper.COMPONENT_POSTING).getAlertId()%>&GetUserId=true">Component
                            posting announcement</a></li>
                    <li>
                        <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.registry.getMappedAlertData(AOLHelper.INDIVIDUAL).getAlertId()%>&GetUserId=true">Individual
                            Alerts</a></li>
                </ul>
            </p>


        </div>
    </td>


    <!-- Right Column-->
    <td>&#160;</td>

</tr>

</table>


<jsp:include page="../../foot.jsp"/>
</body>

</html>
