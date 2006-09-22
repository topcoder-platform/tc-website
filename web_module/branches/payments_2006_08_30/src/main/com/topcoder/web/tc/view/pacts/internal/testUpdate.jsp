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
Updating the status
<br> 
<%
	ap.setStatusId(PactsConstants.PAYMENT_OWED_STATUS);
%>
getStatusDesc: <%= ap.getStatusDesc() %> <br>

<br>
Updating the desc and committing
<br> 
<%
	ap.setDescription("hi, new description!");
	pcs.updatePayment(ap);
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


</body>

</html>