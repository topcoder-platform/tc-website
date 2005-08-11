<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="PositionInterestTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.PositionInterestTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>TopCoder | Recruiting Reports</title>
    <jsp:include page="script.jsp" />
</head>

<body>

<!-- Header Begins -->
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include><!-- Header Ends -->


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
                        <tces:trailIterator id="trailItem" trailList="<%=PositionInterestTask.getTrail()%>">
                            <a href="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></a> &gt;
                        </tces:trailIterator>
						<br/>
						<span class=testHead>Position Interest</span>
						<br/><br/>
                        <strong>Campaign:</strong> <jsp:getProperty name="PositionInterestTask" property="CampaignName"/><br/>
                        <strong>Position:</strong> <jsp:getProperty name="PositionInterestTask" property="PositionName"/><br>
                        <a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.DEMOGRAPHIC_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>" class="bodyText">View collective demographic info</a><br>
                        </p>
                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                  <td class="screeningHeader"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=handle&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="screeningHeader">Handle</a></td>
                  <td class="screeningHeader"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=rating_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="screeningHeader">Rating</a></td>
                  <td class="screeningHeader"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=design_rating&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="screeningHeader">Design Rating</a></td>
                  <td class="screeningHeader"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=dev_rating&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="screeningHeader">Development Rating</a></td>
                  <td class="screeningHeader" align=center><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=state_code_sort" class="screeningHeader">State</a></td>
                  <td class="screeningHeader"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=country_code" class="screeningHeader">Country</a></td>
                  <td class="screeningHeader"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc" class="screeningHeader">Type</a></td>
                  <td class="screeningHeader"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=school_name_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="screeningHeader">School</a></td>
                  <td class="screeningHeader"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=gpa_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="screeningHeader">GPA</a></td>
                  <td class="screeningHeader" align=center><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=coder_type_desc&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>&<%=TCESConstants.BACK_SORT_PARAM%>=grad_year_sort&<%=TCESConstants.BACK_SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="screeningHeader">Grad.<br/>Year</a></td>
                  <td class="screeningHeader" align=center><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=hit_date_sort&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="screeningHeader">Hit Date</a></td>
                  <td class="screeningHeader" align=center><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=has_resume&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_DES%>" class="screeningHeader">Resume</a> </td>
                  <td class="screeningHeader"><a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.POSITION_INTEREST_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.SORT_PARAM%>=language_name&<%=TCESConstants.SORT_ORDER_PARAM%>=<%=TCESConstants.SORT_ORDER_ASC%>" class="screeningHeader">Lang.</a></td>
                </tr>

                <% int i=0; %>
                <%--not indenting to save some space on the download cuz this can be a big loop
                    and the spaces significantly impact the size of the html source
                --%>
                <tces:rowIterator id="hit" rowList="<%=PositionInterestTask.getHitList()%>"><% i++; %><tr>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">
  <a href="<jsp:getProperty name="PositionInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.MEMBER_PROFILE_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=PositionInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=PositionInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=hit.getItem("coder_id").toString()%>" class="bodyText"><%= hit.getItem("handle").toString() %></a></td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= hit.getItem("rating").toString() %>&#160;</td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= hit.getItem("design_rating").toString() %>&#160;</td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= hit.getItem("dev_rating").toString() %>&#160;</td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="center"><%= hit.getItem("state_code").toString() %></td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= hit.getItem("country_code").toString() %></td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= hit.getItem("coder_type_desc").toString() %></td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= hit.getItem("school_name").toString() %></td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= hit.getItem("gpa").toString() %></td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="center"><%= hit.getItem("grad_year").toString() %></td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=center><%= hit.getItem("hit_date").toString() %></td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="center"><%=hit.getItem("has_resume").toString().equals("1")?"Yes":"No"%></td>
 <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%=hit.getItem("language_name").toString()%></td>
</tr></tces:rowIterator>

                <% if(PositionInterestTask.getHitList().isEmpty()){ %>
                <tr><td class="bodyText" colspan="10"><br></td></tr>
                <tr><td class="bodyText" align="center" colspan="10">No hits available.</td></tr>
                <% } %>

            </table>

            <p><br></p>
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
