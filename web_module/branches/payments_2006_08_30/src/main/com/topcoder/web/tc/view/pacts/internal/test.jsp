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
	ProblemPayment pp=new ProblemTestingPayment(20009005,123.456, 1228);
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
	 pp=new ProblemWritingPayment(20009005,123.456, 1228);
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
	AlgorithmPayment ap=new AlgorithmContestPayment(20009005,260, 9998);
	pcs.addPayment(ap);
%>
ap.getId: <%= ap.getId() %> <br>
ap.getCoderId: <%= ap.getCoderId() %> <br>
ap.getNetAmount: <%= ap.getNetAmount() %> <br>
ap.getGrossAmount: <%= ap.getGrossAmount() %> <br>
ap.getStatusId: <%= ap.getStatusId() %> <br>
ap.getDescription: <%= ap.getDescription() %> <br>
ap.getDueDate: <%= ap.getDueDate() %> <br>
ap.getRoundId: <%= ap.getRoundId() %> <br>
ap.getPaymentType: <%= ap.getPaymentType() %>

Algorithm Tournament Prize, second place
<br> 
<%
AlgorithmTournamentPrizePayment atp=new AlgorithmTournamentPrizePayment(20009005,300, 9980, 2);
	pcs.addPayment(atp);
%>
atp.getId: <%= atp.getId() %> <br>
atp.getCoderId: <%= atp.getCoderId() %> <br>
atp.getNetAmount: <%= atp.getNetAmount() %> <br>
atp.getGrossAmount: <%= atp.getGrossAmount() %> <br>
atp.getStatusId: <%= atp.getStatusId() %> <br>
atp.getDescription: <%= atp.getDescription() %> <br>
atp.getDueDate: <%= atp.getDueDate() %> <br>
atp.getRoundId: <%= atp.getRoundId() %> <br>
atp.getPaymentType: <%= atp.getPaymentType() %>

Marathon Match, 3rd place
<br> 
<%
MarathonMatchPayment mm =new MarathonMatchPayment(20009005,400, 9881, 3);
	pcs.addPayment(mm);
%>
atp.getId: <%= mm.getId() %> <br>
atp.getCoderId: <%= mm.getCoderId() %> <br>
atp.getNetAmount: <%= mm.getNetAmount() %> <br>
atp.getGrossAmount: <%= mm.getGrossAmount() %> <br>
atp.getStatusId: <%= mm.getStatusId() %> <br>
atp.getDescription: <%= mm.getDescription() %> <br>
atp.getDueDate: <%= mm.getDueDate() %> <br>
atp.getRoundId: <%= mm.getRoundId() %> <br>
atp.getPaymentType: <%= mm.getPaymentType() %>


<br>
<br>

</body>

</html>