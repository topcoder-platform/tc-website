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
			out.print(affidavitList[n]._user._id);
			out.print("\">"+affidavitList[n]._user._handle+"</a></td>\n");

			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.AFFIDAVIT_CMD+"&");
			out.print(PactsConstants.AFFIDAVIT_ID+"=");
			out.print(affidavitList[n]._id);
			out.print("\">"+affidavitList[n]._creationDate+"</a></td>\n");

			if (affidavitList[n]._affirmed) {
				out.print("<td>Yes</td>\n");
			}
			else {
				out.print("<td>No</td>\n");
			}

			if (affidavitList[n]._notarized) {
				out.print("<td>Yes</td>\n");
			}
			else {
				out.print("<td>No</td>\n");
			}

			out.print("<td>"+affidavitList[n]._type+"</td>\n");
			out.print("<td>"+affidavitList[n]._status+"</td>\n");

			out.print("</tr>\n");
		}
	}
%>

</table>

<jsp:include page="/InternalFooter.jsp" flush="true" />

</body>

</html>
