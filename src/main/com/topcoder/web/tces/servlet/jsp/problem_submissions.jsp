<%@  page 
  language="java"
  errorPage="errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="ProblemSubmissionsTask" scope="request" class="com.topcoder.web.tces.bean.ProblemSubmissionsTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Recruiting Reports</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/corpStyle.css">
    <jsp:include page="script.jsp" />
    
  </HEAD>
  <body>
  <jsp:include page="top.jsp" />             
  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">
    <!-- Left Column Begins -->
      <TD WIDTH="170">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
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
                <tces:trailIterator id="trailItem" trailList="<%=ProblemSubmissionsTask.getTrail()%>">
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

              <B>Member Profile: <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "handle").toString()%> </B> <BR/>
              <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "first_name").toString()%> <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "last_name").toString()%> <BR/>
              <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "address1").toString()%>
              <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "address1").toString().equals("")?"":"<BR/>"+ProblemSubmissionsTask.getMemberInfo().getItem(0, "address2").toString()+"<BR/>"%>
              <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "city").toString()%>,
              <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "state_code").toString()%>
              <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "zip").toString()%> <BR/>
              <A HREF="mailto:<%=ProblemSubmissionsTask.getMemberInfo().getItem(0, "email").toString() %>" class="bodyText"><%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "email").toString() %></A> | <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "home_phone").toString()%> <BR/>
              <B>Interested in:</B> <jsp:getProperty name="ProblemSubmissionsTask" property="JobName"/><BR/>
              <% if (ProblemSubmissionsTask.hasResume()) { %>
                <a href="/Resume?&t=CorporateDownloadTask&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="ProblemSubmissionsTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="ProblemSubmissionsTask" property="JobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="ProblemSubmissionsTask" property="MemberID"/>" class="bodyText"><B>Resume</B></a>
              <% } %>
              </TD>
              </TR>
              </TABLE>

                  <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>" class="bodyText">
                            Coder Demographic Info</A>                          
                        </TD>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>" class="bodyText">
                            Coder Competition History</A>
                        </TD>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>" class="bodyText">
                            </A>Coder Problem Submissions                          
                        </TD>
                    </TR>
                  </TABLE>              
              
              <P><FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Problem Submissions</FONT></P>
              <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                <TR>
                  <TD class="testTableTitle" HEIGHT="18">&#160;<b>Date</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Event Name</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Division</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Level</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Coder Points</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Language</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Result</b></TD>
                </TR>

                
                <% int i=0; %>
                <tces:rowIterator id="submission" rowList="<%=(List)ProblemSubmissionsTask.getSubmissionList()%>">
                <% i++; %>
                  <TR>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>" HEIGHT="18">&#160;
                        <%= TCESConstants.DATE_FORMAT.format((java.sql.Timestamp)submission.getItem("date").getResultData()) %>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                      <A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>&<%=TCESConstants.ROUND_ID_PARAM%>=<%= submission.getItem("round_id").toString() %>" class="bodyText">
                        <%= submission.getItem("name").toString() %>
                      </A>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                        <%= submission.getItem("division_desc").toString() %>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                      <A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>&<%=TCESConstants.PROBLEM_ID_PARAM%>=<%= submission.getItem("problem_id").toString() %>" class="bodyText">
                        <%= submission.getItem("level_desc").toString() %>
                      </A>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                        <%= submission.getItem("final_points").toString() %>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                        <%= submission.getItem("language_name").toString() %>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                        <%= submission.getItem("end_status_text").toString() %>
                    </TD>
                  </TR>
                </tces:rowIterator>

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

<!-- Footer begins -->
<jsp:include page="foot.jsp" />             
<!-- Footer ends -->

</BODY>
</HTML>
