<html>
<head>
<title>PACTS</title>
</head>
<body>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.*" %>

<% String message = (String) request.getAttribute("message");
   if (message == null) message = "There was an error processing your request.";
%>

<font color="FF0000">
<% out.print(message); %>
</font>

<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />
</body>
</html>