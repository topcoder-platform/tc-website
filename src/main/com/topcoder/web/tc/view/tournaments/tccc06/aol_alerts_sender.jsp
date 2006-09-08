<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tccc06.AOLAlertsDescription" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tccc06.SendAOLAlert" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>


<html>
<head>
    <jsp:include page="/script.jsp"/>
    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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

                <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=SendAOLAlert.ALERT_TYPE%>">${err}
                    <br></tc-webtag:errorIterator></span>

                <form action="${sessionInfo.servletPath}" method="post" name="groupSendFrom">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SendAOLAlert"/>
                    <tc-webtag:hiddenInput name="<%=SendAOLAlert.ALERT_TYPE%>" value="<%=AOLAlertsDescription.AOL_GROUP_ALERT%>"/>

                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=SendAOLAlert.MESSAGE_TEXT+AOLAlertsDescription.AOL_GROUP_ALERT%>">${err}
                        <br></tc-webtag:errorIterator></span>

                    <p><span class="bigTitle">Group Alert</span></p>

                    <p>Message text:<br/>
                        <tc-webtag:textArea name="<%=SendAOLAlert.MESSAGE_TEXT+AOLAlertsDescription.AOL_GROUP_ALERT%>" rows="10" cols="80"/>
                    </p>
                    <button name="send" value="submit" type="submit">Send</button>

                </form>

                <br/><br/>

                <form action="${sessionInfo.servletPath}" method="post" name="indSendFrom">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SendAOLAlert"/>
                    <tc-webtag:hiddenInput name="<%=SendAOLAlert.ALERT_TYPE%>" value="<%=AOLAlertsDescription.AOL_INDIVIDUAL_ALERT%>"/>


                    <p><span class="bigTitle">Individual Alert</span></p>

                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>">${err}
                        <br></tc-webtag:errorIterator></span>

                    <p>
                        Handle: <tc-webtag:textInput name="<%=Constants.HANDLE%>"/>
                    </p>

                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=SendAOLAlert.QUERY%>">${err}
                        <br></tc-webtag:errorIterator></span>

                    <p>
                        Query: <tc-webtag:textInput name="<%=SendAOLAlert.QUERY%>"/>
                    </p>

                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=SendAOLAlert.MESSAGE_TEXT+AOLAlertsDescription.AOL_INDIVIDUAL_ALERT%>">${err}
                        <br></tc-webtag:errorIterator></span>

                    <p>
                        Message text:<br/>
                        <tc-webtag:textArea name="<%=SendAOLAlert.MESSAGE_TEXT+AOLAlertsDescription.AOL_INDIVIDUAL_ALERT%>" rows="10" cols="80"/>
                    </p>

                    <p>
                        <button name="send" value="submit" type="submit">Send</button>
                    </p>

                </form>


            </div>
        </td>


        <!-- Right Column-->
        <td>&#160;</td>

    </tr>

</table>


<jsp:include page="../../foot.jsp"/>
</body>

</html>
