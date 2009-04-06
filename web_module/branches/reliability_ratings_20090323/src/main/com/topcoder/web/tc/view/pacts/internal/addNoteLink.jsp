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

<h1>PACTS</h1>
<h2>Add Note Link</h2>

<% out.println("<form action=\""+PactsConstants.INTERNAL_SERVLET_URL+"\" method=\"post\">");
   out.println("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.ADD_TASK+"\">");
   out.println("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.NOTE_LINK_CMD+"\">");
   out.println("<input type=\"hidden\" name=\""+PactsConstants.OBJECT_ID+"\" value=\""+request.getParameter(PactsConstants.OBJECT_ID)+"\">");
   out.println("<input type=\"hidden\" name=\""+PactsConstants.OBJECT_TYPE+"\" value=\""+request.getParameter(PactsConstants.OBJECT_TYPE)+"\">");
   String tfuID = request.getParameter(PactsConstants.TAX_FORM_USER_ID);
   if (tfuID != null) out.println("<input type=\"hidden\" name=\""+PactsConstants.TAX_FORM_USER_ID+"\" value=\""+request.getParameter(PactsConstants.TAX_FORM_USER_ID)+"\">");
   out.println("Note ID: <input type=\"text\" name=\""+PactsConstants.NOTE_ID+"\">");
   out.println("<input type=\"submit\" value=\"Link Note\">");
%>
</form><br>

<jsp:include page="/InternalFooter.jsp" flush="true" />

</body>

</html>