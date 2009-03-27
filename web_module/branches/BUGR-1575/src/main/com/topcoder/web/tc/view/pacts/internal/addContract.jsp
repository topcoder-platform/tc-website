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
	UserProfileHeader user = (UserProfileHeader)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	ResultSetContainer stati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	ResultSetContainer contractTypes = (ResultSetContainer)
		request.getAttribute(PactsConstants.CONTRACT_TYPE_LIST);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (user == null) {
		out.println("no user!!!<br>");
		user = new UserProfileHeader();
	}
	String name = request.getParameter("name");
	if (name == null) name = "";
	String desc = request.getParameter("contract_desc");
	if (desc == null) desc = "";
	String start = request.getParameter("start_date");
	if (start == null) start = "";
	String end = request.getParameter("end_date");
	if (end == null) end = "";
	String text = request.getParameter("text");
	if (text == null) text = "";
	int status = -1;
	try { status = Integer.parseInt(request.getParameter("status_id")); } catch (Exception e) {}
	int type = -1;
	try { type = Integer.parseInt(request.getParameter("contract_type_id")); } catch (Exception e) {}
%>

<h1>PACTS</h1>
<h2>Add Contract</h2>

<%		out.print("<font color=\"#FF0000\">" + message + "</font>");
		out.print("<form action=\"" + PactsConstants.INTERNAL_SERVLET_URL);
		out.print("\" method=\"post\"><input type=\"hidden\" name=\"");
		out.print(PactsConstants.USER_ID+"\" value=\""+user.getId()+"\">");

		out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.ADD_TASK+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.CONTRACT_CMD+"\">");
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
			out.print(user.getId());
			out.print("\">"+user.getHandle()+"</a></td>\n");
%>
		</tr>
		<tr>
		<td><b>Name:</b></td><td>
		<input type=text width=25 name="name" value="<% out.print(name); %>">
		</td></tr>
		<tr>
		<td><b>Description:</b></td><td>
		<input type=text width=25 name="contract_desc" value="<% out.print(desc); %>">
		</td></tr>
		<tr>
		<td><b>Start Date:</b></td><td>
		<input type=text width=25 name="start_date" value="<% out.print(start); %>">
		</td></tr>
		<tr>
		<td><b>End Date:</b></td><td>
		<input type=text width=25 name="end_date" value="<% out.print(end); %>">
		</td></tr>
		<tr>
		<td><b>Status:</b></td>
		<td>
		<select name="status_id">
<%		int rowCount;
		String s;
		int s_id;
		ResultSetContainer.ResultSetRow rsr;
		if (stati != null) {
			rowCount = stati.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = stati.getRow(n);
				out.print("<option value=");
				s_id = TCData.getTCInt(rsr,"status_id",0,true);
				out.print(s_id);
				s = TCData.getTCString(rsr,"status_desc","default status",true);
				if (status < 0 && s.equals(PactsConstants.DEFAULT_CONTRACT_STATUS)) {
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
		<td><b>Type:</b></td><td>
		<select name="contract_type_id">
<%		if (contractTypes != null) {
			rowCount = contractTypes.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = contractTypes.getRow(n);
				out.print("<option value=");
				s_id = TCData.getTCInt(rsr,"contract_type_id",0,true);
				out.print(s_id);
				s = TCData.getTCString(rsr,"contract_type_desc","default affidavit type",true);
				if (type < 0 && s.equals(PactsConstants.DEFAULT_CONTRACT_TYPE)) {
					out.print(" selected");
				} else if (type == s_id) out.print(" selected");
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td></tr>
		<tr><td>Text:</td><td>
		<textarea name="text" rows=10 cols=80><% out.print(text); %></textarea>
		</td></tr>
</table>

<input type=submit>
</form>
<jsp:include page="InternalFooter.jsp" flush="true" />
</body>

</html>