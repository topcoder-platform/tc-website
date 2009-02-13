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
	UserProfileHeader user = (UserProfileHeader)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	ResultSetContainer stati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	ResultSetContainer affidavitTypes = (ResultSetContainer)
		request.getAttribute(PactsConstants.AFFIDAVIT_TYPE_LIST);
	ResultSetContainer paymentTypes = (ResultSetContainer)
		request.getAttribute(PactsConstants.PAYMENT_TYPE_LIST);
	ResultSetContainer rounds = (ResultSetContainer)
		request.getAttribute(PactsConstants.ROUND_LIST);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (user == null) {
		out.println("no user!!!<br>");
		user = new UserProfileHeader();
	}
%>

<h1>PACTS</h1>
<h2>Add Affidavit</h2>

<%		out.print("<text color=\"red\">" + message + "</text>");
		out.print("<form action=\"" + PactsConstants.INTERNAL_SERVLET_URL);
		out.print("\" method=\"post\"><input type=\"hidden\" name=\"");
		out.print(PactsConstants.USER_ID+"\" value=\""+user._id+"\">");

		out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.ADD_TASK+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.AFFIDAVIT_CMD+"\">");
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>User:</b></td>
<% 			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_CMD+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(user._id);
			out.print("\">"+user._handle+"</a></td>\n");
%>
		</tr>
		<tr>
		<td><b>Notarized:</b></td><td>
<%		out.print("<input type=\"radio\" name=\""+PactsConstants.IS_NOTARIZED+"\" value=\"true\">Yes<br>");
		out.print("<input type=\"radio\" name=\""+PactsConstants.IS_NOTARIZED+"\" value=\"false\" checked>No");
%>
		</td></tr>
		<tr>
		<td><b>Status:</b></td>
		<td>
		<select name="affidavit_status_id">
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
				if (s.equals(PactsConstants.DEFAULT_AFFIDAVIT_STATUS)) {
					out.print(" selected");
				}
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td>
		</tr>
		<tr>
		<td><b>Description:</b></td><td>
		<input type=text width=25 name="affidavit_desc">
		</td></tr>
		<tr>
		<td><b>Type:</b></td><td>
		<select name="affidavit_type_id">
<%		if (affidavitTypes != null) {
			rowCount = affidavitTypes.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = affidavitTypes.getRow(n);
				out.print("<option value=");
				out.print("" + TCData.getTCInt(rsr,"affidavit_type_id",0,true));
				s = TCData.getTCString(rsr,"affidavit_type_desc","default affidavit type",true);
				if (s.equals(PactsConstants.DEFAULT_AFFIDAVIT_TYPE)) {
					out.print(" selected");
				}
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td></tr>
		<tr><td><b>Round:</b></td><td>
		<select name="round_id">
		<option value="-1">None</option>
<%		if (rounds != null) {
			rowCount = rounds.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = rounds.getRow(n);
				out.print("<option value=");
				out.print("" + TCData.getTCLong(rsr,"round_id",0,true));
				s = TCData.getTCString(rsr,"name","default round name",true);
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select></td></tr>
		<tr><td>Text:</td><td>
		<textarea name="text" rows=10 cols=80></textarea>
		</td></tr>
</table>
<h2>Add Payment</h2>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>Status:</b></td>
		<td>
		<select name="payment_status_id">
<%		if (stati != null) {
			rowCount = stati.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = stati.getRow(n);
				out.print("<option value=");
				out.print("" + TCData.getTCInt(rsr,"status_id",0,true));
				s = TCData.getTCString(rsr,"status_desc","default status",true);
				if (s.equals(PactsConstants.DEFAULT_AFFIDAVIT_PAYMENT_STATUS)) {
					out.print(" selected");
				}
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td>
		</tr>
		<tr>
		<td><b>Description:</b></td><td>
		<input type=text width=25 name="payment_desc">
		</td></tr>
		<tr>
		<td><b>Type:</b></td><td>
		<select name="payment_type_id">
<%		if (paymentTypes != null) {
			rowCount = paymentTypes.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = paymentTypes.getRow(n);
				out.print("<option value=");
				out.print("" + TCData.getTCInt(rsr,"payment_type_id",0,true));
				s = TCData.getTCString(rsr,"payment_type_desc","default payment type",true);
				if (s.equals(PactsConstants.DEFAULT_AFFIDAVIT_PAYMENT_TYPE)) {
					out.print(" selected");
				}
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td></tr>
		<tr>
		<td><b>Net Amount:</b></td><td>
		<input type=text width=25 name="net_amount">
		</td></tr>
		<tr>
		<td><b>Gross Amount:</b></td><td>
		<input type=text width=25 name="gross_amount">
		</td></tr>
		<tr>
		<td><b>Date Due:</b></td><td>
		<input type=text width=25 name="date_due">
		</td></tr>
	</table>

<input type=submit>
</form>
<jsp:include page="/InternalFooter.jsp" flush="true" />

</body>

</html>