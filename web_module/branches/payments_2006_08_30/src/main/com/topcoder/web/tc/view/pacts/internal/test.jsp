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

addProblemWritingPayment
<br> 
<%
        InitialContext c =  TCContext.getInitial();
        PactsClientServices pcs = (PactsClientServices) BaseProcessor.createEJB(c, PactsClientServices.class);
        ProblemPayment pp = pcs.addProblemWritingPayment(7545675,123.456, 6005);
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
addProblemTestingPayment
<br> 
<%
	 pp = pcs.addProblemTestingPayment(7545675,123.456, 1228);
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