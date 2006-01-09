<%@ page contentType="text/html;charset=utf-8" %>
<%@  page
  language="java"
  import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder | Recruiting Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/corpStyle.css"/>

<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<jsp:useBean id="MainTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.MainTask" />

<table width="100%" border=0 cellpadding=0 cellspacing=0 align=center>
	<TR valign="top">
		<td width="50%"><jsp:include page="left.jsp" /></td>
<!-- Center Column Begins -->
        <td class=recruitingBody>
			<img src="/i/corp/clear.gif" width="700" height="11" alt="" border=0><br/>
            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrameNB">
                <tr valign="top">
                    <td class="bodyText">
                        <p><span class=testHead>Employment Campaigns for <jsp:getProperty name="MainTask" property="companyName"/></span></p>
                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="700" class="screeningFrame">
                <tr>
                    <td class="screeningHeader">Campaign Name</td>
                    <td class="screeningHeader" nowrap="nowrap" align=center>Start Date</td>
                    <td class="screeningHeader" nowrap="nowrap" align=center>End Date</td>
                    <td class="screeningHeader" nowrap="nowrap" align=center>Most Recent Hit</td>
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

                <tr><td colspan=4 class="screeningHeader"><%= campaignInfo.getItem("company_name").toString() %></td></tr>

                <% lastCompany = currCompany;
                   } %>

                <tr>
                    <td width="40%" class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">&#160;&#160;&#160;<A HREF="<jsp:getProperty name="MainTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_DETAIL_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=campaignInfo.getItem("campaign_id").toString()%>" class="bodyText"><%=campaignInfo.getItem("campaign_name").toString()%></A></td>
                    <td width="20%" class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap="nowrap" align=center><%=campaignInfo.getItem("start_date").toString()%></td>
                    <td width="20%" class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap="nowrap" align=center><%=campaignInfo.getItem("end_date").toString()%></td>
                    <td width="20%" class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap="nowrap" align=center><rsc:item row="<%=campaignInfo%>" name="most_recent_hit" format="MM/dd/yyyy"/></td>
                </tr>

                </tces:rowIterator>

                <% if(MainTask.getCampaignInfoList().isEmpty()){ %>

                <tr>
                    <td class="screeningCellOdd" colspan=4>
                        <img src="/i/corp/clear.gif" alt="" width="10" height="10" border=0><br>
                        Your job campaigns have expired. Contact <A HREF="mailto:tces@topcoder.com" class="bodyText">tces@topcoder.com</A> to renew your contract.<br>
                        <img src="/i/corp/clear.gif" alt="" width="10" height="10" border=0></td>
                </tr>

                <% } %>

            </table>

            <P><BR></P>

        </td>
<!-- Center Column Ends -->
		<td class=homeRightPromos width="50%"><jsp:include page="right.jsp" /></td>
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->

</body>
</html>
