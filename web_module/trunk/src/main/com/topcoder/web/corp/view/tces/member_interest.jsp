<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.JSPUtils,
          com.topcoder.web.corp.common.TCESConstants" %>
          
<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="MemberInterestTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.MemberInterestTask" />
          
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
            <TD class="bodyText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P ALIGN="center">
                <tces:trailIterator id="trailItem" trailList="<%=MemberInterestTask.getTrail()%>">
                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                </tces:trailIterator>
              </P>
        <p>
        <b>
        <FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Member Profile: <jsp:getProperty name="MemberInterestTask" property="Handle"/></FONT>
        </b>
        </p>                                    
                  <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="bodyText">
                            Coder Demographic Info</A>
                        </TD>
                        <% if (MemberInterestTask.isRanked()) { %>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="bodyText">
                            Coder Competition History</A>
                        </TD>
                        <TD class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="bodyText">
                            Coder Problem Submissions</A>
                        </TD>
                        <% } %>
                    </TR>
                  </TABLE>

              <P>
              <FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Member Interest</FONT>
              <BR/>
              <B>Campaign:</B> <%=MemberInterestTask.getCampaignName()%><BR>
              </P>
              <TABLE ID="dataTable" WIDTH="50%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                <TR>
                  <TD class="testTableTitle" HEIGHT="18">&#160;<b>Position Name</b></TD>
                  <TD class="testTableTitle"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle"><b>Hit Date</b></TD>
                </TR>


                <% int i=0; %>
                <tces:rowIterator id="hit" rowList="<%=(List)MemberInterestTask.getHitList()%>">
                <% i++; %>

                <TR>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>" HEIGHT="18">&#160;
                    <%= hit.getItem("job_desc").toString() %>
                  </TD>                                   
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                    <%= JSPUtils.autoFormat(hit.getItem("timestamp")) %>
                  </TD>
                </TR>
                
                </tces:rowIterator>


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

<!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->

</BODY>
</HTML>
