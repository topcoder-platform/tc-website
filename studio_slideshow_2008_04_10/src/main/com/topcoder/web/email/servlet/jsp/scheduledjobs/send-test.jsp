<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<jsp:useBean id="ScheduledJob" scope="session" class="com.topcoder.web.email.bean.ScheduledJobForm" />

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

<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_CHOOSE_TEST_LIST%>', '');">
[send test message]</a>

&nbsp;&nbsp;

<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_ADD%>', '');">
[finish without sending test message]</a>


<jsp:include page="../footer.jsp" />

</body>
</html>
