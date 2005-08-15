<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
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

function submitEdit() {
    document.profileConfirmForm.<%=Constants.MODULE_KEY%>.value = "<%=Constants.POPULATE_PROFILE_PROCESSOR%>";
    document.profileConfirmForm.submit();
    return;
}

function submitUpdate() {
    document.profileConfirmForm.<%=Constants.MODULE_KEY%>.value = "<%=Constants.UPDATE_PROFILE_PROCESSOR%>";
    document.profileConfirmForm.submit();
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
                        <h1 class="testHead">Create a New Session - <font color="#000000">New Test Profile Confirmation</font></h1>
                        <p>Review the information below for correctness.  If the information is correct, click <strong>Submit</strong>.  If changes need to be made,
                        click <strong>Edit</strong> to return to the previous page.</p>
                    </td>
                </tr>
            </table>

            <jsp:useBean id="profile" class="com.topcoder.web.corp.model.ProfileInfo" scope="request" />

             <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr><screen:form name="profileConfirmForm" method="GET" action="<%=sessionInfo.getServletPath()%>">
                    <INPUT TYPE="HIDDEN" NAME="<%=Constants.MODULE_KEY%>" VALUE="" >
                    <% if(!profile.isNew()) { %>
                        <INPUT TYPE="HIDDEN" NAME="profileId" VALUE="<jsp:getProperty name="profile" property="profileId" />" >
                    <% } %>
                    <td width="100%"><img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"></td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
                <tr><td class="testTableTitle" colspan="3">Test Profile</td></tr>

                <tr>
                    <td class="testTableSubtitleOdd"><strong>Name:</strong></td>
                    <INPUT TYPE="HIDDEN" name="profileName" value="<jsp:getProperty name="profile" property="profileName" />" >
                    <td class="testTableOdd"><jsp:getProperty name="profile" property="profileName" /></td>
                    <td class="errorTextOdd">&#160;</td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven"><strong>Problem Set:</strong></td>
                <% if (profile.hasTestSetA()) { %>
                <rsc:iterator id="row" list="<%=profile.getProblemSetList()%>"><%
                if(profile.isSelectedTestSetA(row.getItem("round_id").toString())) {
                    %><INPUT type="HIDDEN" name="testSetA" value="<rsc:item row="<%=row%>" name="round_id" />" >
                    <td class="testTableEven"><rsc:item row="<%=row%>" name="name" /></td><%
                } %>
                </rsc:iterator>
                <% } else { %>
                  <INPUT type="HIDDEN" name="testSetA" value="<%=Constants.NO_TEST_SET_A%>" >
                  <td class="testTableEven">No Test Set A</td>
                <% } %>
                    <td class="errorTextEven">&#160;</td>
                </tr>
            </table>

             <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr><td width="100%"><img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"></td></tr>
            </table>

            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
              <% if (profile.hasTestSetA()) {%>
                <tr><td class="testTableTitle" colspan="6">Test Set A</td></tr>

                <tr>
                    <td width="10" class="testFormHeader"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0" /></td>
                    <td width="20%" class="testFormHeader">Name</td>
                    <td width="20%" align="center" class="testFormHeader">Division</td>
                    <td width="20%" align="center" class="testFormHeader">Difficulty</td>
                    <td width="40%" align="center" class="testFormHeader">Algorithmic Categories</td>
 <%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD> --%>
                    <td width="10" class="testFormHeader"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                 </tr>

                <screen:listIterator id="testA" list="<%=profile.getTestSetAList()%>">
                <tr>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td class="testTableOdd"><a href="JavaScript:getProblemDetail('<screen:beanWrite name="testA" property="roundId" />,<screen:beanWrite name="testA" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testA" property="problemName"/></a></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testA" property="divisionDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testA" property="difficultyDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testA" property="algorithmicCategoryList" /></td>
 <%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testA" property="businessCategoryList" /></TD> --%>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>
                </screen:listIterator>

                <tr><td colspan="6"><img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"></td></tr>
              <% } %>
              <% if (!profile.getTestSetBList().isEmpty()) { %>
                <tr><td class="testTableTitle" colspan="6">Test Set B</td></tr>

                <tr>
                    <td width="10" class="testFormHeader"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td width="20%" class="testFormHeader">Name</td>
                    <td width="20%" align="center" class="testFormHeader">Division</td>
                    <td width="20%" align="center" class="testFormHeader">Difficulty</td>
                    <td width="40%" align="center" class="testFormHeader">Algorithmic Categories</td>
 <%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD> --%>
                    <td width="10" class="testFormHeader"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                 </tr>

                <screen:listIterator id="testB" list="<%=profile.getTestSetBList()%>">
                <input type="hidden" name="testSetB" value="<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>" >
                <tr>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td class="testTableOdd"><a href="JavaScript:getProblemDetail('<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testB" property="problemName"/></a></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="divisionDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="difficultyDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="algorithmicCategoryList" /></td>
 <%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testB" property="businessCategoryList" /></TD> --%>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>
                </screen:listIterator>

                <tr><td colspan="6"><img src="/i/corp/clear.gif" width="1" height="20" alt="" border="0"></td></tr>
                <% } %>

                <tr>
                    <td class="testTableTitle" colspan="6">Available Languages</td>
                </tr>

                <rsc:iterator id="row" list="<%=profile.getLanguageList()%>">
                <% if(profile.hasLanguage(row.getItem("language_id").toString())) { %>
                    <input type="HIDDEN" name="language" value="<rsc:item row="<%=row%>" name="language_id" />">
                <tr>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td class="testTableOdd" colspan="4"><rsc:item row="<%=row%>" name="language_name" /></td>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>
                <% } %>
                </rsc:iterator>

                <tr><td colspan="6"><img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"></td></tr>
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="70%">
                 <tr>
                    <td><div align="center"><p class="button"><a href="JavaScript:submitEdit()" class="button">Edit</a>&#160;&#160;<a href="JavaScript:submitUpdate()" class="button">Submit</a></p></div></td>
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
