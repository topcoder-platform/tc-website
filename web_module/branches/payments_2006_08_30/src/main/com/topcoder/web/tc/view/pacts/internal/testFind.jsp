<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.ContractHeader" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.TCData"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader"%>
<%@ page import="com.topcoder.shared.util.TCContext"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="com.topcoder.web.common.*"%>
<%@ page import="com.topcoder.web.ejb.pacts.*"%>
<%@ page import="java.util.*"%>

<html>


<body>

<br> 
<%
        InitialContext c =  TCContext.getInitial();
        PactsClientServices pcs = (PactsClientServices) BaseProcessor.createEJB(c, PactsClientServices.class);
%>

<br><br>
<b>pcs.findPayments(BasePayment.CODER_REFERRAL_PAYMENT);</b><br> 
<table>
<%
	List l = pcs.findPayments(BasePayment.CODER_REFERRAL_PAYMENT);

	for (int i = 0; i < l.size();i++) {
		CoderReferralPayment p = (CoderReferralPayment) l.get(i);
%>
<tr>
<td> <%= p.getId() %></td>
<td> <%= p.getPaymentType() %></td>
<td> <%= p.getDescription() %> </td>
<td> <%= p.getDueDate() %> </td>
<td> <%= p.getGrossAmount() %> </td>
<td> <%= p.getNetAmount() %> </td>
<td> <%= p.getParentId() %> </td>
</tr>
<% } %>
</table>
<br><br>
<b>pcs.findPayments(BasePayment.DIGITAL_RUN_PRIZE_PAYMENT, 4);</b><br> 
<table>
<%
	l = pcs.findPayments(BasePayment.DIGITAL_RUN_PRIZE_PAYMENT, 4);

	for (int i = 0; i < l.size();i++) {
		DigitalRunStageReferencePayment p = (DigitalRunStageReferencePayment) l.get(i);
%>
<tr>
<td> <%= p.getId() %></td>
<td> <%= p.getPaymentType() %></td>
<td> <%= p.getDescription() %> </td>
<td> <%= p.getStatusId() %> </td>
<td> <%= p.getStatusDesc() %> </td>
<td> <%= p.getGrossAmount() %> </td>
<td> <%= p.getNetAmount() %> </td>
<td> <%= p.getStageId() %> </td>
</tr>
<% } %>
</table>
<br><br>
<b>pcs.findCoderPayments(7545675);</b><br> 
<table>
<%
	l = pcs.findCoderPayments(7545675);

	for (int i = 0; i < l.size();i++) {
	BasePayment p = (BasePayment) l.get(i);
%>
<tr>
<td> <%= p.getId() %></td>
<td> <%= p.getPaymentType() %></td>
<td> <%= p.getDescription() %> </td>
<td> <%= p.getStatusId() %> </td>
<td> <%= p.getStatusDesc() %> </td>
<td> <%= p.getGrossAmount() %> </td>
<td> <%= p.getNetAmount() %> </td>
</tr>
<% } %>
</table>
<br><br>

<b>pcs.findCoderPayments(7545675, BasePayment.ALGORITHM_CONTEST_PAYMENT);</b><br> 
<table>
<%
	l = pcs.findCoderPayments(7545675, BasePayment.ALGORITHM_CONTEST_PAYMENT);

	for (int i = 0; i < l.size();i++) {
	BasePayment p = (BasePayment) l.get(i);
%>
<tr>
<td> <%= p.getId() %></td>
<td> <%= p.getPaymentType() %></td>
<td> <%= p.getDescription() %> </td>
<td> <%= p.getStatusId() %> </td>
<td> <%= p.getStatusDesc() %> </td>
<td> <%= p.getGrossAmount() %> </td>
<td> <%= p.getNetAmount() %> </td>
</tr>
<% } %>
</table>

<br><br>

<b>pcs.findCoderPayments(7545675, BasePayment.PROBLEM_WRITING_PAYMENT, 1228);</b><br> 
<table>
<%
	l = pcs.findCoderPayments(7545675, BasePayment.PROBLEM_WRITING_PAYMENT, 1228);

	for (int i = 0; i < l.size();i++) {
	ProblemWritingPayment p = (ProblemWritingPayment) l.get(i);
%>
<tr>
<td> <%= p.getId() %></td>
<td> <%= p.getPaymentType() %></td>
<td> <%= p.getDescription() %> </td>
<td> <%= p.getStatusId() %> </td>
<td> <%= p.getStatusDesc() %> </td>
<td> <%= p.getGrossAmount() %> </td>
<td> <%= p.getNetAmount() %> </td>
<td> <%= p.getProblemId() %> </td>
</tr>
<% } %>
</table>

</body>

</html>




