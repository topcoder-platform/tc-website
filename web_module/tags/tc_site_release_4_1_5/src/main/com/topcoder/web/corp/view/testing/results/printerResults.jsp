<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.List,
                 com.topcoder.web.corp.model.ProblemInfo,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.corp.model.SubmissionInfo,
                 com.topcoder.shared.language.JavaLanguage,
                 java.util.TimeZone" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<html>
<head>
<title>Topcoder | Technical Assessment Application Management Tool</title>

<jsp:include page="../includes/script.jsp" />

</head>

<jsp:useBean id="testSessionInfo" class="com.topcoder.web.corp.model.TestSessionInfo" scope="request" />
<jsp:useBean id="candidateInfo" class="com.topcoder.web.corp.model.CandidateInfo" scope="request"/>
<jsp:useBean id="profileInfo" class="com.topcoder.web.corp.model.ProfileInfo" scope="request"/>
<jsp:useBean id="testResultsInfo" class="com.topcoder.web.corp.model.TestResultsInfo" scope="request"/>

<body>

<!-- Header begins -->
<a name="top"></a>


<SCRIPT LANGUAGE="JavaScript">
<!--
var MM_contentVersion = 6;
var MM_FlashCanPlay = false;
var plugin = (navigator.mimeTypes
              && navigator.mimeTypes["application/x-shockwave-flash"])
            ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
if ( plugin ) {
  var words = navigator.plugins["Shockwave Flash"].description.split(" ");
  for (var i = 0; i < words.length; ++i) {
    if (isNaN(parseInt(words[i])))
      continue;
    var MM_PluginVersion = words[i];
  }
  MM_FlashCanPlay = MM_PluginVersion >= MM_contentVersion;
} else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0
           && (navigator.appVersion.indexOf("Win") != -1)) {
  document.write('<SCR' + 'IPT LANGUAGE=VBScript\> \n');
  document.write('on error resume next \n');
  document.write('MM_FlashCanPlay = ( IsObject(CreateObject');
  document.write('("ShockwaveFlash.ShockwaveFlash." & MM_contentVersion)))\n');
  document.write('</SCR' + 'IPT\> \n');
}
//-->
</SCRIPT>


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
        <td><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="50%"></td>
        <td align="center"><img src="/i/corp/clear.gif" width="700" height="11" alt="" border="0"><br>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class="bodyText">
                        <p class="testHead"><%=testResultsInfo.isSessionComplete()?"Test Results":"Test Details"%></p>
                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr>
                    <td class="bodyText">
                        <strong>Candidate:</strong> <jsp:getProperty name="candidateInfo" property="userName"/>
                       </td>
	        </tr>
