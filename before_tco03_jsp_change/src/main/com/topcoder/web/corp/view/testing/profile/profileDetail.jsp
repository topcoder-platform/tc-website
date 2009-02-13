<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp" />

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<SCRIPT TYPE="text/javascript">
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
</SCRIPT>
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
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Test Profile Details</h1>
                    </td>
                </tr>
            </table>

            <jsp:useBean id="profile" class="com.topcoder.web.corp.model.ProfileInfo" scope="request" />

            <table cellspacing="0" cellpadding="3" width="70%" border="0">
                <tr><td class="bodyText"><strong>Test Profile: </strong><jsp:getProperty name="profile" property="profileName" /></td></tr>

                <tr>
                  <td class="bodyText"><strong>Available Languages: </strong>
                    <screen:resultSetRowIterator id="row" list="<%=profile.getLanguageList()%>">
                    <% if(profile.hasLanguage(row.getItem("language_id").toString())) { %>
                      <screen:resultSetItem row="<%=row%>" name="language_name" />&#160;
                    <% } %>
                    </screen:resultSetRowIterator>
                  </td>
                </tr>
                <tr>
                   <td class="bodyText"><strong>Candiates Assigned: </strong><% if (profile.getSessionList().isEmpty()) { %>0<% } else { %><screen:resultSetItem row="<%=profile.getSessionList().getRow(0)%>" name="num_sessions" /> <% }%></td>
                </tr>
                <tr>
                   <td class="bodyText"><strong>Candiates Completed: </strong><% if (profile.getSessionList().isEmpty()) { %>0<% } else { %><screen:resultSetItem row="<%=profile.getSessionList().getRow(0)%>" name="num_complete" /> <% } %></td>
                </tr>
            </table>

             <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr><td width="100%"><img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"></td></tr>
            </table>

            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
              <% if (profile.hasTestSetA()) { %>
                <tr><td class="testTableTitle" colspan="6">Test Set A</td></tr>
                <tr>
                    <td width="10" class="testFormHeader"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0" /></td>
                    <td width="20%" class="testFormHeader">Name</td>
                    <td width="20%" align="center" class="testFormHeader">Division</td>
                    <td width="20%" align="center" class="testFormHeader">Difficulty</td>
                    <td width="40%" align="center" class="testFormHeader">Algorithmic Categories</td>
                    <td width="10" class="testFormHeader"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                 </tr>

                <screen:listIterator id="testA" list="<%=profile.getTestSetAList()%>">
                <tr>
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td class="testTableOdd"><a href="JavaScript:getProblemDetail('<screen:beanWrite name="testA" property="roundId" />,<screen:beanWrite name="testA" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testA" property="problemName"/></a></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testA" property="divisionDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testA" property="difficultyDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testA" property="algorithmicCategoryList" /></td>
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
                        <td width="10" class="testFormHeader"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                     </tr>

                    <screen:listIterator id="testB" list="<%=profile.getTestSetBList()%>">
                    <tr>
                        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                        <td class="testTableOdd"><a href="JavaScript:getProblemDetail('<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testB" property="problemName"/></a></td>
                        <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="divisionDesc" /></td>
                        <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="difficultyDesc" /></td>
                        <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="algorithmicCategoryList" /></td>
                        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
                    </tr>
                    </screen:listIterator>
                <%}%>

                <tr><td colspan="6"><img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"></td></tr>

            </table>

            <p><br></p>
            <% if (!profile.getSessionList().isEmpty()) { %>
            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">

                <tr>
                   <td colspan="2" align="center" class="testTableTitle">&#160;</td>
                   <td colspan="3" align="center" class="testTableTitle">PROBLEMS</td>
                   <td align="center" class="testTableTitle">&#160;</td>
                </tr>

                <tr>
                   <td align="center" class="testFormHeader">Candidate</td>
                   <td align="center" class="testFormHeader">Status</td>
                   <td align="center" class="testFormHeader">Presented</td>
                   <td align="center" class="testFormHeader">Submitted</td>
                   <td align="center" class="testFormHeader">Passed</td>
                   <td align="center" class="testFormHeader">&#160;</td>
                </tr>

                <% boolean even = true; %>
                <screen:resultSetRowIterator id='row' list='<%= profile.getSessionList() %>'>

                <%-- Do a table body row --%>
                <% if(row.getItem("num_sessions").toString().equals("0")){ %>
                <tr><td colspan="6" align="center" class="bodyText" bgcolor="#EEEEEE">No sessions have been scheduled for this test profile.</td></tr>

                <% } else { %>
                <%
                    String cparam = Constants.CANDIDATE_ID + '=' + row.getItem("user_id");
                    String sparam = Constants.SESSION_ID + '=' + row.getItem("session_id");

                    String color = (even) ? "bgcolor='#EEEEEE'" : "";
                %>
                <tr>
                    <td width="20%" class="bodyText" <%=color%>><screen:servletLink processor="PopulateCandidate" param="<%=cparam%>" styleClass="bodyText"><screen:resultSetItem row="<%=row%>" name="user_name" /></screen:servletLink></td>
                    <td width="16%" align="center" class="bodyText" <%=color%>><screen:sessionStatus row="<%=row%>" /></td>
                    <td width="16%" align="center" class="bodyText" <%=color%>><%=String.valueOf(((Long)row.getItem("set_a_count").getResultData()).longValue()+((Long)row.getItem("set_b_count").getResultData()).longValue())%></td>
                    <td width="16%" align="center" class="bodyText" <%=color%>><screen:resultSetItem row="<%=row%>" name="submitted" /></td>
                    <td width="16%" align="center" class="bodyText" <%=color%>><screen:resultSetItem row="<%=row%>" name="passed" /></td>
                    <td width="16%" align="center" class="bodyText" <%=color%>><screen:servletLink processor="TestResults" param="<%=sparam%>"><screen:sessionStatusLink row="<%=row%>" /></screen:servletLink></td>
                </tr>
                <% } %>
                <% even = !even; %>
                </screen:resultSetRowIterator>
            </table>
            <% } %>

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
