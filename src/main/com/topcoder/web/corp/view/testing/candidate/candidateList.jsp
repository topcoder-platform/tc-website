<%@ page import="com.topcoder.web.corp.common.Constants,
                 com.topcoder.web.corp.model.TestSessionInfo,
                 java.util.Date" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp" />

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
                        <h1 class="testHead">Candidate List</h1>
                        <p>Below is a list of all candidates.  Clicking on a candidate's email address will bring you to the Candidate Info page.<br></p>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr>
                    <td><div align="center"><p class="button"><screen:servletLink processor="PopulateCandidate" param="referrer=BuildCandidateList" styleClass="button">Add Candidate</screen:servletLink></p></div></td>
                </tr>
            </table>

          <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
                 <tr>
                   <td colspan="2" align="center" class="testTableTitleSmall">Candidate</td>
                   <td align="center" class="testTableTitleSmall">Profile</td>               
                   <td align="center" class="testTableTitleSmall">Begin</td>               
                   <td align="center" class="testTableTitleSmall">End</td>
                   <td align="center" class="testTableTitleSmall">Status</td>
                   <td align="center" class="testTableTitleSmall">Notes</td>                                          
                </tr>

                <jsp:useBean id="candidateList" type="java.util.List" scope="request" />
            
                <screen:resultSetRowIterator id="row" list="<%=candidateList%>">

                <%
                    String params = Constants.CANDIDATE_ID + "=" + row.getItem("user_id") + "&referrer=BuildCandidateList";
                    String trparams = Constants.SESSION_ID + "=" + row.getItem("session_id") + "&referrer=BuildCandidateList";
                    boolean hasSession = !row.getItem("has_session").toString().equals("0");
                    boolean hasNotes = ((Long)row.getItem("note_count").getResultData()).longValue()>0;

                %>

                <tr>
                   <td width="1" class="testFormOdd">&#160;</TD>
                   <td width="30%" class="testTableOdd"><screen:servletLink processor="PopulateCandidate" param="<%=params%>"><screen:resultSetItem row="<%=row%>" name="handle" /></screen:servletLink></td>               
                   <td width="10%" align="center" class="testTableOdd"><% if(hasSession){ %><screen:servletLink processor="TestResults" param="<%=trparams%>"><screen:sessionStatusLink row="<%=row%>" /></screen:servletLink><% } %></td>
                   <td width="20%" align="center" class="testTableOdd"><screen:resultSetItem row="<%=row%>" name="begin_time" format="MM/dd/yyyy hh:mm a" ifNull="N/A"/></td> 
                   <td width="20%" align="center" class="testTableOdd"><screen:resultSetItem row="<%=row%>" name="end_time" format="MM/dd/yyyy hh:mm a" ifNull="N/A"/></td> 
                   <td width="10%" align="center" class="testTableOdd"><screen:sessionStatus row="<%=row%>" /></td>
                   <td width="10%" align="center" class="testTableOdd"><screen:servletLink processor="PopulateCandidate" param="<%=params%>"><%=hasNotes?"View":"None"%></screen:servletLink></td>
                </tr>

            </screen:resultSetRowIterator>
            </table>

            <% if (candidateList.size() > 10) { %>
                <table border="0" cellspacing="10" cellpadding="0" width="70%">
                     <tr>
                        <td><div align="center"><p class="button"><screen:servletLink processor="PopulateCandidate" param="referrer=BuildCandidateList" styleClass="button">Add Candidate</screen:servletLink></p></div></td>
                    </tr>
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
