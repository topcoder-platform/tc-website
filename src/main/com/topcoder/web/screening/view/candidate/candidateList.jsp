<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="/script.jsp" />

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
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Candidate List</h1>
                        <p>Below is a list of all candidates.  Clicking on a candidate's email address will bring you to the Candidate Info page.<br></p>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="70%">
                <tr>
                    <td><div align="center"><p class="button"><screen:servletLink processor="PopulateCandidate" param="referrer=BuildCandidateList" styleClass="button">Add Candidate</screen:servletLink></p></div></td>
                </tr>
            </table>

           <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
                <tr>
                    <td colspan="2" class="testTableTitleSmall">&#160;</td>
                    <td colspan="4" align="center" class="testTableTitleSmall">Candidates</td>
                </tr>
                
                <tr>
                   <td colspan="2" align="center" class="testTableTitle">Candidate</td>
                   <td align="center" class="testTableTitle">Profile</td>               
                   <td align="center" class="testTableTitle">Begin</td>               
                   <td align="center" class="testTableTitle">End</td>
                   <td align="center" class="testTableTitle">Status</td>
                   <td align="center" class="testTableTitle">Notes</td>                                          
                </tr>

                <jsp:useBean id="candidateList" type="java.util.List" scope="request" />
            
                <screen:resultSetRowIterator id="row" list="<%=candidateList%>">

                <%
                    String params = Constants.CANDIDATE_ID + "=" + row.getItem("user_id") + "&referrer=BuildCandidateList";
                    String trparams = Constants.SESSION_ID + "=" + row.getItem("session_id") + "&referrer=BuildCandidateList";
                    boolean hasSession = !row.getItem("has_session").toString().equals("0");
                    boolean hasNotes = ((Long)row.getItem("note_count").getResultData()).longValue()>0;
                    boolean hasResults = row.getItem("has_results").getResultData().equals("1");
                %>

                <tr>
                   <td align="center" class="testFormOdd">&#160;</TD>
                   <td align="center" class="testFormOdd"><screen:servletLink processor="PopulateCandidate" param="<%=params%>" styleClass="bodyText"><screen:resultSetItem row="<%=row%>" name="handle" /></screen:servletLink></TD>               
                   <td align="center" class="testFormOdd"><% if(hasSession){ %><screen:servletLink processor="TestResults" param="<%=trparams%>" styleClass="bodyText"><%=hasResults?"Results":"Details"%></screen:servletLink><% } %></TD>
                   <td align="center" class="testFormOdd"><screen:resultSetItem row="<%=row%>" name="begin_time" format="MM/dd/yyyy hh:mm a" ifNull="N/A"/></TD>
                   <td align="center" class="testFormOdd"><screen:resultSetItem row="<%=row%>" name="end_time" format="MM/dd/yyyy hh:mm a" ifNull="N/A"/></TD>
                   <td align="center" class="testFormOdd"><screen:resultSetItem row="<%=row%>" name="status" /></TD>
                   <td align="center" class="testFormOdd"><screen:servletLink processor="NoteList" param="<%=params%>" styleClass="bodyText"><%=hasNotes?"View":"None"%></screen:servletLink></TD>
                </tr>

            </screen:resultSetRowIterator>
            </table>
             
            <table border="0" cellspacing="10" cellpadding="0" width="70%">
                 <tr>
                    <td><div align="center"><p class="button"><screen:servletLink processor="PopulateCandidate" param="referrer=BuildCandidateList" styleClass="button">Add Candidate</screen:servletLink></p></div></td>
                </tr>
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
