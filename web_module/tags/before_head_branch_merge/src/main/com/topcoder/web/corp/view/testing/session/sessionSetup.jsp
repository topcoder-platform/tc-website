<%@ page import="com.topcoder.web.corp.common.Constants,
                 java.util.TimeZone" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Technical Assessment Application Management Tool</title>

<jsp:include page="../includes/script.jsp" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<script type="text/javascript" language="Javascript">
<!--
function showEmail() {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="previewEmail";
    var cid = document.sessionSetupForm.cid.options[document.sessionSetupForm.cid.selectedIndex].value;
    var cEmail = "NO";
    if(document.sessionSetupForm.candidateEmailInfo.checked) {
        cEmail = "YES";
    }
    var rEmail = "NO";
    if(document.sessionSetupForm.repEmail.checked) {
        rEmail = "YES";
    }
    <% String url = sessionInfo.getServletPath() + "?" + Constants.MODULE_KEY + "=PreviewEmail"; %>
    window.open('<%=url%>&<%=Constants.CANDIDATE_ID%>='+ cid + "&<%=Constants.REP_EMAIL%>=" + rEmail + "&<%=Constants.CANDIDATE_EMAIL%>=" + cEmail,name,cmd);
    return;
  }

function submitProfile() {
    document.sessionSetupForm.<%=Constants.MODULE_KEY%>.value="<%=Constants.CREATE_PROFILE_PROCESSOR%>";
    document.sessionSetupForm.submit();
}

function submitCandidate() {
    document.sessionSetupForm.<%=Constants.MODULE_KEY%>.value="<%=Constants.CREATE_CANDIDATE_PROCESSOR%>";
    document.sessionSetupForm.submit();
}

function submitSession() {
    document.sessionSetupForm.<%=Constants.MODULE_KEY%>.value="<%=Constants.CONFIRM_SESSION_PROCESSOR%>";
    document.sessionSetupForm.submit();
}
//-->
</script>

</head>

<body>

