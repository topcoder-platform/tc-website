<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:include page="../includes/script.jsp" />

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
// -->
</script>

</head>

<jsp:useBean id="testSessionInfo" class="com.topcoder.web.corp.model.TestSessionInfo" />
<jsp:useBean id="candidateInfo" class="com.topcoder.web.corp.model.CandidateInfo" />
<jsp:useBean id="profileInfo" class="com.topcoder.web.corp.model.ProfileInfo" />
<jsp:useBean id="testResultsInfo" class="com.topcoder.web.corp.model.TestResultsInfo" />

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
                        <h1 class="testHead"><%=testResultsInfo.isSessionComplete()?"Test Results":"Test Details"%></h1>
                    </td>
                </tr>
            </table>

            <table cellspacing="1" cellpadding="0" width="100%" border="0">
                <tr>
                    <td class="bodyText">
                        <% String params = Constants.CANDIDATE_ID + '=' + candidateInfo.getUserId() + "&referrer=TestResults";%>
                        <strong>Candidate:</strong> <screen:servletLink processor="PopulateCandidate" param="<%=params%>"><jsp:getProperty name="candidateInfo" property="userName"/></screen:servletLink>
                       </td>
	        </tr>
	        
	        <tr>
                    <td class="bodyText">
                        <strong>Test Profile:</strong> <jsp:getProperty name='profileInfo' property='profileName'/>
                    </td>
                </tr>
            <% if (profileInfo.hasTestSetA()) { %>
                <tr>
                    <td class="bodyText">
                        <strong>Problem Set:</strong> <jsp:getProperty name='profileInfo' property='testSetAName'/>
                    </td>
	        </tr>
            <% } %>
                <tr>
                    <td class="bodyText">
                        <strong>Begin:</strong> <screen:beanWrite name='testSessionInfo' property='beginDate' format='MM/dd/yyyy hh:mm a'/>
                    </td>
	        </tr>
                <tr>
                    <td class="bodyText">
                        <strong>End:</strong> <screen:beanWrite name='testSessionInfo' property='endDate' format='MM/dd/yyyy hh:mm a'/>
                    </td>
	        </tr>
	    </table>
        <p></p>
   <% if(testResultsInfo.isSessionComplete()) { %>

            <table cellspacing="1" cellpadding="0" width="100%" border="0">
              <tr>
                    <td class="bodyText">
                        <% String trparams = Constants.SESSION_ID + "=" + testResultsInfo.getSessionId(); %>
                        <screen:servletLink processor="PrinterTestResults" param="<%=trparams%>">View Printer Friendly Version</screen:servletLink>
                    </td>
	        </tr>
            </table>

        <p></p>
        <% boolean even = false; %>
        <% if (profileInfo.hasTestSetA()) { %>
            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
	        <tr>
		       <td colspan="9" class="testTableTitle">Test Set A Results:</td>
	        </tr>
	        
	        <tr>
		       <td width="11%" class="testFormHeader">Problem</td>
		       <td width="11%" align="center" class="testFormHeader">Language</td>
		       <td width="11%" align="center" class="testFormHeader">Status</td>
		       <td width="11%" align="center" class="testFormHeader">Test Passed</td>
		       <td width="11%" align="center" class="testFormHeader">Test Failed</td>
		       <td width="11%" align="center" class="testFormHeader">% Test Passed</td>
		       <td width="11%" align="center" class="testFormHeader">Points</td>
		       <td width="11%" align="center" class="testFormHeader">Time</td>
		       <td width="11%" align="center" class="testFormHeader">&#160;</td>
                </tr>
	        
                <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetAResults()%>">
                    <%
                     String prparam = Constants.SESSION_ID + '=' + testResultsInfo.getSessionId() + '&' +
                     Constants.ROUND_ID + '=' + row.getItem("session_round_id") + '&' +
                     Constants.PROBLEM_ID + '=' + row.getItem("problem_id") + '&' +
                     Constants.PROBLEM_TYPE_ID + '=' + row.getItem("problem_type_id");
                     boolean isSubmitted = row.getItem("is_submitted").toString().equals("1");
                     boolean isCompiled = row.getItem("is_compiled").toString().equals("1");
                     boolean isSystemTested = row.getItem("is_system_tested").toString().equals("1");
                     %>
                     
                <tr>
		       <td class="<%=even?"testTableEven":"testTableOdd"%>">&#160;<a href="JavaScript:getProblemDetail('<screen:resultSetItem row="<%=row%>" name="session_round_id" />,<screen:resultSetItem row="<%=row%>" name="problem_id" />')" class="bodyText"><screen:resultSetItem row="<%=row%>" name="problem_name" /></a></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="language_name" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="status_desc" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_succeeded" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_failed" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="pct_passed" />%</td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="points" format="#.##" ifNull="N/A" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="elapsed" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>">
                 <% if (isSystemTested && (isSubmitted || isCompiled)) {%>
                 <screen:servletLink processor="ProblemResult" param="<%=prparam%>" >Details</screen:servletLink>
                 <% } %>
               </td>
                </tr>
                <% even = !even; %>
                </screen:resultSetRowIterator>
            </table>

            <p></p>

`            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
	        <TR>
		       <TD COLSPAN="10" VALIGN="top" CLASS="testTableTitle">TopCoder Stats</TD>
	        </TR>
	        <TR>
		       <TD WIDTH="10%" CLASS="testFormHeader"><B>Name</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Division</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Difficulty</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Submissions</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Sub %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Correct</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Submit Corr. %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Overall Corr. %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Avg. Pts.</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Time</B></TD>
	        </TR>
                <% if(testResultsInfo.getProblemSetATCStats().isEmpty()){ %>
	             <TR>
		       <TD ALIGN="center" HEIGHT="15" CLASS="bodyText" colspan='10'>No statistics available for this round.</TD>
	             </TR>
                <% } else{ even = false; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetATCStats()%>">
	             <TR>
		       <TD CLASS="<%=even?"testTableEven":"testTableOdd"%>">&#160;<screen:resultSetItem row="<%=row%>" name="name" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="division_desc" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="level_desc" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="submissions" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="submit_pct" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="correct" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="submit_pct_correct" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="overall_pct_correct" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="avg_points" format="#.##"/></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="time_elapsed" /></TD>
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
         </table>
         <p></p>
    <% } //has test set a %>
    <% if(testResultsInfo.getProblemSetBCount() > 0){ %>
            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
	        <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="testTableTitle">Test Set B Results:</TD>
	        </TR>
	        <TR>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Problem</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Language</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Status</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Test Passed</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Test Failed</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>% Test Passed</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Time</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader">&#160;</TD>
	        </TR>
                <% { even = false; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetBResults()%>">
                     <%
                        String prparam = Constants.SESSION_ID + '=' + testResultsInfo.getSessionId() + '&' +
                                         Constants.ROUND_ID + '=' + row.getItem("session_round_id") + '&' +
                                         Constants.PROBLEM_ID + '=' + row.getItem("problem_id") + '&' +
                                         Constants.PROBLEM_TYPE_ID + '=' + row.getItem("problem_type_id");
                        boolean isSubmitted = row.getItem("is_submitted").toString().equals("1");
                        boolean isCompiled = row.getItem("is_compiled").toString().equals("1");
                        boolean isSystemTested = row.getItem("is_system_tested").toString().equals("1");
                     %>
	             <TR>
		       <TD CLASS="<%=even?"testTableEven":"testTableOdd"%>">&#160;<A HREF="JavaScript:getProblemDetail('<screen:resultSetItem row="<%=row%>" name="session_round_id" />,<screen:resultSetItem row="<%=row%>" name="problem_id" />')" CLASS="bodyText"><screen:resultSetItem row="<%=row%>" name="problem_name" /></A></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="language_name" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="status_desc" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_succeeded" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_failed" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="pct_passed" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="elapsed" /></TD>
               <% if (isSystemTested && (isSubmitted || isCompiled)) { %>
		         <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:servletLink processor="ProblemResult" param="<%=prparam%>" styleClass="bodyText">Details</screen:servletLink></TD>
               <% } %>
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
	        </table>
    <% } // getProblemSetBCount() > 0 %>
<% } else { //isSessionComplete %>
  <% if (profileInfo.hasTestSetA()) { %>
            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
           <TR>
              <TD COLSPAN="4" CLASS="testTableTitle">Test Set A</TD>
           </TR>
	        <TR>
		       <TD ALIGN="center" CLASS="testFormHeader">&#160;Name</TD>
		       <TD ALIGN="center" CLASS="testFormHeader">&#160;Division</TD>
		       <TD ALIGN="center" CLASS="testFormHeader">&#160;Difficulty</TD>
		       <TD ALIGN="center" CLASS="testFormHeader">&#160;Algorithmic Categories</TD>
	        </TR>
            <screen:problemInfoIterator id="problem" list="<%=profileInfo.getTestSetAList()%>">
	        <TR>
		       <TD ALIGN="center" CLASS="testTableOdd">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name='problem' property='roundId' />,<screen:beanWrite name='problem' property='problemId' />')" CLASS="bodyText"><screen:beanWrite name='problem' property='problemName' /></A></TD>
		       <TD ALIGN="center" CLASS="testTableOdd">&#160;<screen:beanWrite name='problem' property='divisionDesc' /></TD>
		       <TD ALIGN="center" CLASS="testTableOdd">&#160;<screen:beanWrite name='problem' property='difficultyDesc' /></TD>
		       <TD ALIGN="center" CLASS="testTableOdd">&#160;<screen:beanWrite name='problem' property='algorithmicCategoryList' /></TD>
	        </TR>
            </screen:problemInfoIterator>
         </table>
         <p></p>
   <% } %>
<% if(testResultsInfo.getProblemSetBCount() > 0){ %>
            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
           <TR>
              <TD COLSPAN="4" CLASS="testTableTitle"><B>Test Set B</B></TD>
           </TR>
	        <TR>
		       <TD ALIGN="center" CLASS="testFormHeader" BGCOLOR="#CCCCCC">&#160;Name</TD>
		       <TD ALIGN="center" CLASS="testFormHeader" BGCOLOR="#CCCCCC">&#160;Division</TD>
		       <TD ALIGN="center" CLASS="testFormHeader" BGCOLOR="#CCCCCC">&#160;Difficulty</TD>
		       <TD ALIGN="center" CLASS="testFormHeader" BGCOLOR="#CCCCCC">&#160;Algorithmic Categories</TD>
	        </TR>
            <screen:problemInfoIterator id="problem" list="<%=profileInfo.getTestSetBList()%>">
	        <TR>
		       <TD ALIGN="center" CLASS="testTableOdd">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name='problem' property='roundId' />,<screen:beanWrite name='problem' property='problemId' />')" CLASS="bodyText"><screen:beanWrite name='problem' property='problemName' /></A></TD>
		       <TD ALIGN="center" CLASS="testTableOdd">&#160;<screen:beanWrite name='problem' property='divisionDesc' /></TD>
		       <TD ALIGN="center" CLASS="testTableOdd">&#160;<screen:beanWrite name='problem' property='difficultyDesc' /></TD>
		       <TD ALIGN="center" CLASS="testTableOdd">&#160;<screen:beanWrite name='problem' property='algorithmicCategoryList' /></TD>
	        </TR>
            </screen:problemInfoIterator>
         </table>
<% } // getProblemSetBCount() > 0 %>
<% } // !isSessionComplete() %>

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
