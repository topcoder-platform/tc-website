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
	PactsEntry[] entryList = (PactsEntry[])
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	if (entryList == null) {
		out.println("no list!!!<br>");
		entryList = new PactsEntry[0];
	}
%>

<h1>PACTS</h1>
<h2>Combo List</h2>
<%
	if (entryList.length == 0) {
		out.println("no results matched your query<br>");
	}
	else {
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>Type</b></td>
		<td><b>Identifier</b></td>
		</tr>
<%
		Payment p;
		Affidavit a;
		Contract c;
		TaxForm t;
		UserProfile u;
  		for (int n = 0; n < entryList.length; n++) {
			out.print("<tr><td>");
			switch (entryList[n].getType()) {
				case PactsConstants.PAYMENT_OBJ:
					p = (Payment) entryList[n].get();
					out.print("Payment</td><td><a href=\"");
					out.print(PactsConstants.INTERNAL_SERVLET_URL);
					out.print("?"+PactsConstants.TASK_STRING+"=");
					out.print(PactsConstants.VIEW_TASK+"&");
					out.print(PactsConstants.CMD_STRING+"=");
					out.print(PactsConstants.PAYMENT_CMD+"&");
					out.print(PactsConstants.PAYMENT_ID+"=");
					out.print(p.getHeader().getId());
					out.print("\">"+p.getHeader().getDescription()+"</a>");
					break;
				case PactsConstants.AFFIDAVIT_OBJ:
					a = (Affidavit) entryList[n].get();
					out.print("Affidavit</td><td><a href=\"");
					out.print(PactsConstants.INTERNAL_SERVLET_URL);
					out.print("?"+PactsConstants.TASK_STRING+"=");
					out.print(PactsConstants.VIEW_TASK+"&");
					out.print(PactsConstants.CMD_STRING+"=");
					out.print(PactsConstants.AFFIDAVIT_CMD+"&");
					out.print(PactsConstants.AFFIDAVIT_ID+"=");
					out.print(a.getHeader().getId());
					out.print("\">"+a.getRound()+" for "+a.getHeader().getUser().getHandle()+"</a>");
					break;
				case PactsConstants.CONTRACT_OBJ:
					c = (Contract) entryList[n].get();
					out.print("Contract</td><td><a href=\"");
					out.print(PactsConstants.INTERNAL_SERVLET_URL);
					out.print("?"+PactsConstants.TASK_STRING+"=");
					out.print(PactsConstants.VIEW_TASK+"&");
					out.print(PactsConstants.CMD_STRING+"=");
					out.print(PactsConstants.CONTRACT_CMD+"&");
					out.print(PactsConstants.CONTRACT_ID+"=");
					out.print(c.getHeader().getId());
					out.print("\">"+c.getHeader().getName()+"</a>");
					break;
				case PactsConstants.USER_TAX_FORM_OBJ:
					t = (TaxForm) entryList[n].get();
					out.print("User Tax Form</td><td><a href=\"");
					out.print(PactsConstants.INTERNAL_SERVLET_URL);
					out.print("?"+PactsConstants.TASK_STRING+"=");
					out.print(PactsConstants.VIEW_TASK+"&");
					out.print(PactsConstants.CMD_STRING+"=");
					out.print(PactsConstants.USER_TAX_FORM_CMD+"&");
					out.print(PactsConstants.TAX_FORM_ID+"=");
					out.print(t.getHeader().getId()+"&"+PactsConstants.USER_ID);
					out.print("="+t.getHeader().getUser().getId());
					out.print("\">"+t.getHeader().getName()+" for "+t.getHeader().getUser().getHandle()+"</a>");
					break;
				case PactsConstants.USER_PROFILE_OBJ:
					u = (UserProfile) entryList[n].get();
					out.print("User</td><td><a href=\"");
					out.print(PactsConstants.INTERNAL_SERVLET_URL);
					out.print("?"+PactsConstants.TASK_STRING+"=");
					out.print(PactsConstants.VIEW_TASK+"&");
					out.print(PactsConstants.CMD_STRING+"=");
					out.print(PactsConstants.USER_CMD+"&");
					out.print(PactsConstants.USER_ID+"=");
					out.print(u.getHeader().getId());
					out.print("\">"+u.getHeader().getHandle()+"</a>");
					break;
			}
			out.println("</td></tr>");
		}
	}
%>

</table>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>

</html>
