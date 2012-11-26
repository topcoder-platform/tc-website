<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="email-taglib.tld" prefix="email"%>


<html>
<head>
	<title>Choose report template</title>
</head>
<body>

<SCRIPT Language="Javascript1.2">
	function taskSubmit(task, step, id) {
		document.forms.frmTask.<%=EmailConstants.TASK%>.value = "" + task;
		document.forms.frmTask.<%=EmailConstants.STEP%>.value = "" + step;
		document.forms.frmTask.<%=EmailConstants.REPORT_TEMPLATE_ID%>.value = "" + id;
		document.forms.frmTask.submit();
	}
</SCRIPT>

<form name="frmTask" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post">
	<input type="hidden" name="<%=EmailConstants.TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>">
	<input type="hidden" name="<%=EmailConstants.REPORT_TEMPLATE_ID%>">
</form>


<jsp:include page="../header.jsp" />
<p class="bodyTextBig"><b>Choose report template</b></p>
<form name="frmGroup" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method ="post">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.SCHEDULEDJOB_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.SCHEDULEDJOB_CHOOSE_REPORT_TEMPLATE%>">
<p class="bodyText">
	Group:
	<email:groupSelect name="<%=EmailConstants.REPORT_GROUP%>"
	groupMap="<%=TemplateTask.getTemplateGroupMap()%>"
	onChange="frmGroup.submit()"
	selectedValue="<%=(String) request.getAttribute(EmailConstants.REPORT_GROUP)%>"/>

	<!-- <input type="submit" value="go"> -->
</p>

</form>
<p class="bodyText">
<email:templateIterator id="idname" group="<%=(String)request.getAttribute(EmailConstants.REPORT_GROUP)%>">
	<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_ADD%>', '<%=idname.getId()%>');">
	<%=idname.getName()%></a><br>
</email:templateIterator>
</p>

<jsp:include page="../footer.jsp" />


</body>
</html>
