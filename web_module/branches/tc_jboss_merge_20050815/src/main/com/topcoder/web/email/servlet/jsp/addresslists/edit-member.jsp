<%@ page import="com.topcoder.web.email.servlet.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ taglib uri="/email-taglib.tld" prefix="email"%>
<jsp:useBean id="AddressList" scope="session" class="com.topcoder.web.email.bean.AddressListForm" />

<html>
<head>
	<title>Mailing list members</title>
</head>
<body>

<jsp:include page="../header.jsp" />
<jsp:include page="../js/task-js.jsp" />

<p class="bodyTextBig"><b>Edit member</b></p>
<form action="<%=response.encodeURL(EmailConstants.ALIAS)%>" method="post" >
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.ADDRESSLIST_SAVE_MEMBER%>">

	<jsp:include page="member-form.jsp" />
	<p>
	<input type="submit" value="save">

</form>
<p>
<a href="javascript:taskSubmit('<%=EmailConstants.ADDRESSLIST_TASK%>', '<%=EmailConstants.ADDRESSLIST_LIST%>', '');">
[done]</a>


<hr>
<jsp:include page="member-list.jsp" />
<p>
<jsp:include page="../footer.jsp" />

</body>
</html>
