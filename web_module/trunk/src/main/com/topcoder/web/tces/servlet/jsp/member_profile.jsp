<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Recruiting Reports</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/corpStyle.css">
    <jsp:include page="script.jsp" />

  </HEAD>
  <body>
  <jsp:include page="top.jsp" />



<jsp:useBean id="MemberProfileTask" scope="request" class="com.topcoder.web.tces.bean.MemberProfileTask" />

<% ResultSetContainer MemberInfo = MemberProfileTask.getMemberInfo(); %>
<% ResultSetContainer MemberStats = MemberProfileTask.getMemberStats(); %>

  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">
<!-- Left Column Begins -->
      <TD WIDTH="25"><img src="/i/clear.gif" width="25" HEIGHT="11" alt="" BORDER="0"></TD>
<!-- Left Column Ends -->

      <!-- Gutter Begins -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="8"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <!-- Center Column Begins -->
      <TD class="bodyText" width="100%"><img src="/i/clear.gif" width="400" HEIGHT="11" BORDER="0"><BR>

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
          <TR>
            <TD WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="bodyText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P ALIGN="center">
                <tces:trailIterator id="trailItem" trailList="<%=MemberProfileTask.getTrail()%>">
                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                </tces:trailIterator>
              </P>

            <TABLE WIDTH="100%" BORDER="0">
            <TR>
            <TD class="bodyText" ALIGN="right">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="126" HEIGHT="140" BORDER="0">
            </TD>
            <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <TD class="bodyText" ALIGN="left">

              <B>Member Profile: <%= MemberInfo.getItem(0, "handle").toString()%> </B>
              <BR>
              <%= MemberInfo.getItem(0, "first_name").toString()%> <%= MemberInfo.getItem(0, "last_name").toString()%>
              <BR>
              <%= MemberInfo.getItem(0, "address1").toString()%>
              <%= MemberInfo.getItem(0, "address1").toString().equals("")?"":"<BR>"+MemberInfo.getItem(0, "address2").toString()+"<BR>"%>
              <%= MemberInfo.getItem(0, "city").toString()%>,
              <%= MemberInfo.getItem(0, "state_code").toString()%>
              <%= MemberInfo.getItem(0, "zip").toString()%>
              <BR>
              <A HREF="mailto:<%=MemberInfo.getItem(0, "email").toString() %>" class="bodyText"><%= MemberInfo.getItem(0, "email").toString() %></A> | <%= MemberInfo.getItem(0, "home_phone").toString()%>
              <BR>
              <B>Interested in:</B> <jsp:getProperty name="MemberProfileTask" property="JobName"/>
              <BR>
              <% if (MemberProfileTask.hasResume()) { %>
                <a href="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.RESUME_DOWNLOAD_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="JobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="MemberID"/>" class="bodyText"><B>Resume</B></a>
              <% } %>
              </TD>
              </TR>
              </TABLE>


              <P align="center">
              <A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.MEMBER_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="JobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="MemberProfileTask" property="MemberID"/>" class="bodyText">View all position interest for <%= MemberInfo.getItem(0, "handle")%></A>
              </P>

              <P>
              <B>Member Type:</B> <%=MemberInfo.getItem(0, "coder_type_desc").toString()%> <BR>
              <B>TopCoder Member Since:</B> <%=MemberInfo.getItem(0, "member_since_date").toString()%><BR>
              <% if (MemberProfileTask.getIsStudent()) { %>
                <B>School:</B> <%=MemberInfo.getItem(0, "school_name").toString()%> <BR>
                <B>Degree:</B> <%=MemberInfo.getItem(0, "degree").toString()%> <BR>
                <B>Major:</B> <%=MemberInfo.getItem(0, "major").toString()%> <BR>
                <% if (MemberInfo.getItem(0, "gpa").toString().trim().length()>0) {%>
                  <B>GPA:</B> <%=MemberInfo.getItem(0, "gpa").toString()%> <BR>
                <% } %>
                <B>Graduation Date:</B> <%=MemberInfo.getItem(0, "grad_month").toString()%>
                <%=MemberInfo.getItem(0, "grad_month").toString().trim().length()==0?"":", "%>
                <%=MemberInfo.getItem(0, "grad_year").toString()%><BR>
              <% } %>


              </P>

