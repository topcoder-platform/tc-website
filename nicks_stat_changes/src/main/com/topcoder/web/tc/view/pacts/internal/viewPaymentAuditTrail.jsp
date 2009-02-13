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
	Payment[] payments = (Payment[])
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	NoteHeader[] notes = (NoteHeader[])
		request.getAttribute(PactsConstants.NOTE_HEADER_LIST);
	if (payments == null) {
		out.println("no payments!!!<br>");
		payments = new Payment[0];
	}
	DecimalFormat df = new DecimalFormat(PactsConstants.DECIMAL_FORMAT_STRING);
%>

<h1>PACTS</h1>
<h2>View Payment Audit Trail</h2>

<%		if (payments.length != 0) {
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr><td><b>ID:</b></td><td>
<%		out.print(payments[0]._header._id);	%>	
		</td></tr><tr>
		<td><b>User:</b></td>
<% 			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_CMD+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(payments[0]._header._user._id);
			out.print("\">"+payments[0]._header._user._handle+"</a></td>\n");
%>
		</tr>
		<tr>
		<td><b>Reviewed:</b></td>
<%
		if (payments.length >= 1 && payments[0]._header._reviewed) out.print("<td>Yes</td>\n");
		else out.print("<td>No</td>\n");
%>
		</tr>
		</table>
<%		}
		else out.print("payments was empty!\n");
%>
<p>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>Description</b></td>
		<td><b>Status</b></td>
		<td><b>Type</b></td>
		<td><b>Net Amount</b></td>
		<td><b>Gross Amount</b></td>
		<td><b>Date Printed</b></td>
		<td><b>Date Paid</b></td>
		<td><b>Date Due</b></td>
		<td><b>Modification Rationale</b></td>
		<td><b>Address Information</b></td>
		</tr>

<%		for (int n = 0; n < payments.length; n++) {
			out.print("<tr>\n");
			out.print("<td>"+payments[n]._description+"</td>\n");
			out.print("<td>"+payments[n]._statusDesc+"</td>\n");
			out.print("<td>"+payments[n]._type+"</td>\n");
			out.print("<td>"+df.format(payments[n]._netAmount)+"</td>\n");
			out.print("<td>"+df.format(payments[n]._grossAmount)+"</td>\n");
			out.print("<td>"+payments[n]._printDate+"</td>\n");
			out.print("<td>"+payments[n]._payDate+"</td>\n");
			out.print("<td>"+payments[n]._dueDate+"</td>\n");
			out.print("<td>"+payments[n]._rationale+"</td>\n");
			if (payments[n]._statusId == PactsConstants.PAID_STATUS || payments[n]._statusId == PactsConstants.PRINTED_STATUS) {
				out.print("<td><pre>");
				out.println(payments[n]._lastName+", "+payments[n]._firstName+" "+payments[n]._middleName);
				out.println(payments[n]._address1);
				out.println(payments[n]._address2);
				out.print(payments[n]._city+", "+payments[n]._state+" (");
				out.println(payments[n]._stateCode+") "+payments[n]._zip);
				out.print(payments[n]._country+" ("+payments[n]._countryCode+")");
				out.print("</pre></td>\n");
			}
			out.print("</tr>\n");
		}
%>

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
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.NOTE_CMD+"&");
   out.println("object_id="+request.getParameter(PactsConstants.PAYMENT_ID)+"&");
   out.println("user_id="+payments[0]._header._user._id+"&");
   out.println("object_type="+PactsConstants.PAYMENT_OBJ);
   out.println("\">Add Note</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.UPDATE_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.PAYMENT_CMD+"&");
   out.println(PactsConstants.PAYMENT_ID+"="+request.getParameter(PactsConstants.PAYMENT_ID));
   out.println("\">Reconcile Payment</a><br>");
   
   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.PAYMENT_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.REVIEW_CMD+"&");
   out.println(PactsConstants.PAYMENT_ID+"="+request.getParameter(PactsConstants.PAYMENT_ID)+"&");
   out.print("query="+PactsConstants.INTERNAL_SERVLET_URL+"%3F");
   out.print(PactsConstants.TASK_STRING+"%3D"+PactsConstants.VIEW_TASK+"%26");
   out.print(PactsConstants.CMD_STRING+"%3D"+PactsConstants.PAYMENT_AUDIT_TRAIL_CMD+"%26");
   out.print(PactsConstants.PAYMENT_ID+"%3D"+request.getParameter(PactsConstants.PAYMENT_ID)+"%26");
   out.print("individual_payment%3D1");
   out.println("\">Review Payment</a><br>");

   if (payments.length > 0 && payments[payments.length-1]._statusId == PactsConstants.PRINTED_STATUS) {
   	out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   	out.print(PactsConstants.TASK_STRING+"="+PactsConstants.PAYMENT_TASK+"&");
   	out.println(PactsConstants.CMD_STRING+"="+PactsConstants.PAID_CMD+"&");
   	out.println(PactsConstants.PAYMENT_ID+"="+request.getParameter(PactsConstants.PAYMENT_ID)+"&");
   	out.print("query="+PactsConstants.INTERNAL_SERVLET_URL+"%3F");
   	out.print(PactsConstants.TASK_STRING+"%3D"+PactsConstants.VIEW_TASK+"%26");
   	out.print(PactsConstants.CMD_STRING+"%3D"+PactsConstants.PAYMENT_AUDIT_TRAIL_CMD+"%26");
   	out.print(PactsConstants.PAYMENT_ID+"%3D"+request.getParameter(PactsConstants.PAYMENT_ID)+"%26");
   	out.print("individual_payment%3D1");
   	out.println("\">Mark Payment as Paid</a><br>");
   }
%>

<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />

</body>

</html>
