<html>
<head>
<title>PACTS</title>
</head>
<body>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.*" %>

<% String message = (String) request.getAttribute("message");
   if (message == null) message = "";
   String id = request.getParameter(PactsConstants.AFFIDAVIT_ID);
   String dob = request.getParameter("date_of_birth");
   String fn = request.getParameter("familiy_name");
   String a = request.getParameter("aged");
   if (dob == null) dob = "";
   if (fn == null) fn = "";
   if (a == null) a = "";
%>

<h1>PACTS</h2>
<h2>Affirm Affidavit</h2>



<font color="#FF0000">
<% out.print(message); %>
</font>

<% out.print("<form action=\""+PactsConstants.INTERNAL_SERVLET_URL+"\" method=\"post\">");
   out.print("<input type=\"hidden\" name=\""+PactsConstants.AFFIDAVIT_ID+"\" value=\"");
   out.print(id+"\">");
   out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\"");
   out.print(PactsConstants.AFFIRM_TASK+"\">");
   out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\"");
   out.print(PactsConstants.AFFIDAVIT_CMD+"\">");
%>
<table cellspacing=5>
<tr><td><b>Date of Birth:</b></td><td>
<% out.print("<input type=\"text\" name=\"date_of_birth\" value=\""+dob+"\">"); %>
</td></tr>
<tr><td><b>Family Name (India Only):</b></td><td>
<% out.print("<input type=\"text\" name=\"family_name\" value=\""+fn+"\">"); %>
</td></tr>
<tr><td><b>Aged (India Only):</b></td><td>
<% out.print("<input type=\"text\" name=\"aged\" value=\""+a+"\">"); %>
</td></tr>
</table>
<input type=submit value="Affirm">
</form>
<br>
<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />
</body>
</html>