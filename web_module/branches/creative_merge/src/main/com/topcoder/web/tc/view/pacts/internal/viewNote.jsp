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
<%
	Note note = (Note)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	if (note == null) {
		note = new Note();
	}
%>

<h1>PACTS</h1>
<h2>View Note</h2>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>Note ID:</b></td>
<% out.println("<td>"+note.getHeader().getId()+"</td></tr>"); %>
		<tr>
		<td><b>Submitted by:</b></td>
<% out.println("<td>"+note.getHeader().getUser().getHandle()+"</td></tr>"); %>
		<tr><td><b>Creation Date</b></td>
<% out.println("<td>"+note.getHeader().getCreationDate()+"</td></tr>"); %>
		<tr><td><b>Type</b></td>
<% out.println("<td>"+note.getHeader().getType()+"</td></tr>"); %>
		</table>

<pre>
<% out.println(note.getText()); %>
</pre>

<br>
<% out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?"+PactsConstants.TASK_STRING+"="+PactsConstants.LIST_TASK+"&");
   out.print(PactsConstants.CMD_STRING+"="+PactsConstants.COMBO_CMD+"&"+PactsConstants.NOTE_ID+"="+note.getHeader().getId());
   out.println("\">List Entries this Note is attached to</a>");
%>
<br><br>
<jsp:include page="InternalFooter.jsp" flush="true" />

</body>

</html>
