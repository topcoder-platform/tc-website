<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <jsp:include page="../script.jsp" />             
    
  </HEAD>
  <BODY BGCOLOR="#43515E" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
  <jsp:include page="../top_tces.jsp" />             
  


<jsp:useBean id="MemberProfileTask" scope="request" class="com.topcoder.web.tces.bean.MemberProfileTask" />

<% Map MemberInfo = MemberProfileTask.getMemberInfo(); %>

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
           <jsp:param name="title" value="<%=MemberProfileTask.getCompanyName()%>"/>
        </jsp:include><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"><BR>

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P ALIGN="center">
                <tces:trailIterator id="trailItem" trailList="<%=MemberProfileTask.getTrail()%>">
                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="statText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                </tces:trailIterator>
              </P>
            
            <P align="center">
            <% if (MemberProfileTask.getImagePath().length() > 0) { %>
            <TABLE WIDTH="100%">
            <TD class="statText" ALIGN="right">
                <IMG SRC="<%=MemberProfileTask.getImagePath()%>"/>
            </TD>
            <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" ALIGN="left">
            <% } %>
            
              <B>Member Profile: <%= MemberInfo.get(TCESConstants.MEM_INFO_HANDLE_KEY)%> </B>
              <BR>
              <%= MemberInfo.get(TCESConstants.MEM_INFO_FULLNAME_KEY)%>
              <BR>
              <%= MemberInfo.get(TCESConstants.MEM_INFO_FULLADDR_KEY)%>
              <BR>
              <%= MemberInfo.get(TCESConstants.MEM_INFO_CONTACT_KEY)%>
              <BR>
              <B>Interested in 
                <A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>" class="statText">
                    <%=MemberProfileTask.getJobName()%>
                </A>
              </B>
              
              <% if (MemberProfileTask.getImagePath().length() > 0) { %>
              </TD></TR></TABLE>
              <% } %>
              </P>                            
              
              
              <P align="center">
              <A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.MEMBER_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="statText">View all position interest for <%= MemberInfo.get(TCESConstants.MEM_INFO_HANDLE_KEY)%></A>
              </P>                            
              
              <P>
              <B>Member Type:</B> <%=MemberInfo.get(TCESConstants.MEM_INFO_MEMTYPE_KEY)%> <BR>
              <B>TopCoder Member Since:</B> <%=MemberInfo.get(TCESConstants.MEM_INFO_SINCE_KEY)%><BR>
              <% if (MemberProfileTask.getIsStudent()) { %>
                <B>School:</B> <%=MemberInfo.get(TCESConstants.MEM_INFO_SCHOOLNAME_KEY)%> <BR>
                <B>Degree:</B> <%=MemberInfo.get(TCESConstants.MEM_INFO_DEGREE_KEY)%> <BR>
                <B>Major:</B> <%=MemberInfo.get(TCESConstants.MEM_INFO_MAJOR_KEY)%> <BR>
                <B>Graduation Date:</B> <%=MemberInfo.get(TCESConstants.MEM_INFO_GRADDATE_KEY)%> <BR>
              
              <% } %>

              <% if (MemberProfileTask.hasResume()) { %>
                <a href="/Resume?&t=CorporateDownloadTask" class="statText">Click here to download resume.</a>
              <% } %>

              </P>
              
