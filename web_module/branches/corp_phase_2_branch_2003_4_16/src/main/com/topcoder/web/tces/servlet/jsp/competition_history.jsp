<%@  page 
  language="java"
  errorPage="errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CompetitionHistoryTask" scope="request" class="com.topcoder.web.tces.bean.CompetitionHistoryTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Recruiting Reports</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/corpStyle.css">
    <jsp:include page="script.jsp"/>
  </HEAD>
  <body>
  <jsp:include page="top.jsp" />             
  
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
                <tces:trailIterator id="trailItem" trailList="<%=CompetitionHistoryTask.getTrail()%>">
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

              <B>Member Profile: <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "handle").toString()%> </B> <BR/>
              <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "first_name").toString()%> <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "last_name").toString()%> <BR/>
              <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "address1").toString()%>
              <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "address1").toString().equals("")?"":"<BR/>"+CompetitionHistoryTask.getMemberInfo().getItem(0, "address2").toString()+"<BR/>"%>
              <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "city").toString()%>,
              <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "state_code").toString()%>
              <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "zip").toString()%> <BR/>
              <A HREF="mailto:<%=CompetitionHistoryTask.getMemberInfo().getItem(0, "email").toString() %>" class="bodyText"><%= CompetitionHistoryTask.getMemberInfo().getItem(0, "email").toString() %></A> | <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "home_phone").toString()%> <BR/>
              <B>Interested in:</B> <jsp:getProperty name="CompetitionHistoryTask" property="JobName"/><BR/>
              <% if (CompetitionHistoryTask.hasResume()) { %>
                <a href="/Resume?&t=CorporateDownloadTask&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CompetitionHistoryTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="CompetitionHistoryTask" property="JobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="CompetitionHistoryTask" property="MemberID"/>" class="bodyText"><B>Resume</B></a>
              <% } %>
              </TD>
              </TR>
              </TABLE>
                  <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CompetitionHistoryTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionHistoryTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionHistoryTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionHistoryTask.getMemberID()%>" class="bodyText">
                            Coder Demographic Info</A>                          
                        </TD>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CompetitionHistoryTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionHistoryTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionHistoryTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionHistoryTask.getMemberID()%>" class="bodyText">
                            </A>Coder Competition History
                        </TD>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CompetitionHistoryTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionHistoryTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionHistoryTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionHistoryTask.getMemberID()%>" class="bodyText">
                            Coder Problem Submissions
                          </A>
                        </TD>
                    </TR>
                  </TABLE> 
                               
              
              <P><FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Competition History</FONT></P>
         <p>
          <A HREF="JavaScript:getGraph('/graph?c=rating_history_graph&amp;cr=<jsp:getProperty name="CompetitionHistoryTask" property="MemberID"/>','600','400')" class="bodyText">Rating History Graph</a> &nbsp;&nbsp;|&nbsp;&nbsp;
          <A HREF="JavaScript:getGraph('/graph?c=rating_distribution_graph','600','400')" class="bodyText">Overall Rating Distribution Graph</a>
        </p>                           
              <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                <TR>
                  <TD class="testTableTitle" HEIGHT="18">&#160;<b>Date</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Event Name</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Division</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Coder Points</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Avg Points</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Pre-Rating</b></TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Post-Rating</b></TD>
                </TR>

                
                <% int i=0; %>
                <tces:mapIterator id="comp" mapList="<%=(List)CompetitionHistoryTask.getCompetitionList()%>">
                <% i++; %>
                  <TR>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>" HEIGHT="18">&#160;
                        <%= (String)comp.get("date") %>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                      <A HREF="<jsp:getProperty name="CompetitionHistoryTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionHistoryTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionHistoryTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionHistoryTask.getMemberID()%>&<%=TCESConstants.ROUND_ID_PARAM%>=<%= (String)comp.get("round_id") %>" class="bodyText">
                        <%= (String)comp.get("contest_name") %>
                      </A>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                        <%= (String)comp.get("division_name") %>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                        <%= (String)comp.get("final_points") %>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                        <%= (String)comp.get("avg_points") %>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                        <%= (String)comp.get("old_rating") %>
                    </TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                        <%= (String)comp.get("new_rating") %>
                    </TD>
                  </TR>
                </tces:mapIterator>

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
