<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>PACTS</title>
</head>

<body>

<%@ page import="com.topcoder.web.pacts.common.*" %>
<%@ page import="com.topcoder.web.common.*" %>
<%
	ResultSetContainer stati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	}
%>

<h1>PACTS</h1>
<h2>Add General Tax Form</h2>

<%		out.print("<text color=\"red\">" + message + "</text>");
		out.print("<form action=\"" + PactsConstants.INTERNAL_SERVLET_URL);
		out.print("\" method=\"post\">");

		out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.ADD_TASK+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.TAX_FORM_CMD+"\">");
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>Name:</b></td><td>
		<input type=text width=25 name="name">
		</td></tr>
		<tr>
		<td><b>Description:</b></td><td>
		<input type=text width=25 name="tax_form_desc">
		</td></tr>
		<tr>
		<td><b>Default Withholding Amount:</b></td><td>
		<input type=text width=25 name="default_withholding_amount">
		</td></tr>
		<tr>
		<td><b>Default Withholding Percentage:</b></td><td>
		<input type=text width=25 name="default_withholding_percentage">
		</td></tr>
		<tr><td><b>Withholding Used:</b></td><td>
		<input type=radio name="default_use_percentage" value="false" checked>Amount<br>
		<input type=radio name="default_use_percentage" value="true">Percentage
		</td></tr>
		<tr>
		<td><b>Status:</b></td>
		<td>
		<select name="status_id">
<%		int rowCount;
		String s;
		ResultSetContainer.ResultSetRow rsr;
		if (stati != null) {
			rowCount = stati.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = stati.getRow(n);
				out.print("<option value=");
				out.print("" + TCData.getTCInt(rsr,"status_id",0,true));
				s = TCData.getTCString(rsr,"status_desc","default status",true);
				if (s.equals(PactsConstants.DEFAULT_TAX_FORM_STATUS)) {
					out.print(" selected");
				}
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td>
		</tr>
		<tr><td>Text:</td><td>
		<textarea name="text" rows=10 cols=80></textarea>
		</td></tr>
	</table>

<input type=submit>
</form>
<jsp:include page="/InternalFooter.jsp" flush="true" />

</body>

</html>