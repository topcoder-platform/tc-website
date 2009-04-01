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
	AffidavitHeader[] affidavitList = (AffidavitHeader[])
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	if (affidavitList == null) {
		out.println("no list!!!<br>");
		affidavitList = new AffidavitHeader[0];
	}
%>

<h1>PACTS</h1>
<h2>Affidavit List</h2>
<%
	if (affidavitList.length == 0) {
		out.println("no results matched your query<br>");
	}
	else {
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>User</b></td>
		<td><b>Description</b></td>
		<td><b>Date</b></td>
		<td><b>Affirmed</b></td>
		<td><b>Notarized</b></td>
		<td><b>Type</b></td>
		<td><b>Status</b></td>
		</tr>
<%
  		for (int n = 0; n < affidavitList.length; n++) {
			out.print("<tr>\n<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_CMD+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(affidavitList[n].getUser().getId());
			out.print("\">"+affidavitList[n].getUser().getHandle()+"</a></td>\n");

			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.AFFIDAVIT_CMD+"&");
			out.print(PactsConstants.AFFIDAVIT_ID+"=");
			out.print(affidavitList[n].getId());
			out.print("\">"+affidavitList[n].getDescription()+"</a></td>\n");

			out.print("<td>" + affidavitList[n].getCreationDate()+ "</td>\n");

			if (affidavitList[n].isAffirmed()) {
				out.print("<td>Yes</td>\n");
			}
			else {
				out.print("<td>No</td>\n");
			}

			if (affidavitList[n].isNotarized()) {
				out.print("<td>Yes</td>\n");
			}
			else {
				out.print("<td>No</td>\n");
			}

			out.print("<td>"+affidavitList[n].getTypeDesc()+"</td>\n");
			out.print("<td>"+affidavitList[n].getStatusDesc()+"</td>\n");

			out.print("</tr>\n");
		}
	}
%>

</table>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>

</html>
