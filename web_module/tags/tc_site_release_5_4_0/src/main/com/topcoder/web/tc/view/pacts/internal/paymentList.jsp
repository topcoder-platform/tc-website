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
	String[] creationDateList = (String[])request.getAttribute(PactsConstants.CREATION_DATE_LIST);
	if (paymentList == null) {
		out.println("no list!!!<br>");
		paymentList = new PaymentHeader[0];
	}
	double total_net = 0;
	DecimalFormat df = new DecimalFormat(PactsConstants.DECIMAL_FORMAT_STRING);
%>

<script type="text/javascript">
<!--
  function checkAll(check) {
    var elements = document.thislist.elements;
    for (i=0; i<document.thislist.elements.length; i++) {
      if (document.thislist.elements[i].type=="checkbox") {
        document.thislist.elements[i].checked = (check==true);
      }
    }
  }
-->
</script>

<h1>PACTS</h1>
<h2>Payment List</h2>
<%
	if (paymentList.length == 0) {
		%>no results matched your query<br><%
	}
	else { %>
      <form name="thislist" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="POST">
		<input type=hidden name="<%=PactsConstants.TASK_STRING%>" value="<%=PactsConstants.PAYMENT_TASK%>">
		<input type=hidden name="query" value="<%=(String) request.getAttribute("query")%>">

		<table id="datatable" border="0" cellpadding="5" cellspacing="0">
        <tr>
            <td>
                <a href="Javascript:checkAll(true)">check all</a>
            </td>
            <td>
                <a href="Javascript:checkAll(false)">uncheck all</a>
            </td>
        </tr>
		<tr>
		<td></td>
		<td><b>First</b></td>
		<td><b>Last</b></td>
		<td><b>User</b></td>
		<td><b>Description</b></td>
		<td><b>Gross</b></td>
		<td><b>Tax</b></td>
		<td><b>Net</b></td>
		<td><b>Type</b></td>
		<td><b>Method</b></td>
		<td><b>Status</b></td>
		<td><b>Client</b></td>
		<td><b>Created</b></td>
		<td><b>Reviewed</b></td>
		</tr>
<%
  		for (int n = 0; n < paymentList.length; n++) {
			out.print("<tr>");
			
			out.print("<td><input type=checkbox name=\""+PactsConstants.PAYMENT_ID+"\" value=\""+paymentList[n].getId()+"\" checked></td>\n");
  			out.print("<td>"+paymentList[n].getUser().getFirst()+"</td>\n");
  			out.print("<td>"+paymentList[n].getUser().getLast()+"</td>\n");
			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_CMD+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(paymentList[n].getUser().getId());
			out.print("\">"+paymentList[n].getUser().getHandle()+"</a></td>\n");

			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.PAYMENT_CMD+"&");
			out.print(PactsConstants.PAYMENT_ID+"=");
			out.print(paymentList[n].getId());
			out.print("\">"+paymentList[n].getDescription()+"</a></td>\n");

			total_net += paymentList[n].getRecentNetAmount();

			out.print("<td>"+df.format(paymentList[n].getRecentGrossAmount())+"</td>\n");
			out.print("<td>"+df.format(paymentList[n].getRecentGrossAmount()
				- paymentList[n].getRecentNetAmount())+"</td>\n");
			out.print("<td>"+df.format(paymentList[n].getRecentNetAmount())+"</td>\n");
			String type = paymentList[n].getType().substring(0,paymentList[n].getType().indexOf("Payment"));
			out.print("<td>"+type+"</td>\n");
			out.print("<td>"+paymentList[n].getMethod()+"</td>\n");
			out.print("<td>"+paymentList[n].getRecentStatus()+"</td>\n");
			if (paymentList[n].getClient() != null && !paymentList[n].getClient().trim().equals("null")) {
				out.print("<td>"+paymentList[n].getClient()+"</td>\n");
			} else {
				out.print("<td></td>\n");
			}
			out.print("<td>"+creationDateList[n]+"</td>\n");
			if (paymentList[n].isReviewed()) out.print("<td>Yes</td>\n");
			else out.print("<td>No</td>\n");
			
			out.print("</tr>\n");
		} %>

        <tr>
            <td>
                <a href="Javascript:checkAll(true)">check all</a>
            </td>
            <td>
                <a href="Javascript:checkAll(false)">uncheck all</a>
            </td>
        </tr>
	<%}

%>

</table>
</font>

<b>Total Net Amount: <% out.print(df.format(total_net)); %></b>

<table>
<%
out.print("<tr><td><input type=submit name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.REVIEW_CMD+"\"></td></tr>\n");
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
<jsp:include page="InternalFooter.jsp" flush="true" />
</body>

</html>
