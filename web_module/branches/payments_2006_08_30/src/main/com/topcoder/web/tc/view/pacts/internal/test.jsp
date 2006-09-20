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

<br>
<br>

Problem Writing changing description:
<br> 
<%
	 pp=new ProblemWritingPayment(7545675,123.456, 1228);
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

<br><br>

Algorithm Contest
<br> 
<%
	AlgorithmPayment ap=new AlgorithmContestPayment(7545675,260, 9998);
	pcs.addPayment(ap);
%>
ap.getId: <%= pp.getId() %> <br>
ap.getCoderId: <%= pp.getCoderId() %> <br>
ap.getNetAmount: <%= pp.getNetAmount() %> <br>
ap.getGrossAmount: <%= pp.getGrossAmount() %> <br>
ap.getStatusId: <%= pp.getStatusId() %> <br>
ap.getDescription: <%= pp.getDescription() %> <br>
ap.getDueDate: <%= pp.getDueDate() %> <br>
ap.getRoundId: <%= pp.getRoundId() %> <br>

<br>
<br>

</body>

</html>