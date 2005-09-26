<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.JSPUtils,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CompetitionStatisticsTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.CompetitionStatisticsTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Recruiting Reports</TITLE>
    <jsp:include page="script.jsp" />

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
					<p align=left>
					<tces:trailIterator id="trailItem" trailList="<%=CompetitionStatisticsTask.getTrail()%>">
					<A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
					</tces:trailIterator>
					<A HREF="<jsp:getProperty name="CompetitionStatisticsTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionStatisticsTask.getMemberID()%>" >Problem Submissions</A> &gt;
					<br/>
					<span class=testHead>Competition Statistics: <jsp:getProperty name="CompetitionStatisticsTask" property="handle"/></span>


				<br/><br/>
				<B>Competition:</B> <%= CompetitionStatisticsTask.getStatistic("contest_name") %>
				<br/>
				<B>Division:</B> <%= CompetitionStatisticsTask.getStatistic("division_desc") %>
				</p>
					</td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
				<TR valign='top'>
					<TD width='50%'>
				<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
					<TR>
						<TD class=screeningHeader colspan=2>Individual: <jsp:getProperty name="CompetitionStatisticsTask" property="handle"/></TD>
					</TR>
					<TR>
						<TD class=bodyText><B>Score</B></TD>
						<TD class=bodyText align=right><%= CompetitionStatisticsTask.getStatistic("final_points") %></TD>
					</TR>
					<TR>
						<TD class=bodyText><B># Std. Deviations</B></TD>
						<TD class=bodyText align=right><%= CompetitionStatisticsTask.getStatistic("point_standard_deviation") %></TD>
					</TR>
					<TR>
						<TD class=bodyText><B># Submissions</B></TD>
						<TD class=bodyText align=right><%= CompetitionStatisticsTask.getStatistic("problems_submitted") %></TD>
					</TR>
					<TR>
						<TD class=bodyText><B># Correct</B></TD>
						<TD class=bodyText align=right><%= CompetitionStatisticsTask.getStatistic("problems_correct") %></TD>
					</TR>
				</TABLE>
					</TD>
				<td><img src="/i/corp/clear.gif" width="40" height="1" border=0></td>
				<TD width='50%'>
					<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
					<TR>
						<TD class=screeningHeader colspan='2'>Overall</TD>
					</TR>
					<TR>
						<TD class=bodyText><b># of Competitors</b></TD>
						<TD class=bodyText align=right><%= CompetitionStatisticsTask.getStatistic("num_competitors") %></TD>
					</TR>
					<TR>
						<TD class=bodyText><b>Average Score</b></TD>
						<TD class=bodyText align=right><%= CompetitionStatisticsTask.getStatistic("overall_avg_points") %></TD>
					</TR>
					<TR>
						<TD class=bodyText><b>Std. Deviation</b></TD>
						<TD class=bodyText align=right><%= CompetitionStatisticsTask.getStatistic("overall_std_dev") %></TD>
					</TR>
					<TR>
						<TD class=bodyText><b># Submissions</b></TD>
						<TD class=bodyText align=right><%= CompetitionStatisticsTask.getStatistic("overall_problems_submitted") %></TD>
					</TR>
					<TR>
						<TD class=bodyText><b>Percent Correct</b></TD>
						<TD class=bodyText align=right><%= CompetitionStatisticsTask.getStatistic("overall_submission_accuracy") %>%</TD>
					</TR>
					</TABLE>
				</TD>
			</TR>
			</TABLE>

			<p align=left><b>Competition Stats by Level</B></P>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
				<tr><td class=screeningTitle colspan=5>Individual Stats</td></tr>
				<TR>
					<TD class="screeningHeader">&#160;</TD>
					<TD class="screeningHeader">Status</TD>
					<TD class="screeningHeader" align=right>Points</TD>
					<TD class="screeningHeader" align=right>Time to Submit</TD>
					<TD class="screeningHeader">Language</TD>
				</TR>

				<%
				int i=0;
				%>
					<tces:rowIterator id="level" rowList="<%=(List)CompetitionStatisticsTask.getCoderStatsByLevel()%>">
					<%
					i++;
					%>
				<TR>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><A HREF="<jsp:getProperty name="CompetitionStatisticsTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionStatisticsTask.getMemberID()%>&<%=TCESConstants.PROBLEM_ID_PARAM%>=<%= level.getItem("problem_id").toString() %>&<%=TCESConstants.ROUND_ID_PARAM%>=<%=level.getItem("round_id").toString()%>" class="bodyText">
					<b><%= level.getItem("level_desc").toString() %></b>
					</A>
					</TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= level.getItem("end_status_text").toString() %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= level.getItem("final_points").toString() %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right>
					<% int statusID=Integer.parseInt(level.getItem("end_status_id").toString()); %>
					<%= (statusID==TCESConstants.PROBLEM_STATUS_OPEN || statusID==TCESConstants.PROBLEM_STATUS_COMPILED)?"N/A":JSPUtils.timeFormat(level.getItem("time_elapsed")) %>
					</TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= level.getItem("language_name").toString() %></TD>
				</TR>
				</tces:rowIterator>
			</TABLE>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
				<tr><td class=screeningTitle colspan=10>Overall Stats</td></tr>
				<TR>
					<TD class="screeningHeader" width="7%">&#160;</TD>
					<TD class="screeningHeader" width="7%" align=center><b>Presented</b></TD>
					<TD class="screeningHeader" width="7%" align=center><b>Submitted</b></TD>
					<TD class="screeningHeader" width="7%" align=center><b>Submit %</b></TD>
					<TD class="screeningHeader" width="7%" align=center><b>Correct</b></TD>
					<TD class="screeningHeader" width="13%" align=center><b>Submission<br/>Accuracy</b></TD>
					<TD class="screeningHeader" width="13%" align=center><b>Overall<br/>Accuracy</b></TD>
					<TD class="screeningHeader" width="13%" align=center><b>Avg Points for<br/>Submissions</b></TD>
					<TD class="screeningHeader" width="13%" align=center><b>Avg Points<br/>Overall</b></TD>
					<TD class="screeningHeader" width="13%" align=center><b>Avg Time<br/>to Submit</b></TD>
				</TR>
				<%
				i=0;
				%>
					<tces:rowIterator id="level" rowList="<%=CompetitionStatisticsTask.getOverallStatsByLevel()%>">
					<%
					i++;
					%>
				<TR>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap><b><%= level.getItem("level_desc").toString() %></b></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= level.getItem("problems_presented").toString() %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= level.getItem("problems_submitted").toString() %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("submit_percent")) %>%</TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= level.getItem("problems_correct").toString() %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("submission_accuracy")) %>%</TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("overall_accuracy")) %>%</TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("avg_submission_points")) %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= level.getItem("average_points").toString() %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right nowrap=nowrap><%= JSPUtils.timeFormat(level.getItem("avg_time_elapsed")) %></TD>
				</TR>
				</tces:rowIterator>
					<%
					i++;
					%>
				<TR>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><b>All</b></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= CompetitionStatisticsTask.getStatistic("overall_problems_presented") %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= CompetitionStatisticsTask.getStatistic("overall_problems_submitted") %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= CompetitionStatisticsTask.getStatistic("overall_submit_percent") %>%</TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= CompetitionStatisticsTask.getStatistic("overall_problems_correct") %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= CompetitionStatisticsTask.getStatistic("overall_submission_accuracy") %>%</TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= CompetitionStatisticsTask.getStatistic("overall_accuracy") %>%</TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= CompetitionStatisticsTask.getStatistic("overall_points_per_submission") %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= CompetitionStatisticsTask.getStatistic("overall_points_per_problem") %></TD>
					<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right nowrap=nowrap><%= JSPUtils.timeFormat(CompetitionStatisticsTask.getCompetitionStats().getItem("overall_time_per_problem")) %></TD>
				</TR>
			</TABLE>
			<p align=left><br/></P>
			</TD>
<!-- Body Ends -->
		<td class=homeRightPromos width="50%"><jsp:include page="right.jsp" /></td>
	</TR>
</TABLE>
<!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->
</BODY>
</HTML>