<% if (MemberProfileTask.getIsRanked()) { %>

                  <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="bodyText">
                            Coder Demographic Info
                          </A>
                        </TD>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="bodyText">
                            Coder Competition History
                          </A>
                        </TD>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="bodyText">
                            Coder Problem Submissions
                          </A>
                        </TD>
                    </TR>
                  </TABLE>

                  <P>
                  <B>Current Rating:</B> <%=MemberStats.getItem(0, "rating").toString()%><BR>
                  <B>Current Ranking:</B> <%=MemberStats.getItem(0, "rank").toString()%><BR>
                  <B>Rating Percentile:</B> <%=MemberStats.getItem(0, "percentile").toString()%><BR>
                  <B>Number of Ratings:</B> <%=MemberStats.getItem(0, "num_ratings").toString()%><BR>
                  <B>Highest Rating:</B> <%=MemberStats.getItem(0, "highest_rating").toString()%><BR>
                  <B>Lowest Rating:</B> <%=MemberStats.getItem(0, "lowest_rating").toString()%><BR>
                  <B>Most Recent Rated Event:</B> <%=MemberStats.getItem(0, "last_rated_event").toString()%><BR>
                  </P>

    <% if (MemberProfileTask.hasDivisionI()) { %>
                  <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR><TD BGCOLOR="#43515E" COLSPAN="19" class="statText"><B>Division-I Performance</B></TD</TR>
                    <TR><TD COLSPAN="19" class="bodyText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD></TR>
                    <TR><TD COLSPAN="19" class="bodyText"><B>Average Points per Contest:</B> <%= MemberProfileTask.getDivIStatistic("avg_contest_points") %></TD></TR>
                    <TR><TD COLSPAN="19" class="bodyText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD></TR>
                    <TR><TD COLSPAN="19" class="bodyText"><B>Statistics by Problem Level:</B></TD></TR>
                    <TR><TD COLSPAN="19" class="bodyText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD></TR>
                    <TR>
                      <TD class="testTableTitle" HEIGHT="18">&#160;<b></b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Presented</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submitted</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submit %</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Correct</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submission Accuracy</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Overall Accuracy</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Avg Points for Submissions</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Avg Points Overall</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Avg Time to Submit</b></TD>
                    </TR>



                  <tces:rowIterator id="level" rowList="<%=(List)MemberProfileTask.getDivIStatsByLevel()%>">
                    <TR>
                      <TD class="bodyText" HEIGHT="18">
                        <nobr>&#160;<b><%= level.getItem("level_desc").toString() %></b></nobr>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= level.getItem("presented").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= level.getItem("submitted").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("submit_percent")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= level.getItem("correct").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("submission_accuracy")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("overall_accuracy")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("avg_submission_points")) %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("avg_final_points")) %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.timeFormat(level.getItem("avg_time_elapsed")) %>
                      </TD>
                    </TR>
                  </tces:rowIterator>

                    <TR>
                      <TD class="bodyText" HEIGHT="18">
                        &#160;<b>All</b>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("total_presented") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("total_submitted") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("total_submit_percent") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("correct") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("total_submission_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("total_overall_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("avg_submission_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("avg_overall_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.timeFormat(MemberProfileTask.getDivIStats().getItem("avg_time_elapsed")) %>
                      </TD>
                    </TR>
                  </TABLE>
                  </P>

                  <P>
                  <B>Statistics by Language:<br></B>
                  <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR>
                      <TD class="testTableTitle" HEIGHT="18">&#160;<b></b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submitted</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submit %</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Correct</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submission Accuracy</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Avg Points for Submissions</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Avg Time to Submit</b></TD>
                    </TR>



                  <tces:rowIterator id="language" rowList="<%=(List)MemberProfileTask.getDivIStatsByLang()%>">
                    <TR>
                      <TD class="bodyText" HEIGHT="18">
                        <nobr>&#160;<b><%= language.getItem("language_name").toString() %></b></nobr>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= language.getItem("submitted").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(language.getItem("submit_percent")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= language.getItem("num_correct").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(language.getItem("submission_accuracy")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(language.getItem("avg_submission_points")) %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.timeFormat(language.getItem("avg_submit_time")) %>
                      </TD>
                    </TR>
                  </tces:rowIterator>
                <% if (MemberProfileTask.hasMultipleDivILanguage()) { %>
                    <TR>
                      <TD class="bodyText" HEIGHT="18">
                        &#160;<b>All</b>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("total_submitted") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("total_submit_percent") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("correct") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("total_submission_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIStatistic("avg_submission_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.timeFormat(MemberProfileTask.getDivIStats().getItem("avg_time_elapsed")) %>
                      </TD>
                    </TR>
                <% } %>
                  </TABLE>
                  </P>
    <% } %>

    <% if (MemberProfileTask.hasDivisionII()) { %>
                  <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR><TD BGCOLOR="#43515E" COLSPAN="19" class="bodyText"><B>Division-II Performance</B></TD</TR>
                    <TR><TD COLSPAN="19" class="bodyText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD></TR>
                    <TR><TD COLSPAN="19" class="bodyText"><B>Average Points per Contest:</B> <%= MemberProfileTask.getDivIIStatistic("avg_contest_points") %></TD></TR>
                    <TR><TD COLSPAN="19" class="bodyText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD></TR>
                    <TR><TD COLSPAN="19" class="bodyText"><B>Statistics by Problem Level:</B></TD></TR>
                    <TR><TD COLSPAN="19" class="bodyText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD></TR>
                    <TR>
                      <TD class="testTableTitle" HEIGHT="18">&#160;<b></b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Presented</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submitted</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submit %</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Correct</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submission Accuracy</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Overall Accuracy</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Avg Points for Submissions</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Avg Points Overall</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Avg Time to Submit</b></TD>
                    </TR>



                  <tces:rowIterator id="level" rowList="<%=(List)MemberProfileTask.getDivIIStatsByLevel()%>">
                    <TR>
                      <TD class="bodyText" HEIGHT="18">
                        <nobr>&#160;<b><%= level.getItem("level_desc").toString() %></b></nobr>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= level.getItem("presented").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= level.getItem("submitted").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("submit_percent")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= level.getItem("correct").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("submission_accuracy")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("overall_accuracy")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("avg_submission_points")) %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("avg_final_points")) %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.timeFormat(level.getItem("avg_time_elapsed")) %>
                      </TD>
                    </TR>
                  </tces:rowIterator>

                    <TR>
                      <TD class="bodyText" HEIGHT="18">
                        &#160;<b>All</b>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("total_presented") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submitted") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submit_percent") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("correct") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submission_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("total_overall_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("avg_submission_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("avg_overall_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.timeFormat(MemberProfileTask.getDivIIStats().getItem("avg_time_elapsed")) %>
                      </TD>
                    </TR>
                  </TABLE>
                  </P>

                  <P>
                  <B>Statistics by Language:<br></B>
                  <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR>
                      <TD class="testTableTitle" HEIGHT="18">&#160;<b></b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submitted</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submit %</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Correct</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Submission Accuracy</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Avg Points for Submissions</b></TD>
                      <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="testTableTitle"><b>Avg Time to Submit</b></TD>
                    </TR>



                  <tces:rowIterator id="language" rowList="<%=(List)MemberProfileTask.getDivIIStatsByLang()%>">
                    <TR>
                      <TD class="bodyText" HEIGHT="18">
                        <nobr>&#160;<b><%= language.getItem("language_name").toString() %></b></nobr>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= language.getItem("submitted").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(language.getItem("submit_percent")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= language.getItem("num_correct").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(language.getItem("submission_accuracy")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.autoFormat(language.getItem("avg_submission_points")) %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.timeFormat(language.getItem("avg_submit_time")) %>
                      </TD>
                    </TR>
                  </tces:rowIterator>

                <% if (MemberProfileTask.hasMultipleDivILanguage()) { %>
                    <TR>
                      <TD class="bodyText" HEIGHT="18">
                        &#160;<b>All</b>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submitted") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submit_percent") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("correct") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submission_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= MemberProfileTask.getDivIIStatistic("avg_submission_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="bodyText">
                        <%= JSPUtils.timeFormat(MemberProfileTask.getDivIIStats().getItem("avg_time_elapsed")) %>
                      </TD>
                    </TR>
                  <% } %>
                  </TABLE>
                  </P>
    <% } %>

<% } else { %>

                <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                  <TR>
                    <TD class="bodyText" ALIGN="left" WIDTH="100%">
                      <A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="bodyText">
                        Coder Demographic Info
                      </A>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="bodyText" ALIGN="center" WIDTH="100%">
                      <%= MemberInfo.getItem(0, "handle").toString()%> is not rated in competition.
                    </TD>
                  </TR>
                </TABLE>

<% } %>

                  <P><BR></P>

    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>
  <!-- <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" bgcolor="#001935"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR> -->
</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
      <!-- Right Column Begins -->
      <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
        <!-- Right Column Include Begins -->
        <!--include virtual="/includes/public_right_col.shtml"-->
        <!-- Right Column Include Ends -->
      </TD>
      <!-- Right Column Ends -->
      <!-- Gutter -->
      <TD WIDTH="25"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
    </TR>
</TABLE>

<!-- Footer begins -->
<jsp:include page="foot.jsp" />
<!-- Footer ends -->

</BODY>
</HTML>
