<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="/script.jsp" />

<script type="text/javascript" language="Javascript">
<!--
function submitEdit() {
document.sessionConfirmForm.rp.value = "<%=Constants.POPULATE_SESSION_PROCESSOR%>";
document.sessionConfirmForm.submit();
}

function submitUpdate() {
document.sessionConfirmForm.rp.value = "<%=Constants.UPDATE_SESSION_PROCESSOR%>";
document.sessionConfirmForm.submit();
}
// -->
</script>

</head>

<body>

<!-- Header begins -->
<jsp:include page="/includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
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

            <jsp:useBean id="sessionInfo" type="com.topcoder.web.screening.model.SessionInfo" scope="session" />
                        
            <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr><screen:form name="sessionConfirmForm" action="<%=Constants.CONTROLLER_URL%>" method="GET">
                        <input type="HIDDEN" name="rp" value="" >
                    <td width="100%"><img src="/i/clear.gif" width="1" height="10" alt="" border="0"></td>
                </tr>
            </table>
                        
            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
                <tr><td class="testTableTitle" colspan="3">Session</td></tr>

                <tr>
                    <td class="testTableSubtitleOdd">Candidate:</td>
                        <screen:resultSetRowIterator id="row" list="<%=sessionInfo.getCandidateList()%>">
                        <% if(sessionInfo.isSelectedCandidate(row.getItem("candidate_id").toString())) { %>
                        <input type="HIDDEN" name="cid" value="<screen:resultSetItem row="<%=row%>" name="candidate_id" />" >
                    <td class="testTableOdd"><screen:resultSetItem row="<%=row%>" name="handle" /></td>
                        <% } %>
                        </screen:resultSetRowIterator>
                    <td class="errorTextOdd">&#160;</td>
                </tr>
                
                <tr>
                    <td class="testTableSubtitleEven">Candidate:</td>
                        <screen:resultSetRowIterator id="row" list="<%=sessionInfo.getProfileList()%>">
                        <% if(sessionInfo.isSelectedProfile(row.getItem("session_profile_id").toString())) { %>
                        <input type="HIDDEN" name="profileId" value="<screen:resultSetItem row="<%=row%>" name="session_profile_id" />" >
                    <td class="testTableEven"><screen:resultSetItem row="<%=row%>" name="name" /></td>
                        <% } %>
                        </screen:resultSetRowIterator>
                    <td class="errorTextEven">&#160;</td>
                </tr>
                
                <tr>
                    <td class="testTableSubtitleOdd">Begin:</td>
                        <input type="HIDDEN" name="beginMonth" value="<jsp:getProperty name="sessionInfo" property="beginMonth" />" >
                        <input type="HIDDEN" name="beginDay" value="<jsp:getProperty name="sessionInfo" property="beginDay" />" >
                        <input type="HIDDEN" name="beginYear" value="<jsp:getProperty name="sessionInfo" property="beginYear" />" >
                        <input type="HIDDEN" name="beginHour" value="<jsp:getProperty name="sessionInfo" property="beginHour" />" >
                    <td class="testTableOdd"><screen:beanWrite name="sessionInfo" property="beginDate" format="MM/dd/yyyy hh:mm aa" /></td>
                    <td class="errorTextOdd">&#160;</td>
                </tr>
           
                <tr>
                    <td class="testTableSubtitleEven">End:</td>
                        <input type="HIDDEN" name="endMonth" value="<jsp:getProperty name="sessionInfo" property="endMonth" />" >
                        <input type="HIDDEN" name="endDay" value="<jsp:getProperty name="sessionInfo" property="endDay" />" >
                        <input type="HIDDEN" name="endYear" value="<jsp:getProperty name="sessionInfo" property="endYear" />" >
                        <input type="HIDDEN" name="endHour" value="<jsp:getProperty name="sessionInfo" property="endHour" />" >
                    <td class="testTableEven"><screen:beanWrite name="sessionInfo" property="endDate" format="MM/dd/yyyy hh:mm aa" /></td>
                    <td class="errorTextEven">&#160;</td>
                </tr>  

                <tr>
                    <input type="HIDDEN" name="candidateEmail" value="<jsp:getProperty name="sessionInfo" property="candidateEmail" />" >
                    <td colspan="3" class="testTableOdd">Invite candidate to Testing Application:&#160;<strong><jsp:getProperty name="sessionInfo" property="candidateEmail" /></strong></td>
                </tr>
                
                <tr>
                    <input type="HIDDEN" name="repEmail" value="<jsp:getProperty name="sessionInfo" property="repEmail" />" >
                    <td colspan="3" class="testTableOdd">Send me email reminder:&#160;<strong><jsp:getProperty name="sessionInfo" property="repEmail" /></strong></td>
                </tr>

                <tr><td colspan="3"><img src="/i/clear.gif" width="1" height="10" alt="" border="0"></td></tr>
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="70%">
                 <tr>
                    <td><div align="center"><p class="button"><screen:servletLink processor="CancelSession" styleClass="button">Cancel</screen:servletLink>&#160;&#160;<a href="JavaScript:submitEdit()" CLASS="bodyText">Edit</a>&#160;&#160;<a href="JavaScript:submitUpdate()" CLASS="bodyText">Submit</a></p></div></td>
                </screen:form></tr>
            </table>
            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/includes/foot.jsp" />

</body>
</html>
