<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants,
                 com.topcoder.web.common.StringUtils" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>

<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp"/>

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
function getTCProblemResults(coderId, roundId, problemId) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    <% String tcurl = Constants.CONTROLLER_URL + "?" + Constants.REQUEST_PROCESSOR + "=TCProblemResult"; %>
    var params = '&<%=Constants.USER_ID%>=' + coderId +
                 '&<%=Constants.ROUND_ID%>=' + roundId +
                 '&<%=Constants.PROBLEM_ID%>=' + problemId;
    window.open('<screen:rewrite page="<%=tcurl%>" />'+params,name,cmd);
    return;
  }
</SCRIPT>
</HEAD>

<jsp:useBean id="submissionInfo" class="com.topcoder.web.screening.model.SubmissionInfo" />
<jsp:useBean id="candidateInfo" class="com.topcoder.web.screening.model.CandidateInfo" />
<jsp:useBean id="profileInfo" class="com.topcoder.web.screening.model.ProfileInfo" />
<jsp:useBean id="problemInfo" class="com.topcoder.web.screening.model.ProblemInfo" />

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
		       <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10"></TD>
	        </TR>                       
         </TABLE>           
            
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
           <TR>
              <TD CLASS="bodyText" VALIGN="middle" BGCOLOR="#CCCCCC" HEIGHT="15">&#160;<b>Code:</b></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" VALIGN="top">
              <PRE><%=StringUtils.htmlEncode(submissionInfo.getCode())%></PRE>
              </TD>
           </TR>           
           <TR>
              <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
         </TABLE>
          
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">                   
           <TR>
              <TD COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>                                
           <TR>
              <TD COLSPAN="3" CLASS="bodyText"><B>System Test</B></TD>
           </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Args</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Expected</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Received</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Status</B></TD>	        
	        </TR>
           <TR>
              <TD COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>	        
           <screen:resultSetRowIterator id="testResult" list="<%= submissionInfo.getTestResults() %>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=testResult%>" name="args" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=testResult%>" name="expected_result" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=testResult%>" name="received" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=testResult%>" name="status" /></TD>
	        </TR>	        
           <TR>
              <TD COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
           </screen:resultSetRowIterator>
           <% if(submissionInfo.getTestResults().isEmpty()){ %>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" colspan='4'>
                           No system tests were performed on this problem.
                       </TD>
	        </TR>	        
           <% } %>
         </TABLE>
         
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%"> 
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>                           
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Top TopCoder Solutions </B></TD>
           </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Points</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Categories</B></TD>
<%--		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD> --%>
	        </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>	        
           <screen:resultSetRowIterator id="solution" list="<%= submissionInfo.getTopTCSolutions() %>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;
                           <A HREF="JavaScript:getTCProblemResults('<screen:resultSetItem row="<%=solution%>" name="coder_id" />','<screen:resultSetItem row="<%=solution%>" name="round_id" />','<screen:resultSetItem row="<%=solution%>" name="problem_id" />')" CLASS="bodyText">
                               <screen:resultSetItem row="<%=solution%>" name="final_points" />
                           </A>
                       </TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=solution%>" name="division_desc" /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=solution%>" name="level_desc" /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="algorithmicCategoryList" /></TD>		       	        
<%--		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="businessCategoryList" /></TD> --%>
	        </TR>	        
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>          	        	        	        
           </screen:resultSetRowIterator>
           <% if(submissionInfo.getTopTCSolutions().isEmpty()){ %>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" colspan='5'>
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
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/includes/foot.jsp" />

</body>
</html>
