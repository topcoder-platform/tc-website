<%@ page isErrorPage="true" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.reg.servlet.*" %>
<%!
boolean VERBOSE = true;
%>
<html>
<head><title>Error</title></head>
<body>

Error page goes here.

<% if (VERBOSE) { %>

<pre>
<font color="white">
Exception:

<%
if (exception != null)
{
    out.println(exception.getMessage());
    exception.printStackTrace(new PrintWriter(out));
}
%>

Request Exception:

<%
Throwable requestException = null;
if (request != null && request.getAttribute("exception") != null && request.getAttribute("exception") instanceof Throwable)
{
    requestException = (Throwable) request.getAttribute("exception");
}
if (requestException != null)
{
    out.println(requestException.getMessage());
    requestException.printStackTrace(new PrintWriter(out));
}
%>
</font>
</pre>

<% } %>

</body>
</html>
