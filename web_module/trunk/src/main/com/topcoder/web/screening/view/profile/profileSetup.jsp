<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="/script.jsp" />

<script type="text/javascript" language="Javascript">
<!--
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    <% String url = Constants.CONTROLLER_URL + "?" + Constants.REQUEST_PROCESSOR + "=PopulateProblemDetail"; %>
    window.open('<screen:rewrite page="<%=url%>" />&<%=Constants.ROUND_PROBLEM_ID%>='+id,name,cmd);
    return;
  }

function submitReload() {
    document.profileSetupForm.rp.value = "<%=Constants.POPULATE_PROFILE_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
}

function submitAdd() {
    document.profileSetupForm.rp.value = "<%=Constants.PROFILE_ADD_PROBLEM_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
}

function submitRemove(id) {
    document.profileSetupForm.testSetBRemove.value = id;
    document.profileSetupForm.rp.value = "<%=Constants.PROFILE_REMOVE_PROBLEM_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
}

function submitConfirm() {
    document.profileSetupForm.rp.value = "<%=Constants.PROFILE_CONFIRM_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
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
                        <h1 class="testHead">Create a New Session - <font color="#000000">Set up a New Test Profile</font></h1>
                        <p>To set up a new Test Profile, follow these steps:</p>
                        <ol>
                            <li>Choose an appropriate name for the Test Profile.</li>
                            <li>Assign a Problem Set to Test Set A.  Further information on each Problem Set can be found by clicking <strong>Problem Sets</strong> at the top
                            of the page.  Once a Problem Set is selected, the Test Set A table will be automatically populated.</li>
                            <li>Assign a Problem or Problems to Test Set B by choosing a Problem from the list and clicking <strong>Add</strong>.  Clicking on the Problem
                            Name once the table has been populated will open a window that displays statistical information about the Problem, as well as the
                            Problem Statement.</li>
                            <li>Choose the language(s) in which candidates will be able to code their solutions.</li>
                            <li>Click <strong>Confirm</strong> to ensure the correctness of the information.</li>
                        </ol>
                    </td>
                </tr>
            </table>
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
