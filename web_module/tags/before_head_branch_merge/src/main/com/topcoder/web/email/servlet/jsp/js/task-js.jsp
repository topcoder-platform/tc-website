<%@ page import="com.topcoder.web.email.servlet.*" %>
<SCRIPT Language="javascript"> <!--
	function taskSubmit(task, step, id) {
		document.forms.frmTask.<%=EmailConstants.TASK%>.value = "" + task;
		document.forms.frmTask.<%=EmailConstants.STEP%>.value = "" + step;
		document.forms.frmTask.<%=EmailConstants.ID%>.value = "" + id;
		document.forms.frmTask.submit();
	}

	function taskSubmit(task, step, id, nextpage) {
		document.forms.frmTask.<%=EmailConstants.TASK%>.value = "" + task;
		document.forms.frmTask.<%=EmailConstants.STEP%>.value = "" + step;
		document.forms.frmTask.<%=EmailConstants.ID%>.value = "" + id;
		document.forms.frmTask.<%=EmailConstants.NEXT_PAGE%>.value = "" + nextpage;
		document.forms.frmTask.submit();
	}
//--> </SCRIPT>

<form name="frmTask" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post">
	<input type="hidden" name="<%=EmailConstants.TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>">
	<input type="hidden" name="<%=EmailConstants.ID%>">
	<input type="hidden" name="<%=EmailConstants.NEXT_PAGE%>">
</form>
