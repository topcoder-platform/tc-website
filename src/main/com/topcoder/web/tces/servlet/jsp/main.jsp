<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>

<TITLE>TopCoder | Employment Services</TITLE>

<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>

<jsp:include page="script.jsp" />
    
</HEAD>

<BODY id="tces">

<jsp:include page="top.jsp" />             

<jsp:useBean id="MainTask" scope="request" class="com.topcoder.web.tces.bean.MainTask" />

 <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">

<!-- Left Column Begins -->
      <TD WIDTH="170">
      </TD>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="8"></TD>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <TD class="statText" width="100%"><img src="/i/clear.gif" width="400" HEIGHT="11" BORDER="0"><BR>
            
            <jsp:include page="/body_top.jsp" >
                <jsp:param name="image" value="tces"/>
                <jsp:param name="image1" value="steelblue"/>
                <jsp:param name="title" value="<%=MainTask.getCompanyName()%>"/>
            </jsp:include><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"><BR>
            
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR VALIGN="top">
                    <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                    <TD class="statText" WIDTH="100%">
                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="400" HEIGHT="1" BORDER="0"/>
                        <P><B>Employment Campaigns for <jsp:getProperty name="MainTask" property="CompanyName"/></B></P>
                        <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                            <TR>
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18">&#160;<b>Campaign Name</b></TD>
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Start Date</b></TD>
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>End Date</b></TD>
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                            </TR>
    
                <%
                  /* this is some logic so that if you're an "admin" user, you'll get the company names
                     to separate the different campaigns.  if this tool get's big, we should do it better.
                   */                
                 int lastCompany;
                 if (MainTask.getCampaignInfoList().isEmpty()) {
                     lastCompany = -1;
                 } else {
                     lastCompany = Integer.parseInt(((ResultSetContainer)MainTask.getCampaignInfoList()).getItem(0, "company_id").toString());
                 }
                 int currCompany = -1;
                 int i=0;
                 %>
 
                <tces:rowIterator id="campaignInfo" rowList="<%=MainTask.getCampaignInfoList()%>">
                <% i++;
                   currCompany = Integer.parseInt(campaignInfo.getItem("company_id").toString()); 
                   if (currCompany != lastCompany || (MainTask.hasManyCompanies() && i==1)) { %> 
                  <TR><TD colspan="5" class="statTextBig"><BR/><BR/></TD></TR>
                  <TR><TD colspan="5" class="statTextBig"><%= campaignInfo.getItem("company_name").toString() %></TD></TR><BR/><BR/>
                <% lastCompany = currCompany;
                   } %>

                            <TR>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD class="statText" HEIGHT="18"><A HREF="<jsp:getProperty name="MainTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_DETAIL_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=campaignInfo.getItem("campaign_id").toString()%>" class="statText"><%=campaignInfo.getItem("campaign_name").toString()%></A></TD>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD class="statText"><%=campaignInfo.getItem("start_date").toString()%></TD>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD class="statText"><%=campaignInfo.getItem("end_date").toString()%></TD>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                            </TR>

                            </tces:rowIterator>

                            <% if(MainTask.getCampaignInfoList().isEmpty()){ %>
                
                            <TR><TD class="statText" HEIGHT="18" COLSPAN="20"><BR></TD></TR>                
                            <TR><TD class="statText" HEIGHT="18" align="center" colspan="5">Your job campaigns have expired.  Contact <A HREF="mailto:tces@topcoder.com" CLASS="statText">tces@topcoder.com</A> to renew your contract.</TD></TR>

                            <% } %>

                        </TABLE>
                        
                        <P><BR></P>
                    </TD>
                    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                </TR>

                <TR><TD COLSPAN="3" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
            </TABLE>
        </TD>
<!-- Center Column Ends -->

<!-- Gutter -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"></TD>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
      <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
      </TD>
<!-- Right Column Ends -->

<!-- Gutter -->
      <TD WIDTH="25"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
<!-- Gutter Ends -->

    </TR>
  </TABLE>

</BODY>
</HTML>
