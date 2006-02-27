<%@ page contentType="text/html;charset=utf-8" %>
<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.JSPUtils,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Recruiting Reports</TITLE>
    <jsp:include page="script.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  </HEAD>
  <body>
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>

<jsp:useBean id="MemberProfileTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.MemberProfileTask" />

<% ResultSetContainer MemberInfo = MemberProfileTask.getMemberInfo(); %>
<% ResultSetContainer MemberStats = MemberProfileTask.getMemberStats(); %>

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
   <TR valign="top">
      <td width="50%"><jsp:include page="left.jsp" /></td>
      <!-- Center Column Begins -->
      <td class="recruitingBody">
      <img src="/i/corp/clear.gif" width="700" height="11" alt="" border=0><br />
      <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
         <tr valign="top">
            <td class="bodyText" colspan="2">
                     <div style="float:right;">
                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=ViewSearchTask&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="campaignID" />">Search candidates</A>
                     </div>
            <tces:trailIterator id="trailItem" trailList="<%=MemberProfileTask.getTrail()%>">
            <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
            </tces:trailIterator>
            <br />
            <span class=testHead>Member Profile: <%= MemberInfo.getItem(0, "handle").toString()%> </span>
            <br /><br />
         </tr>
         <tr>
            <td class="bodyText" width="50%" valign="top">
            <strong>Name:</strong> <%= MemberInfo.getItem(0, "first_name").toString()%> <%= MemberInfo.getItem(0, "middle_name").toString()%> <%= MemberInfo.getItem(0, "last_name").toString()%><br />
            <strong>Address:</strong><br />
            <%= MemberInfo.getItem(0, "address1").toString()%><br />
            <%= MemberInfo.getItem(0, "address2").toString().length()==0?"":MemberInfo.getStringItem(0, "address2")+"<br />"%>
            <%= MemberInfo.getItem(0, "address3").toString().length()==0?"":MemberInfo.getStringItem(0, "address3")+"<br />"%>
            <%= MemberInfo.getItem(0, "province").toString()%>
            <%= MemberInfo.getItem(0, "city").toString()%>,
            <%= MemberInfo.getItem(0, "state_code").toString()%>
            <%= MemberInfo.getItem(0, "zip").toString()%>
            <%= MemberInfo.getItem(0, "country_name").toString()%>
            <br />
            <strong>Email:</strong> <A HREF="mailto:<%=MemberInfo.getStringItem(0, "email")%>" class="bodyText"><%= MemberInfo.getStringItem(0, "email")%></A><br />
            <% if (MemberInfo.getStringItem(0, "home_phone")!=null) { %><strong>Phone:</strong> <%= MemberInfo.getStringItem(0, "home_phone")%><% } %>
            <br /><br />
            <B>Member Type:</B> <%=MemberInfo.getItem(0, "coder_type_desc").toString()%> <br />
            <B>TopCoder Member Since:</B> <%=MemberInfo.getItem(0, "member_since_date").toString()%><br />
            <% if (MemberProfileTask.getIsStudent()) { %>
            <B>School:</B> <%=MemberInfo.getItem(0, "school_name").toString()%> <br />
            <B>Degree:</B> <%=MemberInfo.getItem(0, "degree").toString()%> <br />
            <B>Major:</B> <%=MemberInfo.getItem(0, "major").toString()%> <br />
            <% if (MemberInfo.getItem(0, "gpa").toString().trim().length()>0) {%>
            <B>GPA:</B> <%=MemberInfo.getItem(0, "gpa").toString()%> <br />
            <% } %>
            <B>Graduation Date:</B> <%=MemberInfo.getItem(0, "grad_month").toString()%>
            <%=MemberInfo.getItem(0, "grad_month").toString().trim().length()==0?"":", "%>
            <%=MemberInfo.getItem(0, "grad_year").toString()%>
            <% } %>
            <br /><br />
            <A HREF="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="bodyText">Coder Demographic Info</A>
            <br />
            <A HREF="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="bodyText">Coder Competition History</A>
            <br />
            <A HREF="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="bodyText">Coder Problem Submissions</A>
            <br />
            <A HREF="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=PlacementInfoTask&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="bodyText">Coder Skill Set</A>
            <br /><br />
            <% if (MemberProfileTask.hasResume()) { %>
            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.RESUME_DOWNLOAD_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="campaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="jobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="memberID"/>" class="bodyText"><B>Resume</B></a>
            <br /><br />
            <% } %>
            <strong>Interested in:</strong> <jsp:getProperty name="MemberProfileTask" property="jobName"/>
            <br />
            <A HREF="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.MEMBER_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="campaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="jobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="memberID"/>" class="bodyText">View all position interest for <%= MemberInfo.getItem(0, "handle")%></A>
            <br /><br />
            </td>
            <td class="bodyText" width="50%" valign="top">
            <% if (MemberProfileTask.getIsRanked()) { %>
                <% if (MemberInfo.getColumnIndex("tc_user_id")>=0) {
                    if (MemberInfo.getItem(0, "tc_user_id").getResultData()!=null) {%>
                        <A HREF="/tc?module=MemberProfile&cr=<%=MemberInfo.getLongItem(0, "tc_user_id")%>" target="blank" class="bodyText">Full TopCoder Profile</a>
                <%   } 
                   } else { %>
                    <A HREF="/tc?module=MemberProfile&cr=<%=MemberProfileTask.getMemberID()%>" target="blank" class="bodyText">Full TopCoder Profile</a>
                <% } %>
            <br /><br />
            <b>Algorithm Statistics</b><br />
            Current Rating: <%=MemberStats.getItem(0, "rating").toString()%><br />
            Current Ranking: <%=MemberStats.getItem(0, "rank").toString()%><br />
            Rating Percentile: <%=MemberStats.getItem(0, "percentile").toString()%> (<A HREF="JavaScript:getGraph('/corp/graph?c=rating_distribution_graph&cm=<jsp:getProperty name="MemberProfileTask" property="companyId"/>','600','400','distribution')" class="bodyText">Distribution Graph</a>)<br />
            Number of Ratings: <%=MemberStats.getItem(0, "num_ratings").toString()%><br />
            Highest Rating: <%=MemberStats.getItem(0, "highest_rating").toString()%><br />
            Lowest Rating: <%=MemberStats.getItem(0, "lowest_rating").toString()%><br />
            Most Recent Rated Event: <%=MemberStats.getItem(0, "last_rated_event").toString()%><br />
            <A href="#division">Statistics by Division</A>
            <% } else { %>
            Not rated
            <% } %>
            <br /><br />


            <% if (MemberProfileTask.getIsRanked()&&MemberStats.getStringItem(0, "num_design_ratings")!=null) { %>
                <b>Component Design Statistics</b><br />
                Current Rating: <rsc:item name="design_rating" format="#" set="<%=MemberStats%>" ifNull="Not Rated"/> <br />
                Current Ranking: <rsc:item name="design_rank" format="#" set="<%=MemberStats%>" ifNull="Not Ranked"/><br />
                Rating Percentile: <rsc:item name="design_percentile" set="<%=MemberStats%>" ifNull="Not Ranked"/><br />
                Number of Ratings: <rsc:item name="num_design_ratings" format="#" set="<%=MemberStats%>" ifNull="Not Rated"/><br />
                Highest Rating: <rsc:item name="highest_design_rating" format="#" set="<%=MemberStats%>" ifNull="Not Rated"/><br />
                Lowest Rating: <rsc:item name="lowest_design_rating" format="#" set="<%=MemberStats%>" ifNull="Not Rated"/><br />
                Most Recent Rated Event: <rsc:item name="last_rated_design_project" format="MM/dd/yyyy" set="<%=MemberStats%>" ifNull="Not Rated"/><br />
                <br />
            <% } %>

            <% if (MemberProfileTask.getIsRanked()&&MemberStats.getStringItem(0, "num_dev_ratings")!=null) { %>
                <b>Component Development Statistics</b><br />
                Current Rating: <rsc:item name="dev_rating" format="#" set="<%=MemberStats%>" ifNull="Not Rated"/> <br />
                Current Ranking: <rsc:item name="dev_rank" format="#" set="<%=MemberStats%>" ifNull="Not Ranked"/><br />
                Rating Percentile: <rsc:item name="dev_percentile" set="<%=MemberStats%>" ifNull="Not Ranked"/><br />
                Number of Ratings: <rsc:item name="num_dev_ratings" format="#" set="<%=MemberStats%>" ifNull="Not Rated"/><br />
                Highest Rating: <rsc:item name="highest_dev_rating" format="#" set="<%=MemberStats%>" ifNull="Not Rated"/><br />
                Lowest Rating: <rsc:item name="lowest_dev_rating" format="#" set="<%=MemberStats%>" ifNull="Not Rated"/><br />
                Most Recent Rated Event: <rsc:item name="last_rated_dev_project" format="MM/dd/yyyy" set="<%=MemberStats%>" ifNull="Not Rated"/><br />
                <br />
            <% } %>

            </td>
         </tr>
      </table>


