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
	TaxFormHeader[] taxforms = (TaxFormHeader[])
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	UserProfileHeader user = (UserProfileHeader)
		request.getAttribute("user");
	ResultSetContainer stati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	}
	String DateFiled = request.getParameter("date_filed");
	if (DateFiled == null) DateFiled = "";
	long tf = -1;
	try { tf = Long.parseLong(request.getParameter("tax_form_id")); } catch (Exception e) {}
	int status = -1;
	try { status = Integer.parseInt(request.getParameter("status_id")); } catch (Exception e) {}
%>

<h1>PACTS</h1>
<h2>Add User Tax Form</h2>

<%		out.print("<font color=\"#FF0000\">" + message + "</font>");
		out.print("<form action=\"" + PactsConstants.INTERNAL_SERVLET_URL);
		out.print("\" method=\"post\"><input type=\"hidden\" name=\"");
		out.print(PactsConstants.USER_ID+"\" value=\""+user._id+"\">");

		out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.ADD_TASK+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.USER_TAX_FORM_CMD+"\">");
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
		<td><b>Status:</b></td>
		<td>
		<select name="status_id">
<%		int rowCount;
		String s;
		long s_id;
		ResultSetContainer.ResultSetRow rsr;
		if (stati != null) {
			rowCount = stati.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = stati.getRow(n);
				out.print("<option value=");
				s_id = TCData.getTCInt(rsr,"status_id",0,true);
				out.print(s_id);
				s = TCData.getTCString(rsr,"status_desc","default status",true);
				if (status < 0 && s.equals(PactsConstants.DEFAULT_USER_TAX_FORM_STATUS)) {
					out.print(" selected");
				} else if (status == s_id) out.print(" selected");
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td>
		</tr>
		<tr>
		<td><b>Tax Form:</b></td>
		<td>
		<select name="tax_form_id">
<%			for (int n = 0; n < taxforms.length; n++) {
				out.print("<option value=");
				out.print("" + taxforms[n]._id);
				s = taxforms[n]._name;
				if (tf < 0 && s.equals(PactsConstants.DEFAULT_USER_TAX_FORM)) {
					out.print(" selected");
				} else if (tf == taxforms[n]._id) out.print(" selected");
				out.print(">" + s + "</option>\n");
			}
%>
		</select>
		</td>
		</tr>
		<tr>
		<td><b>Date Filed:</b></td>
<%		out.print("<td><input type=\"text\" name=\"date_filed\" value=\""+DateFiled+"\"></td>"); %>
		</tr>
	</table>

<input type=submit>
</form>
<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />
</body>

</html>