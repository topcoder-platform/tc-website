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
	Affidavit affidavit = (Affidavit)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	NoteHeader[] notes = (NoteHeader[])
		request.getAttribute(PactsConstants.NOTE_HEADER_LIST);
	if (affidavit == null) {
		affidavit = new Affidavit();
	}
	if (notes == null) {
		notes = new NoteHeader[0];
	}
%>

<h1>PACTS</h1>
<h2>View Affidavit</h2>

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
			out.print(affidavit.getHeader().getUser().getId());
			out.print("\">"+affidavit.getHeader().getUser().getHandle()+"</a></td>\n");
%>
		</tr>
		<tr>
		<td><b>Creation Date:</b></td>
<%			out.print("<td>"+affidavit.getHeader().getCreationDate()+"</a>\n");
%>
		</tr>
		<tr>
		<td><b>Affirmed:</b></td>
<%			if (affidavit.getHeader().isAffirmed()) {
				out.print("<td>Yes</td>\n");
			}
			else {
				out.print("<td>No</td>\n");
			}
%>
		</tr>
		<tr>
		<td><b>Notarized:</b></td>
<%			if (affidavit.getHeader().isNotarized()) {
				out.print("<td>Yes</td>\n");
			}
			else {
				out.print("<td>No</td>\n");
			}
%>
		</tr>
		<tr>
		<td><b>Status:</b></td>
<%			out.print("<td>"+affidavit.getHeader().getStatusDesc()+"</td>\n");
%>
		</tr>
		<tr>
		<td><b>Description:</b></td><td>
<%			out.print(affidavit.getHeader().getDescription());
%>
		</td></tr>
		<tr>
		<td><b>Affirmation Date:</b></td><td>
<%			out.print(affidavit.getAffirmationDate());
%>
		</td></tr>
		<tr>
		<td><b>Type:</b></td><td>
<%			out.print(affidavit.getHeader().getTypeDesc());
%>
		</td></tr>
		<tr>
		<td><b>Round:</b></td><td>
<%		out.print(affidavit.getRound());
%>
		</td></tr>
		<tr>
		<td><b>

<%		out.print("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL);
		out.print("?"+PactsConstants.TASK_STRING+"=");
		out.print(PactsConstants.VIEW_TASK+"&"+PactsConstants.CMD_STRING);
		out.print("="+PactsConstants.PAYMENT_CMD+"&");
		out.print(PactsConstants.PAYMENT_ID+"="+affidavit.getPayment().getId());
		out.print("\">Payment</a>");
%>
			Status:</b></td><td>
<%		out.print(affidavit.getPayment().getRecentStatus());
%>
		</td></tr>

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
   out.println("object_id="+affidavit.getHeader().getId()+"&object_type="+PactsConstants.AFFIDAVIT_OBJ);
   out.println("\">View Affidavit Text</a><br>");

   out.println("<br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.ADD_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.NOTE_CMD+"&");
   out.println("object_id="+affidavit.getHeader().getId()+"&");
   out.println("user_id="+affidavit.getHeader().getUser().getId()+"&");
   out.println("object_type="+PactsConstants.AFFIDAVIT_OBJ);
   out.println("\">Add Note</a><br>");

   out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   out.print(PactsConstants.TASK_STRING+"="+PactsConstants.UPDATE_TASK+"&");
   out.println(PactsConstants.CMD_STRING+"="+PactsConstants.AFFIDAVIT_CMD+"&");
   out.println(PactsConstants.AFFIDAVIT_ID+"="+affidavit.getHeader().getId());
   out.println("\">Update Affidavit</a><br>");

   if (!affidavit.getHeader().isAffirmed()) {
   	out.println("<a href=\""+PactsConstants.INTERNAL_SERVLET_URL+"?");
   	out.print(PactsConstants.TASK_STRING+"="+PactsConstants.AFFIRM_TASK+"&");
   	out.println(PactsConstants.CMD_STRING+"="+PactsConstants.AFFIDAVIT_CMD+"&");
   	out.println(PactsConstants.AFFIDAVIT_ID+"="+affidavit.getHeader().getId());
   	out.println("\">Affirm Affidavit</a><br>");
   }
%>


<jsp:include page="InternalFooter.jsp" flush="true" />

</body>

</html>
