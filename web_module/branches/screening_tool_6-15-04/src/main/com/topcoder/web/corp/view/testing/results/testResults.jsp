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
            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrameNB">
                <tr valign="top">
                    <td class="bodyText">
                        <p class="testHead"><%=testResultsInfo.isSessionComplete()?"Test Results":"Test Details"%></p>
                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrameNB">
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

            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrameNB">
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
            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">
	        <tr>
		       <td colspan="9" class="screeningTitle">Test Set A Results:</td>
	        </tr>
	        
	        <tr>
		       <td width="11%" align="left" class="screeningHeader">Problem</td>
		       <td width="11%" align="center" class="screeningHeader">Language</td>
		       <td width="11%" align="center" class="screeningHeader">Status</td>
		       <td width="11%" align="center" class="screeningHeader">Test Passed</td>
		       <td width="11%" align="center" class="screeningHeader">Test Failed</td>
		       <td width="11%" align="center" class="screeningHeader">% Test Passed</td>
		       <td width="11%" align="center" class="screeningHeader">Points</td>
		       <td width="11%" align="center" class="screeningHeader">Time</td>
		       <td width="11%" align="center" class="screeningHeader">&#160;</td>
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
		       <td class="<%=even?"screeningCellEven":"screeningCellOdd"%>">&#160;<a href="JavaScript:getProblemDetail('<screen:resultSetItem row="<%=row%>" name="session_round_id" />,<screen:resultSetItem row="<%=row%>" name="problem_id" />')" class="bodyText"><screen:resultSetItem row="<%=row%>" name="problem_name" /></a></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="language_name" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="status_desc" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_succeeded" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_failed" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="pct_passed" />%</td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="points" format="#.##" ifNull="N/A" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="elapsed" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>">
                 <% if (isSystemTested && (isSubmitted || isCompiled)) {%>
                 <screen:servletLink processor="ProblemResult" param="<%=prparam%>" >Details</screen:servletLink>
                 <% } %>
               </td>
                </tr>
                <% even = !even; %>
                </screen:resultSetRowIterator>
            </table>

            <p></p>

            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">
	        <TR>
		       <TD COLSPAN="10" VALIGN="top" CLASS="screeningTitle">TopCoder Stats</TD>
	        </TR>
	        <TR>
		       <TD ALIGN="left" WIDTH="10%" CLASS="screeningHeader"><B>Name</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Division</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Difficulty</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Submissions</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Sub %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Correct</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Submit Corr. %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Overall Corr. %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Avg. Pts.</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Time</B></TD>
	        </TR>
                <% if(testResultsInfo.getProblemSetATCStats().isEmpty()){ %>
	             <TR>
		       <TD ALIGN="center" HEIGHT="15" CLASS="bodyText" colspan='10'>No statistics available for this round.</TD>
	             </TR>
                <% } else{ even = false; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetATCStats()%>">
	             <TR>
		       <TD ALIGN="left" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>">&#160;<screen:resultSetItem row="<%=row%>" name="name" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="division_desc" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="level_desc" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="submissions" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="submit_pct" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="correct" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="submit_pct_correct" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="overall_pct_correct" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="avg_points" format="#.##"/></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="time_elapsed" /></TD>
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
         </table>
         <p></p>
    <% } //has test set a %>
    <% if(testResultsInfo.getProblemSetBCount() > 0){ %>
            <%if( request.getAttribute(Constants.USAGE_TYPE) != null && ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_SCREENING) { %>
            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">
	        <TR>
                       <TD COLSPAN="7" VALIGN="top" CLASS="screeningTitle">Problem Statistics:</TD>
	        </TR>
	        <TR>
		       <TD ALIGN="left" WIDTH="10%" CLASS="screeningHeader"><B>Problem</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B># Submissions</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Submission %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B># Correct</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Sub. Correct %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Overall Correct %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Avg. Time</B></TD>
	        </TR>
                <% { even = false; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetBStats()%>">
	             <TR>
		       <TD CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>">&#160;<screen:resultSetItem row="<%=row%>" name="name" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="submission_count" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="submission_percent" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_correct" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="submit_correct_percent" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="overall_correct_percent" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="avg_time" /></TD>
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
	        </table>
	        <p></p>
            <% } %>
            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">
	        <TR>
	        <% if( request.getAttribute(Constants.USAGE_TYPE) != null &&  ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_SCREENING) { %>
		       <TD COLSPAN="6" VALIGN="top" CLASS="screeningTitle">Test Set B Results:</TD>
		<% } else { %>
                       <TD COLSPAN="8" VALIGN="top" CLASS="screeningTitle">Test Set B Results:</TD>
		<% } %>
	        </TR>
	        <TR>
		       <TD ALIGN="left" WIDTH="10%" CLASS="screeningHeader"><B>Problem</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Language</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Status</B></TD>
		       <%if( request.getAttribute(Constants.USAGE_TYPE) == null || ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_TESTING) { %>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Test Passed</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Test Failed</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>% Test Passed</B></TD>
		       <% } %>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Time</B></TD>
                <% if( request.getAttribute(Constants.USAGE_TYPE) != null &&  ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_SCREENING) { %>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader">Percentile</TD>
		<% } %>
                       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader">&#160;</TD>
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
		       <TD ALIGN="left" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>">&#160;<A HREF="JavaScript:getProblemDetail('<screen:resultSetItem row="<%=row%>" name="session_round_id" />,<screen:resultSetItem row="<%=row%>" name="problem_id" />')" CLASS="bodyText"><screen:resultSetItem row="<%=row%>" name="problem_name" /></A></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="language_name" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="status_desc" /></TD>
		       <%if( request.getAttribute(Constants.USAGE_TYPE) == null || ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_TESTING) { %>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_succeeded" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_failed" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="pct_passed" />%</TD>
		       <% } %>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:resultSetItem row="<%=row%>" name="elapsed" /></TD>
		       <% if( request.getAttribute(Constants.USAGE_TYPE) != null &&  ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_SCREENING) { %>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><%= testResultsInfo.getProblemSetBPrecentiles().get( String.valueOf( row.getLongItem("problem_id") ) ) %>%</td>
		       <% } %>		       
               <% if (isSystemTested && (isSubmitted || isCompiled)) { %>
		         <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><screen:servletLink processor="ProblemResult" param="<%=prparam%>" styleClass="bodyText">Details</screen:servletLink></TD>
               <% } %>
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
	        </table>
    <% } // getProblemSetBCount() > 0 %>
<% } else { //isSessionComplete %>
  <% if (profileInfo.hasTestSetA()) { %>
            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">
           <TR>
              <TD COLSPAN="4" CLASS="screeningTitle">Test Set A</TD>
           </TR>
	        <TR>
		       <TD ALIGN="left" CLASS="screeningHeader">&#160;Name</TD>
		       <TD ALIGN="center" CLASS="screeningHeader">&#160;Division</TD>
		       <TD ALIGN="center" CLASS="screeningHeader">&#160;Difficulty</TD>
		       <TD ALIGN="center" CLASS="screeningHeader">&#160;Algorithmic Categories</TD>
	        </TR>
            <screen:problemInfoIterator id="problem" list="<%=profileInfo.getTestSetAList()%>">
	        <TR>
		       <TD ALIGN="left" CLASS="screeningCellOdd">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name='problem' property='roundId' />,<screen:beanWrite name='problem' property='problemId' />')" CLASS="bodyText"><screen:beanWrite name='problem' property='problemName' /></A></TD>
		       <TD ALIGN="center" CLASS="screeningCellOdd">&#160;<screen:beanWrite name='problem' property='divisionDesc' /></TD>
		       <TD ALIGN="center" CLASS="screeningCellOdd">&#160;<screen:beanWrite name='problem' property='difficultyDesc' /></TD>
		       <TD ALIGN="center" CLASS="screeningCellOdd">&#160;<screen:beanWrite name='problem' property='algorithmicCategoryList' /></TD>
	        </TR>
            </screen:problemInfoIterator>
         </table>
         <p></p>
   <% } %>
<% if(testResultsInfo.getProblemSetBCount() > 0){ %>
            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">
           <TR>
              <TD COLSPAN="4" CLASS="screeningTitle"><B>Test Set B</B></TD>
           </TR>
	        <TR>
		       <TD ALIGN="left" CLASS="screeningHeader" BGCOLOR="#CCCCCC">&#160;Name</TD>
		       <TD ALIGN="center" CLASS="screeningHeader" BGCOLOR="#CCCCCC">&#160;Division</TD>
		       <TD ALIGN="center" CLASS="screeningHeader" BGCOLOR="#CCCCCC">&#160;Difficulty</TD>
		       <TD ALIGN="center" CLASS="screeningHeader" BGCOLOR="#CCCCCC">&#160;Algorithmic Categories</TD>
	        </TR>
            <screen:problemInfoIterator id="problem" list="<%=profileInfo.getTestSetBList()%>">
	        <TR>
		       <TD ALIGN="left" CLASS="screeningCellOdd">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name='problem' property='roundId' />,<screen:beanWrite name='problem' property='problemId' />')" CLASS="bodyText"><screen:beanWrite name='problem' property='problemName' /></A></TD>
		       <TD ALIGN="center" CLASS="screeningCellOdd">&#160;<screen:beanWrite name='problem' property='divisionDesc' /></TD>
		       <TD ALIGN="center" CLASS="screeningCellOdd">&#160;<screen:beanWrite name='problem' property='difficultyDesc' /></TD>
		       <TD ALIGN="center" CLASS="screeningCellOdd">&#160;<screen:beanWrite name='problem' property='algorithmicCategoryList' /></TD>
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
