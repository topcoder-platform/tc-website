<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="../errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.List,
                 com.topcoder.web.screening.model.ProblemInfo" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp" />

</head>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.screening.model.SessionInfo" />
<jsp:useBean id="candidateInfo" class="com.topcoder.web.screening.model.CandidateInfo" />
<jsp:useBean id="profileInfo" class="com.topcoder.web.screening.model.ProfileInfo" />
<jsp:useBean id="testResultsInfo" class="com.topcoder.web.screening.model.TestResultsInfo" />

<body>

<!-- Header begins -->
<a name="top"></a>


<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr>
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <td width="206">
            <img src="/i/logo_testing.gif" width="206" height="49" border="0" vspace="5"/>
        </td>
        <td width="99%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
   </tr>
    <tr><td height="3" class="headStripe" colspan="3"><img src="/images/clear.gif" alt="" height="3" alt="" border="0"></td></tr>
</table>


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

                <tr>
                    <td class="bodyText">
                        <strong>Problem Set:</strong> <jsp:getProperty name='profileInfo' property='testSetAName'/>
                    </td>
	        </tr>
                <tr>
                    <td class="bodyText">
                        <strong>Begin:</strong> <screen:beanWrite name='sessionInfo' property='beginDate' format='MM/dd/yyyy hh:mm a'/>
                    </td>
	        </tr>
                <tr>
                    <td class="bodyText">
                        <strong>End:</strong> <screen:beanWrite name='sessionInfo' property='endDate' format='MM/dd/yyyy hh:mm a'/>
                    </td>
	        </tr>
	    </table>

    <% if(testResultsInfo.isSessionComplete()) { %>
            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
	        <tr>
		       <td colspan="7" class="testHeadSmall">Test Set A Results:</td>
	        </tr>

	        <tr>
		       <td width="15%" class="testFormHeader">Problem</td>
		       <td width="15%" align="center" class="testFormHeader">Language</td>
		       <td width="15%" align="center" class="testFormHeader">Status</td>
		       <td width="15%" align="center" class="testFormHeader">Test Passed</td>
		       <td width="15%" align="center" class="testFormHeader">Test Failed</td>
		       <td width="15%" align="center" class="testFormHeader">% Test Passed</td>
		       <td width="15%" align="center" class="testFormHeader">Time</td>
                </tr>

                <% boolean even = true; %>
                <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetAResults()%>">
                    <% String color = even ? "bgcolor='#EEEEEE'" : ""; %>

                <tr>
		       <td class="bodyText" <%= color %>>&#160;<screen:resultSetItem row="<%=row%>" name="problem_name" /></td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="language_name" /></td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="status_desc" /></td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="num_succeeded" /></td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="num_failed" /></td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="pct_passed" />%</td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="elapsed" /></td>
                </tr>
                <% even = !even; %>
                </screen:resultSetRowIterator>
            </table>

            <p></p>

<% } // isSessionComplete %>

<% if(testResultsInfo.isSessionComplete()) { %>
	        <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
	        <TR>
		       <TD COLSPAN="10" VALIGN="top" CLASS="bodyTextBold"><B>TopCoder Stats</B></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="10"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1"></TD>
	        </TR>
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Division</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Coders</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Submissions</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Sub %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Correct</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Submit Corr. %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Overall Corr. %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Time</B></TD>
	        </TR>
                <% if(testResultsInfo.getProblemSetATCStats().isEmpty()){ %>
	             <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" colspan='10'>No statistics available for this round.</TD>
	             </TR>
                <% }else{ boolean even = true; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetATCStats()%>">
                     <% String color = even ? "BGCOLOR='#CCCCCC'" : ""; %>
	             <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText" <%= color %>>&#160;<screen:resultSetItem row="<%=row%>" name="name" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="division_desc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="level_desc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="coders" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="submissions" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="submit_pct" />%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="correct" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="submit_pct_correct" />%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="overall_pct_correct" />%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="time_elapsed" /></TD>
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
         </TABLE>
    <% if(testResultsInfo.getProblemSetBCount() > 0){ %>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
	        <TR>
		       <TD COLSPAN="7"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="30"></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="7" VALIGN="top" CLASS="bodyTextBold"><B>Test Set B Results:</B></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="7"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1"></TD>
	        </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Problem</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Language</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Status</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Test Passed</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Test Failed</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>% Test Passed</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Time</B></TD>
	        </TR>
                <% { boolean even = true; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetBResults()%>">
                     <% String color = even ? "BGCOLOR='#CCCCCC'" : ""; %>
	             <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText" <%= color %>>&#160;<screen:resultSetItem row="<%=row%>" name="problem_name" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="language_name" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="status_desc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="num_succeeded" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="num_failed" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="pct_passed" />%</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="elapsed" /></TD>
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
	        <TR>
		       <TD COLSPAN="7"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="30"></TD>
	        </TR>
	        </TABLE>
    <% } // getProblemSetBCount() > 0 %>
            <p><br></p>

            <% ResultSetContainer solutions = (ResultSetContainer)request.getAttribute("problemSolutionList"); %>
            <% List statements = (List)request.getAttribute("problemStatementList"); %>
            <% ProblemInfo problem = null; %>

            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
	          <tr>
		        <td class="testHeadSmall">Problems:</td>
	          </tr>

              <% int i=0; %>
              <screen:resultSetRowIterator id="row" list="<%=solutions%>">
                <tr>
                  <% String color = i%2==0 ? "bgcolor='#EEEEEE'" : "";
                     problem = (ProblemInfo)statements.get(i); %>
		          <td class="bodyText" <%= color %>>&#160;<screen:resultSetItem row="<%=row%>" name="submission_text" /></td>
                </tr>
                <tr>
		          <td class="bodyText" <%= color %>>&#160;<%=problem.getProblemStatement()%></td>
                </tr>
                <% i++; %>
              </screen:resultSetRowIterator>
            </table>

<% } %>

        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../includes/foot.jsp" />

</body>
</html>
