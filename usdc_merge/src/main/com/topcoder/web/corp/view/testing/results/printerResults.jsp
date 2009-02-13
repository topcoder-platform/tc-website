<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.List,
                 com.topcoder.web.corp.model.ProblemInfo,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.corp.model.SubmissionInfo" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp" />

</head>

<jsp:useBean id="testSessionInfo" class="com.topcoder.web.corp.model.TestSessionInfo" />
<jsp:useBean id="candidateInfo" class="com.topcoder.web.corp.model.CandidateInfo" />
<jsp:useBean id="profileInfo" class="com.topcoder.web.corp.model.ProfileInfo" />
<jsp:useBean id="testResultsInfo" class="com.topcoder.web.corp.model.TestResultsInfo" />

<body>

<!-- Header begins -->
<a name="top"></a>


<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr>
        <td width="15"><img src="/i/corp/clear.gif" width="15" height="1" border="0"/></td>
        <td width="206">
            <img src="/i/corp/logo_testing.gif" width="206" height="49" border="0" vspace="5"/>
        </td>
        <td width="99%"><img src="/i/corp/clear.gif" width="1" height="1" border="0"/></td>
   </tr>
    <tr><td height="3" class="headStripe" colspan="3"><img src="/i/corp/clear.gif" alt="" height="3" alt="" border="0"></td></tr>
