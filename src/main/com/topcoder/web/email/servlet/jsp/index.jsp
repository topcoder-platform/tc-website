<%@ page import="com.topcoder.web.email.servlet.*" %>

<html>
<head>
	<title>TopCoder E-Mail System</title>
</head>
<body>
<jsp:include page="header.jsp" />

<p class="bodyTextBig"><b>Main Menu</b></p>

<SCRIPT Language="Javascript1.2">
	function menuSubmit(task, step) {
		document.forms.frmMenu.<%=EmailConstants.TASK%>.value = "" + task;
		document.forms.frmMenu.<%=EmailConstants.STEP%>.value = "" + step;
		document.forms.frmMenu.submit();
	}
</SCRIPT>

<form name="frmMenu" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post">
	<input type="hidden" name="<%=EmailConstants.TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>">
</form>

<a href="javascript:menuSubmit('<%=EmailConstants.EMAILTEMPLATE_TASK%>', '<%=EmailConstants.TEMPLATE_LIST%>');"
		onMouseOver="window.status='Email tasks'; return true;"
		onMouseOut="window.status=''; return true;">
E-mail Templates</a>

<p>
<a href="javascript:menuSubmit('<%=EmailConstants.ADDRESSLIST_TASK%>', '<%=EmailConstants.ADDRESSLIST_LIST%>');"
		onMouseOver="window.status='Address list tasks'; return true;"
		onMouseOut="window.status=''; return true;">
Mailing Lists</a>

<p>
<a href="javascript:menuSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_LIST%>');"
		onMouseOver="window.status='Scheduled job tasks'; return true;"
		onMouseOut="window.status=''; return true;">
Scheduled Jobs</a>

<p>
<jsp:include page="footer.jsp" />

</body>
</html>
