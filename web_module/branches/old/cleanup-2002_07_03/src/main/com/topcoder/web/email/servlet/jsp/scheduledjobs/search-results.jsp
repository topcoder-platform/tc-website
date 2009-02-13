<html>
<head>
	<title>Job Search</title>
</head>
<body>

<%@ include file="../header.jsp" %>
<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*, java.util.*" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>
<%@ include file="../js/task-js.jsp"%>
<% String thisPage = EmailConstants.SCHEDULEDJOB_SEARCH_RESULTS_PAGE; %>

<p class="bodyTextBig">
<b>Search Results</b>
</p>
<%@ include file="job-list.jsp" %>

<%@ include file="../footer.jsp" %>


</body>
</html>