<% if (MemberProfileTask.getIsRanked()) { %>
              
                  <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BORDER="0">
                    <TR>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="statText">
                            Coder Demographic Info
                          </A>
                        </TD>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="statText">
                            Coder Competition History
                          </A>
                        </TD>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="statText">
                            Coder Problem Submissions
                          </A>
                        </TD>
                    </TR>
                  </TABLE>

                  <P>
                  <B>Current Rating:</B> <%=MemberInfo.get(TCESConstants.MEM_RATING_CURRENT_KEY)%><BR>
                  <B>Highest Rating:</B> <%=MemberInfo.get(TCESConstants.MEM_RATING_HIGH_KEY)%><BR>
                  <B>Lowest Rating:</B> <%=MemberInfo.get(TCESConstants.MEM_RATING_LOW_KEY)%><BR>
                  <B>Rating Percentile:</B> <%=MemberInfo.get(TCESConstants.MEM_RATING_PCTILE_KEY)%><BR>
                  <B>Number of Ratings:</B> <%=MemberInfo.get(TCESConstants.MEM_RATING_NUMEVENTS_KEY)%><BR>
                  <B>Most Recent Rated Event:</B> <%=MemberInfo.get(TCESConstants.MEM_RATING_MOSTRECENT_KEY)%><BR>
                  </P>    

    <% if (MemberProfileTask.hasDivisionI()) { %>
                  <P>
                  &nbsp;<BR>
                  <B>Division I Performance</B>
                  </P>    

                  <P>
                  <B>Average Points per Contest:</B> <%= MemberProfileTask.getDivIStatistic("avg_contest_points") %>
                  </P>    

                  <P>
                  <B>Statistics by Problem Level:<br></B>
                  <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" BORDER="0">               
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

                

                  <tces:rowIterator id="level" rowList="<%=(List)MemberProfileTask.getDivIStatsByLevel()%>">
                    <TR>
                      <TD class="statText" HEIGHT="18">
                        <nobr>&#160;<b><%= level.getItem("level_desc").toString() %></b></nobr>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= level.getItem("presented").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= level.getItem("submitted").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.autoFormat(level.getItem("submit_percent")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= level.getItem("correct").toString() %>
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
                        <%= JSPUtils.autoFormat(level.getItem("avg_final_points")) %>
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
                        <%= MemberProfileTask.getDivIStatistic("total_presented") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("total_submitted") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("total_submit_percent") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("correct") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("total_submission_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("total_overall_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("avg_submission_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("avg_overall_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.timeFormat(MemberProfileTask.getDivIStats().getItem("avg_time_elapsed")) %>
                      </TD>
                    </TR>
                  </TABLE>
                  </P>    

                  <P>
                  <B>Statistics by Language:<br></B>
                  <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" BORDER="0">               
                    <TR>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18">&#160;<b></b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Submitted</b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Submit %</b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Correct</b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Submission Accuracy</b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Avg Points for Submissions</b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Avg Time to Submit</b></TD>
                    </TR>

                

                  <tces:rowIterator id="language" rowList="<%=(List)MemberProfileTask.getDivIStatsByLang()%>">
                    <TR>
                      <TD class="statText" HEIGHT="18">
                        <nobr>&#160;<b><%= language.getItem("language_name").toString() %></b></nobr>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= language.getItem("submitted").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.autoFormat(language.getItem("submit_percent")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= language.getItem("num_correct").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.autoFormat(language.getItem("submission_accuracy")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.autoFormat(language.getItem("avg_submission_points")) %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.timeFormat(language.getItem("avg_submit_time")) %>
                      </TD>
                    </TR>
                  </tces:rowIterator>

                    <TR>
                      <TD class="statText" HEIGHT="18">
                        &#160;<b>All</b>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("total_submitted") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("total_submit_percent") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("correct") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("total_submission_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIStatistic("avg_submission_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.timeFormat(MemberProfileTask.getDivIStats().getItem("avg_time_elapsed")) %>
                      </TD>
                    </TR>
                  </TABLE>
                  </P>    
    <% } %>

    <% if (MemberProfileTask.hasDivisionII()) { %>
                  <P>
                  &nbsp;<BR>
                  <B>Division II Performance</B>
                  </P>    

                  <P>
                  <B>Average Points per Contest:</B> <%= MemberProfileTask.getDivIIStatistic("avg_contest_points") %>
                  </P>    

                  <P>
                  <B>Statistics by Problem Level:<br></B>
                  <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" BORDER="0">               
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

                

                  <tces:rowIterator id="level" rowList="<%=(List)MemberProfileTask.getDivIIStatsByLevel()%>">
                    <TR>
                      <TD class="statText" HEIGHT="18">
                        <nobr>&#160;<b><%= level.getItem("level_desc").toString() %></b></nobr>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= level.getItem("presented").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= level.getItem("submitted").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.autoFormat(level.getItem("submit_percent")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= level.getItem("correct").toString() %>
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
                        <%= JSPUtils.autoFormat(level.getItem("avg_final_points")) %>
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
                        <%= MemberProfileTask.getDivIIStatistic("total_presented") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submitted") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submit_percent") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("correct") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submission_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("total_overall_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("avg_submission_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("avg_overall_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.timeFormat(MemberProfileTask.getDivIIStats().getItem("avg_time_elapsed")) %>
                      </TD>
                    </TR>
                  </TABLE>
                  </P>    

                  <P>
                  <B>Statistics by Language:<br></B>
                  <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" BORDER="0">               
                    <TR>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18">&#160;<b></b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Submitted</b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Submit %</b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Correct</b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Submission Accuracy</b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Avg Points for Submissions</b></TD>
                      <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Avg Time to Submit</b></TD>
                    </TR>

                

                  <tces:rowIterator id="language" rowList="<%=(List)MemberProfileTask.getDivIIStatsByLang()%>">
                    <TR>
                      <TD class="statText" HEIGHT="18">
                        <nobr>&#160;<b><%= language.getItem("language_name").toString() %></b></nobr>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= language.getItem("submitted").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.autoFormat(language.getItem("submit_percent")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= language.getItem("num_correct").toString() %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.autoFormat(language.getItem("submission_accuracy")) %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.autoFormat(language.getItem("avg_submission_points")) %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.timeFormat(language.getItem("avg_submit_time")) %>
                      </TD>
                    </TR>
                  </tces:rowIterator>

                    <TR>
                      <TD class="statText" HEIGHT="18">
                        &#160;<b>All</b>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submitted") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submit_percent") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("correct") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("total_submission_accuracy") %>%
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= MemberProfileTask.getDivIIStatistic("avg_submission_points") %>
                      </TD>
                      <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                      <TD class="statText">
                        <%= JSPUtils.timeFormat(MemberProfileTask.getDivIIStats().getItem("avg_time_elapsed")) %>
                      </TD>
                    </TR>
                  </TABLE>
                  </P>    
    <% } %>

<% } else { %>
            
                <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BORDER="0">
                  <TR>
                    <TD class="statText" ALIGN="left" WIDTH="100%">
                      <A HREF="<jsp:getProperty name="MemberProfileTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberProfileTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberProfileTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberProfileTask.getMemberID()%>" class="statText">
                        Coder Demographic Info
                      </A>
                    </TD>
                  </TR>
                  <TR>
                    <TD class="statText" ALIGN="center" WIDTH="100%">
                      <%= MemberInfo.get(TCESConstants.MEM_INFO_HANDLE_KEY)%> is not ranked in competition.
                    </TD>
                  </TR>
                </TABLE>
            
<% } %>
              
                  <P><BR></P>
              
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
