<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>

<jsp:include page="/script.jsp" />
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
    if(document.sessionSetupForm.candidateEmail.checked) {
        cEmail = "YES";
    }
    var rEmail = "NO";
    if(document.sessionSetupForm.repEmail.checked) {
        rEmail = "YES";
    }
    <% String url = Constants.CONTROLLER_URL + "?" + Constants.REQUEST_PROCESSOR + "=PreviewEmail"; %>
    window.open('<screen:rewrite page="<%=url%>" />&<%=Constants.CANDIDATE_ID%>='+ cid + "&<%=Constants.REP_EMAIL%>=" + rEmail + "&<%=Constants.CANDIDATE_EMAIL%>=" + cEmail,name,cmd);
    return;
  }

function submitProfile() {
    document.sessionSetupForm.rp.value="<%=Constants.CREATE_PROFILE_PROCESSOR%>";
    document.sessionSetupForm.submit();
}

function submitCandidate() {
    document.sessionSetupForm.rp.value="<%=Constants.CREATE_CANDIDATE_PROCESSOR%>";
    document.sessionSetupForm.submit();
}

function submitSession() {
    document.sessionSetupForm.rp.value="<%=Constants.CONFIRM_SESSION_PROCESSOR%>";
    document.sessionSetupForm.submit();
}
//-->
</script>

</head>

<body>

<!-- Header begins -->
<jsp:include page="/includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- left column begins -->
        <td width="22" bgcolor="#000000">

        <jsp:include page="/includes/left.jsp" />

      </td>
<!-- left column ends -->

