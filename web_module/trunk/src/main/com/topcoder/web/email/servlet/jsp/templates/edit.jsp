<%@ page import="com.topcoder.web.email.servlet.*" %>
<jsp:useBean id="EmailTemplate" scope="session" class="com.topcoder.web.email.bean.EmailTemplateForm" />

<html>
<head>
	<title>Edit template</title>
</head>
<body>

<%@ include file="../header.jsp" %>

<p class="bodyTextBig"><b>Editing template</b></p>
<form name="frmTemplate" method="post" onSubmit="validate(); return false;" action="<%=response.encodeURL(EmailConstants.ALIAS)%>">
	<input type="hidden" name="<%=EmailConstants.TASK%>" value="<%=EmailConstants.EMAILTEMPLATE_TASK%>">
	<input type="hidden" name="<%=EmailConstants.STEP%>" value="<%=EmailConstants.TEMPLATE_SAVE%>">

	<%@ include file="template-body.jsp" %>
	<p>
	<input type="submit" value="save">

</form>
<%@ include file="../footer.jsp" %>

</body>
</html>
