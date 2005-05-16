<%@ page import="com.topcoder.web.corp.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Technical Assessment Application Management Tool</title>

<jsp:include page="../includes/script.jsp" />

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<script type="text/javascript" language="Javascript">
<!--
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    <% String url = sessionInfo.getServletPath() + "?" + Constants.MODULE_KEY + "=PopulateProblemDetail"; %>
    window.open('<%=url%>&<%=Constants.ROUND_PROBLEM_ID%>='+id,name,cmd);
    return;
  }

function submitReload() {
    document.profileSetupForm.<%=Constants.MODULE_KEY%>.value = "<%=Constants.POPULATE_PROFILE_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
}

function submitAdd() {
    document.profileSetupForm.<%=Constants.MODULE_KEY%>.value = "<%=Constants.PROFILE_ADD_PROBLEM_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
}

function submitRemove(id) {
    document.profileSetupForm.testSetBRemove.value = id;
    document.profileSetupForm.<%=Constants.MODULE_KEY%>.value = "<%=Constants.PROFILE_REMOVE_PROBLEM_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
}

function submitConfirm() {
    document.profileSetupForm.<%=Constants.MODULE_KEY%>.value = "<%=Constants.PROFILE_CONFIRM_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
}
// -->
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
                        <h1 class="testHead">Create a New Session - <font color="#000000">Set up a New Test Profile</font></h1>
                        <p>Each candidate is assigned to a Test Profile. Each Test Profile is assigned two sets of problems&#151;Test Set A, which is used to screen for
                        accuracy and speed, and Test Set B, which is used to screen for accuracy and style.</p>

                        <p>To set up a new Test Profile, follow these steps:</p>
                        <ol>
                            <li>Choose an appropriate name for the Test Profile.</li>
                            <li>Assign a Problem Set to Test Set A.  Once a Problem Set is selected, the Test Set A table will be automatically populated. Further information on each Problem Set can be found by clicking <strong>Problem Sets</strong> at the top
                            of the page.</li>
                            <li>Assign a Problem or Problems to Test Set B by choosing a Problem from the list and clicking <strong>Add to Test Set B</strong>.  Clicking on the Problem
                            Name once the table has been populated will open a window that displays statistical information about the Problem, as well as the
                            Problem Statement.</li>
                            <li>Choose the language(s) in which candidates will be able to code their solutions.</li>
                            <li>Click <strong>Confirm</strong> to ensure the correctness of the information.</li>
                        </ol>
                    </td>
                </tr>
            </table>

            <jsp:useBean id="profile" class="com.topcoder.web.corp.model.ProfileInfo" scope="request" />

            <screen:form name="profileSetupForm" method="GET" action="<%=sessionInfo.getServletPath()%>">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="" >
            <% if(!profile.isNew()) { %>
               <input type="hidden" name="profileId" value="<jsp:getProperty name="profile" property="profileId" />" >
            <% } %>

            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
                <tr><td class="testTableTitle" colspan="3">Test Profile</td></tr>

                <tr>
                    <td class="testTableSubtitleOdd">Name</td>
                    <td class="testTableOdd"><input type="text" name="profileName" value ="<jsp:getProperty name="profile" property="profileName" />" size="30" maxlength="100"></td>
                    <td class="errorTextOdd"><screen:errors id="err" name="profileName" ><%=err%></screen:errors></td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Problem Set</td>
                    <td class="testTableEven">
                        <select name="<%=Constants.TEST_SET_A%>" onChange="submitReload()">
                            <rsc:iterator id="row" list="<%=profile.getProblemSetList()%>"><%
                            if(profile.isSelectedTestSetA(row.getItem("round_id").toString())) {
                                %><option value="<rsc:item row="<%=row%>" name="round_id" />" SELECTED><rsc:item row="<%=row%>" name="name" /></option><%
                            } else {
                                %><option value="<rsc:item row="<%=row%>" name="round_id" />"><rsc:item row="<%=row%>" name="name" /></option><%
                            } %>
                            </rsc:iterator>
                            <option value="<%=Constants.NO_TEST_SET_A%>" <%=profile.isSelectedTestSetA(String.valueOf(Constants.NO_TEST_SET_A))?"SELECTED":""%> name="round_id">No Test Set A</option>
                        </select>
                    <td class="errorTextEven">&#160;</td>
                </tr>
            </table>

             <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr><td width="100%"><img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"></td></tr>
                </table>

            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
              <% if (profile.hasTestSetA()) { %>
                <tr><td class="testTableTitle" colspan="7">Test Set A</td></tr>

                <tr>
                    <td width="10" class="testFormHeader"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0" /></td>
                    <td width="20%" class="testFormHeader">Name</td>
                    <td width="20%" align="center" class="testFormHeader">Division</td>
                    <td width="20%" align="center" class="testFormHeader">Difficulty</td>
                    <td colspan="2" align="center" class="testFormHeader">Algorithmic Categories</td>
                     <td width="10" class="testFormHeader"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                 </tr>

                <screen:listIterator id="testA" list="<%=profile.getTestSetAList()%>">

                <tr>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td class="testTableOdd"><a href="JavaScript:getProblemDetail('<screen:beanWrite name="testA" property="roundId" />,<screen:beanWrite name="testA" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testA" property="problemName"/></a></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testA" property="divisionDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testA" property="difficultyDesc" /></td>
                    <td colspan="2" align="center" class="testTableOdd"><screen:beanWrite name="testA" property="algorithmicCategoryList" /></td>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>
                </screen:listIterator>

                <tr><td colspan="7"><img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"></td></tr>

              <% } %>
                <tr><td class="testTableTitle" colspan="7">Test Set B</td></tr>

                <tr>
                    <td width="10" class="testFormHeader"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td width="20%" class="testFormHeader">Name</td>
                    <td width="20%" align="center" class="testFormHeader">Division</td>
                    <td width="20%" align="center" class="testFormHeader">Difficulty</td>
                    <td width="40%" align="center" class="testFormHeader">Algorithmic Categories</td>
 <%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD> --%>
                    <td width="1%" align="center" class="testFormHeader">&#160;</td>
                    <td width="10" class="testFormHeader"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                 </tr>

                <input type="hidden" name="testSetBRemove" value="" >
                <screen:listIterator id="testB" list="<%=profile.getTestSetBList()%>">
                <input type="hidden" name="testSetB" value="<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>" >
                <tr>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td class="testTableOdd"><a href="JavaScript:getProblemDetail('<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testB" property="problemName"/></a></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="divisionDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="difficultyDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="algorithmicCategoryList" /></td>
 <%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testB" property="businessCategoryList" /></TD> --%>
                    <td align="center" class="testTableOdd"><a href="JavaScript:submitRemove('<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>')" CLASS="bodyText">Remove</a></td>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>
                </screen:listIterator>

                <tr>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td colspan="5" class="errorTextOdd"><screen:errors id="err" name="testSetB" ><%=err%></screen:errors></td>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>

                <tr><td colspan="7"><img src="/i/corp/clear.gif" width="1" height="20" alt="" border="0"></td></tr>

                <tr>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td colspan="5" align="center">
                        <select name="testSetBAdd" class="dropdown" size="10" multiple="true">
                            <rsc:iterator id="row" list="<%=profile.getCompanyProblemList()%>">
                            <option value="<rsc:item row="<%=row%>" name="round_id" />,<rsc:item row="<%=row%>" name="problem_id" />"><rsc:item row="<%=row%>" name="name" /></option>
                            </rsc:iterator>
                        </select>
                    </td>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>

                  <tr>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td colspan="5"><div align="center"><p class="button"><a href="JavaScript:submitAdd()" class="button">Add to Test Set B</a></p></div></td>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>

                <tr><td colspan="7"><img src="/i/corp/clear.gif" width="1" height="20" alt="" border="0"></td></tr>

                <tr>
                    <td class="testTableTitle" colspan="7">Available Languages</td>
                </tr>

                <rsc:iterator id="row" list="<%=profile.getLanguageList()%>">
                <tr>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td class="testTableOdd" colspan="5">
                        <% if(profile.hasLanguage(row.getItem("language_id").toString())) { %>
                        <input type="checkbox" name="language" value="<rsc:item row="<%=row%>" name="language_id" />" CHECKED>&#160;<rsc:item row="<%=row%>" name="language_name" />
                        <% } else { %>
                        <input type="checkbox" name="language" value="<rsc:item row="<%=row%>" name="language_id" />" >&#160;<rsc:item row="<%=row%>" name="language_name" />
                        <% } %>
                    </td>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>
                </rsc:iterator>

                <tr>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td colspan="5" class="errorTextOdd"><screen:errors id="err" name="language" ><%=err%></screen:errors></td>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="70%">
                 <tr>
                    <td><div align="center"><p class="button"><a href="JavaScript:submitConfirm()" class="button">Confirm</a></p></div></td>
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

  <jsp:include page="../../foot.jsp" />

</body>
</html>
