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

<html>


<body>

<br> 
<%
        InitialContext c =  TCContext.getInitial();
        PactsClientServices pcs = (PactsClientServices) BaseProcessor.createEJB(c, PactsClientServices.class);
%>




<br> 
<br><br>

Contract Payment
<br> 
<%
	BasePayment p= new NoReferencePayment(BasePayment.CONTRACT_PAYMENT, 7545675, 1500.0, "Contract for w/e 23.09.06");
	pcs.addPayment(p);
%>
getId: <%= p.getId() %> <br>
getCoderId: <%= p.getCoderId() %> <br>
getNetAmount: <%= p.getNetAmount() %> <br>
getGrossAmount: <%= p.getGrossAmount() %> <br>
getStatusId: <%= p.getStatusId() %> <br>
getStatusDesc: <%= p.getStatusDesc() %> <br>
getDescription: <%= p.getDescription() %> <br>
getDueDate: <%= p.getDueDate() %> <br>
getPaymentType: <%= p.getPaymentType() %>

<br><br>


<%
try {
	p=new NoReferencePayment(BasePayment.TC_STUDIO_PAYMENT, 7545675, 1500.0, "Contract for w/e 23.09.06");
	out.println("Exception expected!");
} catch (IllegalArgumentException e) {
	out.println(e);
}
%>

</body>

</html>