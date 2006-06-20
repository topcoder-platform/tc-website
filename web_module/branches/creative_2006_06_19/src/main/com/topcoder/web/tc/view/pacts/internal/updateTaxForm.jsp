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
	TaxForm taxForm = (TaxForm)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	String text = (String)
		request.getAttribute("text");
	ResultSetContainer stati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	} else if (taxForm != null) {
		String param;
		param = request.getParameter("name");
		if (param != null) taxForm.getHeader().setName(param);
		param = request.getParameter("tax_form_desc");
		if (param != null) taxForm.setDescription(param);
		param = request.getParameter("default_withholding_amount");
		try { if (param != null) taxForm.setDefaultWithholdingAmount(Double.parseDouble(param)); } catch (Exception e) {}
		param = request.getParameter("default_withholding_percentage");
		try { if (param != null) taxForm.setDefaultWithholdingPercentage(Float.parseFloat(param)); } catch (Exception e) {}
		param = request.getParameter("status_id");
		try { if (param != null) taxForm.setGenericFormStatusID(Integer.parseInt(param)); } catch (Exception e) {}
		param = request.getParameter("text");
		if (param != null) text = param;
		param = request.getParameter("default_use_percentage");
		if (param != null && param.equals("true")) taxForm.setDefaultUsePercentage(true);
		if (param != null && param.equals("false")) taxForm.setDefaultUsePercentage(false);
	}
	if (taxForm == null) {
		out.println("No Tax Form!!!<br>");
		taxForm = new TaxForm();
	}
%>

<h1>PACTS</h1>
<h2>Update General Tax Form</h2>

<%		out.print("<font color=\"#FF0000\">" + message + "</font>");
		out.print("<form action=\"" + PactsConstants.INTERNAL_SERVLET_URL);
		out.print("\" method=\"post\">");

		out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.UPDATE_TASK+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.TAX_FORM_CMD+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.TAX_FORM_ID+"\" value=\""+taxForm.getHeader().getId()+"\">");
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>Name:</b></td><td>
		<input type=text width=25 name="name"
<% out.print("value=\""+taxForm.getHeader().getName()+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Description:</b></td><td>
		<input type=text width=25 name="tax_form_desc"
<% out.print("value=\""+taxForm.getDescription()+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Default Withholding Amount:</b></td><td>
		<input type=text width=25 name="default_withholding_amount"
<% out.print("value=\""+taxForm.getDefaultWithholdingAmount()+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Default Withholding Percentage:</b></td><td>
		<input type=text width=25 name="default_withholding_percentage"
<% out.print("value=\""+taxForm.getDefaultWithholdingPercentage()+"\">"); %>
		</td></tr>
		<tr><td><b>Withholding Used:</b></td><td>
		<input type=radio name="default_use_percentage" value="false"<% if (!taxForm.isDefaultUsePercentage()) out.print( "checked"); %>>Amount<br>
		<input type=radio name="default_use_percentage" value="true"<% if (taxForm.isDefaultUsePercentage()) out.print( "checked"); %>>Percentage
		</td></tr>
		<tr>
		<td><b>Status:</b></td>
		<td>
		<select name="status_id">
<%		int rowCount;
		String s;
		int status_id;
		ResultSetContainer.ResultSetRow rsr;
		if (stati != null) {
			rowCount = stati.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = stati.getRow(n);
				out.print("<option value=");
				status_id = TCData.getTCInt(rsr,"status_id",0,true);
				out.print(""+status_id);
				s = TCData.getTCString(rsr,"status_desc","default status",true);
				if (status_id == taxForm.getGenericFormStatusID()) {
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
		<textarea name="text" rows=10 cols=80><% out.print(text); %></textarea>
		</td></tr>
	</table>

<input type=submit>
</form>
<jsp:include page="InternalFooter.jsp" flush="true" />
</body>

</html>