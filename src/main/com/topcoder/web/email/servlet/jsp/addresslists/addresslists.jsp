<%@ page import="com.topcoder.web.email.servlet.*, com.topcoder.web.email.bean.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="email-taglib.tld" prefix="email"%>

<html>
<head>
	<title>Mailing Lists</title>
</head>
<body>

<jsp:include page="../js/task-js.jsp"/>

<jsp:include page="../header.jsp" />
<p class="bodyTextBig"><b>Mailing Lists</b></p>
<p>
<form name="frmGroup" action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method ="post">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.ADDRESSLIST_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.ADDRESSLIST_LIST%>">

        <p class="bodyText">
	Group:
	<email:groupSelect
	name="<%=EmailConstants.GROUP%>"
	groupMap="<%=AddressListTask.getAddressListGroupMap()%>"
	onChange="frmGroup.submit()"
	selectedValue="<%=(String) request.getAttribute(EmailConstants.GROUP)%>"/>
        </p>

<!--	<input type="submit" value="go"> -->
</form>
<p>
<a href="javascript:taskSubmit('<%=EmailConstants.ADDRESSLIST_TASK%>', '<%=EmailConstants.ADDRESSLIST_CREATE%>', '');">
[create new mailing list]</a>
<p>

<% // alternate colors every row...
	int row = 0;
	String[] colors = { "#EEEEEE", "#FFFFFF" };
%>

<table border=1 cellpadding=2 cellspacing=0>
	<tr>
	<th align="left" class="bodyText">
	Mailing list name
	</th>
	<th align="left" class="bodyText">
	Delete
	</th>
	</tr>

<email:addressListIterator id="idname" group="<%=(String) request.getAttribute(EmailConstants.GROUP)%>">
	<tr bgcolor="<%=colors[(row++)%colors.length]%>">

	<td width="80%">
	<a href="javascript:taskSubmit('<%=EmailConstants.ADDRESSLIST_TASK%>', '<%=EmailConstants.ADDRESSLIST_EDIT%>', '<%=idname.getId()%>');">
	<%=idname.getName()%></a>
	</td>

	<td>
	<a href="javascript:taskSubmit('<%=EmailConstants.ADDRESSLIST_TASK%>', '<%=EmailConstants.ADDRESSLIST_DELETE%>', '<%=idname.getId()%>');">
	[delete]</a>


	</td>

	</tr>
</email:addressListIterator>
</table>

<p>
<a href="javascript:taskSubmit('<%=EmailConstants.HOME_TASK%>', '', '');">
[back to main menu]</a>
<p>
<jsp:include page="../footer.jsp" />


</body>
</html>