</table>


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
                        <strong>Candidate:</strong> <jsp:getProperty name="candidateInfo" property="userName"/>
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


   <% boolean even = false; %>
   <% if(testResultsInfo.isSessionComplete()) { %>

     <% if (profileInfo.hasTestSetA()) { %>
            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
	        <tr>
		       <td colspan="8" class="testTableTitle">Test Set A Results:</td>
	        </tr>

	        <tr>
		       <td width="15%" class="testFormHeader">Problem</td>
		       <td width="15%" align="center" class="testFormHeader">Language</td>
		       <td width="15%" align="center" class="testFormHeader">Status</td>
		       <td width="15%" align="center" class="testFormHeader">Test Passed</td>
		       <td width="15%" align="center" class="testFormHeader">Test Failed</td>
		       <td width="15%" align="center" class="testFormHeader">% Test Passed</td>
		       <td width="11%" align="center" class="testFormHeader">Points</td>
		       <td width="15%" align="center" class="testFormHeader">Time</td>
                </tr>

                <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetAResults()%>">
                <tr>
		       <td class="<%=even?"testTableEven":"testTableOdd"%>">&#160;<screen:resultSetItem row="<%=row%>" name="problem_name" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="language_name" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="status_desc" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_succeeded" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_failed" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="pct_passed" />%</td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="points" format="#.##" ifNull="N/A" /></td>
		       <td align="center" class="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="elapsed" /></td>
                </tr>
                <% even = !even; %>
                </screen:resultSetRowIterator>
            </table>

            <p></p>

            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
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
		       <TD ALIGN="center" CLASS="bodyText" colspan='10'>No statistics available for this round.</TD>
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
		       <TD COLSPAN="7" VALIGN="top" CLASS="testTableTitle">Test Set B Results:</TD>
	        </TR>
	        <TR>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Problem</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Language</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Status</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Test Passed</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Test Failed</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>% Test Passed</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="testFormHeader"><B>Time</B></TD>
	        </TR>
                <% { even = false; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetBResults()%>">
	             <TR>
		       <TD CLASS="<%=even?"testTableEven":"testTableOdd"%>">&#160;<screen:resultSetItem row="<%=row%>" name="problem_name" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="language_name" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="status_desc" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_succeeded" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="num_failed" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="pct_passed" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=row%>" name="elapsed" /></TD>
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
	        </table>
    <% } // getProblemSetBCount() > 0 %>
            <p><br></p>

            <% ResultSetContainer notes = (ResultSetContainer)request.getAttribute("noteList"); %>

            <% if (!notes.isEmpty()) { %>
              <table cellspacing="0" cellpadding="3" width="100%" class="testFrame">
                <TR>
                   <TD COLSPAN="3" VALIGN="top" CLASS="testTableTitle">Notes:</TD>
                </TR>
                <tr>
                    <td width="70%" class="testFormHeader">Note</td>
                    <td width="15%" align="center" class="testFormHeader">Author</td>
                    <td width="15%" align="center" class="testFormHeader">Date Created</td>
                </tr>

                <% even = false; %>
                <screen:resultSetRowIterator id="row" list="<%=notes%>">
                <tr>
                    <td <% if(even){ %>class="testTableEven"<% } else { %>class="testTableOdd"<% } %>><%=StringUtils.htmlEncode((String)row.getItem("text").getResultData())%></td>
                    <td align="center" <% if(even){ %>class="testTableEven"<% } else { %>class="testTableOdd"<% } %>><screen:resultSetItem row="<%=row%>" name="created_by" /></td>
                    <td align="center" <% if(even){ %>class="testTableEven"<% } else { %>class="testTableOdd"<% } %>><screen:resultSetItem row="<%=row%>" name="create_date" /></td>
                </tr>
                <% even = !even; %>
                </screen:resultSetRowIterator>
              </table>
              <p><br></p>
            <% } %>


            <%-- TODO this is terrible, get this java code OUTTA here --%>
            <% List solutionA = (List)request.getAttribute("problemSolutionAList");
               List solutionB = (List)request.getAttribute("problemSolutionBList");
               List statementsA = profileInfo.getTestSetAList();
               List statementsB = profileInfo.getTestSetBList();
               ProblemInfo problem = null;
               SubmissionInfo solution = null; %>

              <% for (int j=0; j<statementsA.size(); j++) { %>
                  <% problem = (ProblemInfo)statementsA.get(j); %>
                  <% solution = (SubmissionInfo)solutionA.get(j); %>
                  <% if (!(solution.isSubmitted()||solution.isCompiled())) continue; %>
                  <div style="page-break-before:always"/>
                  <%=j==0&&(solution.isSubmitted()||solution.isCompiled())?"<h3>Test Set A</h3>":""%>
                  <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
                  <tr>
		            <td class="bodyText"><screen:problemStatement text="<%=problem.getProblemStatement()%>" language="Java" class="bodyText"/></td>
                  </tr>
                  <tr><td><br/></td></tr>
                  </table>

                  <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
                  <tr>
		            <td class="bodyText">
                     <h3><%=solution.isCompiled()?"Compilation":"Solution"%></h3><br/>
                     <%--this should really get plugged into the formatter object --%>
                     <PRE><%=StringUtils.htmlEncode(solution.getCode())%></PRE>
                    </td>
                  </tr>
                  <tr><td><br/></td></tr>
                  </table>
              <% } %>

              <% for (int j=0; j<statementsB.size(); j++) { %>
                  <% problem = (ProblemInfo)statementsB.get(j); %>
                  <% solution = (SubmissionInfo)solutionB.get(j); %>
                  <% if (!(solution.isSubmitted()||solution.isCompiled())) continue; %>
                  <div style="page-break-before:always"/>
                  <%=j==0&&(solution.isSubmitted()||solution.isCompiled())?"<h3>Test Set B</h3>":""%>
                  <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
                  <tr>
		            <td class="bodyText"><screen:problemStatement text="<%=problem.getProblemStatement()%>" language="Java" class="bodyText"/></td>
                  </tr>
                  <tr><td><br/></td></tr>
                  </table>

                  <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
                  <tr>
		            <td class="bodyText">
                     <h3><%=solution.isCompiled()?"Compilation":"Solution"%></h3><br/>
                     <%--this should really get plugged into the formatter object --%>
                     <PRE><%=StringUtils.htmlEncode(solution.getCode())%></PRE>
                    </td>
                  </tr>
                  <tr><td><br/></td></tr>
                  </table>
              <% } %>
              </table>

<% } //isSessionComplete %>

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
