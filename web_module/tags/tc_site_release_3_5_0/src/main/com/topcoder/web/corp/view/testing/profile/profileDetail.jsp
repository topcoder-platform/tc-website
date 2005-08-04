<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<html>
<head>
<title>Topcoder | Technical Assessment Application Management Tool</title>

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
            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrameNB">
                <tr valign="top">
                    <td class="bodyText">
                        <p class="testHead">Test Profile Details</p>
                    </td>
                </tr>
            </table>

            <jsp:useBean id="profile" class="com.topcoder.web.corp.model.ProfileInfo" scope="request" />

            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrameNB">
                <tr><td class="bodyText"><strong>Test Profile: </strong><jsp:getProperty name="profile" property="profileName" /></td></tr>

                <tr>
                  <td class="bodyText"><strong>Available Languages: </strong>
                    <rsc:iterator id="row" list="<%=profile.getLanguageList()%>">
                    <% if(profile.hasLanguage(row.getItem("language_id").toString())) { %>
                      <rsc:item row="<%=row%>" name="language_name" />&#160;
                    <% } %>
                    </rsc:iterator>
                  </td>
                </tr>
                <tr>
                   <td class="bodyText"><strong>Candidates Assigned: </strong><% if (profile.getSessionList().isEmpty()) { %>0<% } else { %><rsc:item row="<%=profile.getSessionList().getRow(0)%>" name="num_sessions" /> <% }%></td>
                </tr>
                <tr>
                   <td class="bodyText"><strong>Candidates Completed: </strong><% if (profile.getSessionList().isEmpty()) { %>0<% } else { %><rsc:item row="<%=profile.getSessionList().getRow(0)%>" name="num_complete" /> <% } %></td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">
              <% if (profile.hasTestSetA()) { %>
                <tr><td class="screeningTitle" colspan="4">Test Set A</td></tr>
                <tr>
                    <td width="20%" align="left" class="screeningHeader">Name</td>
                    <td width="20%" align="center" class="screeningHeader">Division</td>
                    <td width="20%" align="center" class="screeningHeader">Difficulty</td>
                    <td width="40%" align="center" class="screeningHeader">Algorithmic Categories</td>
                 </tr>

                <screen:listIterator id="testA" list="<%=profile.getTestSetAList()%>">
                <tr>
                    <td class="screeningCellOdd"><a href="JavaScript:getProblemDetail('<screen:beanWrite name="testA" property="roundId" />,<screen:beanWrite name="testA" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testA" property="problemName"/></a></td>
                    <td align="center" class="screeningCellOdd"><screen:beanWrite name="testA" property="divisionDesc" /></td>
                    <td align="center" class="screeningCellOdd"><screen:beanWrite name="testA" property="difficultyDesc" /></td>
                    <td align="center" class="screeningCellOdd"><screen:beanWrite name="testA" property="algorithmicCategoryList" /></td>
                </tr>
                </screen:listIterator>

              <% } %>

                <% if (!profile.getTestSetBList().isEmpty()) { %>
                    <tr><td class="screeningTitle" colspan="4">Test Set B</td></tr>

                    <tr>
                        <td width="20%" class="screeningHeader">Name</td>
                        <td width="20%" align="center" class="screeningHeader">Division</td>
                        <td width="20%" align="center" class="screeningHeader">Difficulty</td>
                        <td width="40%" align="center" class="screeningHeader">Algorithmic Categories</td>
                     </tr>

                    <screen:listIterator id="testB" list="<%=profile.getTestSetBList()%>">
                    <tr>
                        <td class="screeningCellOdd"><a href="JavaScript:getProblemDetail('<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testB" property="problemName"/></a></td>
                        <td align="center" class="screeningCellOdd"><screen:beanWrite name="testB" property="divisionDesc" /></td>
                        <td align="center" class="screeningCellOdd"><screen:beanWrite name="testB" property="difficultyDesc" /></td>
                        <td align="center" class="screeningCellOdd"><screen:beanWrite name="testB" property="algorithmicCategoryList" /></td>
                    </tr>
                    </screen:listIterator>
                <%}%>

            </table>

            <% if (!profile.getSessionList().isEmpty()) { %>
            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">

                <tr>
                   <td colspan="2" align="center" class="screeningTitle">&#160;</td>
                   <td colspan="3" align="center" class="screeningTitle">Problems</td>
                   <td align="center" class="screeningTitle">&#160;</td>
                </tr>

                <tr>
                   <td align="left" class="screeningHeader">Candidate</td>
                   <td align="center" class="screeningHeader">Status</td>
                   <td align="center" class="screeningHeader">Presented</td>
                   <td align="center" class="screeningHeader">Submitted</td>
                   <td align="center" class="screeningHeader">Passed</td>
                   <td align="center" class="screeningHeader">&#160;</td>
                </tr>

                <% boolean even = true; %>
                <rsc:iterator id='row' list='<%= profile.getSessionList() %>'>

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
                    <td width="20%" CLASS="<%=even?"screeningCellOdd":"screeningCellEven"%>" <%=color%>><screen:servletLink processor="PopulateCandidate" param="<%=cparam%>" styleClass="bodyText"><rsc:item row="<%=row%>" name="user_name" /></screen:servletLink></td>
                    <td width="16%" align="center" CLASS="<%=even?"screeningCellOdd":"screeningCellEven"%>" <%=color%>><screen:sessionStatus row="<%=row%>" /></td>
                    <td width="16%" align="center" CLASS="<%=even?"screeningCellOdd":"screeningCellEven"%>" <%=color%>><%=String.valueOf(((Long)row.getItem("set_a_count").getResultData()).longValue()+((Long)row.getItem("set_b_count").getResultData()).longValue())%></td>
                    <td width="16%" align="center" CLASS="<%=even?"screeningCellOdd":"screeningCellEven"%>" <%=color%>><rsc:item row="<%=row%>" name="submitted" /></td>
                    <td width="16%" align="center" CLASS="<%=even?"screeningCellOdd":"screeningCellEven"%>" <%=color%>><rsc:item row="<%=row%>" name="passed" /></td>
                    <td width="16%" align="center" CLASS="<%=even?"screeningCellOdd":"screeningCellEven"%>" <%=color%>><screen:servletLink processor="TestResults" param="<%=sparam%>"><screen:sessionStatusLink row="<%=row%>" /></screen:servletLink></td>
                </tr>
                <% } %>
                <% even = !even; %>
                </rsc:iterator>
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
