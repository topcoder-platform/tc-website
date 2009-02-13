<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.JSPUtils,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

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

<jsp:useBean id="MemberProfileTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.MemberProfileTask" />

<% ResultSetContainer MemberInfo = MemberProfileTask.getMemberInfo(); %>
<% ResultSetContainer MemberStats = MemberProfileTask.getMemberStats(); %>

<table width=100% border=0 cellpadding=0 cellspacing=0 align=center>
	<TR valign="top">
		<td width="50%"><jsp:include page="left.jsp" /></td>
		<!-- Center Column Begins -->
		<td class=recruitingBody>
		<img src="/i/corp/clear.gif" width="700" height="11" alt="" border=0><br/>
		<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
			<tr valign="top">
				<td class=bodyText colspan=2>
				<p>
				<tces:trailIterator id="trailItem" trailList="<%=MemberProfileTask.getTrail()%>">
				<A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
				</tces:trailIterator>
				<br/>
				<span class=testHead>Member Profile: <%= MemberInfo.getItem(0, "handle").toString()%> </span>
				<br/><br/>
				</td>
			</tr>
			<tr valign="top">
				<td class=bodyText width="50%">
				<strong>Name:</strong> <%= MemberInfo.getItem(0, "first_name").toString()%> <%= MemberInfo.getItem(0, "middle_name").toString()%> <%= MemberInfo.getItem(0, "last_name").toString()%><br/>
				<strong>Address:</strong><br/>
				<%= MemberInfo.getItem(0, "address1").toString()%><br/>
				<%= MemberInfo.getItem(0, "address2").toString().length()==0?"":MemberInfo.getStringItem(0, "address2")+"<br/>"%>
				<%= MemberInfo.getItem(0, "address3").toString().length()==0?"":MemberInfo.getStringItem(0, "address3")+"<br/>"%>
				<%= MemberInfo.getItem(0, "province").toString()%>
				<%= MemberInfo.getItem(0, "city").toString()%>,
				<%= MemberInfo.getItem(0, "state_code").toString()%>
				<%= MemberInfo.getItem(0, "zip").toString()%>
				<%= MemberInfo.getItem(0, "country_name").toString()%>
				<br/>
				<strong>Email:</strong> <A HREF="mailto:<%=MemberInfo.getStringItem(0, "email")%>" class="bodyText"><%= MemberInfo.getStringItem(0, "email")%></A><br/>
				<strong>Phone:</strong> <%= MemberInfo.getStringItem(0, "home_phone")%>
				<br/>
				<% if (MemberProfileTask.hasResume()) { %>
				<a href="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.RESUME_DOWNLOAD_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="JobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="MemberID"/>" class="bodyText"><B>Resume</B></a>
				<% } %>
				<br/><br/>
				</td>
				<td class=bodyText>
				<% if (MemberProfileTask.getIsRanked()) { %>
				<B>Current Rating:</B> <%=MemberStats.getItem(0, "rating").toString()%><br/>
				<B>Current Ranking:</B> <%=MemberStats.getItem(0, "rank").toString()%><br/>
				<B>Rating Percentile:</B> <%=MemberStats.getItem(0, "percentile").toString()%><br/>
				<B>Number of Ratings:</B> <%=MemberStats.getItem(0, "num_ratings").toString()%><br/>
				<B>Highest Rating:</B> <%=MemberStats.getItem(0, "highest_rating").toString()%><br/>
				<B>Lowest Rating:</B> <%=MemberStats.getItem(0, "lowest_rating").toString()%><br/>
				<B>Most Recent Rated Event:</B> <%=MemberStats.getItem(0, "last_rated_event").toString()%>
				<% } else { %>
				<b>Not rated</b>
				<% } %>
				<br/><br/>
				</td>
			</tr>
			<tr valign=top>
				<td width="50%" class="bodyText">
				<B>Member Type:</B> <%=MemberInfo.getItem(0, "coder_type_desc").toString()%> <br/>
				<B>TopCoder Member Since:</B> <%=MemberInfo.getItem(0, "member_since_date").toString()%><br/>
				<% if (MemberProfileTask.getIsStudent()) { %>
				<B>School:</B> <%=MemberInfo.getItem(0, "school_name").toString()%> <br/>
				<B>Degree:</B> <%=MemberInfo.getItem(0, "degree").toString()%> <br/>
				<B>Major:</B> <%=MemberInfo.getItem(0, "major").toString()%> <br/>
				<% if (MemberInfo.getItem(0, "gpa").toString().trim().length()>0) {%>
				<B>GPA:</B> <%=MemberInfo.getItem(0, "gpa").toString()%> <br/>
				<% } %>
				<B>Graduation Date:</B> <%=MemberInfo.getItem(0, "grad_month").toString()%>
				<%=MemberInfo.getItem(0, "grad_month").toString().trim().length()==0?"":", "%>
				<%=MemberInfo.getItem(0, "grad_year").toString()%>
				<% } %>
				<br/><br/>
				</td>
				<td class=bodyText>
				<strong>Interested in:</strong> <jsp:getProperty name="MemberProfileTask" property="JobName"/>
				<br/>
				<A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.MEMBER_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="JobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="MemberID"/>" class="bodyText">View all position interest for <%= MemberInfo.getItem(0, "handle")%></A>
				<br/><br/>
				</td>
			</tr>
			<tr>
				<td class=bodyText>
				<A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="bodyText">Coder Demographic Info</A>
				<br/>
				<A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="bodyText">Coder Competition History</A>
				<br/>
				<A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="bodyText">Coder Problem Submissions</A>
				</td>
				<td class=bodyText>
				</td>
			</tr>
		</table>


