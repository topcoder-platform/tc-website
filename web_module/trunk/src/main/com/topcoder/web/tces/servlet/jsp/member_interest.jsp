<%@  page 
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>
          
<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="MemberInterestTask" scope="request" class="com.topcoder.web.tces.bean.MemberInterestTask" />          
          
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <jsp:include page="script.jsp" />
    
  </HEAD>
  <BODY class="tces">
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
           <jsp:param name="title" value="<%=MemberInterestTask.getCompanyName()%>"/>  
        </jsp:include><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"><BR>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
          <TR>
            <TD WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P ALIGN="center">
                <tces:trailIterator id="trailItem" trailList="<%=MemberInterestTask.getTrail()%>">
                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="statText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                </tces:trailIterator>
              </P>
        <p>
        <b>
        <FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Member Profile: <jsp:getProperty name="MemberInterestTask" property="Handle"/></FONT>
        </b>
        </p>                                    
                  <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="statText">
                            Coder Demographic Info</A>                          
                        </TD>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="statText">
                            Coder Competition History</A>
                        </TD>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="statText">
                            Coder Problem Submissions</A>                          
                        </TD>
                    </TR>
                  </TABLE>               
              
              <P>
              <FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Member Interest</FONT>
              <BR/>
              <B>Campaign:</B> <%=MemberInterestTask.getCampaignName()%><BR>
              </P>
              <TABLE ID="dataTable" WIDTH="50%" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                <TR>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18">&#160;<b>Position Name</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Hit Date</b></TD>
                </TR>


                <tces:rowIterator id="hit" rowList="<%=(List)MemberInterestTask.getHitList()%>">

                <TR>
                  <TD class="statText" HEIGHT="18">&#160;
                    <%= hit.getItem("job_desc").toString() %>
                  </TD>                                   
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText">
                    <%= JSPUtils.autoFormat(hit.getItem("timestamp")) %>
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
  <!-- Body Ends -->

  </BODY>
</HTML>
