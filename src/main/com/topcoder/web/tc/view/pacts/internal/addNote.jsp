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
<%@ page import="com.topcoder.shared.dataAccess.resultSet.*" %>
<%
	ResultSetContainer noteTypes = (ResultSetContainer)
		request.getAttribute(PactsConstants.NOTE_TYPE_LIST);
	String message = (String)
		request.getAttribute("message");
	long object_id = Long.parseLong(request.getParameter("object_id"));
	int object_type = Integer.parseInt(request.getParameter("object_type"));
	String tfuid = request.getParameter("tax_form_user_id");
	long tax_form_user_id;
	if (tfuid != null) tax_form_user_id = Long.parseLong(tfuid);
	else tax_form_user_id = 0;
	if (message == null) {
		message = "";
	}
	int t = -1;
	try { t = Integer.parseInt(request.getParameter("note_type_id")); } catch (Exception e) {}
	String text = request.getParameter("text");
	if (text == null) text = "";
%>

<h1>PACTS</h1>
<h2>Add Note</h2>

<%		out.print("<font color=\"#FF0000\">" + message + "</font>");
		out.print("<form action=\"" + PactsConstants.INTERNAL_SERVLET_URL);
		out.print("\" method=\"post\">");
		out.print("<input type=\"hidden\" name=\"object_type\" value=\""+object_type+"\">");
		out.print("<input type=\"hidden\" name=\"object_id\" value=\""+object_id+"\">");
		out.print("<input type=\"hidden\" name=\"tax_form_user_id\" value=\""+tax_form_user_id+"\">");
		out.print("<input type=\"hidden\" name=\"user_id\" value=\""+request.getParameter("user_id")+"\">");

		out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.ADD_TASK+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.NOTE_CMD+"\">");
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>Type:</b></td>
		<td>
		<select name="note_type_id">
<%		int rowCount;
		String s;
		int type;
		ResultSetContainer.ResultSetRow rsr;
		if (noteTypes != null) {
			rowCount = noteTypes.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = noteTypes.getRow(n);
				type = TCData.getTCInt(rsr,"note_type_id",0,true);
				out.print("<option value="+type);
				s = TCData.getTCString(rsr,"note_type_desc","default status",true);
				if (t < 0 && type == object_type) {
					out.print(" selected");
				} else if (t == type) out.print (" selected");
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td>
		</tr>
		<tr><td>Text:</td><td>
		<textarea name="text" rows=10 cols=80><% out.print(text); %></textarea>
		</td></tr>
	</table>

<input type=submit>
</form>
<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />
</body>

</html>