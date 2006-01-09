<%@ page contentType="text/html;charset=utf-8" %>
<%@  page
  language="java"
  import="com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CompetitionHistoryTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.CompetitionHistoryTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>TopCoder | Recruiting Reports</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <jsp:include page="script.jsp" />
</head>

<body>

<!-- Header Begins -->
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<!-- Header Ends -->
<table width=100% border=0 cellpadding=0 cellspacing=0 align=center>
	<TR valign="top">
		<td width="50%"><jsp:include page="left.jsp" /></td>
<!-- Center Column Begins -->
        <td class=recruitingBody>
			<img src="/i/corp/clear.gif" width="700" height="11" alt="" border=0><br/>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class=bodyText colspan=2>
					<p>
                        <tces:trailIterator id="trailItem" trailList="<%=CompetitionHistoryTask.getTrail()%>">
                            <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                        </tces:trailIterator>
					<br/>
					<span class=testHead>Coder Competition History: <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "handle").toString()%></span>
					<br/><br/>
					</td>
				</tr>

                <tr>
                    <td class="bodyText" align="left">
                        <strong>Name:</strong> <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "first_name").toString()%> <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "middle_name").toString()%> <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "last_name").toString()%><br/>
                        <strong>Address:</strong><br/>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "address1").toString()%><br/>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "address2").toString().length()==0?"":CompetitionHistoryTask.getMemberInfo().getStringItem(0, "address2")+"<br/>"%>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "address3").toString().length()==0?"":CompetitionHistoryTask.getMemberInfo().getStringItem(0, "address3")+"<br/>"%>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "province").toString()%>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "city").toString()%>,
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "state_code").toString()%>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "zip").toString()%>
                        <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "country_name").toString()%><br/>
                        <strong>Email:</strong> <a href="mailto:<%=CompetitionHistoryTask.getMemberInfo().getItem(0, "email").toString() %>" class="bodyText"><%= CompetitionHistoryTask.getMemberInfo().getItem(0, "email").toString() %></A><br/>
                        <strong>Phone:</strong> <%= CompetitionHistoryTask.getMemberInfo().getItem(0, "home_phone").toString()%>
						<br/>
						<% if (CompetitionHistoryTask.hasResume()) { %>
						<a href="<jsp:getProperty name="CompetitionHistoryTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.RESUME_DOWNLOAD_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CompetitionHistoryTask" property="campaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="CompetitionHistoryTask" property="jobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="CompetitionHistoryTask" property="memberID"/>" class="bodyText"><strong>Resume</strong></a>
						<% } %>
						<br/><br/>
                        <strong>Interested in:</strong> <jsp:getProperty name="CompetitionHistoryTask" property="jobName"/>
						<br/><br/>
                        <A HREF="<jsp:getProperty name="CompetitionHistoryTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionHistoryTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionHistoryTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionHistoryTask.getMemberID()%>" class="bodyText">Coder Demographic Info</A>
						<br/>
                        Coder Competition History
						<br/>
                        <A HREF="<jsp:getProperty name="CompetitionHistoryTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionHistoryTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionHistoryTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionHistoryTask.getMemberID()%>" class="bodyText">Coder Problem Submissions</A>
                    </td>
                </tr>
                <tr>
                    <td class="bodyText" align="right">
	                <% if (!CompetitionHistoryTask.isRestrictedCampaign()) {%>
	                <A HREF="JavaScript:getGraph('/corp/graph?c=rating_history_graph&cr=<jsp:getProperty name="CompetitionHistoryTask" property="memberID"/>&cm=<jsp:getProperty name="CompetitionHistoryTask" property="companyId"/>','800','600','history')" class="bodyText">Rating History Graph</a> &nbsp;&nbsp;|&nbsp;&nbsp;
	                <% } %>
	                <A HREF="JavaScript:getGraph('/corp/graph?c=rating_distribution_graph&cm=<jsp:getProperty name="CompetitionHistoryTask" property="companyId"/>','600','400','distribution')" class="bodyText">Overall Rating Distribution Graph</a>
                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                  <td class="screeningHeader">Date</td>
                  <td class="screeningHeader">Event Name</td>
                  <td class="screeningHeader" align=left>Division</td>
                  <td class="screeningHeader" align=right>Coder Points</td>
                  <td class="screeningHeader" align=right>Avg Points</td>
                  <td class="screeningHeader" align=right>Pre-Rating</td>
                  <td class="screeningHeader" align=right>Post-Rating</td>
                </tr>

                <% int i=0; %>
                <%--not indenting to save some space on the download cuz this can be a big loop
                    and the spaces significantly impact the size of the html source
                --%>
                    <tces:mapIterator id="comp" mapList="<%=CompetitionHistoryTask.getCompetitionList()%>"><% i++; %>
				<tr>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= (String)comp.get("date") %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><A HREF="<jsp:getProperty name="CompetitionHistoryTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CompetitionHistoryTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CompetitionHistoryTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CompetitionHistoryTask.getMemberID()%>&<%=TCESConstants.ROUND_ID_PARAM%>=<%= (String)comp.get("round_id") %>" class="bodyText"><%= (String)comp.get("contest_name") %></A></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=left><%= (String)comp.get("division_name") %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= (String)comp.get("final_points") %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= (String)comp.get("avg_points") %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= (String)comp.get("old_rating") %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right><%= (String)comp.get("new_rating") %></td>
				</TR>
				</tces:mapIterator>
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
