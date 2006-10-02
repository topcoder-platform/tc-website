<%@ page import="com.topcoder.web.email.servlet.*" %>
<%@ page errorPage="../error.jsp" %>
<jsp:useBean id="AddressList" scope="session" class="com.topcoder.web.email.bean.AddressListForm" />

<html>
<head>
	<title>Edit mailing list</title>
</head>
<body>

<jsp:include page="../header.jsp" />

<p class="bodyTextBig">Editing list</p>
<form name="frmList" method="post" onSubmit="validate(); return false;" action="<%=response.encodeURL(EmailConstants.ALIAS)%>">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.ADDRESSLIST_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.ADDRESSLIST_SAVE%>">

	<jsp:include page="list-body.jsp" />
	<p>
	<input type="submit" value="save &gt;&gt">

</form>
<jsp:include page="../footer.jsp" />

</body>
</html>
