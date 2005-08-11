<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc"%>

<jsp:useBean id="CampaignInterestTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.CampaignInterestTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>

<title>TopCoder | Recruiting Reports</title>

<!-- JavaScript begins -->
<jsp:include page="script.jsp" />
<!-- JavaScript ends -->

</head>

<body>

<!-- Top begins -->
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include><!-- Top ends -->

<table width=100% border=0 cellpadding=0 cellspacing=0 align=center>
	<TR valign="top">
		<td width="50%"><jsp:include page="left.jsp" /></td>
<!-- Center Column Begins -->
        <td class=recruitingBody>
			<img src="/i/corp/clear.gif" width="700" height="11" alt="" border=0><br/>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class=bodyText>
                        <p>
                        <tces:trailIterator id="trailItem" trailList="<%=CampaignInterestTask.getTrail()%>">
                            <a href="<jsp:getProperty name="trailItem" property="href" />" class="bodyText"><jsp:getProperty name="trailItem" property="name" /></a> &gt;
                        </tces:trailIterator>
						<br/>
						<span class=testHead>Campaign Interest</span>
						<br/><br/>
                        <strong>Campaign:</strong> <%=CampaignInterestTask.getCampaignName()%><br/>
                        <a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.DEMOGRAPHIC_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>" class="bodyText">View collective demographic info</a><br/>
                        </p>
                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                    <td class="screeningHeader" width="50%"><A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=handle&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="screeningHeader"><strong>Handle</strong></a></td>
                    <td class="screeningHeader"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=rating_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="screeningHeader"><strong>Rating</strong></a></td>
                    <td class="screeningHeader"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=design_rating&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="screeningHeader"><strong>Design <br />Rating</strong></a></td>
                    <td class="screeningHeader"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=dev_rating&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="screeningHeader"><strong>Develoment <br />Rating</strong></a></td>
                    <td class="screeningHeader"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=state_code_sort" class="screeningHeader"><strong>State</strong></a></td>
                    <td class="screeningHeader" width="50%"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=country" class="screeningHeader"><strong>Country</strong></a></td>
                    <td class="screeningHeader"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc" class="screeningHeader"><strong>Type</strong></a></td>
                    <td class="screeningHeader"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=school_name_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="screeningHeader"><strong>School</strong></a></td>
                    <td class="screeningHeader"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=job_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="screeningHeader"><strong>Position</strong></a></td>
                    <td class="screeningHeader"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.SORT_PARAM%>=hit_date_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="screeningHeader"><strong>Hit Date</strong></a></td>
                  <td class="screeningHeader" align=center><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.SORT_PARAM%>=has_resume&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="screeningHeader">Resume</a> </td>
                  <td class="screeningHeader"><a href="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CAMPAIGN_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CampaignInterestTask.getCampaignID()%>&<%=TCESConstants.SORT_PARAM%>=language_name&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="screeningHeader">Lang.</a></td>
                </tr>

                <% int i=0; %>
                <%--not indenting to save some space on the download cuz this can be a big loop
                    and the spaces significantly impact the size of the html source
                --%>
                <tces:rowIterator id="hit" rowList="<%=CampaignInterestTask.getHitList()%>"><% i++; %>
				<tr valign=middle>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><tces:handleTag campaignId="<%=CampaignInterestTask.getCampaignID()%>" jobId='<%=hit.getLongItem("job_id")%>' coderId='<%=hit.getLongItem("coder_id")%>' companyId="<%=CampaignInterestTask.getCompanyId()%>"/></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= hit.getItem("rating").toString() %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><rsc:item name="design_rating" format="#" row="<%=hit%>" ifNull="Not Rated"/></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><rsc:item name="dev_rating" format="#" row="<%=hit%>" ifNull="Not Rated"/></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= hit.getItem("state_code").toString() %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= hit.getItem("country").toString() %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= hit.getItem("coder_type_desc").toString() %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= hit.getItem("school_name").toString() %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" nowrap=nowrap><A HREF="<jsp:getProperty name="CampaignInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CampaignInterestTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<%=hit.getItem("job_id").toString()%>" class="bodyText"><%= hit.getItem("job_desc").toString() %></a></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= hit.getItem("hit_date").toString() %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="center"><%=hit.getItem("has_resume").toString().equals("1")?"Yes":"No"%></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%=hit.getItem("language_name").toString()%></td>
				</tr>
				</tces:rowIterator>

                <% if(CampaignInterestTask.getHitList().isEmpty()){ %>

                <tr><td class="bodyText" HEIGHT="18" COLSPAN="20"><br/></td></tr>

                <tr><td class="bodyText" HEIGHT="18" align="center" colspan="20">No hits available.</td></tr>

                <% } %>

            </table>

            <p><br/></p>
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
