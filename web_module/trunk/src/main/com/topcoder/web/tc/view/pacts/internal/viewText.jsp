<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>PACTS</title>
</head>

<body>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.*" %>
<%
	String text = (String)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	}
%>

<h1>PACTS</h1>
<h2>View Text</h2>

<pre>
<% out.print(text); %>
</pre>


<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />

</body>

</html>