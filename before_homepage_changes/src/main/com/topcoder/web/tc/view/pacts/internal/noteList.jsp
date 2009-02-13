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
	NoteHeader[] noteList = (NoteHeader[])
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	if (noteList == null) {
		out.println("no list!!!<br>");
		noteList = new NoteHeader[0];
	}
%>

<h1>PACTS</h1>
<h2>Note List</h2>
<%
	if (noteList.length == 0) {
		out.println("no results matched your query<br>");
	}
	else {
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>Submitted by</b></td>
		<td><b>Creation Date</b></td>
		<td><b>Type</b></td>
		</tr>
<%
  		for (int n = 0; n < noteList.length; n++) {
			out.print("<tr>\n<td>"+noteList[n]._user._handle+"</td><td>\n");
			out.print("<a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.NOTE_CMD+"&");
			out.print(PactsConstants.NOTE_ID+"=");
			out.print(noteList[n]._id);
			out.print("\">"+noteList[n]._creationDate+"</a></td>\n");
			out.print("<td>"+noteList[n]._type+"</td></tr>\n");
		}
	}
%>

</table>

<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />
</body>

</html>
