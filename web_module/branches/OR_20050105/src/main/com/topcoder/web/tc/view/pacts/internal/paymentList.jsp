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
<%@ page import="java.text.DecimalFormat" %>
<%
	PaymentHeader[] paymentList = (PaymentHeader[])
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	ResultSetContainer stati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	if (paymentList == null) {
		out.println("no list!!!<br>");
		paymentList = new PaymentHeader[0];
	}
	double total_net = 0;
	DecimalFormat df = new DecimalFormat(PactsConstants.DECIMAL_FORMAT_STRING);
%>

<h1>PACTS</h1>
<h2>Payment List</h2>
<%
	if (paymentList.length == 0) {
		out.println("no results matched your query<br>");
	}
	else {
		out.print("<form name=\"thislist\" action=\""+PactsConstants.INTERNAL_SERVLET_URL+"\" method=POST>");
		out.print("<input type=hidden name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.PAYMENT_TASK+"\">");
		out.print("<input type=hidden name=\"query\" value=\""+(String) request.getAttribute("query")+"\">");
%>

		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td></td>
		<td><b>ID</b></td>
		<td><b>User</b></td>
		<td><b>Description</b></td>
		<td><b>Net Amount</b></td>
		<td><b>Type</b></td>
		<td><b>Status</b></td>
		<td><b>Reviewed</b></td>
		</tr>
<%
  		for (int n = 0; n < paymentList.length; n++) {
			out.print("<tr><td><input type=checkbox name=\""+PactsConstants.PAYMENT_ID+"\" value=\""+paymentList[n]._id+"\" checked>\n");
  			out.print("</td><td>" + paymentList[n]._id + "</td>");
			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_CMD+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(paymentList[n]._user._id);
			out.print("\">"+paymentList[n]._user._handle+"</a></td>\n");

			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.PAYMENT_CMD+"&");
			out.print(PactsConstants.PAYMENT_ID+"=");
			out.print(paymentList[n]._id);
			out.print("\">"+paymentList[n]._description+"</a></td>\n");

			total_net += paymentList[n]._recentNetAmount;

			out.print("<td>"+df.format(paymentList[n]._recentNetAmount)+"</td>\n");
			out.print("<td>"+paymentList[n]._type+"</td>\n");
			out.print("<td>"+paymentList[n]._recentStatus+"</td>\n");
			if (paymentList[n]._reviewed) out.print("<td>Yes</td>\n");
			else out.print("<td>No</td>\n");

			out.print("</tr>\n");
		}
	}
%>

</table>

<b>Total Net Amount: <% out.print(df.format(total_net)); %></b>

<table>
<%
out.print("<tr><td><input type=submit name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.REVIEW_CMD+"\"></td></tr>\n");
out.print("<tr><td><input type=submit name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.PAID_CMD+"\"></td></tr>\n");
out.print("<tr><td><input type=submit name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.STATUS_CMD+"\"></td>\n");
out.print("<td><select name=\"status_id\">");

int rowCount;
String s;
if (stati == null) rowCount = 0;
else rowCount = stati.getRowCount();
ResultSetContainer.ResultSetRow rsr;

for (int n = 0; n < rowCount; n++) {
	rsr = stati.getRow(n);
	out.print("<option value=\""+TCData.getTCInt(rsr,"status_id",0,true)+"\"");
	s = TCData.getTCString(rsr,"status_desc","default status desc",true);
	if (s.equals(PactsConstants.DEFAULT_BATCH_STATUS)) out.print(" selected");
	out.print(">"+s+"</option>\n");
}

out.print("</td></tr>");

%>
</table>

</form>
<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />
</body>

</html>
