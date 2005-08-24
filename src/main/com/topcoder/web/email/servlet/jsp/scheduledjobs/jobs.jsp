<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="email-taglib.tld" prefix="email"%>

<html>
<head>
	<title>Scheduled Jobs</title>
</head>
<body>

<jsp:include page="../js/task-js.jsp"/>
<% String thisPage = EmailConstants.SCHEDULEDJOB_LIST_PAGE; %>

<jsp:include page="../header.jsp" />
<p class="bodyTextBig"><b>Scheduled Jobs</b></p>
<p class="bodyText">
<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_CREATE%>', '');">
[schedule new job]</a>
</p>
<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_SHOW_SEARCH%>', '');">
[search past jobs]</a>
<p class="bodyTextBig">
Recent jobs
</p>

<jsp:include page="job-list.jsp" >
  <jsp:param name="thisPage" value="<%=thisPage%>"/>
</jsp:include>

<p class="bodyText">
<a href="javascript:taskSubmit('<%=EmailConstants.HOME_TASK%>', '', '');">
[back to main menu]</a>
</p>
<jsp:include page="../footer.jsp" />


</body>
</html>
