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
<%@ page import="java.text.DecimalFormat" %>
<%
	TaxForm taxForm = (TaxForm)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	if (taxForm == null) {
		out.println("no taxForm!!!<br>");
		taxForm = new TaxForm();
	}
	DecimalFormat df = new DecimalFormat(PactsConstants.DECIMAL_FORMAT_STRING);
%>

<h1>PACTS</h1>
<h2>View General Tax Form</h2>

		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>Name:</b></td><td>
<%			out.print(taxForm._header._name);
%>
		</td></tr>
		<tr>
		<td><b>Status:</b></td>
<%			out.print("<td>"+taxForm._genericFormStatus+"</td>\n");
%>
		</tr>
		<tr>
		<td><b>Description:</b></td><td>
<%			out.print(taxForm._description);
%>
		</td></tr>
		<tr>
		<td><b>Default Withholding Amount <% if (!taxForm._defaultUsePercentage) out.print("(Used)"); %>:</b></td><td>
<%			out.print(df.format(taxForm._defaultWithholdingAmount));
%>
		</td></tr>
		<tr>
		<td><b>Default Withholding Percentage <% if (taxForm._defaultUsePercentage) out.print("(Used)"); %>:</b></td>
<%			out.print("<td>"+taxForm._defaultWithholdingPercentage+"</a>\n");
%>
		</tr>

</table>

<% out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.VIEW_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.TEXT_CMD+"&");
   out.println("object_id="+taxForm._header._id+"&object_type="+PactsConstants.TAX_FORM_OBJ);
   out.println("\">View General Tax Form Text</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.LIST_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.USER_TAX_FORM_CMD+"&");
   out.println(PactsConstants.TAX_FORM_ID+"="+taxForm._header._id+"\">Users with this Tax Form</a><br>");

   out.println("<br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.UPDATE_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.TAX_FORM_CMD+"&");
   out.println(PactsConstants.TAX_FORM_ID+"="+taxForm._header._id);
   out.println("\">Update General Tax Form</a><br>");

%>

<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />

</body>

</html>
