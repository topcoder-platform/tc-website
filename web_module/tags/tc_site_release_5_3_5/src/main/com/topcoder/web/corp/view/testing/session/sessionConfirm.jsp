<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ page import="com.topcoder.web.corp.common.Constants,
                 java.util.TimeZone" %>
<html>
<head>
<title>Topcoder | Technical Assessment Application Management Tool</title>

<jsp:include page="../includes/script.jsp" />

<script type="text/javascript" language="Javascript">
<!--
function submitEdit() {
document.sessionConfirmForm.<%=Constants.MODULE_KEY%>.value = "<%=Constants.POPULATE_SESSION_PROCESSOR%>";
document.sessionConfirmForm.submit();
}

function submitUpdate() {
document.sessionConfirmForm.<%=Constants.MODULE_KEY%>.value = "<%=Constants.UPDATE_SESSION_PROCESSOR%>";
document.sessionConfirmForm.submit();
}
// -->
</script>

</head>

<body>

<!-- Header begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/corp/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Create a New Session - <font color="#000000">Session Confirmation</font></h1>
                        <p>Review the information below for correctness.  If the information is correct, click <strong>Submit</strong>.  If changes
                        need to be made, click <strong>Edit</strong> to return to the previous page.  Click <strong>Cancel</strong> if you do not wish
                        to set up this session.</p><br>
                    </td>
                </tr>
            </table>

            <jsp:useBean id="testSessionInfo" type="com.topcoder.web.corp.model.TestSessionInfo" scope="session" />

            <screen:form name="sessionConfirmForm" action="<%=sessionInfo.getServletPath()%>" method="GET">
            <input type="HIDDEN" name="<%=Constants.MODULE_KEY%>" value="" >

            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
                <tr><td class="testTableTitle" colspan="3">Session</td></tr>

                <tr>
                    <td class="testTableSubtitleOdd">Candidate:</td>
                        <rsc:iterator id="row" list="<%=testSessionInfo.getCandidateList()%>">
                        <% if(testSessionInfo.isSelectedCandidate(row.getItem("candidate_id").toString())) { %>
                        <input type="HIDDEN" name="cid" value="<rsc:item row="<%=row%>" name="candidate_id" />" >
                    <td class="testTableOdd"><rsc:item row="<%=row%>" name="handle" /></td>
                        <% } %>
                        </rsc:iterator>
                    <td class="errorTextOdd">&#160;</td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Profile:</td>
                        <rsc:iterator id="row" list="<%=testSessionInfo.getProfileList()%>">
                        <% if(testSessionInfo.isSelectedProfile(row.getItem("session_profile_id").toString())) { %>
                        <input type="HIDDEN" name="profileId" value="<rsc:item row="<%=row%>" name="session_profile_id" />" >
                    <td class="testTableEven"><rsc:item row="<%=row%>" name="name" /></td>
                        <% } %>
                        </rsc:iterator>
                    <td class="errorTextEven">&#160;</td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">Begin:</td>
                        <input type="HIDDEN" name="beginMonth" value="<jsp:getProperty name="testSessionInfo" property="beginMonth" />" >
                        <input type="HIDDEN" name="beginDay" value="<jsp:getProperty name="testSessionInfo" property="beginDay" />" >
                        <input type="HIDDEN" name="beginYear" value="<jsp:getProperty name="testSessionInfo" property="beginYear" />" >
                        <input type="HIDDEN" name="beginHour" value="<jsp:getProperty name="testSessionInfo" property="beginHour" />" >
                    <td class="testTableOdd"><screen:beanWrite name="testSessionInfo" property="beginDate" format="MM/dd/yyyy hh:mm a z" timeZone="<%=testSessionInfo.getTimeZone()%>" /></td>
                    <td class="errorTextOdd">&#160;</td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">End:</td>
                        <input type="HIDDEN" name="endMonth" value="<jsp:getProperty name="testSessionInfo" property="endMonth" />" >
                        <input type="HIDDEN" name="endDay" value="<jsp:getProperty name="testSessionInfo" property="endDay" />" >
                        <input type="HIDDEN" name="endYear" value="<jsp:getProperty name="testSessionInfo" property="endYear" />" >
                        <input type="HIDDEN" name="endHour" value="<jsp:getProperty name="testSessionInfo" property="endHour" />" >
                    <td class="testTableEven"><screen:beanWrite name="testSessionInfo" property="endDate" format="MM/dd/yyyy hh:mm a z" timeZone="<%=testSessionInfo.getTimeZone()%>"/></td>
                    <td class="errorTextEven">&#160;</td>
                </tr>

                <tr>
                    <td colspan="3" width="100%" align="center">
                        <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <input type="HIDDEN" name="candidateEmailInfo" value="<jsp:getProperty name="testSessionInfo" property="candidateEmail" />" >
                                <td colspan="3" class="testTableOdd">Invite candidate to Technical Assessment Application:&#160;<strong><jsp:getProperty name="testSessionInfo" property="candidateEmail" /></strong></td>
                            </tr>

                            <tr>
                                <input type="HIDDEN" name="repEmail" value="<jsp:getProperty name="testSessionInfo" property="repEmail" />" >
                                <td colspan="3" class="testTableOdd">Send me email reminder:&#160;<strong><jsp:getProperty name="testSessionInfo" property="repEmail" /></strong></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="70%">
                 <tr>
                    <td><div align="center"><p class="button"><screen:servletLink processor="CancelSession" styleClass="button">Cancel</screen:servletLink>&#160;&#160;<a href="JavaScript:submitEdit()" CLASS="button">Edit</a>&#160;&#160;<a href="JavaScript:submitUpdate()" CLASS="button">Submit</a></p></div></td>
                </screen:form></tr>
            </table>
            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/foot.jsp" />

</body>
</html>
