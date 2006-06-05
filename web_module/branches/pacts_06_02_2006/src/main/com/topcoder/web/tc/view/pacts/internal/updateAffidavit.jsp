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
	Affidavit affidavit = (Affidavit)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	ResultSetContainer stati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	ResultSetContainer affidavitTypes = (ResultSetContainer)
		request.getAttribute(PactsConstants.AFFIDAVIT_TYPE_LIST);
	ResultSetContainer rounds = (ResultSetContainer)
		request.getAttribute(PactsConstants.ROUND_LIST);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	} else if (affidavit != null) {
		String param;
		param = request.getParameter(PactsConstants.IS_NOTARIZED);
        affidavit.getHeader().setNotarized("true".equals(param));
		param = request.getParameter("affidavit_status_id");
		try { if (param != null) affidavit.getHeader().setStatusId(Integer.parseInt(param)); } catch (Exception e) {}
		param = request.getParameter("affidavit_type_id");
		try { if (param != null) affidavit.getHeader().setTypeId(Integer.parseInt(param)); } catch (Exception e) {}
		param = request.getParameter("round_id");
		try { if (param != null) affidavit.setRoundId(new Long(Long.parseLong(param))); } catch (Exception e) {}
		param = request.getParameter("affidavit_desc");
		if (param != null) affidavit.getHeader().setDescription(param);
	}
	if (affidavit == null) {
		out.println("no affidavit!!!<br>");
		affidavit = new Affidavit();
	}
	
   String dob = request.getParameter("date_of_birth");
   String fn = request.getParameter("family_name");
   String a = request.getParameter("aged");
   if (dob == null) dob = "";
   if (fn == null) fn = "";
   if (a == null) a = "";
%>

<h1>PACTS</h1>
<h2>Update Affidavit</h2>

<%		out.print("<font color=\"#FF0000\">" + message + "</font>");
		out.print("<form action=\"" + PactsConstants.INTERNAL_SERVLET_URL);
		out.print("\" method=\"post\">");

		out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.UPDATE_TASK+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.AFFIDAVIT_CMD+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.AFFIDAVIT_ID+"\" value=\""+affidavit.getHeader().getId()+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.PAYMENT_ID+"\" value=\""+affidavit.getPayment().getId()+"\">");
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
			out.print(affidavit.getHeader().getUser().getId());
			out.print("\">"+affidavit.getHeader().getUser().getHandle()+"</a></td>\n");
%>
		</tr>
		<tr>
		<td><b>Notarized:</b></td><td>
<%		out.print("<input type=\"radio\" name=\""+PactsConstants.IS_NOTARIZED+"\" value=\"true\"");
		if (affidavit.getHeader().isNotarized()) out.print(" checked");
		out.print(">Yes<br>");
		out.print("<input type=\"radio\" name=\""+PactsConstants.IS_NOTARIZED+"\" value=\"false\"");
		if (!affidavit.getHeader().isNotarized()) out.print(" checked");
		out.print(">No");
%>
		</td></tr>
		<tr>
		<td><b>Status:</b></td>
		<td>
		<select name="affidavit_status_id">
<%		int rowCount;
		String s;
		long code;
		ResultSetContainer.ResultSetRow rsr;
		if (stati != null) {
			rowCount = stati.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = stati.getRow(n);
				code = TCData.getTCInt(rsr,"status_id",0,true);
				if (affidavit.getHeader().getStatusId() == PactsConstants.AFFIDAVIT_AFFIRMED_STATUS &&
					code != PactsConstants.AFFIDAVIT_AFFIRMED_STATUS) {
					continue;
				}
				out.print("<option value="+code);
				s = TCData.getTCString(rsr,"status_desc","default status",true);
				if (code == affidavit.getHeader().getStatusId()) {
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
<% out.print("<input type=text width=25 name=\"affidavit_desc\" value=\""+affidavit.getHeader().getDescription()+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Type:</b></td><td>
		<select name="affidavit_type_id">
<%		if (affidavitTypes != null) {
			rowCount = affidavitTypes.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = affidavitTypes.getRow(n);
				out.print("<option value=");
				code = TCData.getTCInt(rsr,"affidavit_type_id",0,true);
				out.print(""+code);
				s = TCData.getTCString(rsr,"affidavit_type_desc","default affidavit type",true);
				if (code == affidavit.getHeader().getTypeId()) {
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
				code = TCData.getTCLong(rsr,"round_id",0,true);
				out.print(""+code);
				s = TCData.getTCString(rsr,"name","default round name",true);
				if (code == affidavit.getRoundId().longValue()) {
					out.print(" selected");
				}
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select></td></tr>
		
		<%	if (affidavit.getHeader().getStatusId() != PactsConstants.AFFIDAVIT_AFFIRMED_STATUS) { %>
		<tr></tr>
		<tr><td colspan="2"><b>Required for an affirmed affidavit:</b></td></tr>
		
		<tr><td><b>Date of Birth:</b></td><td>
		<% out.print("<input type=\"text\" name=\"date_of_birth\" value=\""+dob+"\">"); %>
		</td></tr>
		<tr><td><b>Family Name (India Only):</b></td><td>
		<% out.print("<input type=\"text\" name=\"family_name\" value=\""+fn+"\">"); %>
		</td></tr>
		<tr><td><b>Aged (India Only):</b></td><td>
		<% out.print("<input type=\"text\" name=\"aged\" value=\""+a+"\">"); %>
		</td></tr>
		<%	} %>

</table>

<input type=submit>
</form>
<jsp:include page="InternalFooter.jsp" flush="true" />
</body>

</html>