<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="/script.jsp" />

<script type="text/javascript" language="Javascript">
<!--
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    <% String url = Constants.CONTROLLER_URL + "?" + Constants.REQUEST_PROCESSOR + "=PopulateProblemDetail"; %>
    window.open('<screen:rewrite page="<%=url%>" />&<%=Constants.ROUND_PROBLEM_ID%>='+id,name,cmd);
    return;
  }
// -->
</script>

</head>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.screening.model.SessionInfo" />
<jsp:useBean id="candidateInfo" class="com.topcoder.web.screening.model.CandidateInfo" />
<jsp:useBean id="profileInfo" class="com.topcoder.web.screening.model.ProfileInfo" />
<jsp:useBean id="testResultsInfo" class="com.topcoder.web.screening.model.TestResultsInfo" />

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
                        <h1 class="testHead"><%=testResultsInfo.isSessionComplete()?"Test Results":"Test Details%></h1>
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
                
                <tr>
                    <td class="bodyText">
                        <strong>Problem Set:</strong> <jsp:getProperty name='profileInfo' property='testSetAName'/>
                    </td>
	        </tr>
                <tr>
                    <td class="bodyText">
                        <strong>Problem Set:</strong> <screen:beanWrite name='sessionInfo' property='beginDate' format='MM/dd/yyyy hh:mm a'/>
                    </td>
	        </tr>
                <tr>
                    <td class="bodyText">
                        <strong>Problem Set:</strong> <screen:beanWrite name='sessionInfo' property='endDate' format='MM/dd/yyyy hh:mm a'/>
                    </td>
	        </tr>
	    </table>

            <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
                <% if(testResultsInfo.isSessionComplete()) { %>
	        <tr>
		       <td colspan="8" class="testHeadSmall">Test Set A Results:</td>
	        </tr>
	        
	        <tr>
		       <td width="15%" class="testFormHeader">Problem</td>
		       <td width="15%" align="center" class="testFormHeader">Language</td>
		       <td width="15%" align="center" class="testFormHeader">Status</td>
		       <td width="15%" align="center" class="testFormHeader">Test Passed</td>
		       <td width="15%" align="center" class="testFormHeader">Test Failed</td>
		       <td width="15%" align="center" class="testFormHeader">% Test Passed</td>
		       <td width="15%" align="center" class="testFormHeader">Time</td>
		       <td width="15%" align="center" class="testFormHeader">&#160;</td>
                </tr>
	        
                <% boolean even = true; %>
                <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetAResults()%>">
                    <%
                     String color = even ? "bgcolor='#EEEEEE'" : "";
                     String prparam = Constants.SESSION_ID + '=' + testResultsInfo.getSessionId() + '&' +
                     Constants.ROUND_ID + '=' + row.getItem("session_round_id") + '&' +
                     Constants.PROBLEM_ID + '=' + row.getItem("problem_id") + '&' +
                     Constants.PROBLEM_TYPE_ID + '=' + row.getItem("problem_type_id");
                     %>
                     
                <tr>
		       <td class="bodyText" <%= color %>>&#160;<a href="JavaScript:getProblemDetail('<screen:resultSetItem row="<%=row%>" name="session_round_id" />,<screen:resultSetItem row="<%=row%>" name="problem_id" />')" class="bodyText"><screen:resultSetItem row="<%=row%>" name="problem_name" /></a></td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="language_name" /></td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="status_desc" /></td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="num_succeeded" /></td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="num_failed" /></td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="pct_passed" />%</td>
		       <td align="center" class="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="elapsed" /></td>
		       <td align="center" class="bodyText" <%= color %>><screen:servletLink processor="ProblemResult" param="<%=prparam%>" >Details</screen:servletLink></td>
                </tr>
                <% even = !even; %>
                </screen:resultSetRowIterator>
            </table>

            <p><br></p>

            <table cellspacing="1" cellpadding="3" width="100%">
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="30"></TD>
	        </TR>
<% } // isSessionComplete %>
	        </TABLE>

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
		       <TD COLSPAN="8"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="30"></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="bodyTextBold"><B>Test Set B Results:</B></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1"></TD>
	        </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Problem</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Language</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Status</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Test Passed</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Test Failed</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>% Test Passed</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Time</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666">&#160;</TD>
	        </TR>
                <% { boolean even = true; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetBResults()%>">
                     <%
                        String color = even ? "BGCOLOR='#CCCCCC'" : "";
                        String prparam = Constants.SESSION_ID + '=' + testResultsInfo.getSessionId() + '&' +
                                         Constants.ROUND_ID + '=' + row.getItem("session_round_id") + '&' +
                                         Constants.PROBLEM_ID + '=' + row.getItem("problem_id") + '&' +
                                         Constants.PROBLEM_TYPE_ID + '=' + row.getItem("problem_type_id");
                     %>
	             <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText" <%= color %>>&#160;<A HREF="JavaScript:getProblemDetail('<screen:resultSetItem row="<%=row%>" name="session_round_id" />,<screen:resultSetItem row="<%=row%>" name="problem_id" />')" CLASS="bodyText"><screen:resultSetItem row="<%=row%>" name="problem_name" /></A></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="language_name" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="status_desc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="num_succeeded" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="num_failed" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="pct_passed" />%</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:resultSetItem row="<%=row%>" name="elapsed" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <%= color %>><screen:servletLink processor="ProblemResult" param="<%=prparam%>" styleClass="bodyText">Details</screen:servletLink></TD>
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="30"></TD>
	        </TR>
	        </TABLE>
    <% } // getProblemSetBCount() > 0 %>
<% } else { //isSessionComplete %>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Problems</B></TD>
           </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Problem Set A</B></TD>
           </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Categories</B></TD>
<%--		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD> --%>
	        </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
            <screen:problemInfoIterator id="problem" list="<%=profileInfo.getTestSetAList()%>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name='problem' property='roundId' />,<screen:beanWrite name='problem' property='problemId' />')" CLASS="bodyText"><screen:beanWrite name='problem' property='problemName' /></A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='divisionDesc' /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='difficultyDesc' /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='algorithmicCategoryList' /></TD>
<%--		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='businessCategoryList' /></TD> --%>
	        </TR>
            </screen:problemInfoIterator>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>

<% if(testResultsInfo.getProblemSetBCount() > 0){ %>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Problem Set B</B></TD>
           </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Categories</B></TD>
<%--		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD> --%>
	        </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
            <screen:problemInfoIterator id="problem" list="<%=profileInfo.getTestSetBList()%>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name='problem' property='roundId' />,<screen:beanWrite name='problem' property='problemId' />')" CLASS="bodyText"><screen:beanWrite name='problem' property='problemName' /></A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='divisionDesc' /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='difficultyDesc' /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='algorithmicCategoryList' /></TD>
<%--		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='businessCategoryList' /></TD> --%>
	        </TR>
            </screen:problemInfoIterator>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>
<% } // getProblemSetBCount() > 0 %>
<% } // !isSessionComplete() %>

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
