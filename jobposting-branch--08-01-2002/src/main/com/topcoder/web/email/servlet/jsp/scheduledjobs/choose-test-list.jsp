<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>

<html>
<head>
	<title>Choose test list</title>
</head>
<body>

<%@ include file="../js/task-js.jsp" %>

<%@ include file="../header.jsp" %>
<p class="bodyTextBig"><b>Choose test list</b></p>
<form>
<p class="bodyText">
<email:addressListIterator id="idname" group="<%=String.valueOf(EmailConstants.TEST_LIST_GROUP_ID)%>">
	<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_CHOOSE_REPORT_TEMPLATE%>', '<%=idname.getId()%>');"
		onMouseOver="window.status='Choose list'; return true;"
		onMouseOut="window.status=''; return true;">
	<%=idname.getName()%></a><br>
</email:addressListIterator>
</p>

<%@ include file="../footer.jsp" %>

</body>
</html>
