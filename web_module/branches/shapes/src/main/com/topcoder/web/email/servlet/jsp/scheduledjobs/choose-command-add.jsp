<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>


<html>
<head>
	<title>Predefined Queries</title>
</head>
<body>

<SCRIPT Language="Javascript1.2">
	function taskSubmit(task, step, id) {
		document.forms.frmTask.<%=EmailConstants.TASK%>.value = "" + task;
		document.forms.frmTask.<%=EmailConstants.STEP%>.value = "" + step;
		document.forms.frmTask.<%=EmailConstants.COMMAND_ID%>.value = "" + id;
		document.forms.frmTask.submit();
	}
</SCRIPT>

<form name="frmTask" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post">
	<input type="hidden" name="<%=EmailConstants.TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>">
	<input type="hidden" name="commandId">
</form>

<jsp:include page="../header.jsp" />
<p class="bodyTextBig"><b>Choose a predefined query</b></p>
<p class="bodyText">
<email:commandIterator id="idname">
	<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_ADD%>', '<%=idname.getId()%>');">
	<%=idname.getName()%></a><br>
</email:commandIterator>
</p>
<jsp:include page="../footer.jsp" />


</body>
</html>