<% if (MemberProfileTask.getIsRanked()) { %>
   <% if (MemberProfileTask.hasDivisionI()) { %>

      <br /><br />
      <A name="division"></A>
      <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
         <TR><TD COLSPAN="10" class="screeningTitle"><B>Division-I Performance</B></TD</TR>
         <TR><TD COLSPAN="10" class="screeningHeader">Average Points per Contest: <%= MemberProfileTask.getDivIStatistic("avg_contest_points") %></TD></TR>
         <TR><TD COLSPAN="10" class="screeningHeader">Statistics by Problem Level:</TD></TR>
         <TR><TD class="screeningHeader">&#160;</TD>
            <TD class="screeningHeader" align="center"><b>Presented</b></TD>
            <TD class="screeningHeader" align="center"><b>Submitted</b></TD>
            <TD class="screeningHeader" align="center"><b>Submit %</b></TD>
            <TD class="screeningHeader" align="center"><b>Correct</b></TD>
            <TD class="screeningHeader" align="center"><b>Submission<br />Accuracy</b></TD>
            <TD class="screeningHeader" align="center"><b>Overall<br />Accuracy</b></TD>
            <TD class="screeningHeader" align="center"><b>Avg Points for<br />Submissions</b></TD>
            <TD class="screeningHeader" align="center"><b>Avg<br />Points<br />Overall</b></TD>
            <TD class="screeningHeader" align="center"><b>Avg Time<br />to Submit</b></TD>
         </TR>

<%
int i=0;
%>
<tces:rowIterator id="level" rowList="<%=MemberProfileTask.getDivIStatsByLevel()%>">
<%
i++;
%>
         <TR>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap="nowrap">&#160;<b><%= level.getItem("level_desc").toString() %></b></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= level.getItem("presented").toString() %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= level.getItem("submitted").toString() %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(level.getItem("submit_percent")) %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= level.getItem("correct").toString() %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(level.getItem("submission_accuracy")) %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(level.getItem("overall_accuracy")) %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(level.getItem("avg_submission_points")) %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(level.getItem("avg_final_points")) %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align="right"><%= JSPUtils.timeFormat(level.getItem("avg_time_elapsed")) %></TD>
         </TR>
</tces:rowIterator>
<%
i++;
%>
         <TR>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" HEIGHT="18">&#160;<b>All</b></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("total_presented") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("total_submitted") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("total_submit_percent") %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("correct") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("total_submission_accuracy") %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("total_overall_accuracy") %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("avg_submission_points") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("avg_overall_points") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align="right"><%= JSPUtils.timeFormat(MemberProfileTask.getDivIStats().getItem("avg_time_elapsed")) %></TD>
         </TR>
      </TABLE>

      <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
         <tr><td class="screeningTitle" colspan="7">Division-I Statistics by Language:</td></tr>
         <TR>
            <TD class="screeningHeader" width="100%">&#160;</TD>
            <TD class="screeningHeader" align="center">Submitted</TD>
            <TD class="screeningHeader" align="center">Submit %</TD>
            <TD class="screeningHeader" align="center">Correct</TD>
            <TD class="screeningHeader" align="center">Submission<br />Accuracy</TD>
            <TD class="screeningHeader" align="center">Avg Points for<br />Submissions</TD>
            <TD class="screeningHeader" align="center">Avg Time to<br />Submit</TD>
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
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= language.getItem("submitted").toString() %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(language.getItem("submit_percent")) %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= language.getItem("num_correct").toString() %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(language.getItem("submission_accuracy")) %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(language.getItem("avg_submission_points")) %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align="right"><%= JSPUtils.timeFormat(language.getItem("avg_submit_time")) %></TD>
         </TR>
</tces:rowIterator>
<% if (MemberProfileTask.hasMultipleDivILanguage()) { %>
<%
i++;
%>
         <TR>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">&#160;<b>All</b></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("total_submitted") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("total_submit_percent") %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("correct") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"<%= MemberProfileTask.getDivIStatistic("total_submission_accuracy") %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIStatistic("avg_submission_points") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.timeFormat(MemberProfileTask.getDivIStats().getItem("avg_time_elapsed")) %></TD>
         </TR>
<% } %>
      </TABLE>
<% } %>


<% if (MemberProfileTask.hasDivisionII()) { %>

      <br /><br />

      <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
         <TR><TD COLSPAN="10" class="screeningTitle">Division-II Performance</TD</TR>
         <TR><TD COLSPAN="10" class="screeningHeader">Average Points per Contest: <%= MemberProfileTask.getDivIIStatistic("avg_contest_points") %></TD></TR>
         <TR><TD COLSPAN="10" class="screeningHeader">Statistics by Problem Level:</TD></TR>
         <TR>
            <TD class="screeningHeader">&#160;</TD>
            <TD class="screeningHeader" align="center">Presented</TD>
            <TD class="screeningHeader" align="center">Submitted</TD>
            <TD class="screeningHeader" align="center">Submit %</TD>
            <TD class="screeningHeader" align="center">Correct</TD>
            <TD class="screeningHeader" align="center">Submission<br />Accuracy</TD>
            <TD class="screeningHeader" align="center">Overall<br />Accuracy</TD>
            <TD class="screeningHeader" align="center">Avg Points for<br />Submissions</TD>
            <TD class="screeningHeader" align="center">Avg<br />Points<br />Overall</TD>
            <TD class="screeningHeader" align="center">Avg Time to<br />Submit</TD>
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
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= level.getItem("presented").toString() %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= level.getItem("submitted").toString() %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(level.getItem("submit_percent")) %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= level.getItem("correct").toString() %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(level.getItem("submission_accuracy")) %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(level.getItem("overall_accuracy")) %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(level.getItem("avg_submission_points")) %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(level.getItem("avg_final_points")) %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align="right"><%= JSPUtils.timeFormat(level.getItem("avg_time_elapsed")) %></TD>
         </TR>
</tces:rowIterator>

<%
i++;
%>
         <TR>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">&#160;<b>All</b></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("total_presented") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("total_submitted") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("total_submit_percent") %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("correct") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("total_submission_accuracy") %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("total_overall_accuracy") %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("avg_submission_points") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("avg_overall_points") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align="right"><%= JSPUtils.timeFormat(MemberProfileTask.getDivIIStats().getItem("avg_time_elapsed")) %></TD>
         </TR>
      </TABLE>

      <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
         <tr><td class="screeningTitle" colspan="7">Division-II Statistics by Language:</td></tr>
         <TR>
            <TD class="screeningHeader" width="100%">&#160;</TD>
            <TD class="screeningHeader" align="center">Submitted</TD>
            <TD class="screeningHeader" align="center">Submit %</TD>
            <TD class="screeningHeader" align="center">Correct</TD>
            <TD class="screeningHeader" align="center">Submission<br />Accuracy</TD>
            <TD class="screeningHeader" align="center">Avg Points for<br />Submissions</TD>
            <TD class="screeningHeader" align="center">Avg Time to<br />Submit</TD>
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
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= language.getItem("submitted").toString() %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(language.getItem("submit_percent")) %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= language.getItem("num_correct").toString() %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(language.getItem("submission_accuracy")) %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= JSPUtils.autoFormat(language.getItem("avg_submission_points")) %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align="right"><%= JSPUtils.timeFormat(language.getItem("avg_submit_time")) %></TD>
         </TR>
</tces:rowIterator>

<% if (MemberProfileTask.hasMultipleDivIILanguage()) { %>
<%
i++;
%>
         <TR>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" HEIGHT="18">&#160;<b>All</b></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("total_submitted") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("total_submit_percent") %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("correct") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("total_submission_accuracy") %>%</TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= MemberProfileTask.getDivIIStatistic("avg_submission_points") %></TD>
            <TD class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap align="right"><%= JSPUtils.timeFormat(MemberProfileTask.getDivIIStats().getItem("avg_time_elapsed")) %></TD>
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

                  <P><br /></P>
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
