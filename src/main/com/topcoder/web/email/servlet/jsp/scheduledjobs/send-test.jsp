<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<jsp:useBean id="ScheduledJob" scope="sessionz" class="com.topcoder.web.email.bean.ScheduledJobForm" />

<html>
<head>
	<title>Send test message</title>
</head>
<body>

<jsp:include page="../header.jsp" />

<jsp:include page="../js/task-js.jsp" />

<p class="bodyTextBig">
<b>Send test message?</b>
</p>

<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_CHOOSE_TEST_LIST%>', '');"
		onMouseOver="window.status='Send test message'; return true;"
		onMouseOut="window.status=''; return true;">
[send test message]</a>

&nbsp;&nbsp;

<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_ADD%>', '');"
		onMouseOver="window.status='Finish'; return true;"
		onMouseOut="window.status=''; return true;">
[finish without sending test message]</a>


<jsp:include page="../footer.jsp" />

</body>
</html>
