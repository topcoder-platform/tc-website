<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>PACTS</title>
</head>

<body>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.*" %>
<%
	UserProfileHeader user = (UserProfileHeader)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	ResultSetContainer astati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	ResultSetContainer pstati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST + "2");
	ResultSetContainer affidavitTypes = (ResultSetContainer)
		request.getAttribute(PactsConstants.AFFIDAVIT_TYPE_LIST);
	ResultSetContainer paymentTypes = (ResultSetContainer)
		request.getAttribute(PactsConstants.PAYMENT_TYPE_LIST);
	ResultSetContainer rounds = (ResultSetContainer)
		request.getAttribute(PactsConstants.ROUND_LIST);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (user == null) {
		out.println("no user!!!<br>");
		user = new UserProfileHeader();
	}
	String notarized = request.getParameter(PactsConstants.IS_NOTARIZED);
	if (notarized == null) notarized = "false";
	int astatus = -1;
	try { astatus = Integer.parseInt(request.getParameter("affidavit_status_id")); } catch (Exception e) {}
	int pstatus = -1;
	try { pstatus = Integer.parseInt(request.getParameter("payment_status_id")); } catch (Exception e) {}
	int atype = -1;
	try { atype = Integer.parseInt(request.getParameter("affidavit_type_id")); } catch (Exception e) {}
	int ptype = -1;
	try { ptype = Integer.parseInt(request.getParameter("payment_type_id")); } catch (Exception e) {}
	long round = -1;
	try { round = Long.parseLong(request.getParameter("round_id")); } catch (Exception e) {}
	String adesc = request.getParameter("affidavit_desc");
	if (adesc == null) adesc = "";
	String pdesc = request.getParameter("payment_desc");
	if (pdesc == null) pdesc = "";
	String due = request.getParameter("date_due");
	if (due == null) due = "";
	String text = request.getParameter("text");
	if (text == null) text = "";
	String net = request.getParameter("net_amount");
	if (net == null) net = "";
	String gross = request.getParameter("gross_amount");
	if (gross == null) gross = "";

%>

<h1>PACTS</h1>
<h2>Add Affidavit</h2>

<font color="#FF0000"><%=message%></font>
<form action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
  <input type="hidden" name="<%=PactsConstants.USER_ID%>" value="<%=user.getId()%>"/>
  <input type="hidden" name="<%=PactsConstants.TASK_STRING%>" value="<%=PactsConstants.ADD_TASK%>"/>
  <input type="hidden" name="<%=PactsConstants.CMD_STRING%>" value="<%=PactsConstants.AFFIDAVIT_CMD%>"/>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>User:</b></td>
        <td><a href="<%=PactsConstants.INTERNAL_SERVLET_URL+"?"+PactsConstants.TASK_STRING+"="+PactsConstants.VIEW_TASK+"&"+PactsConstants.CMD_STRING+"="+PactsConstants.USER_CMD+"&"+PactsConstants.USER_ID+"="+user.getId()%>"><%=user.getHandle()%></a></td>
		</tr>
		<tr>
		<td><b>Notarized:</b></td><td>
            <input type="radio" name="<%=PactsConstants.IS_NOTARIZED%>" value="true" <%= notarized.equals("true")?"checked":""%>/>Yes<br />
            <input type="radio" name="<%=PactsConstants.IS_NOTARIZED%>" value="false" <%= !notarized.equals("true")?"checked":""%>/>No
		</td></tr>
		<tr>
		<td><b>Status:</b></td>
		<td>
            <tc-webtag:rscSelect name="affidavit_status_id" list='<%=astati%>' fieldText="status_desc" fieldValue="status_id" selectedValue="<%=astatus%>"/>
		</td>
		</tr>
		<tr>
		<td><b>Description:</b></td><td>
		<input type=text width=25 name="affidavit_desc" value="<%=adesc%>">
		</td></tr>
		<tr>
		<td><b>Type:</b></td><td>
            <tc-webtag:rscSelect name="affidavit_type_id" list='<%=affidavitTypes%>' fieldText="affidavit_type_desc" fieldValue="affidavit_type_id" selectedValue="<%=atype%>"/>
		</td></tr>
		<tr><td><b>Round:</b></td><td>
            <tc-webtag:rscSelect name="round_id" list='<%=rounds%>' fieldText="name" fieldValue="round_id" selectedValue="<%=round%>"/>
        </td></tr>
        <tr><td colspan="2">If you don't know what to fill in below, then you can leave it blank.  We'll
        figure it out using the affidavit type you chose above.</td></tr>
		<tr><td>Text:</td><td>
		<textarea name="text" rows=10 cols=80><%=text%></textarea>
		</td></tr>
</table>
<h2>Add Payment</h2>
<p>If you do not not wish to associate a payment with this affidavit, just leave this section blank.</p>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>Status:</b></td>
		<td>
            <tc-webtag:rscSelect name="payment_status_id" list='<%=pstati%>' fieldText="status_desc" fieldValue="status_id" selectedValue="<%=pstatus%>"/>
		</td>
		</tr>
		<tr>
		<td><b>Description:</b></td><td>
		<input type=text width=25 name="payment_desc" value="<% out.print(pdesc); %>">
		</td></tr>
		<tr>
		<td><b>Type:</b></td><td>
            <tc-webtag:rscSelect name="payment_type_id" list='<%=paymentTypes%>' fieldText="payment_type_desc" fieldValue="payment_type_id" selectedValue="<%=ptype%>"/>
		</td></tr>
		<tr>
		<td><b>Net Amount:</b></td><td>
		<input type=text width=25 name="net_amount" value="<% out.print(net); %>">
		</td></tr>
		<tr>
		<td><b>Gross Amount:</b></td><td>
		<input type=text width=25 name="gross_amount" value="<% out.print(gross); %>">
		</td></tr>
		<tr>
		<td><b>Date Due:</b></td><td>
		<input type=text width=25 name="date_due" value="<% out.print(due); %>">
		</td></tr>
	</table>

<input type=submit>
</form>
<jsp:include page="InternalFooter.jsp" flush="true" />

</body>

</html>