<%@ page import="com.topcoder.web.email.servlet.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="email-taglib.tld" prefix="email"%>
<jsp:useBean id="AddressList" scope="session" class="com.topcoder.web.email.bean.AddressListForm" />
<h3>Mailing list members</h3>

<% // alternate colors every row...
	int curr = 0;
	String[] colorArr = { "#EEEEEE", "#FFFFFF" };
%>

<table border=0 cellpadding=2 cellspacing=0>
<email:memberIDIterator id="memberID" addressListID="<%=AddressList.getId()%>">
	<tr bgcolor="<%=colorArr[(curr++)%colorArr.length]%>">

	<td valign="top" class="bodyText">
	<%=curr%>.
	</td>

	<td width=75% class="bodyText">
	<email:memberDataDisplay memberID="<%=memberID%>" addressListID="<%=AddressList.getId()%>"/>
	</td>

	<td valign="top" class="bodyText">
	<a href="javascript:taskSubmit('<%=EmailConstants.ADDRESSLIST_TASK%>', '<%=EmailConstants.ADDRESSLIST_EDIT_MEMBER%>', '<%=memberID%>');">
	[edit]</a>
	</td>

	<td valign="top" class="bodyText">
	<a href="javascript:taskSubmit('<%=EmailConstants.ADDRESSLIST_TASK%>', '<%=EmailConstants.ADDRESSLIST_DELETE_MEMBER%>', '<%=memberID%>');">
	[delete]</a>
</td>

</tr>
</email:memberIDIterator>
</table>
