<%@ page import="com.topcoder.web.email.servlet.*" %>
<jsp:useBean id="AddressList" scope="request" class="com.topcoder.web.email.bean.AddressListForm" />

<html>
<head>
	<title>Edit mailing list</title>
</head>
<body>

<jsp:include page="../header.jsp" />

<p class="bodyTextBig"><b>New list</b></p>
<form name="frmList" method="post" onSubmit="validate(); return false;" action="<%=response.encodeURL(EmailConstants.ALIAS)%>">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.ADDRESSLIST_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.ADDRESSLIST_ADD%>">

	<jsp:include page="list-body.jsp" />
	<p>
	<input type="submit" value="create &gt;&gt">

</form>
<jsp:include page="../footer.jsp" />

</body>
</html>