<% if (MemberProfileTask.getIsRanked()) { %>
	<% if (MemberProfileTask.hasDivisionI()) { %>

		<br/><br/>

		<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
			<TR><TD COLSPAN="10" class="screeningTitle"><B>Division-I Performance</B></TD</TR>
			<TR><TD COLSPAN="10" class="screeningHeader">Average Points per Contest: <%= MemberProfileTask.getDivIStatistic("avg_contest_points") %></TD></TR>
			<TR><TD COLSPAN="10" class="screeningHeader">Statistics by Problem Level:</TD></TR>
			<TR><TD class="screeningHeader">&#160;</TD>
				<TD class="screeningHeader" align=center><b>Presented</b></TD>
				<TD class="screeningHeader" align=center><b>Submitted</b></TD>
				<TD class="screeningHeader" align=center><b>Submit %</b></TD>
				<TD class="screeningHeader" align=center><b>Correct</b></TD>
				<TD class="screeningHeader" align=center><b>Submission<br/>Accuracy</b></TD>
				<TD class="screeningHeader" align=center><b>Overall<br/>Accuracy</b></TD>
				<TD class="screeningHeader" align=center><b>Avg Points for<br/>Submissions</b></TD>
				<TD class="screeningHeader" align=center><b>Avg<br/>Points<br/>Overall</b></TD>
				<TD class="screeningHeader" align=center><b>Avg Time<br/>to Submit</b></TD>
			</TR>

<%
int i=0;
%>
<tces:rowIterator id="level" rowList="<%=MemberProfileTask.getDivIStatsByLevel()%>">
<%
i++;
%>
			<TR>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">&#160;<b><%= level.getItem("level_desc").toString() %></b></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= level.getItem("presented").toString() %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= level.getItem("submitted").toString() %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("submit_percent")) %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= level.getItem("correct").toString() %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("submission_accuracy")) %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("overall_accuracy")) %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("avg_submission_points")) %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("avg_final_points")) %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align=right><%= JSPUtils.timeFormat(level.getItem("avg_time_elapsed")) %></TD>
			</TR>
</tces:rowIterator>
<%
i++;
%>
			<TR>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" HEIGHT="18">&#160;<b>All</b></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("total_presented") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("total_submitted") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("total_submit_percent") %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("correct") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("total_submission_accuracy") %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("total_overall_accuracy") %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("avg_submission_points") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("avg_overall_points") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align=right><%= JSPUtils.timeFormat(MemberProfileTask.getDivIStats().getItem("avg_time_elapsed")) %></TD>
			</TR>
		</TABLE>

		<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
			<tr><td class="screeningTitle" colspan="7">Division-I Statistics by Language:</td></tr>
			<TR>
				<TD class="screeningHeader" width="100%">&#160;</TD>
				<TD class="screeningHeader" align=center>Submitted</TD>
				<TD class="screeningHeader" align=center>Submit %</TD>
				<TD class="screeningHeader" align=center>Correct</TD>
				<TD class="screeningHeader" align=center>Submission<br/>Accuracy</TD>
				<TD class="screeningHeader" align=center>Avg Points for<br/>Submissions</TD>
				<TD class="screeningHeader" align=center>Avg Time to<br/>Submit</TD>
			</TR>

<%
i=0;
%>
<tces:rowIterator id="language" rowList="<%=MemberProfileTask.getDivIStatsByLang()%>">
<%
i++;
%>

			<TR>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">&#160;<b><%= language.getItem("language_name").toString() %></b></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= language.getItem("submitted").toString() %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(language.getItem("submit_percent")) %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= language.getItem("num_correct").toString() %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(language.getItem("submission_accuracy")) %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(language.getItem("avg_submission_points")) %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align=right><%= JSPUtils.timeFormat(language.getItem("avg_submit_time")) %></TD>
			</TR>
</tces:rowIterator>
<% if (MemberProfileTask.hasMultipleDivILanguage()) { %>
<%
i++;
%>
			<TR>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">&#160;<b>All</b></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("total_submitted") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("total_submit_percent") %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("correct") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right<%= MemberProfileTask.getDivIStatistic("total_submission_accuracy") %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIStatistic("avg_submission_points") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.timeFormat(MemberProfileTask.getDivIStats().getItem("avg_time_elapsed")) %></TD>
			</TR>
<% } %>
		</TABLE>
<% } %>


<% if (MemberProfileTask.hasDivisionII()) { %>

		<br/><br/>

		<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
			<TR><TD COLSPAN="10" class="screeningTitle">Division-II Performance</TD</TR>
			<TR><TD COLSPAN="10" class="screeningHeader">Average Points per Contest: <%= MemberProfileTask.getDivIIStatistic("avg_contest_points") %></TD></TR>
			<TR><TD COLSPAN="10" class="screeningHeader">Statistics by Problem Level:</TD></TR>
			<TR>
				<TD class="screeningHeader">&#160;</TD>
				<TD class="screeningHeader" align=center>Presented</TD>
				<TD class="screeningHeader" align=center>Submitted</TD>
				<TD class="screeningHeader" align=center>Submit %</TD>
				<TD class="screeningHeader" align=center>Correct</TD>
				<TD class="screeningHeader" align=center>Submission<br/>Accuracy</TD>
				<TD class="screeningHeader" align=center>Overall<br/>Accuracy</TD>
				<TD class="screeningHeader" align=center>Avg Points for<br/>Submissions</TD>
				<TD class="screeningHeader" align=center>Avg<br/>Points<br/>Overall</TD>
				<TD class="screeningHeader" align=center>Avg Time to<br/>Submit</TD>
			</TR>


<%
int i=0;
%>
<tces:rowIterator id="level" rowList="<%=MemberProfileTask.getDivIIStatsByLevel()%>">
<%
i++;
%>
			<TR>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">&#160;<b><%= level.getItem("level_desc").toString() %></b></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= level.getItem("presented").toString() %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= level.getItem("submitted").toString() %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("submit_percent")) %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= level.getItem("correct").toString() %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("submission_accuracy")) %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("overall_accuracy")) %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("avg_submission_points")) %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(level.getItem("avg_final_points")) %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align=right><%= JSPUtils.timeFormat(level.getItem("avg_time_elapsed")) %></TD>
			</TR>
</tces:rowIterator>

<%
i++;
%>
			<TR>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">&#160;<b>All</b></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("total_presented") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("total_submitted") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("total_submit_percent") %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("correct") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("total_submission_accuracy") %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("total_overall_accuracy") %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("avg_submission_points") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("avg_overall_points") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align=right><%= JSPUtils.timeFormat(MemberProfileTask.getDivIIStats().getItem("avg_time_elapsed")) %></TD>
			</TR>
		</TABLE>

		<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
			<tr><td class="screeningTitle" colspan="7">Division-II Statistics by Language:</td></tr>
			<TR>
				<TD class="screeningHeader" width="100%">&#160;</TD>
				<TD class="screeningHeader" align=center>Submitted</TD>
				<TD class="screeningHeader" align=center>Submit %</TD>
				<TD class="screeningHeader" align=center>Correct</TD>
				<TD class="screeningHeader" align=center>Submission<br/>Accuracy</TD>
				<TD class="screeningHeader" align=center>Avg Points for<br/>Submissions</TD>
				<TD class="screeningHeader" align=center>Avg Time to<br/>Submit</TD>
			</TR>

<%
i=0;
%>
<tces:rowIterator id="language" rowList="<%=MemberProfileTask.getDivIIStatsByLang()%>">
<%
i++;
%>
			<TR>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">&#160;<b><%= language.getItem("language_name").toString() %></b></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= language.getItem("submitted").toString() %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(language.getItem("submit_percent")) %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= language.getItem("num_correct").toString() %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(language.getItem("submission_accuracy")) %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= JSPUtils.autoFormat(language.getItem("avg_submission_points")) %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align=right><%= JSPUtils.timeFormat(language.getItem("avg_submit_time")) %></TD>
			</TR>
</tces:rowIterator>

<% if (MemberProfileTask.hasMultipleDivIILanguage()) { %>
<%
i++;
%>
			<TR>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" HEIGHT="18">&#160;<b>All</b></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("total_submitted") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("total_submit_percent") %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("correct") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("total_submission_accuracy") %>%</TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= MemberProfileTask.getDivIIStatistic("avg_submission_points") %></TD>
				<TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align=right><%= JSPUtils.timeFormat(MemberProfileTask.getDivIIStats().getItem("avg_time_elapsed")) %></TD>
			</TR>
<% } %>
		</TABLE>
<% } %>

<% } else { %>

		<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
			<TR>
				<TD class="screeningCellOdd" ALIGN="center" WIDTH="100%"><%= MemberInfo.getItem(0, "handle").toString()%> is not rated in competition.</TD>
			</TR>
		</TABLE>
<% } %>

                  <P><br/></P>
	    </TD>
  <!-- Center Column Ends -->
		<td class=homeRightPromos width="50%"><jsp:include page="right.jsp" /></td>
	</TR>
</TABLE>

<!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->

</BODY>
</HTML>