<%if( request.getAttribute(Constants.USAGE_TYPE) != null && ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_SCREENING) { %>
	        <tr>
                    <td class="bodyText">
                        <strong>Preference Level:</strong>
                        <SCRIPT language="JavaScript">
                        <!--
                        if ( MM_FlashCanPlay ) {
                            document.write(' <object ');
                            document.write(' classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
                            document.write(' codebase="http://fpdownload.macromedia.com" ');
                            document.write('/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
                            document.write(' width="80" ');
                            document.write(' height="12" ');
                            document.write(' id="tc_card" ');
                            document.write(' align="middle">');
                            document.write(' <param name="allowScriptAccess" value="sameDomain" />');
                            document.write(' <param name="movie" ');
                            document.write(' value="/i/corp/screeningRatingOdd.swf?preference=<jsp:getProperty name="candidateInfo" property="preference"/>&sendurl=/corp/testing?module=UpdatePreference&userId=<%=request.getAttribute(Constants.USER_ID)%>&cid=<jsp:getProperty name="candidateInfo" property="userId"/>"/>');
                            document.write(' <param name="menu" value="false" />');
                            document.write(' <param name="quality" value="high" />');
                            document.write(' <param name="bgcolor" value="#ffffff" />');
                            document.write(' <embed ');
                            document.write(' src="/i/corp/screeningRatingOdd.swf?preference=<jsp:getProperty name="candidateInfo" property="preference"/>&sendurl=/corp/testing?module=UpdatePreference&userId=<%=request.getAttribute(Constants.USER_ID)%>&cid=<jsp:getProperty name="candidateInfo" property="userId"/>" ');
                            document.write(' menu="false" ');
                            document.write(' quality="high" ');
                            document.write(' bgcolor="#ffffff" ');
                            document.write(' width="80" ');
                            document.write(' height="12" ');
                            document.write(' name="tc_card" ');
                            document.write(' align="middle" ');
                            document.write(' allowScriptAccess="sameDomain" ');
                            document.write(' type="application/x-shockwave-flash" ');
                            document.write(' pluginspage="http://www.macromedia.com/go/getflashplayer" /> ');
                            document.write(' </object> ');
                        }
                        // -->
                        </SCRIPT>
                    </td>
	        </tr>
	        <% } %>
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
                        <strong>Begin:</strong> <screen:beanWrite name='testSessionInfo' property='beginDate' format='MM/dd/yyyy hh:mm a z' timeZone="<%=((TimeZone)request.getAttribute(Constants.TIMEZONE)).getID()%>"/>
                    </td>
	        </tr>
                <tr>
                    <td class="bodyText">
                        <strong>End:</strong> <screen:beanWrite name='testSessionInfo' property='endDate' format='MM/dd/yyyy hh:mm a z' timeZone="<%=((TimeZone)request.getAttribute(Constants.TIMEZONE)).getID()%>"/>
                    </td>
	        </tr>
	    </table>


   <% boolean even = false; %>
   <% if(testResultsInfo.isSessionComplete()) { %>

     <% if (profileInfo.hasTestSetA()) { %>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
	        <tr>
		       <td colspan="8" class="screeningTitle">Test Set A Results:</td>
	        </tr>

	        <tr>
		       <td width="15%" class="screeningHeader">Problem</td>
		       <td width="15%" align="center" class="screeningHeader">Language</td>
		       <td width="15%" align="center" class="screeningHeader">Status</td>
		       <td width="15%" align="center" class="screeningHeader">Test Passed</td>
		       <td width="15%" align="center" class="screeningHeader">Test Failed</td>
		       <td width="15%" align="center" class="screeningHeader">% Test Passed</td>
		       <td width="11%" align="center" class="screeningHeader">Points</td>
		       <td width="15%" align="center" class="screeningHeader">Time</td>
                </tr>

                <rsc:iterator id="row" list="<%=testResultsInfo.getProblemSetAResults()%>">
                <tr>
		       <td class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="problem_name" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="language_name" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="status_desc" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="num_succeeded" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="num_failed" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="pct_passed" />%</td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="points" format="#.##" ifNull="N/A" /></td>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="elapsed" /></td>
                </tr>
                <% even = !even; %>
                </rsc:iterator>
            </table>


            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
	        <TR>
		       <TD COLSPAN="10" VALIGN="top" CLASS="screeningTitle">TopCoder Stats</TD>
	        </TR>
	        <TR>
		       <TD WIDTH="10%" CLASS="screeningHeader"><B>Name</B></TD>
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
		       <TD ALIGN="center" CLASS="bodyText" colspan='10'>No statistics available for this round.</TD>
	             </TR>
                <% } else{ even = false; %>
                   <rsc:iterator id="row" list="<%=testResultsInfo.getProblemSetATCStats()%>">
	             <TR>
		       <TD CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="name" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="division_desc" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="level_desc" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="submissions" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="submit_pct" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="correct" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="submit_pct_correct" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="overall_pct_correct" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="avg_points" format="#.##"/></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="time_elapsed" /></TD>
	             </TR>
                     <% even = !even; %>
                   </rsc:iterator>
                <% } %>
         </table>

              <% } //has test set a %>
    <% if(testResultsInfo.getProblemSetBCount() > 0){ %>
            <%if( request.getAttribute(Constants.USAGE_TYPE) != null && ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_SCREENING) { %>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
	        <TR>
                       <TD COLSPAN="7" VALIGN="top" CLASS="screeningTitle">Problem Statistics:</TD>
	        </TR>
	        <TR>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Problem</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B># Submissions</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Submission %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B># Correct</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Sub. Correct %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Overall Correct %</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Avg. Time</B></TD>
	        </TR>
                <% { even = false; %>
                   <rsc:iterator id="row" list="<%=testResultsInfo.getProblemSetBStats()%>">
	             <TR>
		       <TD CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="name" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="submission_count" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="submission_percent" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="num_correct" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="submit_correct_percent" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="overall_correct_percent" />%</TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="avg_time" /></TD>
	             </TR>
                     <% even = !even; %>
                   </rsc:iterator>
                <% } %>
	        </table>

	        <% } %>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
	        <TR>
       	        <% if( request.getAttribute(Constants.USAGE_TYPE) != null &&  ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_SCREENING) { %>
		       <TD COLSPAN="5" VALIGN="top" CLASS="screeningTitle">Test Set B Results:</TD>
		<% } else { %>
                       <TD COLSPAN="7" VALIGN="top" CLASS="screeningTitle">Test Set B Results:</TD>
		<% } %>

	        </TR>
	        <TR>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Problem</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Language</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Status</B></TD>
		       <%if( request.getAttribute(Constants.USAGE_TYPE) == null || ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_TESTING) { %>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Test Passed</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Test Failed</B></TD>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>% Test Passed</B></TD>
		       <% } %>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Time</B></TD>
		       <% if( request.getAttribute(Constants.USAGE_TYPE) != null &&  ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_SCREENING) { %>
		       <TD ALIGN="center" WIDTH="10%" CLASS="screeningHeader"><B>Percentile</B></TD>
                       <% } %>
	        </TR>
                <% { even = false; %>
                   <rsc:iterator id="row" list="<%=testResultsInfo.getProblemSetBResults()%>">
	             <TR>
		       <TD CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="problem_name" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="language_name" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="status_desc" /></TD>
		       <%if( request.getAttribute(Constants.USAGE_TYPE) == null || ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_TESTING) { %>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="num_succeeded" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="num_failed" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="pct_passed" />%</TD>
		       <% } %>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=row%>" name="elapsed" /></TD>
		       <% if( request.getAttribute(Constants.USAGE_TYPE) != null &&  ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_SCREENING) { %>
		       <td align="center" class="<%=even?"screeningCellEven":"screeningCellOdd"%>"><%= testResultsInfo.getProblemSetBPrecentiles().get( String.valueOf( row.getLongItem("problem_id") ) ) %>%</td>
		       <% } %>
	             </TR>
                     <% even = !even; %>
                   </rsc:iterator>
                <% } %>
	        </table>
    <% } // getProblemSetBCount() > 0 %>

            <% ResultSetContainer notes = (ResultSetContainer)request.getAttribute("noteList"); %>

            <% if (!notes.isEmpty()) { %>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <TR>
                   <TD COLSPAN="3" VALIGN="top" CLASS="screeningTitle">Notes:</TD>
                </TR>
                <tr>
                    <td width="70%" class="screeningHeader">Note</td>
                    <td width="15%" align="center" class="screeningHeader">Author</td>
                    <td width="15%" align="center" class="screeningHeader">Date Created</td>
                </tr>

                <% even = false; %>
                <rsc:iterator id="row" list="<%=notes%>">
                <tr>
                    <td <% if(even){ %>class="screeningCellEven"<% } else { %>class="screeningCellOdd"<% } %>><%=StringUtils.htmlEncode((String)row.getItem("text").getResultData())%></td>
                    <td align="center" <% if(even){ %>class="screeningCellEven"<% } else { %>class="screeningCellOdd"<% } %>><rsc:item row="<%=row%>" name="created_by" /></td>
                    <td align="center" <% if(even){ %>class="screeningCellEven"<% } else { %>class="screeningCellOdd"<% } %>><rsc:item row="<%=row%>" name="create_date" /></td>
                </tr>
                <% even = !even; %>
                </rsc:iterator>
              </table>

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
		            <td class="screeningCellOdd"><screen:problemStatement text="<%=problem.getProblemStatement()%>" language="<%=JavaLanguage.JAVA_LANGUAGE%>" styleClass="bodyText"/></td>
<%--
		            <td class="screeningCellOdd"><screen:problemStatement text="<%=problem.getProblemStatement()%>" language="Java" styleClass="bodyText"/></td>
--%>
                  </tr>
                  <tr><td><br/></td></tr>
                  </table>

                  <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
                  <tr>
		            <td class="screeningCellOdd">
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
		            <td class="screeningCellOdd"><screen:problemStatement text="<%=problem.getProblemStatement()%>" language="<%=JavaLanguage.JAVA_LANGUAGE%>" styleClass="bodyText"/></td>
<%--
		            <td class="screeningCellOdd"><screen:problemStatement text="<%=problem.getProblemStatement()%>" language="Java" styleClass="bodyText"/></td>
--%>
                  </tr>
                  <tr><td><br/></td></tr>
                  </table>

                  <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
                  <tr>
		            <td class="screeningCellOdd">
                     <h3><%=solution.isCompiled()?"Compilation":"Solution"%></h3><br/>
                     <%--this should really get plugged into the formatter object --%>
                     <PRE><%=StringUtils.htmlEncode(solution.getCode())%></PRE>
                    </td>
                  </tr>
                  <tr><td><br/></td></tr>
                  </table>
              <% } %>

<% } //isSessionComplete %>
        <p><br/></p>

        </td>
        <td width="50%"></td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/foot.jsp" />

</body>
</html>
