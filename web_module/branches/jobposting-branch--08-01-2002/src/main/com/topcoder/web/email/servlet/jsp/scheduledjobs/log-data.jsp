<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>

<html>
<head>
	<title>Job Log Data</title>
</head>
<body>

<%@ include file="../header.jsp" %>

<p class="bodyTextBig">Job log data</p>
<pre>
<%=(String) request.getAttribute(EmailConstants.JOB_LOG_DATA)%>
</pre>
<%@ include file="../footer.jsp" %>

</body>
</html>
