<%@ page isErrorPage="true" %>
<%@ page 
  language="java"
  import="java.util.*,
          java.net.*,
          com.coolservlets.forum.*,
          com.coolservlets.forum.util.*,
	  com.coolservlets.forum.util.admin.*"
%>
<html>
<head>
  <title>Untitled</title>
</head>
<body>
<%
  exception.printStackTrace();
%>
Exception is: <%= exception %>
<p>
exception.getMessage(): <%= exception.getMessage() %>
</body>
</html>

