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
	Payment payment = (Payment)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	ResultSetContainer stati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	ResultSetContainer paymentTypes = (ResultSetContainer)
		request.getAttribute(PactsConstants.PAYMENT_TYPE_LIST);
	ResultSetContainer rationale = (ResultSetContainer)
		request.getAttribute(PactsConstants.MODIFICATION_RATIONALE_LIST);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	} else if (payment != null) {
		String param;
		param = request.getParameter("status_id");
		try { if (param != null) payment.getHeader().setRecentStatusId(Integer.parseInt(param)); } catch (Exception e) {}
		param = request.getParameter("payment_desc");
		if (param != null) payment.getHeader().setDescription(param);
		param = request.getParameter("date_printed");
		if (param != null) payment.setPrintDate(param);
		param = request.getParameter("date_paid");
		if (param != null) payment.setPayDate(param);
		param = request.getParameter("date_due");
		if (param != null) payment.setDueDate(param);
		param = request.getParameter("payment_type_id");
		try { if (param != null) payment.getHeader().setTypeId(Integer.parseInt(param)); } catch (Exception e) {}
		param = request.getParameter("net_amount");
		try { if (param != null) payment.setNetAmount(Double.parseDouble(param)); } catch (Exception e) {}
		param = request.getParameter("gross_amount");
		try { if (param != null) payment.setGrossAmount(Double.parseDouble(param)); } catch (Exception e) {}
	}
	if (payment == null) {
		out.print("No Payment!!!<br>");
		payment = new Payment();
	}
	int my_rationale = -1;
	try { my_rationale = Integer.parseInt(request.getParameter("modification_rationale_id")); } catch (Exception e) {}
%>

<h1>PACTS</h1>
<h2>Update Payment</h2>

<font color="#FF0000">
<% out.print(message); %>
</font>

<% out.print("<form action=\""+PactsConstants.INTERNAL_SERVLET_URL+"\" method=\"post\">");
   out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\"");
   out.print(PactsConstants.UPDATE_TASK+"\">");
   out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\"");
   out.print(PactsConstants.PAYMENT_CMD+"\">");
   out.print("<input type=\"hidden\" name=\""+PactsConstants.PAYMENT_ID+"\" value=\""+payment.getHeader().getId()+"\">");
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr><td><b>ID:</b></td><td>
<%		out.print(payment.getHeader().getId());	%>
		</td></tr><tr>
		<td>
<%		out.print("<b>User:</b></td>");
 		out.print("<td><a href=\"");
		out.print(PactsConstants.INTERNAL_SERVLET_URL);
		out.print("?"+PactsConstants.TASK_STRING+"=");
		out.print(PactsConstants.VIEW_TASK+"&");
		out.print(PactsConstants.CMD_STRING+"=");
		out.print(PactsConstants.USER_CMD+"&");
		out.print(PactsConstants.USER_ID+"=");
		out.print(payment.getHeader().getUser().getId());
		out.print("\">"+payment.getHeader().getUser().getHandle()+"</a>\n");
%>
		</td>
		</tr>
		<tr>
		<td><b>Status:</b></td>
		<td>
		<select name="status_id">
<%		int rowCount;
		ResultSetContainer.ResultSetRow rsr;
		String s;
		int code;
		if (stati != null) {
			rowCount = stati.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = stati.getRow(n);
				out.print("<option value=");
				code = TCData.getTCInt(rsr,"status_id",0,true);
				out.print("" + code);
				s = TCData.getTCString(rsr,"status_desc","default status",true);
				if (code == payment.getHeader().getRecentStatusId()) {
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
<% out.print("<input type=text width=25 name=\"payment_desc\" value=\""+payment.getHeader().getDescription()+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Date Paid:</b></td><td>
<% out.print("<input type=text width=25 name=\"date_paid\" value=\""+payment.getPrintDate()+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Date Printed:</b></td><td>
<% out.print("<input type=text width=25 name=\"date_printed\" value=\""+payment.getPayDate()+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Date Due:</b></td><td>
<% out.print("<input type=text width=25 name=\"date_due\" value=\""+payment.getDueDate()+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Type:</b></td><td>
		<select name="payment_type_id">
<%		if (paymentTypes != null) {
			rowCount = paymentTypes.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = paymentTypes.getRow(n);
				out.print("<option value=");
				code = TCData.getTCInt(rsr,"payment_type_id",0,true);
				out.print("" + code);
				s = TCData.getTCString(rsr,"payment_type_desc","default payment type",true);
				if (code == payment.getHeader().getTypeId()) {
					out.print(" selected");
				}
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td></tr>
		<tr>
		<td><b>Net Amount:</b></td><td>
<% out.print("<input type=text width=25 name=\"net_amount\" value=\""+payment.getNetAmount()+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Gross Amount:</b></td><td>
<% out.print("<input type=text width=25 name=\"gross_amount\" value=\""+payment.getGrossAmount()+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Modification Rationale:</b></td><td>
		<select name="modification_rationale_id">
<%		if (rationale != null) {
			rowCount = rationale.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = rationale.getRow(n);
				out.print("<option value=");
				code = TCData.getTCInt(rsr,"modification_rationale_id",0,true);
				out.print("" + code);
				s = TCData.getTCString(rsr,"modification_rationale_desc","default rationale",true);
				if (my_rationale < 0 && s.equals(PactsConstants.DEFAULT_MODIFICATION_RATIONALE)) {
					out.print(" selected");
				} else if (my_rationale == code) out.print(" selected");
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td></tr>
	</table>

<input type=submit>
</form>
<jsp:include page="InternalFooter.jsp" flush="true" />
</body>

</html>