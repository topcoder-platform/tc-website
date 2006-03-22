<%@ page isErrorPage="true"
  import="com.topcoder.common.web.data.report.Constants"
%>

<html>
  <head>
    <title>TopCoder Reporting II</title>
  </head>
  <body>
   <a href=<%=Constants.SERVLET_ADDR%>><< back to main menu<a><br/><br/>
    <br/><pre>
<%
Throwable requestException = null;
if (request != null && request.getAttribute("Exception") != null && request.getAttribute("Exception") instanceof Throwable){
    requestException = (Throwable) request.getAttribute("Exception");
}
if (requestException != null) {
    out.println(requestException.getMessage());
    requestException.printStackTrace(new java.io.PrintWriter(out));
}
%>
    </pre>
    <br/>
  </body>
</html>
