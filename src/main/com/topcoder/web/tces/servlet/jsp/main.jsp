<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML id="tces">
<HEAD>

<TITLE>TopCoder | Employment Services</TITLE>

<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css">
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css">

<jsp:include page="script.jsp" />
    
</HEAD>

<BODY id="tces">

<jsp:include page="top.jsp" />             

<jsp:useBean id="MainTask" scope="request" class="com.topcoder.web.tces.bean.MainTask" />

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">

<!-- Left Column Begins -->
      <TD WIDTH="25"><img src="/i/clear.gif" width="25" HEIGHT="11" alt="" BORDER="0"></TD>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="8" alt="" border="0"></TD>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <TD class="statText" width="100%" align="center"><br>
                    
            <jsp:include page="/body_top.jsp" >
                <jsp:param name="image" value="tces" />
                <jsp:param name="image1" value="steelblue" />
                <jsp:param name="title" value="<%=MainTask.getCompanyName()%>" />
            </jsp:include><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"><BR>
            
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="50%" align="center">
                <TR VALIGN="top">
                    <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statTextBig" WIDTH="100%">
                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="400" HEIGHT="10" BORDER="0"><br>
                        Employment Campaigns for <jsp:getProperty name="MainTask" property="CompanyName"/><br>
                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="10" BORDER="0">
                        <TABLE ID="dataTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="3" BORDER="0">
                            <TR>
                                <TD WIDTH="5" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                                <TD colspan="2" class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><strong>Campaign Name</strong></TD>
                                <TD WIDTH="10" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" nowrap="nowrap"><strong>Start Date</strong></TD>
                                <TD WIDTH="10" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" nowrap="nowrap"><strong>End Date</strong></TD>
                                <TD WIDTH="5" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
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
                            <TR>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                                <TD colspan="6" class="statTextBig"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"><br>
                                    <%= campaignInfo.getItem("company_name").toString() %></TD>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                            </TR>
                <% lastCompany = currCompany;
                   } %>

                            <TR>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                                <TD WIDTH="98%" class="statText"><A HREF="<jsp:getProperty name="MainTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_DETAIL_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=campaignInfo.getItem("campaign_id").toString()%>" class="statText"><%=campaignInfo.getItem("campaign_name").toString()%></A></TD>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD WIDTH="1%" class="statText" nowrap="nowrap"><%=campaignInfo.getItem("start_date").toString()%></TD>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD WIDTH="1%" class="statText" nowrap="nowrap"><%=campaignInfo.getItem("end_date").toString()%></TD>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                            </TR>

                            </tces:rowIterator>

                            <% if(MainTask.getCampaignInfoList().isEmpty()){ %>
                
                            <TR>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                                <TD class="statText" colspan="6">
                                    <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="5" BORDER="0"><br>
                                    Your job campaigns have expired.  Contact <A HREF="mailto:tces@topcoder.com" CLASS="statText">tces@topcoder.com</A> to renew your contract.</TD>
                                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                            </TR>

                            <% } %>

                        </TABLE>
                    </TD>
                    <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>

                <TR><TD COLSPAN="3" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD></TR>
                
                <P><BR></P>

            </TABLE>
        </TD>
<!-- Center Column Ends -->

<!-- Gutter -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" alt="" BORDER="0"></TD>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
      <TD WIDTH="25"><img src="/i/clear.gif" width="25" HEIGHT="11" alt="" BORDER="0"></TD>
<!-- Right Column Ends -->

    </TR>
</TABLE>

</BODY>
</HTML>
