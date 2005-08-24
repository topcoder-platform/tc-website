<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.JSPUtils,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>

<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
function openWnd(pageUrl) {
  var width = screen.availWidth * 2 / 3;
  var height = screen.availHeight / 2;
  var left = (screen.availWidth - width) / 2;
  var top = 0;
  OpenWin=this.open(pageUrl,"CtrlWindow",
            "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes"
            + ",width=" + width + ",height=" + height
            + ",left=" + left + ",top=" + top);
}
// End -->
</SCRIPT>

<jsp:useBean id="ProblemStatisticsTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.ProblemStatisticsTask" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<style type="text/css">
.code
{
	width: 100%;
	padding: 10px;
	margin: 0px;
	color: #333;
	font-size: 12px;
	font-weight: normal;
	line-height: 14px;
	background-color: #EEEEEE;
	border: 1px solid #999;
}

</style>
<TITLE>TopCoder | Recruiting Reports</TITLE>
<jsp:include page="script.jsp"/>
</HEAD>
<body>
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>

<table width=100% border=0 cellpadding=0 cellspacing=0 align=center>
	<TR valign="top">
		<td width="50%"><jsp:include page="left.jsp" /></td>
<!-- Center Column Begins -->
        <td class=recruitingBody>
			<img src="/i/corp/clear.gif" width="700" height="11" alt="" border=0><br/>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class=bodyText>
					<p>
					<tces:trailIterator id="trailItem" trailList="<%=ProblemStatisticsTask.getTrail()%>">
					<A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
					</tces:trailIterator>
					<A HREF="<jsp:getProperty name="ProblemStatisticsTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemStatisticsTask.getMemberID()%>" >Problem Submissions</A> &gt;
					<br/>
					<span class=testHead>Problem Statistics: <jsp:getProperty name="ProblemStatisticsTask" property="handle"/></span>
					<br/><br/>
					<B>Problem Name:</B> <%= ProblemStatisticsTask.getStatistic("class_name") %>
					<br/>
					<B>Division:</B> <%= ProblemStatisticsTask.getStatistic("division_desc") %>
					<br/>
					<B>Problem Level:</B> <%= ProblemStatisticsTask.getStatistic("level_desc") %>
					<br/>
					<B>Event Name:</B> <%= ProblemStatisticsTask.getStatistic("contest_name") %>
					<br/>
					<B># of Competitors:</B> <%= ProblemStatisticsTask.getStatistic("problems_presented") %>

		              <p>
		                <A HREF="javascript:openWnd('<%=sessionInfo.getServletPath()%>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_STATEMENT_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemStatisticsTask.getMemberID()%>&<%=TCESConstants.PROBLEM_ID_PARAM%>=<%=ProblemStatisticsTask.getProblemID()%>&<%=TCESConstants.ROUND_ID_PARAM%>=<%=ProblemStatisticsTask.getRoundId()%>')" class="bodyText">
		                  View Problem Statement
		                </A>
		              </P>
					</td>
				</tr>
			</table>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
				<tr><td class=screeningTitle colspan=10>Overall Submission Statistics: <%= ProblemStatisticsTask.getStatistic("class_name") %></td></tr>
                <TR>
                  <TD class="screeningHeader"><b>Language</b></TD>
                  <TD class="screeningHeader" align=center>Presented</TD>
                  <TD class="screeningHeader" align=center>Submitted</TD>
                  <TD class="screeningHeader" align=center>Submit %</TD>
                  <TD class="screeningHeader" align=center>Correct</TD>
                  <TD class="screeningHeader" align=center>Submission<br/>Accuracy</TD>
                  <TD class="screeningHeader" align=center>Overall<br/>Accuracy</TD>
                  <TD class="screeningHeader" align=center>Avg. Pts. for<br/>Correct Subs.</TD>
                  <TD class="screeningHeader" align=center>Avg Points<br/>Overall</TD>
                  <TD class="screeningHeader" align=center>Avg. Time for<br/>Correct Subs.</TD>
                </TR>



				<%
				int i=0;
				%>
	                <tces:rowIterator id="language" rowList="<%=(List)ProblemStatisticsTask.getProblemStatsByLanguage()%>">
					<%
					i++;
					%>
                  <TR>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">
                        <nobr><b><%= language.getItem("language_name").toString() %></b></nobr>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= language.getItem("problems_presented").toString() %>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= language.getItem("submitted").toString() %>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= JSPUtils.autoFormat(language.getItem("submit_percent")) %>%
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= language.getItem("correct").toString() %>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= JSPUtils.autoFormat(language.getItem("submission_accuracy")) %>%
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= JSPUtils.autoFormat(language.getItem("overall_accuracy")) %>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= JSPUtils.autoFormat(language.getItem("avg_submission_points")) %>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= JSPUtils.autoFormat(language.getItem("avg_final_points")) %>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right nowrap=nowrap>
                        <%= JSPUtils.timeFormat(language.getItem("avg_time_elapsed")) %>
                    </TD>
                  </TR>
                </tces:rowIterator>

					<%
					i++;
					%>
                  <TR>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">
                        <b>All</b>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= ProblemStatisticsTask.getStatistic("problems_presented") %>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= ProblemStatisticsTask.getStatistic("problems_submitted") %>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= ProblemStatisticsTask.getStatistic("submit_percent") %>%
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= ProblemStatisticsTask.getStatistic("problems_correct") %>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= ProblemStatisticsTask.getStatistic("submission_accuracy") %>%
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= ProblemStatisticsTask.getStatistic("overall_accuracy") %>%
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= ProblemStatisticsTask.getStatistic("avg_submission_points") %>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
                        <%= ProblemStatisticsTask.getStatistic("average_points") %>
                    </TD>
                    <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right nowrap=nowrap>
                        <%= JSPUtils.timeFormat(ProblemStatisticsTask.getProblemStats().getItem("avg_time_elapsed")) %>
                    </TD>
                  </TR>
            </table>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
				<tr>
					<td class=bodyText>
					<span class=bodySubtitle>Coder Statistics: <%= ProblemStatisticsTask.getHandle() %></span><br/>
					<strong>Status:</strong> <%= ProblemStatisticsTask.getStatistic("end_status_text") %><br/>
					<strong>Time to Submit:</strong> <%= JSPUtils.timeFormat(ProblemStatisticsTask.getProblemStats().getItem("time_elapsed")) %><br/>
					<strong>Points:</strong> <%= ProblemStatisticsTask.getStatistic("final_points") %>
					<br/><br/>
					<strong>Coder Submission Source Code:</strong>
					<br/><br/>
					<PRE><%= JSPUtils.htmlEncode(ProblemStatisticsTask.getStatistic("submission_text")) %></PRE>
					<p><br/></p>
					</TD>
				</TR>
			</table>
		</td>
		<td class=homeRightPromos width="50%"><jsp:include page="right.jsp" /></td>
	</tr>
</table>

<!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->

  </BODY>
</HTML>
