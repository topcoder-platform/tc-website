<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<TITLE>TopCoder - Candidate Evaluation</TITLE>
<jsp:include page="/script.jsp"/>
<SCRIPT TYPE="text/javascript">
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
</SCRIPT>
</HEAD>

<jsp:useBean id="candidateInfo" class="com.topcoder.web.screening.model.CandidateInfo" />
<jsp:useBean id="profileInfo" class="com.topcoder.web.screening.model.ProfileInfo" />
<jsp:useBean id="testResultsInfo" class="com.topcoder.web.screening.model.TestResultsInfo" />

<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="/includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="22" VALIGN="top" BGCOLOR="#000000">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="/includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <TD CLASS="statTextBig" width="100%" valign="top"><img src="/i/ev/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
            <h1 class="testHead">Test Results</h1>
            <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
                <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="bodyText">
<% String params = Constants.CANDIDATE_ID + '=' + candidateInfo.getUserId() + "&referrer=TestResults";%>
                           <B>Candidate:</B> <screen:servletLink processor="PopulateCandidate" param="<%=params%>" styleClass="bodyText"><jsp:getProperty name="candidateInfo" property="emailAddress"/></screen:servletLink>
                       </TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="bodyText">
                           <B>Test Profile:</B> <jsp:getProperty name='profileInfo' property='profileName'/>
                       </TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="bodyText">
                           <B>Problem Set:</B> <jsp:getProperty name='profileInfo' property='testSetAName'/>
                       </TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10"></TD>
	        </TR>
<% if(testResultsInfo.isSessionComplete()) { %>
	        <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="bodyTextBold"><B>Test Set A Results:</B></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1"></TD>
	        </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Problem</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Language</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Status</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Test Passed</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Test Failed</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>% Test Passed</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Time</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666">&#160;</TD>
	        </TR>
                <% boolean even = true; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetAResults()%>">
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
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="30"></TD>
	        </TR>
<% } // isSessionComplete %>
	        </TABLE>

<% if(testResultsInfo.isSessionComplete()) { %>
	        <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
	        <TR>
		       <TD COLSPAN="10" VALIGN="top" CLASS="bodyTextBold"><B>TopCoder Stats</B></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="10"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1"></TD>
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
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="30"></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="bodyTextBold"><B>Test Set B Results:</B></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1"></TD>
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
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="30"></TD>
	        </TR>
	        </TABLE>
    <% } // getProblemSetBCount() > 0 %>
<% } else { //isSessionComplete %>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Problems</B></TD>
           </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Problem Set A</B></TD>
           </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Categories</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD>
	        </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
            <screen:problemInfoIterator id="problem" list="<%=profileInfo.getTestSetAList()%>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name='problem' property='roundId' />,<screen:beanWrite name='problem' property='problemId' />')" CLASS="bodyText"><screen:beanWrite name='problem' property='problemName' /></A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='divisionDesc' /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='difficultyDesc' /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='algorithmicCategoryList' /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='businessCategoryList' /></TD>
	        </TR>
            </screen:problemInfoIterator>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>

<% if(testResultsInfo.getProblemSetBCount() > 0){ %>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Problem Set B</B></TD>
           </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Categories</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD>
	        </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
            <screen:problemInfoIterator id="problem" list="<%=profileInfo.getTestSetBList()%>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name='problem' property='roundId' />,<screen:beanWrite name='problem' property='problemId' />')" CLASS="bodyText"><screen:beanWrite name='problem' property='problemName' /></A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='divisionDesc' /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='difficultyDesc' /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='algorithmicCategoryList' /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='businessCategoryList' /></TD>
	        </TR>
            </screen:problemInfoIterator>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>
<% } // getProblemSetBCount() > 0 %>
<% } // !isSessionComplete() %>

<P><BR/></P>
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>
