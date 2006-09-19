<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tccc06.AOLHelper" %>

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

                <form action="${sessionInfo.servletPath}" method="post" name="groupSendFrom">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SendAOLAlert"/>
                    <select name="<%=AOLHelper.AOL_ALERT_ID%>">
                        <option value="<%=AOLHelper.registry.getMappedAlertData(AOLHelper.INDIVIDUAL).getAlertId()%>"><%=AOLHelper.INDIVIDUAL%></option>
                        <option value="<%=AOLHelper.registry.getMappedAlertData(AOLHelper.TCCC_ANNOUNCEMENT).getAlertId()%>"><%=AOLHelper.TCCC_ANNOUNCEMENT%></option>
                        <option value="<%=AOLHelper.registry.getMappedAlertData(AOLHelper.TCCC_ONSITE_FINALS).getAlertId()%>"><%=AOLHelper.TCCC_ONSITE_FINALS%></option>
                        <option value="<%=AOLHelper.registry.getMappedAlertData(AOLHelper.TCCC_REMINDER).getAlertId()%>"><%=AOLHelper.TCCC_REMINDER%></option>
                        <option value="<%=AOLHelper.registry.getMappedAlertData(AOLHelper.COMPONENT_POSTING).getAlertId()%>"><%=AOLHelper.COMPONENT_POSTING%></option>
                        <option value="<%=AOLHelper.registry.getMappedAlertData(AOLHelper.SRM_REMINDER).getAlertId()%>"><%=AOLHelper.SRM_REMINDER%></option>
                    </select>

                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=AOLHelper.MESSAGE_TEXT%>">${err}
                        <br></tc-webtag:errorIterator></span>

                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>">${err}
                        <br></tc-webtag:errorIterator></span>

                    <p>
                        Handle: <tc-webtag:textInput name="<%=Constants.HANDLE%>"/>
                    </p>
                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=AOLHelper.QUERY%>">${err}
                        <br></tc-webtag:errorIterator></span>

                    <p>
                        Query: (The query should return a list of informixoltp:aol_alert_info.aol_encrypted_user_id)
                        <br/><tc-webtag:textArea name="<%=AOLHelper.QUERY%>" rows="10" cols="50"/>
                    </p>

                    <p>Message text:<br/>
                        <tc-webtag:textArea name="<%=AOLHelper.MESSAGE_TEXT%>" rows="10" cols="80"/>
                    </p>
                    <button name="send" value="submit" type="submit">Send</button>

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
