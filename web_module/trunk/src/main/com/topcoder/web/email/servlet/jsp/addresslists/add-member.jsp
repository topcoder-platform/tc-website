<%@ page import="com.topcoder.web.email.servlet.*" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>
<jsp:useBean id="AddressList" scope="session" class="com.topcoder.web.email.bean.AddressListForm" />

<html>	
<head>
	<title>Mailing list members</title>
</head>
<body>

<jsp:include page="../header.jsp" />
<jsp:include page="../js/task-js.jsp" />

<p class="bodyTextBig"><b>Add new member</b></p>
<form action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post" >
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.ADDRESSLIST_ADD_MEMBER%>">

	<jsp:include page="member-form.jsp" />
	<p>
	<input type="submit" value="add">

</form>
<p>
<a href="javascript:taskSubmit('<%=EmailConstants.ADDRESSLIST_TASK%>', '<%=EmailConstants.ADDRESSLIST_SHOW_BULK_ADD%>', '');"
	onMouseOver="window.status='Switch to bulk entry mode'; return true;"
	onMouseOut="window.status=''; return true;">
[bulk entry mode]
</a>
<p>
<a href="javascript:taskSubmit('<%=EmailConstants.ADDRESSLIST_TASK%>', '<%=EmailConstants.ADDRESSLIST_LIST%>', '');"
		onMouseOver="window.status='Done'; return true;"
		onMouseOut="window.status=''; return true;">
[done]</a>
<p>
<hr>

<jsp:include page="member-list.jsp" />

<p>

<jsp:include page="../footer.jsp" />

</body>
</html>
