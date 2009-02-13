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
	ContractHeader[] contractList = (ContractHeader[])
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	if (contractList == null) {
		out.println("no list!!!<br>");
		contractList = new ContractHeader[0];
	}
%>

<h1>PACTS</h1>
<h2>Contract List</h2>
<%
	if (contractList.length == 0) {
		out.println("no results matched your query<br>");
	}
	else {
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>User</b></td>
		<td><b>Name</b></td>
		<td><b>Creation Date</b></td>
		<td><b>Type</b></td>
		<td><b>Status</b></td>
		</tr>
<%
  		for (int n = 0; n < contractList.length; n++) {
			out.print("<tr>\n<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_CMD+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(contractList[n]._user._id);
			out.print("\">"+contractList[n]._user._handle+"</a></td>\n");

			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.CONTRACT_CMD+"&");
			out.print(PactsConstants.CONTRACT_ID+"=");
			out.print(contractList[n]._id);
			out.print("\">"+contractList[n]._name+"</a></td>\n");

			out.print("<td>"+contractList[n]._creationDate+"</td>");
			out.print("<td>"+contractList[n]._type+"</td>\n");
			out.print("<td>"+contractList[n]._statusDesc+"</td>\n");

			out.print("</tr>\n");
		}
	}
%>

</table>

<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />
</body>

</html>
