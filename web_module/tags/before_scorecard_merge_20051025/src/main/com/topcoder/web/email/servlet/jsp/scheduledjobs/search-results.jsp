<%@ page errorPage="../error.jsp" %>
<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*, java.util.*" %>
<%@ taglib uri="email-taglib.tld" prefix="email"%>
<html>
<head>
	<title>Job Search</title>
</head>
<body>

<jsp:include page="../header.jsp" />
<jsp:include page="../js/task-js.jsp"/>
<% String thisPage = EmailConstants.SCHEDULEDJOB_SEARCH_RESULTS_PAGE; %>

<p class="bodyTextBig">
<b>Search Results</b>
</p>
<jsp:include page="job-list.jsp" >
  <jsp:param name="thisPage" value="<%=thisPage%>"/>
</jsp:include>


<jsp:include page="../footer.jsp" />


</body>
</html>
