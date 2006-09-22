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



Algorithm Contest
<br> 
<%
AlgorithmContestPayment ap=new AlgorithmContestPayment(14810373,260, 9998);
	pcs.fillPaymentData(ap);
	ap.setDescription(ap.getDescription() + " modified!");
	pcs.addPayment(ap);
%>
getId: <%= ap.getId() %> <br>
getCoderId: <%= ap.getCoderId() %> <br>
getNetAmount: <%= ap.getNetAmount() %> <br>
getGrossAmount: <%= ap.getGrossAmount() %> <br>
getStatusId: <%= ap.getStatusId() %> <br>
getStatusDesc: <%= ap.getStatusDesc() %> <br>
getDescription: <%= ap.getDescription() %> <br>
getDueDate: <%= ap.getDueDate() %> <br>
getRoundId: <%= ap.getRoundId() %> <br>
getPaymentType: <%= ap.getPaymentType() %>

<br><br>
Algorithm Tournament Prize, second place (should pay referral)
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
getStatusDesc: <%= atp.getStatusDesc() %> <br>
atp.getDescription: <%= atp.getDescription() %> <br>
atp.getDueDate: <%= atp.getDueDate() %> <br>
atp.getRoundId: <%= atp.getRoundId() %> <br>
atp.getPaymentType: <%= atp.getPaymentType() %>

<br><br>
Marathon Match, 3rd place
<br> 
<%
MarathonMatchPayment mm =new MarathonMatchPayment(14810373,400, 9881, 3);
	pcs.addPayment(mm);
%>
atp.getId: <%= mm.getId() %> <br>
atp.getCoderId: <%= mm.getCoderId() %> <br>
atp.getNetAmount: <%= mm.getNetAmount() %> <br>
atp.getGrossAmount: <%= mm.getGrossAmount() %> <br>
atp.getStatusId: <%= mm.getStatusId() %> <br>
getStatusDesc: <%= mm.getStatusDesc() %> <br>
atp.getDescription: <%= mm.getDescription() %> <br>
atp.getDueDate: <%= mm.getDueDate() %> <br>
atp.getRoundId: <%= mm.getRoundId() %> <br>
atp.getPaymentType: <%= mm.getPaymentType() %>
<br>
<br>

</body>

</html>