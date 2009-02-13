<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>

<html>
<head>
	<title>Job Log Data</title>
</head>
<body>

<jsp:include page="../header.jsp" />

<p class="bodyTextBig">Job log data</p>
<pre>
<%=(String) request.getAttribute(EmailConstants.JOB_LOG_DATA)%>
</pre>
<jsp:include page="../footer.jsp" />

</body>
</html>
