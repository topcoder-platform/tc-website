<%@  page 
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
function openWnd(pageUrl) {
  var width = screen.availWidth * 2 / 3;
  var height = screen.availHeight / 2;
  var left = (screen.availWidth - width) / 2;
  var top = 0;
  OpenWin=this.open(pageUrl,"CtrlWindow",
            "toolbar=yes,menubar=yes,location=yes,scrollbars=yes,resizable=yes"
            + ",width=" + width + ",height=" + height
            + ",left=" + left + ",top=" + top);
}
// End -->
</SCRIPT>

<jsp:useBean id="ProblemStatisticsTask" scope="request" class="com.topcoder.web.tces.bean.ProblemStatisticsTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <jsp:include page="../script.jsp"/>
  </HEAD>
  <BODY BGCOLOR="#43515E" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
  <jsp:include page="../top.jsp" />             
  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" bgcolor="#001935" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD WIDTH="4" BGCOLOR="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <!-- Center Column Begins -->
      <TD class="statText" width="100%" bgcolor="#001935" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
        <jsp:include page="/body_top.jsp" >  
           <jsp:param name="image" value="tces"/>  
           <jsp:param name="image1" value="steelblue"/>  
           <jsp:param name="title" value="Member Profile"/>
        </jsp:include>
        
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <p>
              <b>Problem Statistics</b>
              </p>
      
              <p>
              <b>General Statistics</b>
              </p>
      
              <p>
              <B>Problem Name:</B> <%= ProblemStatisticsTask.getStatistic("class_name") %>
              <br>
              <B>Division:</B> <%= ProblemStatisticsTask.getStatistic("division_desc") %>
              <br>
              <B>Problem Level:</B> <%= ProblemStatisticsTask.getStatistic("level_desc") %>
              <br>
              <B># of Competitors:</B> <%= ProblemStatisticsTask.getStatistic("problems_presented") %>
              </p>
      
              <p>
                <A HREF="javascript:openWnd('/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_STATEMENT_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemStatisticsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemStatisticsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemStatisticsTask.getMemberID()%>&<%=TCESConstants.PROBLEM_ID_PARAM%>=<%=ProblemStatisticsTask.getProblemID()%>')" class="statText">
                  View Problem Statement
                </A>
              </P>

              <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" BORDER="0">               
                <TR>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18">&#160;<b>Language</b></TD>
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

                

                <tces:rowIterator id="language" rowList="<%=(List)ProblemStatisticsTask.getProblemStatsByLanguage()%>">
                  <TR>
                    <TD class="statText" HEIGHT="18">&#160;
                        <nobr><b><%= language.getItem("language_name").toString() %></b></nobr>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= language.getItem("problems_presented").toString() %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= language.getItem("submitted").toString() %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.autoFormat(language.getItem("submit_percent")) %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= language.getItem("correct").toString() %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.autoFormat(language.getItem("submission_accuracy")) %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.autoFormat(language.getItem("overall_accuracy")) %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.autoFormat(language.getItem("avg_submission_points")) %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.autoFormat(language.getItem("avg_final_points")) %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= JSPUtils.timeFormat(language.getItem("avg_time_elapsed")) %>
                    </TD>
                  </TR>
                </tces:rowIterator>

                  <TR>
                    <TD class="statText" HEIGHT="18">&#160;
                        <b>All</b>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= ProblemStatisticsTask.getStatistic("problems_presented") %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= ProblemStatisticsTask.getStatistic("problems_submitted") %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= ProblemStatisticsTask.getStatistic("submit_percent") %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= ProblemStatisticsTask.getStatistic("problems_correct") %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= ProblemStatisticsTask.getStatistic("submission_accuracy") %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= ProblemStatisticsTask.getStatistic("overall_accuracy") %>%
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= ProblemStatisticsTask.getStatistic("avg_submission_points") %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <%= ProblemStatisticsTask.getStatistic("average_points") %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
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

<PRE>
<%= JSPUtils.htmlEncode(ProblemStatisticsTask.getStatistic("submission_text")) %>
</PRE>

    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <!-- <TR>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#001935" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#001935" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" bgcolor="#001935"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR> -->
</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="4" bgcolor="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
      <!-- Right Column Begins -->
      <TD WIDTH="10" bgcolor="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
        <!-- Right Column Include Begins -->
        <!--include virtual="/includes/public_right_col.shtml"-->
        <!-- Right Column Include Ends -->
      </TD>
      <!-- Right Column Ends -->
      <!-- Gutter -->
      <TD WIDTH="25" bgcolor="#001935"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
    </TR>
  </TABLE>
  <!-- Body Ends -->

  </BODY>
</HTML>
