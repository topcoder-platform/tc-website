<%@  page 
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
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
    <jsp:include page="script.jsp" />
    
  </HEAD>
  <BODY BGCOLOR="#43515E" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
  <jsp:include page="top.jsp" />             
  
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
           <jsp:param name="title" value="<%=CampaignInterestTask.getCompanyName()%>"/>  
        </jsp:include><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"><BR>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P ALIGN="center">
                <tces:trailIterator id="trailItem" trailList="<%=CampaignInterestTask.getTrail()%>">
                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="statText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                </tces:trailIterator>
              </P>
              <P><FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Campaign Interest</FONT></P>
              
              <P>
              <B><%=CampaignInterestTask.getCampaignName()%></B><BR>
              <a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.DEMOGRAPHIC_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>" class="statText">View collective demographic info</A><BR>
              </P>
              <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" BORDER="0">               
                <TR>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18">&#160;
                  <A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=handle&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="statText">
                  <b>Handle</b></A></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=rating_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="statText">                  
                  <b>Rating</b></A></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=state_code_sort" class="statText">                  
                  <b>State</b></A></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=country" class="statText">                                    
                  <b>Country</b></A></TD>                  
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc" class="statText">                  
                  <b>Type</b></A></TD>                  
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=school_name_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="statText">                  
                  <b>School</b></A></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=job_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="statText">
                  <b>Position</b></A></TD>                  
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif">
                  <A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=hit_date_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="statText">
                  <b>Hit Date</b></A></TD>                                    
                </TR>


                <tces:rowIterator id="hit" rowList="<%=CampaignInterestTask.getHitList()%>">

                <TR>
                  <TD class="statText" HEIGHT="18">&#160;
                  <A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.MEMBER_PROFILE_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<%=hit.getItem("job_id").toString()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=hit.getItem("coder_id").toString()%>" class="statText">
                    <%= hit.getItem("handle").toString() %>
                  </A></TD>
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" NOWRAP>
                    <%= hit.getItem("rating").toString() %>
                  </TD>
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText">
                    <%= hit.getItem("state_code").toString() %>
                  </TD>
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText">
                    <%= hit.getItem("country").toString() %>
                  </TD>                  
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText">
                    <%= hit.getItem("coder_type_desc").toString() %>
                  </TD>                  
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText">
                    <%= hit.getItem("school_name").toString() %>
                  </TD> 
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText"><A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<%=hit.getItem("job_id").toString()%>" class="statText">
                    <%= hit.getItem("job_desc").toString() %>
                  </A></TD>                                   
                  <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText">
                    <%= hit.getItem("hit_date").toString() %>
                  </TD>
                </TR>
                
                </tces:rowIterator>

                <% if(CampaignInterestTask.getHitList().isEmpty()){ %>
                <TR>
                  <TD class="statText" HEIGHT="18" COLSPAN="20"><BR></TD>                  
                </TR>                
                <TR>
                  <TD class="statText" HEIGHT="18" align="center" colspan='20'>
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
