<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.controller.request.Registration,
                 com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Registration</title>

<jsp:include page="../includes/css.jsp" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top_generic.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left_generic.jsp" />
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%"><img src="/i/corp/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="bodyText" width="100%" colspan="2">

                        <h3><font color="#666666"><strong>Registration Successful</strong></font></h3>

                        <p>Your TopCoder Registration has been confirmed. You now have access to:<br></p>
                    </td>
                </tr>
            </table>

            <div align="center">

            <table width="500" border="0" cellpadding="0" cellspacing="10">
                <tr valign=middle>
                    <td class="bodyText" width="200"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/pages/s_subscriptions.jsp" class="bodyText"><img src="/i/corp/icon_software.gif" alt="TopCoder Software" width="200" height="75" border="0"></a></td>
                    <td class="bodyText">Purchase a <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/pages/s_subscriptions.jsp" class="bodyText">Subscription</a> to download software from our Component
                    Catalog</td>
                </tr>

                <tr valign=middle>
                     <td class="bodyText" width="200"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/pages/c_active_collab.jsp" class="bodyText"><img src="/i/corp/icon_forums.gif" alt="TopCoder Software Forums" width="200" height="75" border="0"></a></td>
                   <td class="bodyText">Post messages to the TopCoder Software <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/pages/c_active_collab.jsp" class="bodyText">Forums</a></td>
                </tr>

                <tr valign=middle>
                    <td class="bodyText" width="200"><a href="<jsp:getProperty name="sessionInfo" property="servletPath" />" class="bodyText"><img src="/i/corp/icon_corp_serv.gif" alt="Corporate Services" width="200" height="75" border="0"></a></td>
                    <td class="bodyText">Take advantage of our <a href="<jsp:getProperty name="sessionInfo" property="servletPath" />?module=Static&d1=corp&d2=testing&d3=index" class="bodyText">Testing</a> and <a href="<jsp:getProperty name="sessionInfo" property="servletPath" />?module=Static&d1=corp&d2=recruiting&d3=index" class="bodyText">Recruiting</a> programs</td>
                </tr>

                <tr valign=middle>
                    <td class="bodyText" colspan="2"><br>We value your membership. If you have questions about our Coding Competions or
                    our products and services, contact us by <a href="mailto:sales@topcoder.com" class="bodyText">email</a> or call us toll free
                    at 866.867.2633.</td>
                </tr>
           </table>

           </div>

            <p><br></p>

        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

