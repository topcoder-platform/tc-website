<%@  page 
  language="java"
  errorPage="errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>
          
<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="PositionInterestTask" scope="request" class="com.topcoder.web.tces.bean.PositionInterestTask" />          

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
                <tces:trailIterator id="trailItem" trailList="<%=PositionInterestTask.getTrail()%>">
                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                </tces:trailIterator>
              </P>
              <P><FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Position Interest</FONT></P>
              
              <P>
              <B>Campaign:</B> <jsp:getProperty name="PositionInterestTask" property="CampaignName"/><BR>
              <B>Position:</B> <jsp:getProperty name="PositionInterestTask" property="PositionName"/><BR>
              <a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.DEMOGRAPHIC_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>" class="bodyText">View collective demographic info</A><BR>
              </P>
                            
              
              <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                <TR>
                  <TD class="testTableTitle" HEIGHT="18">
                    <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=handle&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="bodyText">
                    <b>Handle</b></A>
                  </TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle">
                    <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=rating_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="bodyText">
                    <b>Rating</b></A>
                  </TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle">
                    <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=state_code_sort" class="bodyText">
                    <b>State</b></A>
                  </TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle">
                    <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=country_code" class="bodyText">                  
                    <b>Country</b></A>
                  </TD>                  
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle">
                    <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc" class="bodyText">
                    <b>Type</b></A>
                  </TD>                  
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle">
                    <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=school_name_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="bodyText">
                    <b>School</b></A>
                  </TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle">
                    <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=gpa_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="bodyText">
                    <B>GPA</B></A>
                  </TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle">
                    <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=grad_year_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="bodyText">
                    <B>Grad. Year</B></A>
                  </TD>
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle">
                    <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=hit_date_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>"" class="bodyText">
                    <b>Hit Date</b></A>
                  </TD>                                    
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle">
                    <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=has_resume&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="bodyText">
                    <b>Resume</b></A>
                  </TD>                                    
                  <TD class="testTableTitle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="testTableTitle">
                    <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=language_name&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="bodyText">
                    <b>Language</b></A>
                  </TD>
                </TR>

                <% int i=0; %>
                <tces:rowIterator id="hit" rowList="<%=PositionInterestTask.getHitList()%>">
                <% i++; %>

                <TR>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>" HEIGHT="18">&#160;
                  <A HREF="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.MEMBER_PROFILE_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=hit.getItem("coder_id").toString()%>" class="bodyText">
                    <%= hit.getItem("handle").toString() %>
                  </A>
                  </TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                    <%= hit.getItem("rating").toString() %>
                  </TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                    <%= hit.getItem("state_code").toString() %>
                  </TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                    <%= hit.getItem("country_code").toString() %>
                  </TD>                  
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                    <%= hit.getItem("coder_type_desc").toString() %>
                  </TD>                  
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                    <%= hit.getItem("school_name").toString() %>
                  </TD>                  
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                    <%= hit.getItem("gpa").toString() %>
                  </TD>                  
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                    <%= hit.getItem("grad_year").toString() %>
                  </TD>                  
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                    <%= hit.getItem("hit_date").toString() %>
                  </TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                    <%=hit.getItem("has_resume").toString().equals("1")?"Yes":"No"%>  
                  </TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                    <%=hit.getItem("language_name").toString()%>
                  </TD>
                </TR>
                
                </tces:rowIterator>

                <% if(PositionInterestTask.getHitList().isEmpty()){ %>
                <TR>
                  <TD class="bodyText" HEIGHT="18" COLSPAN="20"><BR></TD>                  
                </TR>                
                <TR>
                  <TD class="bodyText" HEIGHT="18" align="center" colspan='20'>
                    No hits available.
                  </TD>
                </TR>
                <% } %>
                
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
