<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>

<html>
<head>
	<title>E-mail templates</title>
</head>
<body>

<jsp:include page="../js/task-js.jsp"/>

<jsp:include page="../header.jsp" />

<p class="bodyTextBig"><b>E-mail Templates</b></p>

<p class="bodyText">
<form name="frmGroup" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method ="post">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.EMAILTEMPLATE_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.TEMPLATE_LIST%>">

	Group:
	<email:groupSelect name="<%=EmailConstants.GROUP%>"
	groupMap="<%=TemplateTask.getTemplateGroupMap()%>"
	onChange="frmGroup.submit()"
	selectedValue="<%=(String) request.getAttribute(EmailConstants.GROUP)%>"/>

	<!-- <input type="submit" value="go"> -->
</form>
</p>
<p class="bodyText">
<a href="javascript:taskSubmit('<%=EmailConstants.EMAILTEMPLATE_TASK%>', '<%=EmailConstants.TEMPLATE_CREATE%>', '');"
		onMouseOver="window.status='New template'; return true;"
		onMouseOut="window.status=''; return true;">
[create new message template]</a>
</p>

<% // alternate colors every row...
	int row = 0;
	String[] colors = { "#EEEEEE", "#FFFFFF" };
%>

<table border=1 cellpadding=2 cellspacing=0>
	<tr>
	<th align="left" class="bodyText">
	Template name
	</th>
	<th align="left" class="bodyText">
	Delete
	</th>
	</tr>

<email:templateIterator id="idname" group="<%=(String) request.getAttribute(EmailConstants.GROUP)%>">

	<tr bgcolor="<%=colors[(row++)%colors.length]%>">

	<td width=80% class="bodyText">
	<a href="javascript:taskSubmit('<%=EmailConstants.EMAILTEMPLATE_TASK%>', '<%=EmailConstants.TEMPLATE_EDIT%>', '<%=idname.getId()%>');"
		onMouseOver="window.status='Edit template'; return true;"
		onMouseOut="window.status=''; return true;">

	<%=idname.getName()%></a>
	</td>

	<td class="bodyText">
	<a href="javascript:taskSubmit('<%=EmailConstants.EMAILTEMPLATE_TASK%>', '<%=EmailConstants.TEMPLATE_DELETE%>', '<%=idname.getId()%>');"
		onMouseOver="window.status='Delete template'; return true;"
		onMouseOut="window.status=''; return true;">
	[delete]</a>
	</td>


	</tr>
</email:templateIterator>
</table>

<p class="bodyText">



<a href="javascript:taskSubmit('<%=EmailConstants.HOME_TASK%>', '', '');"
		onMouseOver="window.status='Main menu'; return true;"
		onMouseOut="window.status=''; return true;">
[back to main menu]</a>
</p>
<jsp:include page="../footer.jsp" />


</body>
</html>
