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

Problem Testing:
<br> 
<%
	ProblemPayment pp=new ProblemTestingPayment(7545675,123.456, 1228);
	 pcs.addPayment(pp);
%>
pp.getId: <%= pp.getId() %> <br>
pp.getCoderId: <%= pp.getCoderId() %> <br>
pp.getNetAmount: <%= pp.getNetAmount() %> <br>
pp.getGrossAmount: <%= pp.getGrossAmount() %> <br>
pp.getStatusId: <%= pp.getStatusId() %> <br>
pp.getDescription: <%= pp.getDescription() %> <br>
pp.getDueDate: <%= pp.getDueDate() %> <br>
pp.getProblemId: <%= pp.getProblemId() %> <br>

Problem Testing changing description:
<br> 
<%
	 pp=new ProblemTestingPayment(7545675,123.456, 1228);
pcs.fillPaymentData(pp);
pp.setDescription(pp.getDescription() + " modified!");
	 pcs.addPayment(pp);
%>
pp.getId: <%= pp.getId() %> <br>
pp.getCoderId: <%= pp.getCoderId() %> <br>
pp.getNetAmount: <%= pp.getNetAmount() %> <br>
pp.getGrossAmount: <%= pp.getGrossAmount() %> <br>
pp.getStatusId: <%= pp.getStatusId() %> <br>
pp.getDescription: <%= pp.getDescription() %> <br>
pp.getDueDate: <%= pp.getDueDate() %> <br>
pp.getProblemId: <%= pp.getProblemId() %> <br>

</body>

</html>