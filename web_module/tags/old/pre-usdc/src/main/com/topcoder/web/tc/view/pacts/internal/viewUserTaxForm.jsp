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
	NoteHeader[] notes = (NoteHeader[])
		request.getAttribute(PactsConstants.NOTE_HEADER_LIST);
	if (taxForm == null) {
		out.println("no taxForm!!!<br>");
		taxForm = new TaxForm();
	}
	if (notes == null) {
		notes = new NoteHeader[0];
	}
	DecimalFormat df = new DecimalFormat(PactsConstants.DECIMAL_FORMAT_STRING);
%>

<h1>PACTS</h1>
<h2>View User Tax Form</h2>

		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>User:</b></td><td>
<%			out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
			out.print(PactsConstants.TASK_STRING+"="+PactsConstants.VIEW_TASK);
			out.print("&"+PactsConstants.CMD_STRING+"="+PactsConstants.USER_CMD);
			out.print("&"+PactsConstants.USER_ID+"="+taxForm._header._user._id);
			out.print("\">"+taxForm._header._user._handle+"</a>");
%>
		</td></tr>
		<tr>
		<td><b>Name:</b></td><td>
<%			out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
			out.print(PactsConstants.TASK_STRING+"="+PactsConstants.VIEW_TASK);
			out.print("&"+PactsConstants.CMD_STRING+"="+PactsConstants.TAX_FORM_CMD);
			out.print("&"+PactsConstants.TAX_FORM_ID+"="+taxForm._header._id);
			out.print("\">"+taxForm._header._name+"</a>");
%>
		</td></tr>
		<tr>
		<td><b>Status:</b></td>
<%			out.print("<td>"+taxForm._header._status+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>Generic Tax Form Status:</b></td>
<%			out.print("<td>"+taxForm._genericFormStatus+"</td>\n");
%>
		</tr>
		<tr>
		<td><b>Date Filed:</b></td>
		<td>
<%		out.print(taxForm._header._dateFiled); %>
		</td>
		</tr>
		<tr>
		<td><b>Description:</b></td><td>
<%			out.print(taxForm._description);
%>
		</td></tr>
		<tr>
		<td><b>Withholding Amount <% if (!taxForm._usePercentage) out.print("(Used)"); %>:</b></td><td>
<%			out.print(df.format(taxForm._withholdingAmount)+"</td><td>(Default: ");
			out.print(df.format(taxForm._defaultWithholdingAmount)+")");
%>
		</td></tr>
		<tr>
		<td><b>Withholding Percentage <% if (taxForm._usePercentage) out.print("(Used)"); %>:</b></td>
<%			out.print("<td>"+taxForm._withholdingPercentage+"</td><td>(Default: ");
			out.print(taxForm._defaultWithholdingPercentage+")</td>\n");
%>
		</tr>
</table>

<%  if (notes.length > 0) {
	out.println("<form action=\""+PactsConstants.INTERNAL_SERVLET_URL+"\" method=\"post\">");
	out.println("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.VIEW_TASK+"\">");
	out.println("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.NOTE_CMD+"\">");
	out.println("<input type=\"submit\" value=\"View Note\">");
	out.println("<select name=\""+PactsConstants.NOTE_ID+"\">");
	for (int n = 0; n < notes.length; n++) {
		out.println("<option value=\""+notes[n]._id+"\">"+notes[n]._creationDate+" by "+notes[n]._user._handle+"</option>");
	}
	out.println("</select></form>");
    }
%>
<p>
<% 
   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.VIEW_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.TEXT_CMD+"&");
   out.println("object_id="+taxForm._header._id+"&object_type="+PactsConstants.TAX_FORM_OBJ);
   out.println("\">View General Tax Form Text</a><br>");

   out.println("<br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.NOTE_CMD+"&");
   out.println("object_id="+taxForm._header._id+"&");
   out.println("object_type="+PactsConstants.USER_TAX_FORM_OBJ+"&");
   out.println(PactsConstants.TAX_FORM_USER_ID+"="+taxForm._header._user._id+"&");
   out.println(PactsConstants.USER_ID+"="+taxForm._header._user._id+"\">Add Note</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.UPDATE_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.USER_TAX_FORM_CMD+"&");
   out.println(PactsConstants.TAX_FORM_ID+"="+taxForm._header._id+"&");
   out.println(PactsConstants.USER_ID+"="+taxForm._header._user._id+"\">Update User Tax Form</a><br>");
%>


<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />

</body>

</html>