<!-- gutter begins -->
        <td width="10"><img src="/i/ev/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td class="bodyText" width="100%"><img src="/i/ev/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="60%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Create a New Session</h1>
                        <p>Here you will create a session by selecting a Test Profile and assigning a candidate to it by following these steps:</p>
                        <ol>
                            <li>Select a Test Profile. If you wish to create a new Test Profile, click "Create a New Test Profile".</li>
                            <li>Select a candidate to assign to the Test Profile.  If you wish to add a new candidate, click "Add a Candidate".</li>
                            <li>Set the timeframe for when the candidate can access the Testing Application. Be sure to allow at least a 3-hour window during which the candidate can participate.</li>
                        </ol>
                    </td>
                </tr>
            </table>

            <jsp:useBean id="sessionInfo" type="com.topcoder.web.screening.model.SessionInfo" scope="session" />
            <screen:form name="sessionSetupForm" action="<%=Constants.CONTROLLER_URL%>" method="GET">
            <input type="HIDDEN" name="rp" value="" >

            <table cellspacing="0" cellpadding="3" width="70%" align="left" class="testFrame">
                <tr><td class="testTableTitle" colspan="3">Test Profile</td></tr>
                <tr>
                    <td class="testTableOdd" width="60"><img src="/i/ev/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="testTableOdd">
                        <select name ="profileId">
                        <screen:resultSetRowIterator id="row" list="<%=sessionInfo.getProfileList()%>">
                        <% if(sessionInfo.isSelectedProfile(row.getItem("session_profile_id").toString())) { %>
                            <option class="dropdownvalue="<screen:resultSetItem row="<%=row%>" name="session_profile_id" />" SELECTED><screen:resultSetItem row="<%=row%>" name="name" /></option>
                        <% } else { %>
                            <option value="<screen:resultSetItem row="<%=row%>" name="session_profile_id" />"><screen:resultSetItem row="<%=row%>" name="name" /></option>
                        <% } %>
                        </screen:resultSetRowIterator>
                        </select>
                    </td>
                    <td class="testTableOdd">&#160;<a name="profile"></a><a href="JavaScript:submitProfile()">Create a New Test Profile</a></td>
                </tr>

                <tr>
                    <td><img src="/i/ev/clear.gif" width="1" height="1" alt="" border="0"></td>
                    <td colspan="2" class="errortextOdd"></td>
                </tr>

                <tr><td class="testTableTitle" colspan="3">Candidate</td></tr>
                <tr>
                    <td class="testTableOdd">&#160;</td>
                    <td class="testTableOdd">
                        <select name="cid">
                        <screen:resultSetRowIterator id="row" list="<%=sessionInfo.getCandidateList()%>">
                        <% if(sessionInfo.isSelectedCandidate(row.getItem("candidate_id").toString())) { %>
                            <option value="<screen:resultSetItem row="<%=row%>" name="candidate_id" />" SELECTED><screen:resultSetItem row="<%=row%>" name="handle" /></option>
                        <% } else { %>
                            <option value="<screen:resultSetItem row="<%=row%>" name="candidate_id" />"><screen:resultSetItem row="<%=row%>" name="handle" /></option>
                        <% } %>
                        </screen:resultSetRowIterator>
                        </select>
                    </td>
                    <td class="testTableOdd">&#160;<a name="profile"></a><a href="JavaScript:submitCandidate()">Add a Candidate</a></td>
                </tr>

                <tr>
                    <td><img src="/i/ev/clear.gif" width="1" height="1" alt="" border="0"></td>
                    <td colspan="2" class="errorTextOdd"></td>
                </tr>

                <tr>
                    <td class="testTableTitle" colspan="2">Begin Time</td>
                    <td class="testTableTimezone">All times are Eastern Time</td>
                </tr>
                    
                <tr>
                    <td class="testTableSubtitleOdd">Month</td>
                    <td class="testTableOdd"><screen:month name="beginMonth" selected="<%=sessionInfo.getBeginMonth()%>" /></td>
                    <td class="errorTextOdd"><screen:errors name="beginMonth" /></TD>
                </tr>
                
                <tr>
                    <td class="testTableSubtitleEven">Day</td>
                    <td class="testTableEven"><screen:day name="beginDay" selected="<%=sessionInfo.getBeginDay()%>" /></td>
                    <td class="errorTextEven"><screen:errors name="beginDay" /></td>
                </tr>
                
                <tr>
                    <td class="testTableSubtitleOdd">Year</td>
                    <td class="testTableOdd"><screen:year name="beginYear" selected="<%=sessionInfo.getBeginYear()%>" /></td>
                    <td class="errorTextOdd"><screen:errors name="beginYear" /></td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Hour</td>
                    <td class="testTableEven"><screen:hour name="beginHour" selected="<%=sessionInfo.getBeginHour()%>" /></td>
                    <td class="errorTextEven"><screen:errors name="beginHour" /></td>
                </tr>

                <tr>
                    <td><img src="/i/ev/clear.gif" width="1" height="1" alt="" border="0"></td>
                    <td colspan="2" class="errorTextOdd"></td>
                </tr>

                <tr>
                    <td class="testTableTitle" colspan="2">End Time</td>
                    <td class="testTableTimezone">All times are Eastern Time</td>
                </tr>
                    
                <tr>
                    <td class="testTableSubtitleOdd">Month</td>
                    <td class="testTableOdd"><screen:month name="endMonth" selected="<%=sessionInfo.getEndMonth()%>" /></td>
                    <td class="errorTextOdd"><screen:errors name="endMonth" /></td>
                </tr>
                
                <tr>
                    <td class="testTableSubtitleEven">Day</td>
                    <td class="testTableEven"><screen:day name="endDay" selected="<%=sessionInfo.getEndDay()%>" /></td>
                    <td class="errorTextEven"><screen:errors name="endDay" /></td>
                </tr>
                
                <tr>
                    <td class="testTableSubtitleOdd">Year</td>
                    <td class="testTableOdd"><screen:year name="endYear" selected="<%=sessionInfo.getEndYear()%>" /></td>
                    <td class="errorTextOdd"><screen:errors name="endYear" /></td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Hour</td>
                    <td class="testTableEven"><screen:hour name="endHour" selected="<%=sessionInfo.getEndHour()%>" /></td>
                    <td class="errorTextEven"><screen:errors name="endHour" /></td>
                </tr>

                <tr>
                    <td><img src="/i/ev/clear.gif" width="1" height="1" alt="" border="0"></td>
                    <td colspan="2" class="errortextOdd"><screen:errors name="dateCompare" /></td>
                </tr>

                <tr>
                    <td class="testTableTitle" colspan="3">Email</td>
                </tr>
                    
                <tr>
                    <td class="testTableOdd" colspan="3">Invite candidate to Testing Application&#160;<screen:checkbox name="candidateEmail" value="YES" checked="<%=sessionInfo.getCandidateEmail()%>" /></td>
                </tr>
                
                <tr>
                    <td class="testTableEven" colspan="3">Send me email reminder&#160;<screen:checkbox name="repEmail" value="YES" checked="<%=sessionInfo.getRepEmail()%>" /></td>
                </tr>
                
                <tr>
                    <td class="testTableOdd" colspan="3">To preview the email template <a href="JavaScript:showEmail()" CLASS="bodyText">click here</a></td>
                </tr>
                
                <tr>
                    <td class="testTableOdd" colspan="3"><img src="/i/ev/clear.gif" width="1" height="10" alt="" border="0"></td>
                </tr>
                
                 <tr>
                    <td class="testTableOdd" colspan="3"><div align="center"><a href="JavaScript:submitSession()" CLASS="bodyText" >Confirm</a></div></td>
                </tr>

                <tr>
                    <td class="testTableOdd" colspan="3"><img src="/i/ev/clear.gif" width="1" height="10" alt="" border="0"></td>
                </tr>
            </table>

           </screen:form>
 
             <table border="0" cellspacing="0" cellpadding="3" width="30%">
                <tr><td width="100%"><img src="/i/ev/clear.gif" width="1" height="1" alt="" border="0"></td></tr>
            </table>
 
            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/ev/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/includes/foot.jsp" />

</body>
</html>
