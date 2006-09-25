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

</body>

</html>




