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
	TaxFormHeader[] taxFormList = (TaxFormHeader[])
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	if (taxFormList == null) {
		out.println("no list!!!<br>");
		taxFormList = new TaxFormHeader[0];
	}
%>

<h1>PACTS</h1>
<h2>User Tax Form List</h2>
<%
	if (taxFormList.length == 0) {
		out.println("no results matched your query<br>");
	}
	else {
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>User</b></td>
		<td><b>Name</b></td>
		<td><b>Status</b></td>
		</tr>
<%
  		for (int n = 0; n < taxFormList.length; n++) {
			out.print("<tr><td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_CMD+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(taxFormList[n]._user._id);
			out.print("\">"+taxFormList[n]._user._handle+"</a></td>\n");

			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_TAX_FORM_CMD+"&");
			out.print(PactsConstants.TAX_FORM_ID+"=");
			out.print(taxFormList[n]._id+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(taxFormList[n]._user._id);
			out.print("\">"+taxFormList[n]._name+"</a></td>\n");

			out.print("<td>" + taxFormList[n]._status + "</td></tr>\n");
		}
	}
%>

</table>

<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />

</body>

</html>
