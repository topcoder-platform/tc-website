<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants,
                 com.topcoder.web.common.StringUtils" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>

<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp"/>
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
function getTCProblemResults(coderId, roundId, problemId) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    <% String tcurl = sessionInfo.getServletPath() + "?" + Constants.MODULE_KEY + "=TCProblemResult"; %>
    var params = '&<%=Constants.USER_ID%>=' + coderId +
                 '&<%=Constants.ROUND_ID%>=' + roundId +
                 '&<%=Constants.PROBLEM_ID%>=' + problemId;
    window.open('<%=tcurl%>'+params,name,cmd);
    return;
  }
</SCRIPT>
</HEAD>

<jsp:useBean id="submissionInfo" class="com.topcoder.web.corp.model.SubmissionInfo" />
<jsp:useBean id="candidateInfo" class="com.topcoder.web.corp.model.CandidateInfo" />
<jsp:useBean id="profileInfo" class="com.topcoder.web.corp.model.ProfileInfo" />
<jsp:useBean id="problemInfo" class="com.topcoder.web.corp.model.ProblemInfo" />

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
            <h1 class="testHead">Problem Results</h1>                
            <P>Below are the submitted code and system test results for the candidate.  Clicking on the point value in the Top TopCoder 
            Solutions table opens a window that displays the submitted code and system test results for the highest TopCoder point-getter.</P>
                    </td>
                </tr>
            </table>


            <FORM>
            <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
	        <TR>
		       <TD VALIGN="top" CLASS="bodyText">
                           <B>Candidate:</B> <screen:servletLink processor="PopulateCandidate" param="<%=Constants.CANDIDATE_ID+'='+candidateInfo.getUserId()%>" styleClass="bodyText"><jsp:getProperty name="candidateInfo" property="userName"/></screen:servletLink>
                       </TD>
	        </TR>
	        <TR>
		       <TD VALIGN="top" CLASS="bodyText">
                           <B>Test Profile:</B> <jsp:getProperty name='profileInfo' property='profileName'/>
                       </TD>
	        </TR>	                 
	        <TR>
		       <TD VALIGN="top" CLASS="bodyText">
                           <B>Problem Set:</B> <jsp:getProperty name='profileInfo' property='testSetAName'/>
                       </TD>
	        </TR>
	        <TR>
		       <TD VALIGN="top" CLASS="bodyText">
                           <B>Problem:</B> <A HREF="JavaScript:getProblemDetail('<jsp:getProperty name='problemInfo' property='roundId' />,<jsp:getProperty name='problemInfo' property='problemId' />')" CLASS="bodyText"><jsp:getProperty name='problemInfo' property='problemName'/></A>
                       </TD>
	        </TR>
	        <TR>
		       <TD><IMG src="/i/corp/clear.gif" WIDTH="1" HEIGHT="10"></TD>
	        </TR>
         </TABLE>

         <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
           <TR>
              <TD CLASS="testTableTitle">&#160;Code:</TD>
           </TR>
           <TR>
              <TD CLASS="testTableOdd" VALIGN="top">
              <PRE><%=StringUtils.htmlEncode(submissionInfo.getCode())%></PRE>
              </TD>
           </TR>
         </table>

         <p></p>

         <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
           <TR>
              <TD COLSPAN="4" CLASS="testTableTitle"><B>System Test</B></TD>
           </TR>
	        <TR>
		       <TD ALIGN="center" CLASS="testFormHeader">Args</TD>
		       <TD ALIGN="center" CLASS="testFormHeader">Expected</TD>
		       <TD ALIGN="center" CLASS="testFormHeader">Received</TD>
		       <TD ALIGN="center" CLASS="testFormHeader">Status</TD>
	        </TR>
            <% boolean even = false; %>
           <screen:resultSetRowIterator id="testResult" list="<%= submissionInfo.getTestResults() %>">
	        <TR>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><%=StringUtils.htmlEncode((String)testResult.getItem("args").getResultData())%></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><%=StringUtils.htmlEncode((String)testResult.getItem("expected_result").getResultData())%></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><%=StringUtils.htmlEncode((String)testResult.getItem("received").getResultData())%></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><screen:resultSetItem row="<%=testResult%>" name="status" /></TD>
	        </TR>
            <% even = !even; %>
           </screen:resultSetRowIterator>
           <% if(submissionInfo.getTestResults().isEmpty()){ %>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="testTableOdd" colspan='4'>
                           No system tests were performed on this problem.
                       </TD>
	        </TR>	        
           <% } %>
         </table>

         <p></p>

         <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
           <TR>
              <TD COLSPAN="4" CLASS="testTableTitle">Top TopCoder Solutions</TD>
           </TR>	        
	        <TR>
		       <TD ALIGN="center" CLASS="testFormHeader">Points</TD>
		       <TD ALIGN="center" CLASS="testFormHeader">Division</TD>
		       <TD ALIGN="center" CLASS="testFormHeader">Difficulty</TD>
		       <TD ALIGN="center" CLASS="testFormHeader">Algorithmic Categories</TD>
	        </TR>
           <screen:resultSetRowIterator id="solution" list="<%= submissionInfo.getTopTCSolutions() %>">
	        <TR>
		       <TD ALIGN="center" HEIGHT="15" CLASS="testTableOdd">
                           <A HREF="JavaScript:getTCProblemResults('<screen:resultSetItem row="<%=solution%>" name="coder_id" />','<screen:resultSetItem row="<%=solution%>" name="round_id" />','<screen:resultSetItem row="<%=solution%>" name="problem_id" />')" CLASS="testTableOdd">
                               <screen:resultSetItem row="<%=solution%>" name="final_points" />
                           </A>
                       </TD>
		       <TD ALIGN="center" CLASS="testTableOdd"><screen:resultSetItem row="<%=solution%>" name="division_desc" /></TD>
		       <TD ALIGN="center" CLASS="testTableOdd"><screen:resultSetItem row="<%=solution%>" name="level_desc" /></TD>
		       <TD ALIGN="center" CLASS="testTableOdd"><jsp:getProperty name="problemInfo" property="algorithmicCategoryList" /></TD>
	        </TR>
           </screen:resultSetRowIterator>
           <% if(submissionInfo.getTopTCSolutions().isEmpty()){ %>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="testTableOdd" colspan='5'>
                           No TopCoder solutions available for this problem.
                       </TD>
	        </TR>	        
           <% } %>
         </TABLE>                 
</FORM>         
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
