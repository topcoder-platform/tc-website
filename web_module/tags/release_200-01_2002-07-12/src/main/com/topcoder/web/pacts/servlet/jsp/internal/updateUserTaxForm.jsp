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
	TaxForm taxForm = (TaxForm)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	ResultSetContainer stati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	}
	else if (taxForm != null) {
		String param;
		int i;
		float f;
		double d;
		param = request.getParameter("status_id");
		try { taxForm._header._statusID = Integer.parseInt(param); } catch (Exception e) {}
		param = request.getParameter("date_filed");
		taxForm._header._dateFiled = param;
		param = request.getParameter("withholding_amount");
		try { taxForm._withholdingAmount = Double.parseDouble(param); } catch (Exception e) {}
		param = request.getParameter("withholding_percentage");
		try { taxForm._withholdingPercentage = Float.parseFloat(param); } catch (Exception e) {}
		param = request.getParameter("use_percentage");
		if (param != null && param.equals("true")) taxForm._usePercentage = true;
		if (param != null && param.equals("false")) taxForm._usePercentage = false;
	}
	if (taxForm == null) {
		out.print("No User Tax Form!!!<br>");
		taxForm = new TaxForm();
	}
%>

<h1>PACTS</h1>
<h2>Update User Tax Form</h2>

<%		out.print("<font color=\"#FF0000\">" + message + "</font>");
		out.print("<form action=\"" + PactsConstants.INTERNAL_SERVLET_URL);
		out.print("\" method=\"post\">");

		out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.UPDATE_TASK+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.USER_TAX_FORM_CMD+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.TAX_FORM_ID+"\" value=\""+taxForm._header._id+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.USER_ID+"\" value=\""+taxForm._header._user._id+"\">");
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
			out.print(taxForm._header._user._id);
			out.print("\">"+taxForm._header._user._handle+"</a></td>\n");
%>
		</tr>
		<tr>
		<td><b>Status:</b></td>
		<td>
		<select name="status_id">
<%		int rowCount;
		int status_id;
		String s;
		ResultSetContainer.ResultSetRow rsr;
		if (stati != null) {
			rowCount = stati.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = stati.getRow(n);
				out.print("<option value=");
				status_id = TCData.getTCInt(rsr,"status_id",0,true);
				out.print("" + status_id);
				s = TCData.getTCString(rsr,"status_desc","default status",true);
				if (status_id == taxForm._header._statusID) {
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
		<td><b>Date Filed:</b></td>
		<td><input type="text" name="date_filed"
<% out.print("value=\""+taxForm._header._dateFiled+"\">"); %>
		</td>
		</tr>
		<tr>
		<td><b>Withholding Amount:</b></td>
		<td><input type="text" name="withholding_amount"
<% out.print("value=\""+taxForm._withholdingAmount+"\"></td><td>(Default: "+taxForm._defaultWithholdingAmount+")"); %>
		</td>
		</tr>
		<tr>
		<td><b>Withholding Percentage:</b></td>
		<td><input type="text" name="withholding_percentage"
<% out.print("value=\""+taxForm._withholdingPercentage+"\"></td><td>(Default: "+taxForm._defaultWithholdingPercentage+")"); %>
		</td>
		</tr>
		<tr><td><b>Withholding Used:</b></td><td>
		<input type=radio name="use_percentage" value="false"<% if (!taxForm._usePercentage) out.print( "checked"); %>>Amount <% if (!taxForm._defaultUsePercentage) out.print( "(default)"); %><br>
		<input type=radio name="use_percentage" value="true"<% if (taxForm._usePercentage) out.print( "checked"); %>>Percentage <% if (taxForm._defaultUsePercentage) out.print( "(default)"); %>
		</td></tr>
	</table>

<input type=submit>
</form>
<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />

</body>

</html>