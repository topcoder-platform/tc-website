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
<%@ page import="java.text.DecimalFormat" %>
<%
	Payment payment = (Payment)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	NoteHeader[] notes = (NoteHeader[])
		request.getAttribute(PactsConstants.NOTE_HEADER_LIST);
	if (notes == null) {
		notes = new NoteHeader[0];
	}
	if (payment == null) {
		out.println("no payment!!!<br>");
		payment = new Payment();
	}
	DecimalFormat df = new DecimalFormat(PactsConstants.DECIMAL_FORMAT_STRING);
%>

<h1>PACTS</h1>
<h2>View Payment</h2>

		<table border="0" cellpadding="5" cellspacing="5">
		<tr><td><b>ID:</b></td><td>
<%		out.print(payment._header._id);	%>	
		</td></tr><tr>
		<td><b>User:</b></td>
<% 			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_CMD+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(payment._header._user._id);
			out.print("\">"+payment._header._user._handle+"</a></td>\n");
%>
		</tr>

		<tr>
		<td><b>Description:</b></td><td>
<%			out.print(payment._header._description);
%>
		</td></tr>
		<tr>
		<td><b>Status:</b></td>
<%			out.print("<td>"+payment._statusDesc+"</td>\n");
%>
		</tr>
		<tr>
		<td><b>Type:</b></td><td>
<%			out.print(payment._header._type);
%>
		</td></tr>

		<tr>
		<td><b>Net Amount:</b></td>
<%			out.print("<td>"+df.format(payment._netAmount)+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>Gross Amount:</b></td>
<%			out.print("<td>"+df.format(payment._grossAmount)+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>Date Printed:</b></td>
<%			out.print("<td>"+payment._printDate+"</td>\n");
%>
		</tr>

		<tr>
		<td><b>Date Paid:</b></td>
<%			out.print("<td>"+payment._payDate+"</td>\n");
%>
		</tr>
		<tr>
		<td><b>Date Due:</b></td>
<%			out.print("<td>"+payment._dueDate+"</td>\n");
%>
		</tr>
		<tr>
		<td><b>Reviewed:</b></td>
<%
		if (payment._header._reviewed) out.print("<td>Yes</td>\n");
		else out.print("<td>No</td>\n");
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
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.PAYMENT_AUDIT_TRAIL_CMD+"&");
   out.println(PactsConstants.PAYMENT_ID+"="+payment._header._id);
   out.println("\">View Audit Trail</a><br>");

   out.print("<br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.NOTE_CMD+"&");
   out.println("object_id="+payment._header._id+"&");
   out.println("user_id="+payment._header._user._id+"&");
   out.println("object_type="+PactsConstants.PAYMENT_OBJ);
   out.println("\">Add Note</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.UPDATE_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.PAYMENT_CMD+"&");
   out.println(PactsConstants.PAYMENT_ID+"="+payment._header._id);
   out.println("\">Reconcile Payment</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.PAYMENT_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.REVIEW_CMD+"&");
   out.println(PactsConstants.PAYMENT_ID+"="+payment._header._id+"&");
   out.print("query="+PactsConstants.INTERNAL_SERVLET_URL+"%3F");
   out.print(PactsConstants.TASK_STRING+"%3D"+PactsConstants.VIEW_TASK+"%26");
   out.print(PactsConstants.CMD_STRING+"%3D"+PactsConstants.PAYMENT_CMD+"%26");
   out.print(PactsConstants.PAYMENT_ID+"%3D"+payment._header._id+"%26");
   out.print("individual_payment%3D1");
   out.println("\">Review Payment</a><br>");

   if (payment._header._recentStatusID == PactsConstants.PRINTED_STATUS) {
   	out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   	out.print(PactsConstants.TASK_STRING+"="+PactsConstants.PAYMENT_TASK+"&");
   	out.print(PactsConstants.CMD_STRING+"="+PactsConstants.PAID_CMD+"&");
   	out.print(PactsConstants.PAYMENT_ID+"="+payment._header._id+"&");
   	out.print("query="+PactsConstants.INTERNAL_SERVLET_URL+"%3F");
   	out.print(PactsConstants.TASK_STRING+"%3D"+PactsConstants.VIEW_TASK+"%26");
   	out.print(PactsConstants.CMD_STRING+"%3D"+PactsConstants.PAYMENT_CMD+"%26");
   	out.print(PactsConstants.PAYMENT_ID+"%3D"+payment._header._id+"%26");
   	out.print("individual_payment%3D1");
   	out.println("\">Mark Payment as Paid</a><br>");
   }
%>

<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />

</body>

</html>
