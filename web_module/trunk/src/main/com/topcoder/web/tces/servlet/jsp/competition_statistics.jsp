<%@  page 
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CompetitionStatisticsTask" scope="request" class="com.topcoder.web.tces.bean.CompetitionStatisticsTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <jsp:include page="script.jsp" />
    
  </HEAD>
  <BODY id="tces">
  <jsp:include page="top.jsp" />             
  
  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">
    <!-- Left Column Begins -->
      <TD WIDTH="170">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="8"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <!-- Center Column Begins -->
      <TD class="statText" width="100%"><img src="/i/clear.gif" width="400" HEIGHT="11" BORDER="0"><BR>
        <jsp:include page="/body_top.jsp" >  
           <jsp:param name="image" value="tces"/>  
           <jsp:param name="image1" value="steelblue"/>  
           <jsp:param name="title" value="Member Profile"/>
        </jsp:include>
        
        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"><BR>        
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
          <TR>
            <TD WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
              <P ALIGN="center">
                <tces:trailIterator id="trailItem" trailList="<%=CompetitionStatisticsTask.getTrail()%>">
                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="statText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                </tces:trailIterator>
              </P>
        <p>
        <b>
        <FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Member Profile: <jsp:getProperty name="CompetitionStatisticsTask" property="Handle"/></FONT>
        </b>
        </p>                  
                  <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CompetitionStatisticsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionStatisticsTask.getMemberID()%>" class="statText">
                            Coder Demographic Info</A>                          
                        </TD>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CompetitionStatisticsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionStatisticsTask.getMemberID()%>" class="statText">
                            Coder Competition History</A>
                        </TD>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CompetitionStatisticsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionStatisticsTask.getMemberID()%>" class="statText">
                            Coder Problem Submissions</A>                          
                        </TD>
                    </TR>
                  </TABLE>              
              
              <p>
              <FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Coder Problem Submissions &gt; Competition Statistics</FONT>
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
                        <TD class='statText' colspan='2'>
                          <b>Overall</b>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='statText'>
                          <b># of Competitors</b>
                        </TD>
                        <TD class='statText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("num_competitors") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='statText'>
                          <b>Average Score</b>
                        </TD>
                        <TD class='statText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("overall_avg_points") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='statText'>
                          <b>Std. Deviation</b>
                        </TD>
                        <TD class='statText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("overall_std_dev") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='statText'>
                          <b># Submissions</b>
                        </TD>
                        <TD class='statText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("overall_problems_submitted") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='statText'>
                          <b>Percent Correct</b>
                        </TD>
                        <TD class='statText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("overall_submission_accuracy") %>%
                        </TD>
                      </TR>
                    </TABLE>
                  </TD>
                  <TD width='50%'>
                    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" width='50%'>
                      <TR>
                        <TD class='statText' colspan='2'>
                          <b>Individual [ <jsp:getProperty name="CompetitionStatisticsTask" property="Handle"/> ]</b>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='statText'>
                          <B>Score</B>
                        </TD>
                        <TD class='statText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("final_points") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='statText'>
                          <B># Std. Deviations</B>
                        </TD>
                        <TD class='statText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("point_standard_deviation") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='statText'>
                          <B># Submissions</B>
                        </TD>
                        <TD class='statText' align='right'>
                          <%= CompetitionStatisticsTask.getStatistic("problems_submitted") %>
                        </TD>
                      </TR>
                      <TR>
                        <TD class='statText'>
                          <B># Correct</B>
                        </TD>
                        <TD class='statText' align='right'>
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
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18">&#160;<b></b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Status</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Points</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Time to Submit</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Language</b></TD>
                </TR>

                

                <tces:rowIterator id="level" rowList="<%=(List)CompetitionStatisticsTask.getCoderStatsByLevel()%>">
                  <TR>
                    <TD class="statText" HEIGHT="18">&#160;
                      <A HREF="<jsp:getProperty name="CompetitionStatisticsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionStatisticsTask.getMemberID()%>&<%=TCESConstants.PROBLEM_ID_PARAM%>=<%= level.getItem("problem_id").toString() %>" class="statText">
                        <b><%= level.getItem("level_desc").toString() %></b>
                      </A>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= level.getItem("end_status_text").toString() %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= level.getItem("final_points").toString() %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <% int statusID=Integer.parseInt(level.getItem("end_status_id").toString()); %>
                        <%= (statusID==TCESConstants.PROBLEM_STATUS_OPEN || statusID==TCESConstants.PROBLEM_STATUS_COMPILED)?"N/A":JSPUtils.timeFormat(level.getItem("time_elapsed")) %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= level.getItem("language_name").toString() %>
                    </TD>
                  </TR>
                </tces:rowIterator>

              </TABLE>
              <P><BR></P>

              <P><B>Overall Stats</B></P>
              <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                <TR>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18">&#160;<b></b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Presented</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Submitted</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Submit %</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Correct</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Submission Accuracy</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Overall Accuracy</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Avg Points for Submissions</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Avg Points Overall</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Avg Time to Submit</b></TD>
                </TR>

                

                <tces:rowIterator id="level" rowList="<%=(List)CompetitionStatisticsTask.getOverallStatsByLevel()%>">
                  <TR>
                    <TD class="statText" HEIGHT="18">
                        <nobr>&#160;<b><%= level.getItem("level_desc").toString() %></b></nobr>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= level.getItem("problems_presented").toString() %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= level.getItem("problems_submitted").toString() %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.autoFormat(level.getItem("submit_percent")) %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= level.getItem("problems_correct").toString() %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.autoFormat(level.getItem("submission_accuracy")) %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.autoFormat(level.getItem("overall_accuracy")) %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.autoFormat(level.getItem("avg_submission_points")) %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= level.getItem("average_points").toString() %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.timeFormat(level.getItem("avg_time_elapsed")) %>
                    </TD>
                  </TR>
                </tces:rowIterator>

                  <TR>
                    <TD class="statText" HEIGHT="18">
                        &#160;<b>All</b>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_problems_presented") %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_problems_submitted") %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_submit_percent") %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_problems_correct") %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_submission_accuracy") %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_accuracy") %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_points_per_submission") %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= CompetitionStatisticsTask.getStatistic("overall_points_per_problem") %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.timeFormat(CompetitionStatisticsTask.getCompetitionStats().getItem("overall_time_per_problem")) %>
                    </TD>
                  </TR>
              </TABLE>
              <P><BR></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     

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
  <!-- Body Ends -->
  </BODY>
</HTML>
