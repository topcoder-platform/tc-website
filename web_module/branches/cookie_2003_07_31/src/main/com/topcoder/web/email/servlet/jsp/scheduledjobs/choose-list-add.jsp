<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>

<html>
<head>
	<title>Choose address list</title>
</head>
<body>

<SCRIPT Language="Javascript1.2">
	function taskSubmit(task, step, id) {
		document.forms.frmTask.<%=EmailConstants.TASK%>.value = "" + task;
		document.forms.frmTask.<%=EmailConstants.STEP%>.value = "" + step;
		document.forms.frmTask.<%=EmailConstants.LIST_ID%>.value = "" + id;
		document.forms.frmTask.submit();
	}

</SCRIPT>

<form name="frmTask" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post">
	<input type="hidden" name="<%=EmailConstants.TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>">
	<input type="hidden" name="<%=EmailConstants.LIST_ID%>">
</form>

<jsp:include page="../header.jsp" />
<p class="bodyTextBig">Choose address list</p>
<form name="frmGroup" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method ="post">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.SCHEDULEDJOB_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.SCHEDULEDJOB_RELOAD_CHOOSE_LIST_ADD%>">

<p class="bodyText">
	Group:
	<email:groupSelect name="<%=EmailConstants.GROUP%>"
	selectedValue="<%=(String) request.getAttribute(EmailConstants.GROUP)%>"
	onChange="frmGroup.submit();"
	groupMap="<%=AddressListTask.getAddressListGroupMap()%>"/>
</p>
	<!-- <input type="submit" value="go"> -->
</form>
<p class="bodyText">
<email:addressListIterator id="idname" group="<%=(String) request.getAttribute(EmailConstants.GROUP)%>">
	<a href="javascript:taskSubmit('<%=EmailConstants.SCHEDULEDJOB_TASK%>', '<%=EmailConstants.SCHEDULEDJOB_SET_LIST_ADD%>', '<%=idname.getId()%>');">
	<%=idname.getName()%></a><br>
</email:addressListIterator>
</p>

<jsp:include page="../footer.jsp" />


</body>
</html>
