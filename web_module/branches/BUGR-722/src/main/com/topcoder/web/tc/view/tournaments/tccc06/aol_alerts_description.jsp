<%@ page import="com.topcoder.web.tc.controller.request.tournament.tccc06.AOLHelper" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
    <style type="text/css">
        .indent {
            padding-left: 15px;
        }

        .example {
            padding-left: 15px;
        }
    </style>
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
                <br><br>
                For the duration of the 2006 TopCoder&#174; Collegiate Challenge, Sponsored by AOL&#174;, we will be
                offering
                TopCoder members the ability to sign up to receive tournament related messages using
                <a href="http://alerts.aol.com" target="_blank">AOL&#174; Alerts</a>.
                <br><br>
                AOL Alerts is a free AOL&#174; feature that keeps you informed of important events wherever you are.
                Alerts can
                notify you of breaking news, sports scores, stock quotes, TV listings, weather forecasts and more.
                Anybody with a valid AOL or AIM&#174; screen name can register to receive Alerts via their AOL service,
                AOL&#174; Instant Messenger&#153; (AIM), mobile phone or pager.
                <br><br>
                TopCoder and AOL are offering the following categories of messages:
                <br><br>
                <span class="bodySubtitle">Group alerts - You can sign up for any or all of the following:</span>
                <br><br>

                <div class="indent">
                    <b>TopCoder SRM reminder:</b><br/>
                    <span class="example">Example: SRM is on Sep 20 2006. Register between 18:00 &amp; 21:00 EDT (UTC/GMT -4).</span>
                    <br><br>
                    <b>TCCC reminder:</b><br/>
                    <span class="example">Example: TCCC Qual Rd. 1 is on Sep 12, 2006. Register between 18:00 &amp; 20:55 EDT (UTC/GMT -4).</span>
                    <%--
                        <br><br>
                            <b>TCCC announcement:</b><br/>
                             <span class="example">Example: TCCC Qual Rd. 1 is tomorrow. Watch the action to see who advances.</span>
                    --%>
                    <br><br>
                    <b>TopCoder Onsite finals:</b><br/>
                    <span class="example">Example: John Dethridge &amp; Petr have advanced to the Championship Round in the TCCC.</span>
                    <br><br>
                    <b>Component posting announcement:</b><br/>
                    <span class="example">Example: New component design &amp; development projects have been posted. Check them out now.</span>
                </div>
                <br><br>
                <span class="bodySubtitle">Individual alerts - You can sign up for these types of messages and will be sent those that apply to you:</span>
                <br><br>

                <div class="indent">
                    <b>TopCoder SRM score and place:</b><br/>
                    <span class="example">Example: Results for SRM 315 are final. You placed #16 with 1250.87 points. See results online.</span>
                    <br><br>
                    <b>TCCC round score and place:</b><br/>
                    <span class="example">Example: In TCCC Qual Round 1, you placed #213 with a score of 1000.00 and did not advance to Rd. 1.</span>
                    <br><br>
                    <b>Component score and place:</b><br/>
                    <span class="example">Example: On Configuration Manager you placed #2 with a score of 85.66.</span>
                </div>
                <br><br>
                In order to sign up for an alert, click the appropriate link below. If you are currently logged in to
                the AOL site, the alert you selected will be added to your AOL account. If you are not currently logged
                in
                to the AOL site, you will first be asked to login, and then the alert you selected will be added to
                your AOL account. You can see your AOL alerts information at
                <a href="http://alerts.aol.com">http://alerts.aol.com</a>
                <ul>
                    <li>
                        <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.subscriptionRegistry.getMappedAlertData(AOLHelper.SRM_REMINDER).getAlertId()%>&amp;GetUserId=true">TopCoder
                            SRM reminder</a></li>
                    <li>
                        <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.subscriptionRegistry.getMappedAlertData(AOLHelper.TCCC_REMINDER).getAlertId()%>&amp;GetUserId=true">TCCC
                            reminder</a></li>
                    <%--
                            <li>
                                <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.subscriptionRegistry.getMappedAlertData(AOLHelper.TCCC_ANNOUNCEMENT).getAlertId()%>&amp;GetUserId=true">TCCC
                                    announcement</a></li>
                    --%>
                    <li>
                        <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.subscriptionRegistry.getMappedAlertData(AOLHelper.TCCC_ONSITE_FINALS).getAlertId()%>&amp;GetUserId=true">TopCoder
                            Onsite finals</a></li>
                    <li>
                        <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.subscriptionRegistry.getMappedAlertData(AOLHelper.COMPONENT_POSTING).getAlertId()%>&amp;GetUserId=true">Component
                            posting announcement</a></li>
                    <li>
                        <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=<%=AOLHelper.subscriptionRegistry.getMappedAlertData(AOLHelper.INDIVIDUAL).getAlertId()%>&amp;GetUserId=true">Individual
                            Alerts</a></li>
                </ul>
                <br><br>
            </div>
        </td>


        <!-- Right Column-->
        <td>&#160;</td>

    </tr>

</table>


<jsp:include page="../../foot.jsp"/>
</body>

</html>
