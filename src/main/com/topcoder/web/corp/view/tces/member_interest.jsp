<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.JSPUtils,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="MemberInterestTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.MemberInterestTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Recruiting Reports</TITLE>
    <jsp:include page="script.jsp" />

  </HEAD>
  <body>
  <jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
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
	                <tces:trailIterator id="trailItem" trailList="<%=MemberInterestTask.getTrail()%>">
	                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
	                </tces:trailIterator>
					<br/>
					<span class=testHead>Member Interest: <jsp:getProperty name="MemberInterestTask" property="handle"/></span>
					<br/><br/>
                    <strong>Campaign:</strong> <%=MemberInterestTask.getCampaignName()%>
					<br/><br/>
					</td>
				</tr>
				<tr>
					<td class=bodyText>
					<A HREF="<jsp:getProperty name="MemberInterestTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="bodyText">Coder Demographic Info</A>
					<br/>
					<% if (MemberInterestTask.isRanked()) { %>
					<A HREF="<jsp:getProperty name="MemberInterestTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="bodyText">Coder Competition History</A>
					<br/>
					<A HREF="<jsp:getProperty name="MemberInterestTask" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="bodyText">Coder Problem Submissions</A>
					<% } %>
					<br/><br/>
					</td>
				</tr>
			</table>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                  <td class="screeningHeader" width="75%">Position Name</td>
                  <td class="screeningHeader" align=center>Hit Date</td>
                </tr>

                <% int i=0; %>
                <tces:rowIterator id="hit" rowList="<%=(List)MemberInterestTask.getHitList()%>">
                <% i++; %>

                <tr>
                  <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><%= hit.getItem("job_desc").toString() %></td>
                  <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" align=center><%= JSPUtils.autoFormat(hit.getItem("timestamp")) %></td>
                </tr>

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

</BODY>
</HTML>
