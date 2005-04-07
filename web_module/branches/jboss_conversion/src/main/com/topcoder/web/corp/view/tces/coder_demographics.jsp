<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CoderDemographicsTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.CoderDemographicsTask" />

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
                        <tces:trailIterator id="trailItem" trailList="<%=CoderDemographicsTask.getTrail()%>">
                            <a href="<jsp:getProperty name="trailItem" property="href" />" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></a> &gt;
                        </tces:trailIterator>
					<br/>
					<span class=testHead>Coder Demographic Info: <%= CoderDemographicsTask.getMemberInfo().getItem(0, "handle").toString()%></span>
					<br/><br/>

                        <strong>Name:</strong> <%= CoderDemographicsTask.getMemberInfo().getItem(0, "first_name").toString()%> <%= CoderDemographicsTask.getMemberInfo().getItem(0, "middle_name").toString()%> <%= CoderDemographicsTask.getMemberInfo().getItem(0, "last_name").toString()%><br/>
                        <strong>Address:</strong><br/>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "address1").toString()%><br/>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "address2").toString().length()==0?"":CoderDemographicsTask.getMemberInfo().getStringItem(0, "address2")+"<br/>"%>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "address3").toString().length()==0?"":CoderDemographicsTask.getMemberInfo().getStringItem(0, "address3")+"<br/>"%>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "province").toString()%>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "city").toString()%>,
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "state_code").toString()%>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "zip").toString()%>
                        <%= CoderDemographicsTask.getMemberInfo().getItem(0, "country_name").toString()%><br/>
                        <strong>Email:</strong> <a href="mailto:<%=CoderDemographicsTask.getMemberInfo().getItem(0, "email").toString() %>" class="bodyText"><%= CoderDemographicsTask.getMemberInfo().getItem(0, "email").toString() %></A><br/>
                        <strong>Phone:</strong> <%= CoderDemographicsTask.getMemberInfo().getItem(0, "home_phone").toString()%><br/>
                        <% if (CoderDemographicsTask.hasResume()) { %>
                          <a href="<jsp:getProperty name="CoderDemographicsTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.RESUME_DOWNLOAD_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CoderDemographicsTask" property="campaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="CoderDemographicsTask" property="jobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="CoderDemographicsTask" property="memberID"/>" class="bodyText"><B>Resume</B></a>
                        <% } %>
						<br/><br/>
                        <strong>Interested in:</strong> <jsp:getProperty name="CoderDemographicsTask" property="jobName"/>
						<br/><br/>
<% if (CoderDemographicsTask.getIsRanked()) { %>
						Coder Demographic Info
						<br/>
						<A href="<jsp:getProperty name="CoderDemographicsTask" property="servletPath" />?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CoderDemographicsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CoderDemographicsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CoderDemographicsTask.getMemberID()%>" class="bodyText">Coder Competition History</A>
						<br/>
						<A href="<jsp:getProperty name="CoderDemographicsTask" property="servletPath" />?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CoderDemographicsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CoderDemographicsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CoderDemographicsTask.getMemberID()%>" class="bodyText">Coder Problem Submissions</A>
						<br/><br/>
<% } %>
					</td>
				</tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                    <td class="screeningHeader" width="100%">Question</td>
                    <td class="screeningHeader" align=right>Response</td>
                </tr>

                <% int i=0; %>
                    <tces:mapIterator id="question" mapList="<%=(List)CoderDemographicsTask.getQuestionList()%>">
                <% i++; %>

                <tr>
                    <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= (String)question.get("question") %></td>
                    <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=right nowrap=nowrap><%= (String)question.get("response") %></td>
                </tr>
                </tces:mapIterator>

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
