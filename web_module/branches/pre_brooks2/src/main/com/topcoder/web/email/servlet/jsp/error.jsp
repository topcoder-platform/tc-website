<%@ page import="com.topcoder.web.email.servlet.*" %>
<%@ page isErrorPage="true" %>

<html>
<head>
	<title>TopCoder E-Mail System</title>
</head>
<body>
<jsp:include page="header.jsp" />

<h1>Error!</h1>
Sorry, but something went wrong.  Here's the exception:
<p>
<pre>
<%

Throwable requestException = null;
if (request != null && request.getAttribute("Exception") != null && request.getAttribute("Exception") instanceof Throwable)
{
    requestException = (Throwable) request.getAttribute("Exception");
}
if (requestException != null)
{
    out.println(requestException.getMessage());
    requestException.printStackTrace(new java.io.PrintWriter(out));
}

%>
</pre>
<p>
<jsp:include page="footer.jsp" />

</body>
</html>
