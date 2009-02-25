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
<%
	Contract contract = (Contract)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	NoteHeader[] notes = (NoteHeader[])
		request.getAttribute(PactsConstants.NOTE_HEADER_LIST);
	if (notes == null) {
		notes = new NoteHeader[0];
	}
	if (contract == null) {
		out.println("no contract!!!<br>");
		contract = new Contract();
	}
%>

<h1>PACTS</h1>
<h2>View Contract</h2>

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
			out.print(contract.getHeader().getUser().getId());
			out.print("\">"+contract.getHeader().getUser().getHandle()+"</a></td>\n");
%>
		</tr>
		<tr>
		<td><b>Name:</b></td><td>
<%			out.print(contract.getHeader().getName());
%>
		</td></tr>
		<tr>
		<td><b>Creation Date:</b></td>
<%			out.print("<td>"+contract.getHeader().getCreationDate()+"</a>\n");
%>
		</tr>
		<tr>
		<tr>
		<td><b>Status:</b></td>
<%			out.print("<td>"+contract.getHeader().getStatusDesc()+"</td>\n");
%>
		</tr>
		<tr>
		<td><b>Description:</b></td><td>
<%			out.print(contract.getDescription());
%>
		</td></tr>
		<tr>
		<td><b>Type:</b></td><td>
<%			out.print(contract.getHeader().getTypeDesc());
%>
		</td></tr>
		<tr><td><b>Start Date:</b></td><td>
<%		out.print(contract.getStartDate());
%>
		</td></tr>

		<tr><td><b>End Date:</b></td><td>
<%		out.print(contract.getEndDate());
%>
		</td></tr>

<%		for (int n = 0; n < contract.getPayments().length; n++) {
			out.print("<tr><td><a href=\""+PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&"+PactsConstants.CMD_STRING);
			out.print("="+PactsConstants.PAYMENT_CMD+"&");
			out.print(PactsConstants.PAYMENT_ID+"="+contract.getPayments()[n].getId());
			out.print("\">"+contract.getPayments()[n].getDescription()+"</a>:");
%>
			</b></td><td>
<%			out.print(contract.getPayments()[n].getRecentStatus()+"</td></tr>");
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
		out.println("<option value=\""+notes[n].getId()+"\">"+notes[n].getCreationDate()+" by "+notes[n].getUser().getHandle()+"</option>");
	}
	out.println("</select></form>");
    }
%>
<p>

<%
   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.VIEW_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.TEXT_CMD+"&");
   out.println("object_id="+contract.getHeader().getId()+"&object_type="+PactsConstants.CONTRACT_OBJ);
   out.println("\">View Contract Text</a><br>");

   out.println("<br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.PAYMENT_CMD+"&");
   out.println(PactsConstants.CONTRACT_ID+"="+contract.getHeader().getId());
   out.println("\">Add Contract Payment</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.NOTE_CMD+"&");
   out.println("object_id="+contract.getHeader().getId()+"&");
   out.println("user_id="+contract.getHeader().getUser().getId()+"&");
   out.println("object_type="+PactsConstants.CONTRACT_OBJ);
   out.println("\">Add Note</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.UPDATE_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.CONTRACT_CMD+"&");
   out.println(PactsConstants.CONTRACT_ID+"="+contract.getHeader().getId());
   out.println("\">Update Contract</a><br>");
%>


<jsp:include page="InternalFooter.jsp" flush="true" />

</body>

</html>