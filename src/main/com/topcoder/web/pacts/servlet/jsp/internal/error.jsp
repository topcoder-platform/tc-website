<html>
<head>
<title>PACTS</title>
</head>
<body>

<%@ page import="com.topcoder.web.pacts.common.*" %>
<%@ page import="com.topcoder.web.common.*" %>

<% String message = (String) request.getAttribute("message");
   if (message == null) message = "There was an error processing your request.";
%>

<text color="FF0000">
<% out.print(message); %>
</text>

<jsp:include page="/InternalFooter.jsp" flush="true" />

</body>
</html>