<!-- Header begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

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
                        <h1 class="testHead">Create a New Session</h1>
                        <p>Each candidate is assigned to a Test Profile. Each Test Profile is assigned two sets of problems&#151;Test Set A, which is used to screen for
                        accuracy and speed, and Test Set B, which is used to screen for accuracy and style.</p>

                        <p>Here you will create a session by selecting a Test Profile and assigning a candidate to it by following these steps:</p>
                        <ol>
                            <li>Select a Test Profile. If you wish to create a new Test Profile, click <strong>Create a New Test Profile</strong>.</li>
                            <li>Select a candidate to assign to the Test Profile.  If you wish to add a new candidate, click <strong>Add a Candidate</strong>.</li>
                            <li>Set the timeframe for when the candidate can access the Technical Assessment Application. Be sure to allow at least a 24-hour window during which the candidate can participate.</li>
                            <li>Candidates must receive an email in order to access the Technical Assessment Application. You can choose to receive emails reminding you when the candidate is scheduled to participate,
                            as well as when the results are ready.</li>
                        </ol>
                    </td>
                </tr>
            </table>

            <jsp:useBean id="testSessionInfo" type="com.topcoder.web.corp.model.TestSessionInfo" scope="session" />

            <screen:form name="sessionSetupForm" action="<%=sessionInfo.getServletPath()%>" method="GET">
            <input type="HIDDEN" name="<%=Constants.MODULE_KEY%>" value="" >

            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
                <tr><td class="testTableTitle" colspan="3">Test Profile</td></tr>
                <tr>
                    <td class="testTableOdd" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="testTableOdd">
                        <select name ="profileId">
                        <rsc:iterator id="row" list="<%=testSessionInfo.getProfileList()%>">
                        <% if(testSessionInfo.isSelectedProfile(row.getItem("session_profile_id").toString())) { %>
                            <option class="dropdown" value="<rsc:item row="<%=row%>" name="session_profile_id" />" SELECTED><rsc:item row="<%=row%>" name="name" /></option>
                        <% } else { %>
                            <option class="dropdown" value="<rsc:item row="<%=row%>" name="session_profile_id" />"><rsc:item row="<%=row%>" name="name" /></option>
                        <% } %>
                        </rsc:iterator>
                        </select>
                    </td>
                    <td class="testTableOdd">&#160;<a name="profile"></a><a href="JavaScript:submitProfile()">Create a New Test Profile</a></td>
                </tr>

                <tr>
                    <td><img src="/i/corp/clear.gif" width="1" height="1" alt="" border="0"></td>
                    <td colspan="2" class="errortextOdd"></td>
                </tr>

                <tr><td class="testTableTitle" colspan="3">Candidate</td></tr>

                <tr>
                    <td class="testTableOdd">&#160;</td>
                    <td class="testTableOdd">
                        <select name="cid">
                        <rsc:iterator id="row" list="<%=testSessionInfo.getCandidateList()%>">
                        <% if(testSessionInfo.isSelectedCandidate(row.getItem("candidate_id").toString())) { %>
                            <option class="dropdown" value="<rsc:item row="<%=row%>" name="candidate_id" />" SELECTED><rsc:item row="<%=row%>" name="handle" /></option>
                        <% } else { %>
                            <option class="dropdown" value="<rsc:item row="<%=row%>" name="candidate_id" />"><rsc:item row="<%=row%>" name="handle" /></option>
                        <% } %>
                        </rsc:iterator>
                        </select>
                    </td>
                    <% if( request.getAttribute(Constants.USAGE_TYPE) == null || ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_TESTING) { %>
                    <td class="testTableOdd">&#160;<a href="JavaScript:submitCandidate()">Add a Candidate</a></td>
                    <% } %>
                </tr>

                <tr>
                    <td><img src="/i/corp/clear.gif" width="1" height="1" alt="" border="0"></td>
                    <td colspan="2" class="errorTextOdd"></td>
                </tr>

                <tr>
                    <td class="testTableTitle" colspan="2">Begin Time</td>
                    <td class="testTableTimezone">All times are in <%=((TimeZone)request.getAttribute(Constants.TIMEZONE)).getDisplayName(true, TimeZone.LONG)%></td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">Month</td>
                    <td class="testTableOdd"><screen:month name="beginMonth" selected="<%=testSessionInfo.getBeginMonth()%>" /></td>
                    <td class="errorTextOdd"><screen:errors id="err" name="beginMonth" ><%=err%></screen:errors></TD>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Day</td>
                    <td class="testTableEven"><screen:day name="beginDay" selected="<%=testSessionInfo.getBeginDay()%>" /></td>
                    <td class="errorTextEven"><screen:errors id="err" name="beginDay" ><%=err%></screen:errors></td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">Year</td>
                    <td class="testTableOdd"><screen:year name="beginYear" selected="<%=testSessionInfo.getBeginYear()%>" /></td>
                    <td class="errorTextOdd"><screen:errors id="err" name="beginYear" ><%=err%></screen:errors></td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Hour</td>
                    <td class="testTableEven"><screen:hour name="beginHour" selected="<%=testSessionInfo.getBeginHour()%>" /></td>
                    <td class="errorTextEven"><screen:errors id="err" name="beginHour" ><%=err%></screen:errors></td>
                </tr>

                <tr>
                    <td><img src="/i/corp/clear.gif" width="1" height="1" alt="" border="0"></td>
                    <td colspan="2" class="errorTextOdd"></td>
                </tr>

                <tr>
                    <td class="testTableTitle" colspan="2">End Time</td>
                    <td class="testTableTimezone">All times are in <%=((TimeZone)request.getAttribute(Constants.TIMEZONE)).getDisplayName(true, TimeZone.LONG)%></td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">Month</td>
                    <td class="testTableOdd"><screen:month name="endMonth" selected="<%=testSessionInfo.getEndMonth()%>" /></td>
                    <td class="errorTextOdd"><screen:errors id="err" name="endMonth" ><%=err%></screen:errors></td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Day</td>
                    <td class="testTableEven"><screen:day name="endDay" selected="<%=testSessionInfo.getEndDay()%>" /></td>
                    <td class="errorTextEven"><screen:errors id="err" name="endDay" ><%=err%></screen:errors></td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">Year</td>
                    <td class="testTableOdd"><screen:year name="endYear" selected="<%=testSessionInfo.getEndYear()%>" /></td>
                    <td class="errorTextOdd"><screen:errors id="err" name="endYear" ><%=err%></screen:errors></td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Hour</td>
                    <td class="testTableEven"><screen:hour name="endHour" selected="<%=testSessionInfo.getEndHour()%>" /></td>
                    <td class="errorTextEven"><screen:errors id="err" name="endHour" ><%=err%></screen:errors></td>
                </tr>

                <tr>
                    <td><img src="/i/corp/clear.gif" width="1" height="1" alt="" border="0"></td>
                    <td colspan="2" class="errortextOdd"><screen:errors id="err" name="dateCompare" ><%=err%><br /></screen:errors></td>
                </tr>

                <tr>
                    <td class="testTableTitle" colspan="3">Email</td>
                </tr>

                <tr valign="middle">
                    <td class="testTableOdd" colspan="3">Invite candidate to Technical Assessment Application&#160;<screen:checkbox name="<%=Constants.CANDIDATE_EMAIL%>" value="YES" checked="<%=testSessionInfo.getCandidateEmail()%>" /><img src="/i/corp/clear.gif" width="1" height="20" alt="" border="0"></td>
                </tr>

                <tr valign="middle">
                    <td class="testTableEven" colspan="3">Send me email reminder&#160;<screen:checkbox name="<%=Constants.REP_EMAIL%>" value="YES" checked="<%=testSessionInfo.getRepEmail()%>" /><img src="/i/corp/clear.gif" width="1" height="20" alt="" border="0"></td>
                </tr>

                <tr valign="middle">
                    <td class="testTableOdd" colspan="3"><a href="JavaScript:showEmail()">Preview</a> the email template<img src="/i/corp/clear.gif" width="1" height="20" alt="" border="0"></td>
                </tr>
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="70%">
                 <tr>
                    <td><div align="center"><p class="button"><a href="JavaScript:submitSession()" class="button">Confirm</a></p></div></td>
                </tr>
            </table>
            </screen:form>
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
