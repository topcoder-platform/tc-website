<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder | Recruiting Reports</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css">

<jsp:include page="script.jsp" />
    
</head>

<body>

<jsp:include page="top.jsp" />             

<jsp:useBean id="MainTask" scope="request" class="com.topcoder.web.tces.bean.MainTask" />

<table width="100%" border="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">

<!-- Left Column Begins -->
      <td width="25"><img src="/i/clear.gif" width="25" height="11" alt="" border="0"></td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
      <td width="6"><img src="/i/clear.gif" width="6" height="8" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="50%" align="center">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Employment Campaigns for <jsp:getProperty name="MainTask" property="CompanyName"/></h1>
                    </td>
                </tr>
           </table>

            <table id="dataTable" width="50%" cellspacing="0" cellpadding="3" border="0">
                <tr>
                    <td colspan="2" class="testTableTitle">Campaign Name</td>
                    <td class="testTableTitle" nowrap="nowrap">Start Date</td>
                    <td class="testTableTitle" nowrap="nowrap">End Date</td>
                </tr>
    
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
                
                <tr><td colspan="4"><img src="/i/clear.gif" width="1" height="10" alt="" border="0"></td></tr>
                <tr><td colspan="4" class="testFormHeader"><%= campaignInfo.getItem("company_name").toString() %></td></tr>
                
                <% lastCompany = currCompany;
                   } %>

                <tr>
                    <td width="5" class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><img src="/i/clear.gif" alt="" width="5" height="1" border="0"></td>
                    <td width="60%" class="<%=i%2==1?"testTableOdd":"testTableEven"%>"><A HREF="<jsp:getProperty name="MainTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_DETAIL_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=campaignInfo.getItem("campaign_id").toString()%>" class="bodyText"><%=campaignInfo.getItem("campaign_name").toString()%></A></td>
                    <td width="20%" class="<%=i%2==1?"testTableOdd":"testTableEven"%>" nowrap="nowrap"><%=campaignInfo.getItem("start_date").toString()%></td>
                    <td width="20%" class="<%=i%2==1?"testTableOdd":"testTableEven"%>" nowrap="nowrap"><%=campaignInfo.getItem("end_date").toString()%></td>
                </tr>

                </tces:rowIterator>

                <% if(MainTask.getCampaignInfoList().isEmpty()){ %>
                
                <tr>
                    <td class="testTableOdd" colspan="4">
                        <img src="/i/clear.gif" alt="" width="10" height="10" border="0"><br>
                        Your job campaigns have expired. Contact <A HREF="mailto:tces@topcoder.com" class="bodyText">tces@topcoder.com</A> to renew your contract.<br>
                        <img src="/i/clear.gif" alt="" width="10" height="10" border="0"></td>
                </tr>

                <% } %>

            </table>

            <P><BR></P>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
      <td width="25"><img src="/i/clear.gif" width="25" height="11" alt="" border="0"></td>
<!-- Right Column Ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="foot.jsp" />             
<!-- Footer ends -->

</body>
</html>
