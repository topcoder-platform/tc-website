<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.JSPUtils,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

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
  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">
<!-- Left Column Begins -->
      <TD WIDTH="25"><img src="/i/corp/clear.gif" width="25" HEIGHT="11" alt="" BORDER="0"></TD>
<!-- Left Column Ends -->

      <!-- Gutter Begins -->
      <TD WIDTH="6"><IMG src="/i/corp/clear.gif" WIDTH="6" HEIGHT="8"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <!-- Center Column Begins -->
      <TD class="bodyText" width="100%"><img src="/i/corp/clear.gif" width="400" HEIGHT="11" BORDER="0"><BR>

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
          <TR>
            <TD WIDTH="11"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="bodyText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
              <P ALIGN="center">
                <tces:trailIterator id="trailItem" trailList="<%=CompetitionStatisticsTask.getTrail()%>">
                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                </tces:trailIterator>
              </P>
        <p>
        <h2>Member Profile: <jsp:getProperty name="CompetitionStatisticsTask" property="Handle"/></h2>
        </p>
                  <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CompetitionStatisticsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionStatisticsTask.getMemberID()%>" class="bodyText">
                            Coder Demographic Info</A>                          
                        </TD>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CompetitionStatisticsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionStatisticsTask.getMemberID()%>" class="bodyText">
                            Coder Competition History</A>
                        </TD>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CompetitionStatisticsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionStatisticsTask.getMemberID()%>" class="bodyText">
                            Coder Problem Submissions</A>                          
                        </TD>
                    </TR>
                  </TABLE>              
              
              <p>
              <h2>Coder Problem Submissions &gt; Competition Statistics</h2>
              <br>
              <B>Competition:</B> <%= CompetitionStatisticsTask.getStatistic("contest_name") %>
              <br>
              <B>Division:</B> <%= CompetitionStatisticsTask.getStatistic("division_desc") %>
              </p>

              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR valign='top'>
                  <TD width='50%'>
                    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" width='50%'>
                      <TR>
                        <TD class='bodyText' colspan='2'>
                          <b>Overall</b>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='bodyText'>
                          <b># of Competitors</b>
                        </TD>
                        <TD class='bodyText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("num_competitors") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='bodyText'>
                          <b>Average Score</b>
                        </TD>
                        <TD class='bodyText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("overall_avg_points") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='bodyText'>
                          <b>Std. Deviation</b>
                        </TD>
                        <TD class='bodyText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("overall_std_dev") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='bodyText'>
                          <b># Submissions</b>
                        </TD>
                        <TD class='bodyText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("overall_problems_submitted") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='bodyText'>
                          <b>Percent Correct</b>
                        </TD>
                        <TD class='bodyText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("overall_submission_accuracy") %>%
                        </TD>
                      </TR>
                    </TABLE>
                  </TD>
                  <TD width='50%'>
                    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" width='50%'>
                      <TR>
                        <TD class='bodyText' colspan='2'>
                          <b>Individual [ <jsp:getProperty name="CompetitionStatisticsTask" property="Handle"/> ]</b>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='bodyText'>
                          <B>Score</B>
                        </TD>
                        <TD class='bodyText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("final_points") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='bodyText'>
                          <B># Std. Deviations</B>
                        </TD>
                        <TD class='bodyText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("point_standard_deviation") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='bodyText'>
                          <B># Submissions</B>
                        </TD>
                        <TD class='bodyText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("problems_submitted") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='bodyText'>
                          <B># Correct</B>
                        </TD>
                        <TD class='bodyText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("problems_correct") %>
                        </TD>
                      </TR>
                    </TABLE>
                  </TD>
                </TR>
              </TABLE>

              <p><b>Competition Stats by Level</B></P>

              <P><B>Coder Stats</B></P>
              <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                <TR>
                  <TD class="testTableTitle" HEIGHT="18">&#160;<b></b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Status</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Points</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Time to Submit</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Language</b></TD>
                </TR>

                

                <tces:rowIterator id="level" rowList="<%=(List)CompetitionStatisticsTask.getCoderStatsByLevel()%>">
                  <TR>
                    <TD class="bodyText" HEIGHT="18">&#160;
                      <A HREF="<jsp:getProperty name="CompetitionStatisticsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionStatisticsTask.getMemberID()%>&<%=TCESConstants.PROBLEM_ID_PARAM%>=<%= level.getItem("problem_id").toString() %>" class="bodyText">
                        <b><%= level.getItem("level_desc").toString() %></b>
                      </A>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= level.getItem("end_status_text").toString() %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= level.getItem("final_points").toString() %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <% int statusID=Integer.parseInt(level.getItem("end_status_id").toString()); %>
                        <%= (statusID==TCESConstants.PROBLEM_STATUS_OPEN || statusID==TCESConstants.PROBLEM_STATUS_COMPILED)?"N/A":JSPUtils.timeFormat(level.getItem("time_elapsed")) %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= level.getItem("language_name").toString() %>
                    </TD>
                  </TR>
                </tces:rowIterator>

              </TABLE>
              <P><BR></P>

              <P><B>Overall Stats</B></P>
              <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="3" BORDER="0">
                <TR>
                  <TD class="testTableTitle" width="7%">&#160;</TD>
                  <TD class="testTableTitle" width="7%"><b>Presented</b></TD>
                  <TD class="testTableTitle" width="7%"><b>Submitted</b></TD>
                  <TD class="testTableTitle" width="7%"><b>Submit %</b></TD>
                  <TD class="testTableTitle" width="7%"><b>Correct</b></TD>
                  <TD class="testTableTitle" width="13%"><b>Submission<br>Accuracy</b></TD>
                  <TD class="testTableTitle" width="13%"><b>Overall<br>Accuracy</b></TD>
                  <TD class="testTableTitle" width="13%"><b>Avg Points for<br>Submissions</b></TD>
                  <TD class="testTableTitle" width="13%"><b>Avg Points<br>Overall</b></TD>
                  <TD class="testTableTitle" width="13%"><b>Avg Time<br>to Submit</b></TD>
                </TR>

                

                <tces:rowIterator id="level" rowList="<%=CompetitionStatisticsTask.getOverallStatsByLevel()%>">
                  <TR>
                    <TD class="bodyText">
                        <nobr>&#160;<b><%= level.getItem("level_desc").toString() %></b></nobr>
                    </TD>
                    <TD class="bodyText">
                        <%= level.getItem("problems_presented").toString() %>
                    </TD>
                    <TD class="bodyText">
                        <%= level.getItem("problems_submitted").toString() %>
                    </TD>
                    <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("submit_percent")) %>%
                    </TD>
                    <TD class="bodyText">
                        <%= level.getItem("problems_correct").toString() %>
                    </TD>
                    <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("submission_accuracy")) %>%
                    </TD>
                    <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("overall_accuracy")) %>%
                    </TD>
                    <TD class="bodyText">
                        <%= JSPUtils.autoFormat(level.getItem("avg_submission_points")) %>
                    </TD>
                    <TD class="bodyText">
                        <%= level.getItem("average_points").toString() %>
                    </TD>
                    <TD class="bodyText">
                        <%= JSPUtils.timeFormat(level.getItem("avg_time_elapsed")) %>
                    </TD>
                  </TR>
                </tces:rowIterator>

                  <TR>
                    <TD class="bodyText">
                        &#160;<b>All</b>
                    </TD>
                    <TD class="bodyText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_problems_presented") %>
                    </TD>
                    <TD class="bodyText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_problems_submitted") %>
                    </TD>
                    <TD class="bodyText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_submit_percent") %>%
                    </TD>
                    <TD class="bodyText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_problems_correct") %>
                    </TD>
                    <TD class="bodyText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_submission_accuracy") %>%
                    </TD>
                    <TD class="bodyText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_accuracy") %>%
                    </TD>
                    <TD class="bodyText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_points_per_submission") %>
                    </TD>
                    <TD class="bodyText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_points_per_problem") %>
                    </TD>
                    <TD class="bodyText">
                        <%= JSPUtils.timeFormat(CompetitionStatisticsTask.getCompetitionStats().getItem("overall_time_per_problem")) %>
                    </TD>
                  </TR>
              </TABLE>
              <P><BR></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" WIDTH="100%"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>

</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="6"><IMG src="/i/corp/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
      <!-- Right Column Begins -->
      <TD WIDTH="10"><IMG src="/i/corp/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
        <!-- Right Column Include Begins -->
        <!--include virtual="/includes/public_right_col.shtml"-->
        <!-- Right Column Include Ends -->
      </TD>
      <!-- Right Column Ends -->
      <!-- Gutter -->
      <TD WIDTH="25"><IMG src="/i/corp/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
    </TR>
  </TABLE>
  <!-- Body Ends -->
  <!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->
  </BODY>
</HTML>
