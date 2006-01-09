<%@ page contentType="text/html;charset=utf-8" %>
<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="ProblemSubmissionsTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.ProblemSubmissionsTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>TopCoder | Recruiting Reports</title>
    <jsp:include page="script.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                        <tces:trailIterator id="trailItem" trailList="<%=ProblemSubmissionsTask.getTrail()%>">
                            <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                        </tces:trailIterator>
					<br/>
					<span class=testHead>Coder Problem Submissions: <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "handle").toString()%></span>
					<br/><br/>

                    <strong>Name:</strong> <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "first_name").toString()%> <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "middle_name").toString()%> <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "last_name").toString()%><br/>
                    <strong>Address:</strong><br/>
                    <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "address1").toString()%><br/>
                    <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "address2").toString().length()==0?"":ProblemSubmissionsTask.getMemberInfo().getStringItem(0, "address2")+"<br/>"%>
                    <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "address3").toString().length()==0?"":ProblemSubmissionsTask.getMemberInfo().getStringItem(0, "address3")+"<br/>"%>
                    <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "province").toString()%>
                    <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "city").toString()%>,
                    <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "state_code").toString()%>
                    <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "zip").toString()%>
                    <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "country_name").toString()%><br/>
                    <strong>Email:</strong> <a href="mailto:<%=ProblemSubmissionsTask.getMemberInfo().getItem(0, "email").toString() %>" class="bodyText"><%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "email").toString() %></A><br/>
                    <strong>Phone:</strong> <%= ProblemSubmissionsTask.getMemberInfo().getItem(0, "home_phone").toString()%><br/>
                    <% if (ProblemSubmissionsTask.hasResume()) { %>
                    <a href="<jsp:getProperty name="ProblemSubmissionsTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.RESUME_DOWNLOAD_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="ProblemSubmissionsTask" property="campaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="ProblemSubmissionsTask" property="jobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="ProblemSubmissionsTask" property="memberID"/>" class="bodyText"><B>Resume</B></a>
                    <% } %>
					<br/><br/>
                    <strong>Interested in:</strong> <jsp:getProperty name="ProblemSubmissionsTask" property="jobName"/>
					<br/><br/>

                    <A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>" class="bodyText">Coder Demographic Info</A>
					<br/>
                    <A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>" class="bodyText">Coder Competition History</A>
					<br/>
                    Coder Problem Submissions
                    </td>
                </tr>
                <tr>
                    <td class="bodyText" align="right">
	                <% if (!ProblemSubmissionsTask.isRestrictedCampaign()) {%>
	                <A HREF="JavaScript:getGraph('/corp/graph?c=rating_history_graph&cr=<jsp:getProperty name="ProblemSubmissionsTask" property="memberID"/>&cm=<jsp:getProperty name="ProblemSubmissionsTask" property="companyId"/>','800','600','history')" class="bodyText">Rating History Graph</a> &nbsp;&nbsp;|&nbsp;&nbsp;
	                <% } %>
	                <A HREF="JavaScript:getGraph('/corp/graph?c=rating_distribution_graph&cm=<jsp:getProperty name="ProblemSubmissionsTask" property="companyId"/>','600','400','distribution')" class="bodyText">Overall Rating Distribution Graph</a>
                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                  <td class="screeningHeader"><strong>Date</strong></td>
                  <td class="screeningHeader"><strong>Event Name</strong></td>
                  <td class="screeningHeader"><strong>Division</strong></td>
                  <td class="screeningHeader"><strong>Level</strong></td>
                  <td class="screeningHeader"><strong>Coder Points</strong></td>
                  <td class="screeningHeader"><strong>Language</strong></td>
                  <td class="screeningHeader"><strong>Result</strong></td>
                </tr>

                <% int i=0; %>
                <%--not indenting to save some space on the download cuz this can be a big loop
                    and the spaces significantly impact the size of the html source
                --%>
                <tces:rowIterator id="submission" rowList="<%=(List)ProblemSubmissionsTask.getSubmissionList()%>"><% i++; %><tr>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= TCESConstants.DATE_FORMAT.format((java.sql.Timestamp)submission.getItem("date").getResultData()) %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>&<%=TCESConstants.ROUND_ID_PARAM%>=<%= submission.getItem("round_id").toString() %>" class="bodyText"><%= submission.getItem("name").toString() %></A></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= submission.getItem("division_desc").toString() %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><A HREF="<jsp:getProperty name="ProblemSubmissionsTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_STATISTICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=ProblemSubmissionsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=ProblemSubmissionsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=ProblemSubmissionsTask.getMemberID()%>&<%=TCESConstants.PROBLEM_ID_PARAM%>=<%= submission.getItem("problem_id").toString() %>&<%=TCESConstants.ROUND_ID_PARAM%>=<%=submission.getItem("round_id").toString()%>" class="bodyText"><%= submission.getItem("level_desc").toString()%></A></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align="right"><%= submission.getItem("final_points").toString() %>&#160;&#160;</td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= submission.getItem("language_name").toString() %></td>
<td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= submission.getItem("end_status_text").toString() %></td>
</TR>
</tces:rowIterator>

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
