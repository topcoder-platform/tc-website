<%@  page 
  language="java"
  import="java.util.*,
          java.io.*,
          java.text.*,
          javax.naming.*,
          com.coolservlets.forum.*,
          com.coolservlets.forum.util.*,
          weblogic.common.T3Services,
          com.topcoder.common.web.data.Navigation,
          com.topcoder.common.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>
          
<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CampaignInterestTask" scope="request" class="com.topcoder.web.tces.bean.CampaignInterestTask" />          
          
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <%@ include file="/script.jsp" %>
  </HEAD>
  <BODY BGCOLOR="#43515E" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
  <%@ include file="/top.jsp" %>
  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" bgcolor="#001935" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <%@ include file="left.jsp" %>
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
           <jsp:param name="title" value="<%=CampaignInterestTask.getCompanyName()%>"/>  
        </jsp:include><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"><BR>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P><B>Campaign Interest</B></P>
              
              <P>
              <B><%=CampaignInterestTask.getCampaignName()%></B><BR>
              <a href="/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.DEMOGRAPHIC_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>" class="statText">View collective demographic info</A><BR>
              </P>
              <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" BORDER="0">               
                <TR>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18">&#160;
                  <A HREF="/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.SORT_PARAM%>=<%=TCESConstants.SORT_HANDLE%>&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="statText">
                  <b>Handle</b></A></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">\
                  <A HREF="/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.SORT_PARAM%>=<%=TCESConstants.SORT_RATING%>&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="statText">                  
                  <b>Rating</b></A></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.SORT_PARAM%>=<%=TCESConstants.SORT_STATE%>" class="statText">                  
                  <b>State</b></A></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.SORT_PARAM%>=<%=TCESConstants.SORT_COUNTRY%>" class="statText">                                    
                  <b>Country</b></A></TD>                  
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.SORT_PARAM%>=<%=TCESConstants.SORT_TYPE%>" class="statText">                  
                  <b>Type</b></A></TD>                  
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.SORT_PARAM%>=<%=TCESConstants.SORT_SCHOOL%>&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="statText">                  
                  <b>School</b></A></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.SORT_PARAM%>=<%=TCESConstants.SORT_POSITION%>&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="statText">
                  <b>Position</b></A></TD>                  
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.SORT_PARAM%>=<%=TCESConstants.SORT_HITDATE%>" class="statText">                                    
                  <b>Hit Date</b></A></TD>                                    
                </TR>


                <tces:mapIterator id="hit" mapList="<%=(List)CampaignInterestTask.getHitList()%>">

                <TR>
                  <TD class="statText" HEIGHT="18">&#160;
                  <A HREF="/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.MEMBER_PROFILE_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=(String)hit.get("job_id")%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=(String)hit.get("coder_id")%>" class="statText">
                    <%= (String)hit.get("handle") %>
                  </A></TD>
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" NOWRAP>
                    <%= (String)hit.get("rating") %>
                  </TD>
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText">
                    <%= (String)hit.get("state") %>
                  </TD>
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText">
                    <%= (String)hit.get("country") %>
                  </TD>                  
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText">
                    <%= (String)hit.get("type") %>
                  </TD>                  
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText">
                    <%= (String)hit.get("school") %>
                  </TD> 
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText"><A HREF="/tces/tces?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=(String)hit.get("job_id")%>" class="statText">
                    <%= (String)hit.get("position") %>
                  </A></TD>                                   
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText">
                    <%= (String)hit.get("hit_date") %>
                  </TD>
                </TR>
                
                </tces:mapIterator>


              </TABLE>
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
        <%@ include file="right.jsp" %> 
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

  <%@ include file="../foot_tces.jsp" %>

  </BODY>
</HTML>
