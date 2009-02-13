<%@ page import="com.topcoder.web.email.servlet.*" %>
<jsp:useBean id="AddressList" scope="session" class="com.topcoder.web.email.bean.AddressListForm" />

<html>
<head>
	<title>Edit mailing list</title>
</head>
<body>

<%@ include file="../header.jsp" %>

<p class="bodyTextBig"><b>New list</b></p>
<form name="frmList" method="post" onSubmit="validate(); return false;" action="<%=response.encodeURL(EmailConstants.ALIAS)%>">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.ADDRESSLIST_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.ADDRESSLIST_ADD%>">

	<%@ include file="list-body.jsp" %>
	<p>
	<input type="submit" value="create &gt;&gt">

</form>
<%@ include file="../footer.jsp" %>

</body>
</html>
