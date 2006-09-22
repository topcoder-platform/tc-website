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



Studio Payment
<br> 
<%
BasePayment p=new StudioContestPayment(7545675,780, 2132,3);
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


</body>

</html>