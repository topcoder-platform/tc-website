<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants,
                 com.topcoder.web.common.StringUtils" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<HTML>
<HEAD>

<title>Topcoder&#160;&#160;|&#160;&#160;Technical Assessment Application Management Tool</title>

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
        <td width="50%"></td>
        <td align="center"><img src="/i/corp/clear.gif" width="700" height="11" alt="" border="0"><br>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class="bodyText">
            <p class="testHead">Problem Results</p>
            <P>Below are the submitted code and system test results for the candidate.  Clicking on the point value in the Top TopCoder
            Solutions table opens a window that displays the submitted code and system test results for the highest TopCoder point-getter.</P>
                    </td>
                </tr>
            </table>


            <FORM>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
	        <TR>
		       <TD VALIGN="top" CLASS="bodyText">
                           <B>Candidate:</B> <screen:servletLink processor="PopulateCandidate" param="<%=Constants.CANDIDATE_ID+'='+candidateInfo.getUserId()%>" styleClass="bodyText"><jsp:getProperty name="candidateInfo" property="userName"/></screen:servletLink>
                       </TD>
	        </TR>
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
                            document.write(' value="/i/corp/screeningRatingOdd.swf?preference=<jsp:getProperty name="candidateInfo" property="preference"/>&sendurl=/corp/testing/?module=UpdatePreference&userId=<%=request.getAttribute(Constants.USER_ID)%>&cid=<jsp:getProperty name="candidateInfo" property="userId"/>"/>');
                            document.write(' <param name="menu" value="false" />');
                            document.write(' <param name="quality" value="high" />');
                            document.write(' <param name="bgcolor" value="#ffffff" />');
                            document.write(' <embed ');
                            document.write(' src="/i/corp/screeningRatingOdd.swf?preference=<jsp:getProperty name="candidateInfo" property="preference"/>&sendurl=/corp/testing/?module=UpdatePreference&userId=<%=request.getAttribute(Constants.USER_ID)%>&cid=<jsp:getProperty name="candidateInfo" property="userId"/>" ');
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

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
           <TR>
              <TD align="left" CLASS="screeningTitle">&#160;Code:</TD>
           </TR>
           <TR>
              <TD CLASS="screeningCellOdd" VALIGN="top">
              <PRE><%=StringUtils.htmlEncode(submissionInfo.getCode())%></PRE>
              </TD>
           </TR>
         </table>

         <p></p>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
           <TR>
              <TD COLSPAN="5" CLASS="screeningTitle"><B>System Test</B></TD>
           </TR>
	        <TR>
		       <TD ALIGN="left" CLASS="screeningHeader">Args</TD>
		       <TD ALIGN="center" CLASS="screeningHeader">Expected</TD>
		       <TD ALIGN="center" CLASS="screeningHeader">Received</TD>
		       <TD ALIGN="center" CLASS="screeningHeader">Status</TD>
               <TD ALIGN="center" CLASS="screeningHeader">Processing Time (ms)</TD>
	        </TR>
            <% boolean even = false; %>
           <rsc:iterator id="testResult" list="<%= submissionInfo.getTestResults() %>">
	        <TR>
		       <TD ALIGN="left" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><%=StringUtils.htmlEncode((String)testResult.getItem("args").getResultData())%></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><%=StringUtils.htmlEncode((String)testResult.getItem("expected_result").getResultData())%></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><%=StringUtils.htmlEncode((String)testResult.getItem("received").getResultData())%></TD>
		       <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=testResult%>" name="status" /></TD>
               <TD ALIGN="center" CLASS="<%=even?"screeningCellEven":"screeningCellOdd"%>"><rsc:item row="<%=testResult%>" name="processing_time" /></TD>
	        </TR>
            <% even = !even; %>
           </rsc:iterator>
           <% if(submissionInfo.getTestResults().isEmpty()){ %>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="screeningCellOdd" colspan="5">
                           No system tests were performed on this problem.
                       </TD>
	        </TR>
           <% } %>
         </table>

         <p></p>
         <% if( request.getAttribute(Constants.USAGE_TYPE) == null || ((Long)request.getAttribute(Constants.USAGE_TYPE)).longValue() == Constants.USAGE_TYPE_TESTING) { %>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
           <TR>
              <TD COLSPAN="4" CLASS="screeningTitle">Top TopCoder Solutions</TD>
           </TR>
	        <TR>
		       <TD ALIGN="center" CLASS="screeningHeader">Points</TD>
		       <TD ALIGN="center" CLASS="screeningHeader">Division</TD>
		       <TD ALIGN="center" CLASS="screeningHeader">Difficulty</TD>
		       <TD ALIGN="center" CLASS="screeningHeader">Algorithmic Categories</TD>
	        </TR>
           <rsc:iterator id="solution" list="<%= submissionInfo.getTopTCSolutions() %>">
	        <TR>
		       <TD ALIGN="center" HEIGHT="15" CLASS="screeningCellOdd">
                           <A HREF="JavaScript:getTCProblemResults('<rsc:item row="<%=solution%>" name="coder_id" />','<rsc:item row="<%=solution%>" name="round_id" />','<rsc:item row="<%=solution%>" name="problem_id" />')" CLASS="screeningCellOdd">
                               <rsc:item row="<%=solution%>" name="final_points" />
                           </A>
                       </TD>
		       <TD ALIGN="center" CLASS="screeningCellOdd"><rsc:item row="<%=solution%>" name="division_desc" /></TD>
		       <TD ALIGN="center" CLASS="screeningCellOdd"><rsc:item row="<%=solution%>" name="level_desc" /></TD>
		       <TD ALIGN="center" CLASS="screeningCellOdd"><jsp:getProperty name="problemInfo" property="algorithmicCategoryList" /></TD>
	        </TR>
           </rsc:iterator>
           <% if(submissionInfo.getTopTCSolutions().isEmpty()){ %>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="screeningCellOdd" colspan='5'>
                           No TopCoder solutions available for this problem.
                       </TD>
	        </TR>
           <% } %>
         </TABLE>
         <% } %>
</FORM>
            <p><br></p>
        </td>
        <td width="50%"></td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../../foot.jsp" />

</body>
</html>
