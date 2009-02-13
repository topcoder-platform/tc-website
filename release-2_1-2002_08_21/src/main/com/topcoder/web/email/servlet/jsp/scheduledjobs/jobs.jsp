<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>

<html>
<head>
	<title>Scheduled Jobs</title>
</head>
<body>

<%@ include file="../js/task-js.jsp"%>
<% String thisPage = EmailConstants.SCHEDULEDJOB_LIST_PAGE; %>

<%@ include file="../header.jsp" %>
<p class="bodyTextBig"><b>Scheduled Jobs</b></p>
<p class="bodyText">
<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_CREATE%>', '');"
		onMouseOver="window.status='New job'; return true;"
		onMouseOut="window.status=''; return true;">
[schedule new job]</a>
</p>
<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_SHOW_SEARCH%>', '');"
		onMouseOver="window.status='Main menu'; return true;"
		onMouseOut="window.status=''; return true;">
[search past jobs]</a>
<p class="bodyTextBig">
Recent jobs
</p>

<%@ include file="job-list.jsp" %>

<p class="bodyText">
<a href="javascript:taskSubmit('<%=EmailConstants.HOME_TASK%>', '', '');"
		onMouseOver="window.status='Main menu'; return true;"
		onMouseOut="window.status=''; return true;">
[back to main menu]</a>
</p>
<%@ include file="../footer.jsp" %>


</body>
</html>
