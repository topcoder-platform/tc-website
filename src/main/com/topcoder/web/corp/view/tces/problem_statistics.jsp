<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.JSPUtils,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

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
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Recruiting Reports</TITLE>
    <jsp:include page="script.jsp"/>
  </HEAD>
  <body>
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">
    <!-- Left Column Begins -->
      <TD WIDTH="170">
      </TD>
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
            <TD class="bodyText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P ALIGN="center">
                <tces:trailIterator id="trailItem" trailList="<%=ProblemStatisticsTask.getTrail()%>">
                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                </tces:trailIterator>
              </P>
              <p>
                <b>
                  <FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Member Profile: <jsp:getProperty name="ProblemStatisticsTask" property="Handle"/></FONT>
                </b>
              </p>
              <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                <TR>
                    <TD class="bodyText" ALIGN="center" WIDTH="33%">
                      <A HREF="<jsp:getProperty name="ProblemStatisticsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemStatisticsTask.getMemberID()%>" class="bodyText">
                        Coder Demographic Info</A>
                    </TD>
                    <TD class="bodyText" ALIGN="center" WIDTH="33%">
                      <A HREF="<jsp:getProperty name="ProblemStatisticsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemStatisticsTask.getMemberID()%>" class="bodyText">
                        Coder Competition History</A>
                    </TD>
                    <TD class="bodyText" ALIGN="center" WIDTH="33%">
                      <A HREF="<jsp:getProperty name="ProblemStatisticsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemStatisticsTask.getMemberID()%>" class="bodyText">
                        Coder Problem Submissions</A>
                    </TD>
                </TR>
              </TABLE>
              
              <p>
              <FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Coder Problem Submissions &gt; Problem Statistics</FONT>
              <BR/>
              <B>Problem Name:</B> <%= ProblemStatisticsTask.getStatistic("class_name") %>
              <br>
              <B>Division:</B> <%= ProblemStatisticsTask.getStatistic("division_desc") %>
              <br>
              <B>Problem Level:</B> <%= ProblemStatisticsTask.getStatistic("level_desc") %>
              <br>
              <B>Event Name:</B> <%= ProblemStatisticsTask.getStatistic("contest_name") %>
              <br>
              <B># of Competitors:</B> <%= ProblemStatisticsTask.getStatistic("problems_presented") %>
              </p>
      
              <p>
                <A HREF="javascript:openWnd('<%=sessionInfo.getServletPath()%>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_STATEMENT_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemStatisticsTask.getMemberID()%>&<%=TCESConstants.PROBLEM_ID_PARAM%>=<%=ProblemStatisticsTask.getProblemID()%>')" class="bodyText">
                  View Problem Statement
                </A>
              </P>

              <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="3" BORDER="0">               
                <TR>
                  <TD class="testTableTitle">&#160;<b>Language</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Presented</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Submitted</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Submit %</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Correct</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Submission<br>Accuracy</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Overall<br>Accuracy</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Avg. Pts. for<br>Correct Subs.</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Avg Points<br>Overall</b></TD>
                  <TD class="testTableTitle">&#160;&#160;</TD>
                  <TD class="testTableTitle"><b>Avg. Time for<br>Correct Subs.</b></TD>
                </TR>

                

                <tces:rowIterator id="language" rowList="<%=(List)ProblemStatisticsTask.getProblemStatsByLanguage()%>">
                  <TR>
                    <TD class="bodyText" HEIGHT="18">&#160;
                        <nobr><b><%= language.getItem("language_name").toString() %></b></nobr>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= language.getItem("problems_presented").toString() %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= language.getItem("submitted").toString() %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= JSPUtils.autoFormat(language.getItem("submit_percent")) %>%
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= language.getItem("correct").toString() %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= JSPUtils.autoFormat(language.getItem("submission_accuracy")) %>%
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= JSPUtils.autoFormat(language.getItem("overall_accuracy")) %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= JSPUtils.autoFormat(language.getItem("avg_submission_points")) %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= JSPUtils.autoFormat(language.getItem("avg_final_points")) %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= JSPUtils.timeFormat(language.getItem("avg_time_elapsed")) %>
                    </TD>
                  </TR>
                </tces:rowIterator>

                  <TR>
                    <TD class="bodyText" HEIGHT="18">&#160;
                        <b>All</b>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= ProblemStatisticsTask.getStatistic("problems_presented") %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= ProblemStatisticsTask.getStatistic("problems_submitted") %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= ProblemStatisticsTask.getStatistic("submit_percent") %>%
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= ProblemStatisticsTask.getStatistic("problems_correct") %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= ProblemStatisticsTask.getStatistic("submission_accuracy") %>%
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= ProblemStatisticsTask.getStatistic("overall_accuracy") %>%
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= ProblemStatisticsTask.getStatistic("avg_submission_points") %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= ProblemStatisticsTask.getStatistic("average_points") %>
                    </TD>
                    <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="bodyText">
                        <%= JSPUtils.timeFormat(ProblemStatisticsTask.getProblemStats().getItem("avg_time_elapsed")) %>
                    </TD>
                  </TR>
              </TABLE>
              <P><BR></P>

              <p>
              <b>Coder Statistics [ <%= ProblemStatisticsTask.getHandle() %> ]</b>
              </p>

              <p>
              Status: <b><%= ProblemStatisticsTask.getStatistic("end_status_text") %></b>
              <br>
              Time to Submit: <b><%= JSPUtils.timeFormat(ProblemStatisticsTask.getProblemStats().getItem("time_elapsed")) %></b>
              <br>
              Points: <b><%= ProblemStatisticsTask.getStatistic("final_points") %></b>
              </p>

              <p>
              <b>Coder Submission Source Code</b>
              </p>

            </TD>
            <TD VALIGN="top" WIDTH="10"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
          </TR>
          <TR>
            <TD COLSPAN="4" WIDTH="100%"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
          </TR>
        </TABLE>
      <TD WIDTH="6"><IMG src="/i/corp/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"></TD>
      <TD WIDTH="10"><IMG src="/i/corp/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
      </TD>
      <TD WIDTH="25"><IMG src="/i/corp/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
    </TR>
  </TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
  <TR>
    <TD WIDTH="11" VALIGN="top"><IMG src="/i/corp/clear.gif" WIDTH="11" HEIGHT="8"></TD>
    <TD COLSPAN="4" VALIGN="top" WIDTH="100%" class="bodyText">
        <PRE><%= JSPUtils.htmlEncode(ProblemStatisticsTask.getStatistic("submission_text")) %></PRE>
    </TD>
  </TR>
</TABLE>

  </BODY>
</HTML>
