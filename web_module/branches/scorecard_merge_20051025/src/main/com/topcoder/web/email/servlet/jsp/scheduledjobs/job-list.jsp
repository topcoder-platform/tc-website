<%@ page import="com.topcoder.web.email.servlet.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="email-taglib.tld" prefix="email"%>
<jsp:useBean id="JobList" scope="session" class="java.util.ArrayList"/>


<% // alternate colors every row...
    String thisPage = request.getParameter("thisPage");
	int row = 0;
	String[] colors = { "#EEEEEE", "#FFFFFF" };
	String errcolor = "#FF0000";
%>

<table border=1 cellpadding=2 cellspacing=0>
	<tr>
	<th align="left" class="bodyText">
	Sender
	</th>
	<th align="left" class="bodyText">
	Subject
	</th>
	<th align="left" class="bodyText">
	Start time
	</th>
	<th align="left" class="bodyText">
	Status
	</th>
	<th align="left" class="bodyText">
	Edit
	</th>
	<th align="left" class="bodyText">
	Log
	</th>
	<th class="bodyText">
	Task
	</th>
	</tr>
<email:iterator id="jobID" collection="<%=JobList%>">
	<tr bgcolor="<%=colors[(row++)%colors.length]%>">
	<email:scheduledJobSummary id="summary" jobId="<%=String.valueOf(jobID)%>">
	<td class="bodyText">
		<%=summary.getFromPersonal()%> (<%=summary.getFromAddress()%>)
	</td>
	<td class="bodyText">
		<%=summary.getSubject()%>
	</td>
	<td class="bodyText">
		<%=summary.getStartDate()%>
	</td>
	<td class="bodyText">
		<%=summary.getStatus()%>
		<%
		int okCount = Integer.parseInt(summary.getStatusOk());
		int failCount = Integer.parseInt(summary.getStatusFailed());
		int todoCount = Integer.parseInt(summary.getStatusTodo());
		int otherCount = Integer.parseInt(summary.getStatusOther());
		int totalCount = okCount + failCount + todoCount + otherCount;
		int statusId = Integer.parseInt(summary.getStatusId());
		if (totalCount < 1) {
			if (statusId == EmailConstants.JOB_STATUS_CANCELLED
		 	 || statusId == EmailConstants.JOB_STATUS_COMPLETE) {
		%>
	(never started)
		<%
			} else if (statusId == EmailConstants.JOB_STATUS_ACTIVE) {
		%>
	(queued)
		<%
			}
		} else {
	%> (<%=okCount%> sent<%
			if (failCount > 0) { %>, <font color=<%=errcolor%>><%=failCount%> failed</font><% }
			if (todoCount > 0) { %>, <%=todoCount%> todo<% }
			if (otherCount > 0) { %>, <%=otherCount%> other<% }
	%>)<%
		}
		%>
	</td>
	<td class="bodyText">
<% int jobTypeId = Integer.parseInt(summary.getJobTypeId());
if (jobTypeId == EmailConstants.JOB_TYPE_PREDETAIL) { %>

	<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_EDIT%>', '<%=jobID%>');">
	[edit]
	</a>

<% } else { %>

	<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_VIEW%>', '<%=jobID%>');">
	[view]
	</a>

<% } %>

	</td>
	<td class="bodyText">
	<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_SHOW_LOG%>', '<%=jobID%>');">
	[log]
	</a>
	</td>
	<td class="bodyText">
<%
if (statusId == EmailConstants.JOB_STATUS_CANCELLED) { %>

	<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_RESUME_JOB%>', '<%=jobID%>', '<%=thisPage%>');">
	[resume]
	</a>

<% }

else if (statusId == EmailConstants.JOB_STATUS_ACTIVE ||
	statusId == EmailConstants.JOB_STATUS_CREATING ||
	statusId == EmailConstants.JOB_STATUS_READY) { %>

	<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_CANCEL_JOB%>', '<%=jobID%>', '<%=thisPage%>');">
	[cancel]
	</a>

<% } %>

	</td>

	</email:scheduledJobSummary>
	</tr>
</email:iterator>
</table>
