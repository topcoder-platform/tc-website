<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="email-taglib.tld" prefix="email"%>

<html>
<head>
	<title>Choose test list</title>
</head>
<body>

<jsp:include page="../js/task-js.jsp" />

<jsp:include page="../header.jsp" />
<p class="bodyTextBig"><b>Choose test list</b></p>
<form>
<p class="bodyText">
<email:addressListIterator id="idname" group="<%=String.valueOf(EmailConstants.TEST_LIST_GROUP_ID)%>">
	<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_CHOOSE_REPORT_TEMPLATE%>', '<%=idname.getId()%>');">
	<%=idname.getName()%></a><br>
</email:addressListIterator>
</p>

<jsp:include page="../footer.jsp" />

</body>
</html>
