<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<jsp:useBean id="ScheduledJob" scope="session" class="com.topcoder.web.email.bean.ScheduledJobForm" />

<html>
<head>
	<title>Edit job</title>
</head>
<body>

<jsp:include page="../header.jsp" />

<SCRIPT Language="javascript"> <!--

function reload()
{
	frmJob.step.value = "<%=EmailConstants.SCHEDULEDJOB_RELOAD_EDIT%>";
	frmJob.submit();
}

function jobTask(step)
{
	frmJob.<%=EmailConstants.STEP%>.value = step;
	frmJob.submit();
}

//--> </SCRIPT>

<p class="bodyTextBig"><b>Editing job</b></p>
<form name="frmJob" onSubmit="validate(); return false;" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post" >
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.SCHEDULEDJOB_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.SCHEDULEDJOB_SAVE%>">

	<jsp:include page="job-body.jsp" />
	<p>

	<%@ taglib uri="email-taglib.tld" prefix="email"%>

	<table cellpadding = 2>
		<tr>
		<td class="bodyText">Template:
		</td>
		<td class="bodyText">
		<email:templateName id="name" templateId="<%=ScheduledJob.getTemplateId()%>">
			<%=name%>
		</email:templateName>
		</td>
		<td class="bodyText">
		<a href="javascript:jobTask('<%=EmailConstants.SCHEDULEDJOB_CHOOSE_TEMPLATE_EDIT%>');">
		[change]</a>
		</td>
		<tr>

<% if (!String.valueOf(EmailConstants.NO_LIST_ID).equals(ScheduledJob.getListId())) { %>
		<td class="bodyText">Address list:
		</td>
		<td class="bodyText">
		<email:addressListName id="name" listId="<%=ScheduledJob.getListId()%>">
			<%=name%>
		</email:addressListName>
		</td>
<% } else { %>
		<td valign="top" class="bodyText">Predefined query:
		</td>
		<td valign="top" class="bodyText">
		<email:commandName id="commandName" commandId="<%=ScheduledJob.getCommandId()%>">
			<%=commandName%>
		</email:commandName>
		<email:commandInputIterator id="commandInput" commandId="<%=ScheduledJob.getCommandId()%>"
			commandInputMap="<%=ScheduledJob.getCommandInputMap()%>">
			<br>[<%=commandInput.getDescription()%>: <%=commandInput.getValue()%>]
		</email:commandInputIterator>
		</td>
<% } %>
		<td valign="top" class="bodyText">
		<a href="javascript:jobTask('<%=EmailConstants.SCHEDULEDJOB_CHOOSE_LIST_EDIT%>');">
		[choose mailing list]</a>
		&nbsp;
		<a href="javascript:jobTask('<%=EmailConstants.SCHEDULEDJOB_CHOOSE_QUERY_EDIT%>');">
		[choose predefined query]</a>
		</td>

		</tr>


	</table>

	<p>

	<input type="submit" value="save">
</form>
<jsp:include page="../footer.jsp" />

</body>
</html>
