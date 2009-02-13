<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tccc06.AOLAlertsDescription" %>
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

                <p>
                    Click
                    <% if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) { %>
                    <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=7ba63042-e8f0-4adb-815a-f755fc768de9&GetUserId=true&PartnerContext=<%=AOLAlertsDescription.AOL_GROUP_ALERT%>">here</a>
                    <% } else { %>
                    <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=7ba606d0-e8f0-4adb-815a-f755fc768de9&GetUserId=true&PartnerContext=<%=AOLAlertsDescription.AOL_GROUP_ALERT%>">here</a>
                    <% } %>
                    to sign up for group alerts.

                    Click
                    <% if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) { %>
                    <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=268e2e1d-6d09-4c8e-a78c-f755fc768de9&GetUserId=true&PartnerContext=<%=AOLAlertsDescription.AOL_INDIVIDUAL_ALERT%>">here</a>
                    <% } else { %>
                    <a href="http://alerts.aol.com/ar/partner/PartnerSecurityToken.ev?AlertId=9244f24a-3c7c-40a9-abb2-f755fc768de9&GetUserId=true&PartnerContext=<%=AOLAlertsDescription.AOL_INDIVIDUAL_ALERT%>">here</a>
                    <% } %>
                    to sign up for individual alerts.
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
